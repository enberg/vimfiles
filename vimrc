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
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mileszs/ack.vim'
Plug 'Shougo/unite.vim'
Plug 'RRethy/vim-hexokinase'

" Bundles : Colors
Plug 'davidklsn/vim-sialoquent'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" Bundles : Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
Plug 'ianks/vim-tsx'

" Bundles : Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Bundles : Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" Initialize plugin system
call plug#end()

filetype plugin indent on

syntax on
set number

set path+=**
set wildmenu

"let g:jellyx_show_whitespace = 1
set background=dark
colorscheme gruvbox
" let g:solarized_termtrans = 1

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

set foldmethod=manual

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Softtabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

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
let g:ale_typescript_tsserver_executable = '/usr/local/bin/tsserver'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_fixers = {'typescript': ['tslint']}

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup',  '--hidden', '-g', '']
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <leader>u :<C-u>Unite -no-split -buffer-name=gitfiles -start-insert file_rec/git<CR>
nnoremap <silent> <leader>f :<C-u>Unite -no-split -buffer-name=files    -start-insert file_rec/async<cr>
nnoremap <silent> <leader>e :<C-u>Unite -no-split -buffer-name=mru      -start-insert file_mru<cr>
nnoremap <silent> <leader>o :<C-u>Unite -no-split -buffer-name=outline  -start-insert outline<cr>
nnoremap <silent> <leader>y :<C-u>Unite -no-split -buffer-name=yank     history/yank<cr>
nnoremap <silent> <leader>b :<C-u>Unite -no-split -buffer-name=buffer   buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-r>   <Plug>(unite_redraw)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
	imap <silent><buffer><expr> <C-s>     unite#do_action('split')
	imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
endfunction

" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_single_quote_import = 1
autocmd FileType typescript nnoremap <leader>m :TsuRenameSymbol<cr>
autocmd FileType typescript nnoremap <leader>r :TsuReferences<cr>
autocmd FileType typescript nnoremap <leader>d :TsuDefinition<cr>
autocmd FileType typescript nnoremap <leader>t : <C-u>echo tsuquyomi#hint()<CR>

" STACKENBLOCHEN
set colorcolumn=80

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Search
let g:ackprg = 'ag --nogroup --nocolor --column'

" Supertab
let g:SuperTabDefaultCompletionType = "context"
