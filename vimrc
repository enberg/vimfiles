set nocompatible
filetype off
set laststatus=2

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/autoload && curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Bundles
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mileszs/ack.vim'

" Bundles : Colors
Plug 'davidklsn/vim-sialoquent'
Plug 'arcticicestudio/nord-vim'

" Bundles : Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" Bundles : HTML
Plug 'mattn/emmet-vim'

" Bundles : Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }

" Bundles : JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'nikvdp/ejs-syntax', { 'for': 'ejs' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" Bundles : TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" Bundles : Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Bundles : Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" Initialize plugin system
call plug#end()

filetype plugin indent on

set t_Co=256
"let g:jellyx_show_whitespace = 1
"set background=dark
colorscheme nord

let mapleader = ","

" Quickfire .vimrc editing
nmap <leader>ve :tabedit $MYVIMRC<CR>
" Autoload .vimrc post edit
if has("autocmd")
    augroup Vimreload
        autocmd!
        autocmd bufwritepost .vimrc source $MYVIMRC
    augroup END
endif

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

syntax on
filetype on
filetype plugin on
filetype indent on
set number

" Softtabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" tab deviations
if has("autocmd")
    augroup SynTabs
        autocmd!
        autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
    augroup END
endif

" Search settings
set hlsearch
set incsearch

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
if has("autocmd")
    augroup NERDcmd
        autocmd!
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    augroup END
endif

" Testing alternate esc
imap jj <esc>

" Tab movement
nmap <leader>tp :tabprevious<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>tc :tabclose<CR>

" Window movement
nmap <leader>wk :wincmd k<CR>
nmap <leader>wj :wincmd j<CR>
nmap <leader>wh :wincmd h<CR>
nmap <leader>wl :wincmd l<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Quick numbershift
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <silent> <Leader>rn :call NumberToggle()<CR>

" Grepping
command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33

" Pasta toggle
set pastetoggle=<F2>

" Fugitive
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>

" A.L.E.
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\}

" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript nnoremap <leader>r :TsuReferences<cr>¬
autocmd FileType typescript nnoremap <leader>d :TsuDefinition<cr>¬
autocmd FileType typescript nnoremap <leader>t : <C-u>echo tsuquyomi#hint()<CR>

" STACKENBLOCHEN
set colorcolumn=80

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Syntactic
let g:syntastic_javascript_checkers = ['eslint']

" Search
let g:ackprg = 'ag --nogroup --nocolor --column'
