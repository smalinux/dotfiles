"
"  $Id: man.vim,v 1.3 2017/11/28 19:11:22 rfp Exp $
"	man.vim:  A vim plugin by Rich Paul
"	
"	This script allows one to open a man page using
"	  :e man:bash
"	     the section can also be included.  This opens the man page
"	     for the userspace program stat
"	  :e man:1:stat  
"	     This opens the man page for the system call program stat
"	  :e man:2:stat
"	     This opens the man page for the library call program stat
"	  :e man:3:stat
"
"	Usage:  put it in the plugin directory, and
"			(command line): vim sudo:/etc/passwd
"			(within vim):   :e sudo:/etc/passwd
"
"	Requires:
"		decent OS (sorry, no windows, unless cygwin has sudo now?)
"	Provides:
"		URL handler, man: scheme
"		1 autocommands
"		
"	Commands:
"		XMan
"	ToDo:
"		Allow one to sudo to users other than root.
"		Quote the file name better.
"

if exists("s:seen") 
	if !exists("s:debug") || !s:debug
		finish
	endif
endif
let s:seen=1
let s:debug=0
runtime ftplugin/man.vim

function! XManRead(url)
	if a:url=="<afile>"
		let file=expand(a:url)
	else
		let file=a:url
	endif
	let prot=matchstr(file,'^\(man\)\ze:')
	if '' != prot
		let file=strpart(file,strlen(prot)+1)
	endif
	let sect=matchstr(file,'^\(\d\+\)\ze:')
	if '' != sect
		let file=strpart(file,strlen(sect)+1)
	endif	

	let file=shellescape(file,1)
	:0,$d
	call setline(1,"foo")
	exec '1read !man '.sect.' '.file
	:1d
	set nomod
	set ft=man
endfunction

command! -nargs=1 XMan call XManRead(<f-args>)
augroup XMan
	autocmd!
	au BufReadCmd	man:*,man:*/* XMan <afile>
	au FileReadCmd	man:*,man:*/* XMan <afile>
augroup END
