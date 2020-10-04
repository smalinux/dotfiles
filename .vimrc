" Hi

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on


" set noerrorbells
" set tabstop=4 softtabstop=4
" set expandtab
"set smartindent
set nu relativenumber

" set smartcase
" set undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
" filetype plugin on
" filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
" au FocusGained,BufEnter * checktime


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
"
" " Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif



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
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>




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
" Dracula - Dark theme for Vim
Plugin 'dracula/vim', { 'name': 'dracula' }

"
" A light and configurable statusline/tabline plugin for Vim
Plugin 'itchyny/lightline.vim'

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
Plugin 'preservim/nerdtree'

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
Plugin 'wikitopian/hardmode'








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
colorscheme dracula

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
map <C-o> :NERDTreeToggle<CR>

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































