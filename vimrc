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

"let g:tagbar_usearrows = 1
"nnoremap <leader>tb :TagbarToggle<CR>

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
