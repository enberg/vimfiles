" SETTINGS
set number

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Softtabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Pasta toggle
set pastetoggle=<F2>

" STACKENBLOCHEN
set colorcolumn=80

let mapleader = ","

" Load vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Bundles
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'

" Bundles : CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Bundles : Colors
Plug 'dracula/vim'

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

" Bundles : TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Bundles : Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Bundles : Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" Bundles : Elm
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

" Initialize plugin system
call plug#end()

" Config : Color
colorscheme dracula

" Quickfire .vimrc editing
nmap <leader>ve :tabedit $MYVIMRC<CR>
" Autoload .vimrc post edit
if has("autocmd")
    augroup Vimreload
        autocmd!
        autocmd bufwritepost .vimrc source $MYVIMRC
    augroup END
endif

nmap <silent> <leader>s :set nolist!<CR>

" vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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

" Quick numbershift
nnoremap <silent> <Leader>rn :set relativenumber!<CR>

" Fugitive
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" CoC config
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-html',
    \ 'coc-json',
    \ 'https://github.com/rodrigore/coc-tailwind-intellisense',
    \ 'coc-tsserver',
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-tab> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" apply autofix to problem on the current line.
nmap <leader>af  <plug>(coc-fix-current)
nmap <leader>am  <plug>(coc-format-selected)
xmap <leader>am  <plug>(coc-format-selected)
nmap <leader>ac  <Plug>(coc-codeaction)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
