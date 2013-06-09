filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set t_Co=256
"let g:jellyx_show_whitespace = 1
colorscheme wombat256
"set background=dark

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
set number
 
" Softtabs
set softtabstop=4
set shiftwidth=4
set expandtab

" Search settings
set hlsearch
set incsearch 

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"let g:tagbar_usearrows = 1
"nnoremap <leader>tb :TagbarToggle<CR>

" Syntastic conf php
let g:syntastic_phpcs_disable = 1

" Ctrlp conf
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = ''

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

nnoremap <silent> <Leader>mz :VimroomToggle

" Quick numbershift
nnoremap <silent> <Leader>r :set relativenumber!<CR>
nnoremap <silent> <Leader>rn :set number!<CR>

" Mebbe fix supertab/snipmate troubles
let g:SuperTabDefaultCompletionType = "context"
