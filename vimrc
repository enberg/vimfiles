filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set laststatus=2

set t_Co=256
"let g:jellyx_show_whitespace = 1
"set background=dark
colorscheme wombat256

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

" Search settings
set hlsearch
set incsearch 

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Ctag stuff
let g:tagbar_usearrows = 1
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>tl :TlistToggle<CR>

" Syntastic conf php
let g:syntastic_phpcs_disable = 0

" Php-cs-fixer conf
let g:php_cs_fixer_dry_run = 1
let g:php_cs_fixer_verbose = 0

" Ctrlp conf
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/cache/*
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = ''

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

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

nnoremap <silent> <Leader>vr :VimroomToggle<CR>

" Quick numbershift
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <silent> <Leader>rn :call NumberToggle()<CR>

" Mebbe fix supertab/snipmate troubles
"let g:SuperTabDefaultCompletionType = "context"

" Phpunit convenience
com! -nargs=* Phpunit make -c app <q-args> | cw
nnoremap <silent> <Leader>t :Phpunit %<CR>

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

" Vim airline
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" STACKENBLOCHEN
set colorcolumn=80
