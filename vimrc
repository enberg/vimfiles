filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme wombat256

let mapleader = ","

" Quickfire .vimrc editing
nmap <leader>ve :tabedit $MYVIMRC<CR>
" Autoload .vimrc post edit
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
syntax on
filetype on
filetype plugin on
filetype indent on
 
" Search settings
set hlsearch
set incsearch 

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"let g:tagbar_usearrows = 1
"nnoremap <leader>tb :TagbarToggle<CR>

" Ctrlp conf
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Testing alternate esc
imap jj <esc>

" Tab movement
nmap <leader>th :tabprevious<CR>
nmap <leader>tl :tabnext<CR>
nmap <leader>tc :tabclose<CR>

" Window movement
nmap <leader>wk :wincmd k<CR>
nmap <leader>wj :wincmd j<CR>
nmap <leader>wh :wincmd h<CR>
nmap <leader>wl :wincmd l<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
