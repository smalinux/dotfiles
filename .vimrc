
" Ur coc-extensions
":CocInstall coc-clangd coc-cmake coc-elixir coc-fzf-preview coc-highlight coc-json coc-just-complete coc-lists coc-lsp-wl coc-tsserver coc-vimlsp coc-yank
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
set tabstop=3 softtabstop=3 shiftwidth=3 	" size of indent = 4
set smartindent
set autoindent
set lbr
set tw=500
set mouse=n
runtime! ftplugin/man.vim
let $PAGER='most'
"set ttymouse=xterm2
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ','
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lookat these plugins later
" ==========================
" https://github.com/tpope/vim-abolish
" https://github.com/tpope/vim-repeat
" https://github.com/tpope/vim-unimpaired
" https://github.com/vim-scripts/Align
" https://github.com/prabirshrestha/async.vim
" https://github.com/SirVer/ultisnips
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'notpratheek/vim-luna'
Plugin 'ludovicchabant/vim-gutentags' " for Ctags automation
Plugin 'djoshea/vim-autoread'
Plugin 'mileszs/ack.vim'
Plugin 'preservim/tagbar'       "<F8> button
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plugin 'junegunn/fzf.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'tommcdo/vim-exchange'
Plugin 'bronson/vim-visual-star-search'
Plugin 'godlygeek/tabular'
Plugin 'kamykn/spelunker.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'puremourning/vimspector'
"Plugin 'vivien/vim-linux-coding-style' " don't enable that if you don't play with linux codestyle

call vundle#end()            " required
filetype plugin indent on    " required

" Coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>


" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ lightline.vim config
set laststatus=2
" No show Mode! lightlinw.vim will take care!
set noshowmode " No show Mode! lightlinw.vim will take care!
" Colorscheme configuration
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ }
" }}}

" {{{ Rainbow brackets config ({{{{}}}})
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" }}}

" {{{ Theming
syntax enable
colorscheme luna-term
let g:airline_theme='luna'
let g:airline_powerline_fonts=1 "Requires powerline fonts!
set cursorline
" }}}

" {{{ [gutentags] Don't pollute project dirs
let g:gutentags_cache_dir = '~/.vim/tags/'
let g:gutentags_gtags_options_file = '~/dotfiles/tags.conf'
set statusline+=%{gutentags#statusline()}
" }}}

" {{{ Auto strip trailing spaces when save - https://vi.stackexchange.com/a/456
function! <SID>StripTrailingWhitespaces()
   let l:save = winsaveview()
   keeppatterns %s/\s\+$//e
   call winrestview(l:save)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" {{{ Clean last search highlighting - https://stackoverflow.com/a/1037182
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" }}}

" {{{
" multi-word aliases function - https://stackoverflow.com/a/3879737
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" :mm <arg> in vert split
" :m <arg> for horisontal split
call SetupCommandAlias("mm", "vert Man")
call SetupCommandAlias("m", "Man")
" }}}

" {{{ open the file at last place I was in it
" https://stackoverflow.com/q/66331167/5688267
augroup vimStartup | au!
    autocmd BufRead * call setpos('.', getpos("'\""))
augroup end
" }}}

" {{{ Zoom / Restore window. <C-w>o
" https://stackoverflow.com/a/26551079/5688267
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>o :ZoomToggle<CR>
" }}}

" {{{ Key binding
"Show name of file and path relative to current working directory
map <F6> :!make run<CR>
"Show current working directory
map <F7> :pwd<CR>
"Close current buffer
map <F12> :bd!<CR>
"run make
map <F5> :make<CR>
" vim backgrund transparent
hi Normal guibg=NONE ctermbg=NONE
" Move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <CAPS> <BS>
nmap <F8> :TagbarToggle <CR>
" hidden feature ;-)
nnoremap <C-w>n <C-w>s
" }}}

" {{{ Easy motion plugin
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-overwin-f)
nmap <CR> <Plug>(easymotion-s2)
" }}}

" {{{ FZF
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>h :History<CR>
" }}}

" {{{ Yggdroot/indentLine - for indention
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}}

" {{{ Working with tabs
" I don't like tabs! messier and hard to open.
" Just one tab is enough for me.
" }}}

" {{{ no need for ex mode. - move record macro to Q
" https://stackoverflow.com/q/10956261/5688267
nnoremap Q q
nnoremap q <Nop>
" }}}

" {{{ highlight these words for me.
syn keyword celTodo contained TODO FIXME XXX NOTE
" }}}

" Update vimrc no the fly
" what if you want to update your vimrc file in the middle of an editing session?
" and you want to use these settings in this current session...
" this next snippet do that
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" {{{ :terminal
" Please don't use :terminal every. I really hate it.
" use any tailing window manager instead
" }}}

" {{{ Folding
"set foldmethod=indent               " not as cool as syntax, but faster
"set foldlevelstart=1               " start unfolded
" Toggle fold at current position.
"nnoremap <tab> za
" }}}

"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>

" {{{ Abbreviations
iabbrev @@ sohaib.amhmd@gmail.com
iabbrev ccopy (C) 2021 Sohaib Mohamed.
" }}}

" {{{ map H and L
" Map H in normal mode to go to the beginning of the current line.
nnoremap H ^
nnoremap L $
nnoremap 0 <nop>
nnoremap $ <nop>
" }}}

"" :LinuxCodingStyle Plugin
"let g:linuxsty_patterns = [ "/home/sohiab/htop-master", "/linux" ]
"nnoremap <silent> <leader>a :LinuxCodingStyle<cr>
"

" {{{ Plugin 'kamykn/spelunker.vim'
" Improved vim spelling plugin (with camel case support)!
" https://github.com/kamykn/spelunker.vim
" ======================================================
" Zl
" ZT
" }}}

" {{{
" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>
" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
" }}}

" {{{ Plugin 'puremourning/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
" }}}

" {{{
echo "Hi, Sohaib ^.^"
" }}}
