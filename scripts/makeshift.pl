#! /usr/bin/env perl
#! nix-shell -i perl -p perl perlPackages.Perl6Junction perlPackages.ConfigIniFiles

use strict;
use warnings;

use Getopt::Long;
use Perl6::Junction 'any';
use List::Util qw(pairs pairvalues);
use Config::IniFiles;
use Cwd qw(getcwd abs_path);
use Pod::Usage;

my ($exec, $set, $edit, $print, $cmd);
my ($dryrun, $shorthelp, $longhelp, $verbose) = (0) x 6;
GetOptions(
    'exec|x'       => \$exec,
    'set|s=s'      => \$set,
    'cmd|c=s'      => \$cmd,
    'edit|e'       => \$edit,
    'dryrun|n'     => \$dryrun,
    'print|p=s'    => \$print,
    'print|p=s'    => \$print,
    'verbose|v'    => \$verbose,
    'h|?'          => \$shorthelp,
    'help'         => \$longhelp) or pod2usage(2);

$shorthelp || $longhelp and
    pod2usage(-verbose => $verbose + $shorthelp + 2 * $longhelp);

my $projectdir = projectdir();
chdir $projectdir;

my $XDG_CONFIG_HOME = $ENV{XDG_CONFIG_HOME} // "$ENV{HOME}/.config";

my @cfgs = collectcfgs(</etc/makeshift/*>, "$XDG_CONFIG_HOME/makeshift/config");

$edit and exec $ENV{EDITOR} // 'vi', grep { -r } reverse @cfgs;

my $cfg = readcfgs(@cfgs) or die "No makeshift config files found";

my $sel = Config::IniFiles->new(
    -file => "$XDG_CONFIG_HOME/makeshift/selected_platforms",
    -allowempty => 1,
);

if (defined $set) {
    my @set = split '/', $set, 2;
    any($cfg->GroupMembers('platform')) eq "platform $set[0]"
        or warn "WARNING: platform '$set[0]' doesn't exist. Setting anyway..\n";

    $sel->setval("selections", $projectdir, $set)
        or $sel->newval("selections", $projectdir, $set);
    $sel->RewriteConfig();
    exit 0;
}

my $selection = $sel->val('selections', $projectdir)
    or die "FATAL: No platform selected. makeshift -s PLATFORM to set one.\n";

my ($PLATFORM, $suffix) = split '/', $selection, 2;

print "#!/bin/sh\n\n" if $dryrun;

my %cfgenv;

my %cmds = (
    __check__ => [], __prep__ => [], __cmd__ => [], __args__ => [],
    __success__ => [], __failure__ => []
);

my $SOFTWARE;
for my $soft ($cfg->GroupMembers('software')) {
    my $val = $cfg->val($soft, "__check__") or next;

    print "# [$soft] __check__\n" if $dryrun;
    if (vsystem($val) == 0) {
        $SOFTWARE = $soft;
        $SOFTWARE =~ s/^software\s+//;
        last;
    }
    print "[ $? == 0 ] || exit 1\n" if $dryrun;
}

defined $SOFTWARE
    or die "FATAL: Failed to detect kind of software.\n";

setenv(undef, SOFTWARE => $SOFTWARE);
setenv(undef, PLATFORM => $PLATFORM);

sourceenv("software $SOFTWARE");
sourceenv("platform $PLATFORM");

print "\n" if $dryrun;

for my $pair (pairs(@{$cmds{__prep__}})) {
    my ($k, $v) = @$pair;

    print "# [$k] __prep__\n" if $dryrun;
    vsystem($v) == 0 or die "[$k] `__prep__' stage failed.\n";
}

print "\n" if $dryrun;

if ($print) {
    if ($print =~ s/^\$//) {
            exit 1 unless exists $cfgenv{$print};

            my ($sect, $v) = @{$cfgenv{$print}};

            if ($verbose) {
                print "[$sect]\n" if defined $sect;
                print "\$$print = ";
            }

            print "$v\n";
            exit 0;
    } elsif ($print =~ s/^\\//) {
        die "Printing references not yet supported\n";
    } else {
        my $notfound = 1;
        for my $pair (reverse pairs(@{$cmds{$print}})) {
            my ($sect, $v) = @$pair;

            print "[$sect]\n$print = " if $verbose;
            print "$v\n";
            $notfound = 0;
        }
        exit $notfound;
    }
}

if ($exec) {
    exec "@ARGV"
}

unless (defined $cmd) {
    $cmd = '__cmd__';
    for my $pair (pairs(@{$cmds{__args__}})) {
        my (undef, $v) = @$pair;

        push @ARGV, $v;
    }
}

my $ret = vsystem(pairvalues(@{$cmds{$cmd}}), @ARGV);

print "\n" if $dryrun;

my $next = $ret == 0 ? "__success__" : "__fail__";

for my $pair (reverse pairs(@{$cmds{$next}})) {
    my ($k, $v) = @$pair;

    print "# [$k] $next\n" if $dryrun;
    vsystem($v) == 0 or die "[$k] `$next' stage failed.\n";
}

exit $ret;

sub run {
    my ($cmd) = @_;

    my $out = `$cmd`;
    chomp($out);
    return $out;
}

sub projectdir {
    my $super;

    $super = run('git rev-parse --show-superproject-working-tree');
    $super = run('git rev-parse --show-toplevel') unless $super;
    $super = getcwd() unless $super;

    return abs_path($super);
}

sub slurp {
    -f $_[0] && open(my $fh, '<', $_[0]) or return;
    my $out = do { local $/; <$fh> };
    chomp $out;
    $_ = $out;
}

sub expandenv {
    my $arg = shift;
    return $arg if $dryrun;
    $arg =~ s/\$\{(\w+)\}/$ENV{$1}/gr
}

sub setenv {
    my ($sect, $k, $v) = @_;

    $cfgenv{$k} =  [$sect, $v];

    $ENV{$k} = expandenv($v);
    if ($dryrun) {
        print "export $k=$ENV{$k}";
        print " # [$sect]" if defined $sect;
        print "\n";
    }
}

sub sourceenv {
	my $sect = shift;
	print "# [$sect]\n" if $dryrun;

        for my $k ($cfg->Parameters($sect)) {
            my $v = $cfg->val($sect, $k);

            if ($k =~ s/^\$//) {
                setenv($sect, $k => $v);
                next;
            }

            if ($k =~ s/^\\//) {
                die "disallowed recursion in \\$sect\n" if "$k $v" eq $sect;

                sourceenv("$k $v");
                next;
            }

            if ($k =~ /^(?:.*\/)?(__.*__)$/ and not exists $cmds{$1}) {
                die "Unknown special command: $k\n";
            }

            push @{$cmds{$k}}, ($sect, $v);
        }
}

sub vsystem {
    if ($dryrun) {
        print join(' ', @_), "\n";
        return 0;
    } else {
        my $ret = system "@_";
        warn "vsystem: $!\n" if $ret == -1;
        return $ret & 0xFF ? $ret : $ret >> 8;
    }
}

sub collectcfgs {
    my @cfgs = @_;
    slurp('.git') and do {
        s/^gitdir: //;
        my $commondir = "$_/" . slurp("$_/commondir");
        push @cfgs, "$commondir/../.makeshift";
    };
    push @cfgs, "./.makeshift";

    my $cfg;
    for (@cfgs) {
        next unless -e;
        $cfg = Config::IniFiles->new(
            -file => $_, -import => $cfg,
            -allowempty => 1, -negativedeltas => 1,
        );
    }

    ($cfg, @cfgs)
}

sub readcfgs {
    my $cfg;

    for (@_) {
        next unless defined and -e;
        $cfg = Config::IniFiles->new(
            -file => $_, -import => $cfg,
            -allowempty => 1, -negativedeltas => 1,
        );
    }

    return $cfg;
}

__END__

=pod

=head1 NAME

makeshift - makeshift solution for build configuratio management

=head1 SYNOPSIS

makeshift [options] [make arguments ...]

 Options:
   --set=P, -s=P       set platform 'P' configuration to use
   --cmd=C, -c=C       run command 'C'
   --edit, -e          edit platform configuration
   --print=S, -p=S     print makeshift symbol 'S' (e.g. $CONFIG or __cmd__)
   --dryrun, -n        dump shell script that reproduces what makshift would've done
   --help, -h          show this help message

=head1 DESCRIPTION

B<makeshift> is a simple tool to manage build C<ini>-formatted build configurations.
User can define softwares, means to detect them and inline shell scripts to run before
and after the build process. The ability to define command line arguments and environment
variables is baked in as well.

After the software is defined, platform configurations can be defined and selected with
C<-s>. See the next section for an example.

=head1 Sections

The ini file defines a couple of section to improve reusability:

=head2 builder

While optional, a builder section is advised to hold all the build system specific parts.
For example for a Kbuild based project, it can look like this:

    [builder kbuild]
    __cmd__ = make -j$((nproc --all || printf "1\n") | tr -d '\n')

=head2 software

The software section defines the software project specific parts. For example how to detect
the software project, how to prepare the builder for this project and default arguments
to use.

    [software barebox]
    \builder = kbuild
    $KCONFIG_OVERWRITECONFIG = y
    $KBUILD_OUTPUT = ../build/${SOFTWARE}/${PLATFORM}
    $CONFIG = ../${SOFTWARE}-cfg/${PLATFORM}/.config
    __args__ = O=../build/${SOFTWARE}/${PLATFORM}
    __prep__ = <<EOT
            mkdir -p $(dirname ${CONFIG})
            touch ${CONFIG}
            ln -r -f -s $(realpath ${CONFIG}) ${KBUILD_OUTPUT}/.config
            rm -f build && ln -f -s ${KBUILD_OUTPUT} build
    EOT
    __check__ = git cat-file commit a3ffa97f40dc81f2d6b07ee964f2340fe0c1ba97 2>/dev/null 1>/dev/null

=head2 platform

The platform section describes one configuration of the software. This may be
build system parameters and cross compiler settings and such.

    [platform mx6]
    $ARCH = arm
    $CROSS_COMPILE = arm-v7a-linux-gnueabihf-

=head1 CONFIGURATION

B<makeshift> will fetch configuration out of C</etc/makeshift/*>, C<$XDG_CONFIG_HOME/makeshift/*>
and C<./.makeshift>. These files will not be modified. Selected platforms stored in C<$XDG_CONFIG_HOME/makeshift/selected_platforms> are affected by the C<-s> option however.

Example configuration for Kbuild-using C<barebox>:

    [builder kbuild]
    __cmd__ = make -j$((nproc --all || printf "1\n") | tr -d '\n')
    
    [software barebox]
    \builder = kbuild
    $KCONFIG_OVERWRITECONFIG = y
    $KBUILD_OUTPUT = ../build/${SOFTWARE}/${PLATFORM}
    $CONFIG = ../${SOFTWARE}-cfg/${PLATFORM}/.config
    __args__ = O=../build/${SOFTWARE}/${PLATFORM}
    __prep__ = <<EOT
            mkdir -p $(dirname ${CONFIG})
            touch ${CONFIG}
            ln -r -f -s $(realpath ${CONFIG}) ${KBUILD_OUTPUT}/.config
            rm -f build && ln -f -s ${KBUILD_OUTPUT} build
    EOT
    __check__ = git cat-file commit a3ffa97f40dc81f2d6b07ee964f2340fe0c1ba97 2>/dev/null 1>/dev/null
    
    [platform mx6]
    $ARCH = arm
    $CROSS_COMPILE = arm-v7a-linux-gnueabihf-
    
    [platform mx6-clang]
    \platform = mx6
    $CONFIG = ../${SOFTWARE}-cfg/mx6/.config
    __args__ = CC=clang
    

=cut