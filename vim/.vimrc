call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive' " Git
Plug 'airblade/vim-gitgutter' " Git
Plug 'vim-airline/vim-airline' " Custom bar
Plug 'dense-analysis/ale' " Linting
Plug 'maxmellon/vim-jsx-pretty' " Syntax highlight
Plug 'othree/html5.vim'
Plug 'stsewd/fzf-checkout.vim' " Fuzzy branch checkout
Plug 'leafgarland/typescript-vim' " Syntax highlight
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completition
Plug 'moll/vim-node'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'townk/vim-autoclose'
Plug 'preservim/nerdcommenter' " Use c<Space>c for commenting a line or visual block
Plug 'nelstrom/vim-visual-star-search' " Select and press * to search for the selection in the file
Plug 'tpope/vim-surround' " Surround with quotes, braces ...
Plug 'sonph/onehalf', { 'rtp': 'vim' } " Colorsheme
Plug 'pangloss/vim-javascript' " Syntax highlight
Plug 'JulesWang/css.vim' " Syntax highlight for css
Plug 'genoma/vim-less' " Syntax hightlight for less
Plug 'Yggdroot/indentLine' " Indentation lines
call plug#end()

" Cheetsheet
" Syntax highlighting in fzf window - https://crates.io/crates/bat  "
" cs"' changes double quotes to single quotes from inside
" ds" deletes surrounding quotes
" ysiw] surround the word with ] ( can be done with anything )

set number
set relativenumber
syntax enable


" Backup and Swap
set nobackup
set nowritebackup
set noswapfile

" Search Options
set hlsearch   " Highlight search
let @/ = ""
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" Shows matching brackets when text indicator is over them
set showmatch

set cursorline

" Improves redrawing for newer computers
set ttyfast

" when moving through the lines, the cursor will try to stay in the previous columns
set nostartofline

" Use spaces instead of tabs
set tabstop=4           " Show tabs as 4 spaces
set softtabstop=4
set shiftwidth=4        " Indent with 4 spaces when > is pressed
set expandtab
set smarttab

" Auto indentation
set ai
" Smart indentation
set si

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let mapleader = " "
" Custom source .vimrc
map <leader><CR> :so ~/.vimrc<CR>

" Custom escape mapping
inoremap jk <Esc>
" Custom window navigation "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-U> 11kzz
nnoremap <C-D> 11jzz

" Remove hl "
nnoremap <leader>cl :nohlsearch<CR>


" Start BufExplorer
nnoremap <silent><leader>\ :vs<CR>
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>1 :e ~/.vimrc<CR>

" Indent visual selected code without unselecting
vmap > >gv
vmap < <gv

" Custom plugin maps
nmap <leader>t :GFiles<CR>
nmap <leader>l :Buffers<CR>
nmap <leader>, :bp<CR>
nmap <leader>. :bn<CR>

" Ack tricks
" Seen at https://github.com/jeremyckahn
nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Git Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>go :GBranches<CR>

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1 " enable line numbers
let g:NERDTreeWinSize=60
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used


" Coc config TODO:
"

" Nerd Commenter
let g:NERDSpaceDelims = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Ale
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
 let g:ale_linters = {
  \  'javascript': ['eslint'],
  \}

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
nnoremap <leader>n :ALENext<CR>
nnoremap <leader>N :ALEPrevious<CR>

" Vim javascript syntax hightlighting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


augroup configgroup
  autocmd!
  autocmd Filetype gitcommit setlocal spell textwidth=72

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md setlocal spell textwidth=80 colorcolumn=+1
  autocmd BufRead,BufNewFile *.md.erb setlocal spell textwidth=80 colorcolumn=+1
  autocmd BufRead,BufNewFile *.feature setlocal spell
  autocmd BufNewFile,BufRead *.svg set filetype=xml
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .jshintrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
  " show type information automatically when the cursor stops moving
  " autocmd FileType typescript autocmd CursorHold <buffer>
  autocmd FileType typescript nmap <buffer> <leader>i :echom tsuquyomi#hint()<cr>
  autocmd FileType typescript nmap <buffer> <leader>I :TsuImport<cr>
augroup END
