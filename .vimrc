" Hi

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

set nu relativenumber

" Highlight current line
set cursorline


"set noerrorbells
"set tabstop=4 softtabstop=4
"set expandtab
"set smartindent
"set backspace=indent,eol,start  " more powerful backspacing
"set autoindent
"set cindent
"set shiftwidth=2
"set smartcase
"set undodir
"set undofile
" incase search, search while i am typing ....
set is
:set autoread | au CursorHold * checktime | call feedkeys("lh")

"# useful when split vim windows 
":vsp [filename] & ctl w v
":sp [filename] & ctrl w n
set splitbelow splitright

"# Shortcut split navigation, ctl+[h/j/k/l]
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Re-arrange my most used symbols
inoremap <CAPS> <BS>



set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Sets how many lines of history VIM has to remember
set history=500

" ignore case when search for some thing.
" set noic      to remove ignore case!
set ic

" Highlight all search results when use /
set hls

" Enable filetype plugins
" filetype plugin on
" filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
" au FocusGained,BufEnter * checktime


" toggle paste mode
set pastetoggle=<F3>


" copy things from vim to outside ....
"
"


" I like to be scroll free ;)
""set scrolloff




" Making knew shortcuts ...
"map w e
map <F5> i{<Esc>$a}<Esc>    " Click F5 to surround a line with {}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines



""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows :help CTRL-W 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resize widows with mouse :)))
" https://vi.stackexchange.com/a/521/23017
:set mouse=n
:set ttymouse=xterm2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto close brackets 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""









"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ripped off from Cosmin Ratiu, on SO list; 30 Jun 2009
if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0	" Use cscope first, then ctags
        set cst		" Only search cscope
        set csverb	" Make cs verbose

        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

        nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

        " Open a quickfix window for the following queries.
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugin manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

"
" Git plugin not hosted on GitHub
" >>>> Plugin 'git://git.wincent.com/command-t.git'

"
" git repos on your local machine (i.e. when working on your own plugin)
" >>>> Plugin 'file:///home/gmarik/path/to/plugin'

"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"
" Dark theme for Vim
"Plugin 'Zenburn'

"
" A light and configurable statusline/tabline plugin for Vim
"Plugin 'itchyny/lightline.vim'

"
" terryma/vim-multiple-cursors
" True Sublime Text style multiple selections for Vim
" https://github.com/terryma/vim-multiple-cursors

"
" vim-eunuch
" https://github.com/tpope/vim-eunuch

"
" surround
" https://github.com/tpope/vim-surround

"
" A tree explorer plugin for vim.
" Plugin 'preservim/nerdtree'

"
" EditorConfig plugin for Vim
" https://github.com/editorconfig/editorconfig-vim

"
" Emmet
" https://github.com/mattn/emmet-vim

"
" vim-gitgutter
" https://github.com/airblade/vim-gitgutter

"
" ALE
" https://github.com/w0rp/ale


"
" Rainbow brackets for Vim
Plugin 'frazrepo/vim-rainbow'

"
" Vim plugin for intensely nerdy commenting powers 
" Plugin 'preservim/nerdcommenter'

"
" search tool from Vim
" https://github.com/mileszs/ack.vim

"
" YouCompleteMe
" Plugin 'valloric/youcompleteme'

"
" Distraction-free writing in Vim.
Plugin 'junegunn/goyo.vim'

"
" Hard Mode in vim (deprecated)
"Plugin 'wikitopian/hardmode'

"
" vimWiki
Plugin 'vimwiki/vimwiki'

"
"Cool statusline
Plugin 'vim-airline/vim-airline' 

"
"Airline themes
Plugin 'vim-airline/vim-airline-themes' 
"Nice theme
Plugin 'notpratheek/vim-luna' 

"youcompleteme
Plugin 'oblitum/youcompleteme'
let g:ycm_global_ycm_extra_conf = "~/dotfiles/.ycm_extra_conf.py"

"
" ctags
Plugin 'ludovicchabant/vim-gutentags'

"
"auto-load
Plugin 'djoshea/vim-autoread'


" ==========================================================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Dracula Theme config
" ---------------------------
"colorscheme zenburn

" lightline.vim config
" --------------------
set laststatus=2
" No show Mode! lightlinw.vim will take care!
set noshowmode " No show Mode! lightlinw.vim will take care!
" Colorscheme configuration
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ }

" NERDTree Config
" map <C-o> :NERDTreeToggle<CR>

" Rainbow brackets config ({{{{}}}})
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" YouCompleteMe config
"

" Distraction-free config
map <C-g> :Goyo<CR>

" Hard Mode config
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
" End of plugin & config
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "




"Theming
syntax enable
colorscheme luna-term
let g:airline_theme='luna'
let g:airline_powerline_fonts=1 "Requires powerline fonts!
set cursorline








" ========================================================
" Tutorial <3
" ========================================================

" Compare two files
"$ vimdiff file1 file2

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"[gutentags] Don't pollute project dirs
let g:gutentags_cache_dir = '~/.vim/tags/'
set statusline+=%{gutentags#statusline()}


"Buttons for going to previous/next file (buffer)
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
"Show a list of files (buffers) that are open
map <F4> :buffers<CR>
"Yank (copy) contents of current file (buffer) - also to X11 clipboard
map <F5> :%y+<CR>
"Show name of file and path relative to current working directory
map <F6> :echo @%<CR>
"Show current working directory
map <F7> :pwd<CR>
"Close current buffer
map <F12> :bd!<CR>


" copy to ...
vnoremap <C-c> "+y
map <C-v> "+P

