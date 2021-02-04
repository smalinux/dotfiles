syntax on
set nu relativenumber
set cursorline
set is
:set autoread | au CursorHold * checktime | call feedkeys("lh")
set splitbelow splitright
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set history=500
set ic
set hls
set nobackup
set nowb
set noswapfile
set expandtab
set shiftwidth=4 	" size of indent = 4
set tabstop=4 softtabstop=4
set smartindent
set autoindent
set lbr
set tw=500
:set mouse=n
:set ttymouse=xterm2
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ','
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'notpratheek/vim-luna' 
Plugin 'oblitum/youcompleteme'
Plugin 'ludovicchabant/vim-gutentags' " for Ctags automation
Plugin 'djoshea/vim-autoread'
Plugin 'mileszs/ack.vim'
Plugin 'preservim/tagbar'       "<F8> button
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline.vim config
set laststatus=2
" No show Mode! lightlinw.vim will take care!
set noshowmode " No show Mode! lightlinw.vim will take care!
" Colorscheme configuration
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ }
" Rainbow brackets config ({{{{}}}})
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = "~/dotfiles/.ycm_extra_conf.py"
" Distraction-free config
"Theming
syntax enable
colorscheme luna-term
let g:airline_theme='luna'
let g:airline_powerline_fonts=1 "Requires powerline fonts!
set cursorline
"[gutentags] Don't pollute project dirs
let g:gutentags_cache_dir = '~/.vim/tags/'
let g:gutentags_gtags_options_file = '~/dotfiles/tags.conf'
set statusline+=%{gutentags#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key binding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" vim backgrund transparent
hi Normal guibg=NONE ctermbg=NONE
" Move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <CAPS> <BS>
"map <F5> i{<Esc>$a}<Esc>    " Click F5 to surround a line with {}
nmap <F8> :TagbarToggle <CR>
