call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', {'as':'dracula'}
call plug#end()

set number
set relativenumber
syntax on

" Encoding "
set encoding=utf-8
set termencoding=utf-8

" Backup and Swap
set nobackup
set nowritebackup
set noswapfile

" Search Options
set hlsearch   " Highlight search
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
set expandtab
set smarttab

" Auto indentation
set ai
" Smart indentation
set si

" Tab Options"
set shiftwidth=2
set tabstop=2
set expandtab

colorscheme dracula
hi Normal ctermbg=NONE guibg=NON
set termguicolors

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

" Remove hl "
nnoremap <silent><leader>c :nohlsearch<CR>

" Start BufExplorer
nnoremap <silent><leader>\ :vs<CR>
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>1 :e ~/.vimrc<CR>

" Indent visual selected code without unselecting
vmap > >gv
vmap < <gv

" Custom plugin maps
nmap <leader>t :FZF<CR>
nmap <leader>l :Buffers<CR>

" Ack tricks
" Seen at https://github.com/jeremyckahn
nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
  
" Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :Gdiff<CR> 


