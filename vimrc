set nocompatible
filetype off
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'

" Bundles : Git
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'

" Bundles : HTML
Plugin 'mattn/emmet-vim'

" Bundles : Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'

" Bundles : JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

set t_Co=256
"let g:jellyx_show_whitespace = 1
"set background=dark
"colorscheme wombat256

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
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

" STACKENBLOCHEN
set colorcolumn=80

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Syntactic
let g:syntastic_javascript_checkers = ['eslint']
