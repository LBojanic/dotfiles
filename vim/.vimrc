call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder
Plug 'mileszs/ack.vim' " File search
Plug 'tpope/vim-fugitive' " Git
Plug 'airblade/vim-gitgutter' " Git
Plug 'vim-airline/vim-airline' " Custom bar
Plug 'dense-analysis/ale' " Linting
Plug 'maxmellon/vim-jsx-pretty' " Syntax highlight
Plug 'othree/html5.vim' " Syntax hightlight for HTML
Plug 'stsewd/fzf-checkout.vim' " Fuzzy branch checkout
Plug 'preservim/nerdtree' " File explorer
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completition and go to implementation/declaration
Plug 'moll/vim-node'
Plug 'townk/vim-autoclose' " Autoclosing quotes, brackets ..
Plug 'nelstrom/vim-visual-star-search' " Select and press * to search for the selection in the file
Plug 'tpope/vim-surround' " Surround with quotes, braces ...
Plug 'sonph/onehalf', { 'rtp': 'vim' } " Colorsheme
Plug 'pangloss/vim-javascript' " Syntax highlight
Plug 'JulesWang/css.vim' " Syntax highlight for css
Plug 'genoma/vim-less' " Syntax hightlight for less
Plug 'Yggdroot/indentLine' " Indentation lines
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
call plug#end()

" Cheetsheet
" Syntax highlighting in fzf window - https://crates.io/crates/bat  "
" cs"' changes double quotes to single quotes from inside
" ds" deletes surrounding quotes
" ysiw] surround the word with ] ( can be done with anything )
"
" <c-v> and <c-b> for scrolling in the suggestions window
" <c-o> after gd to return to calling point
"
" use K for description under cursor
" gy for type definition
" gd for definition
" gi for implementation
" gr for references
" [c jump to next changed in git diff
" ]c jump to previous changed in git diff
" gcc for commenting a line
" gc for commenting a visual block
"
"
set encoding=UTF-8
set guifont=font-hack-nerd-font
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
set cursorline
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme dracula
hi Normal ctermbg=NONE guibg=NONE " If set transparent background is available
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
nnoremap <C-U> 11k
nnoremap <C-D> 11jz

" Remove hl "
nnoremap <leader>x :nohlsearch<CR>


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
nnoremap <leader>go :GBranches<CR>

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>zz
let NERDTreeShowLineNumbers=1 " enable line numbers
let g:NERDTreeWinSize=60
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used


" Coc config TODO:
vmap <leader>ca  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>ca  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

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
augroup END

if has('nvim-0.4.3') || has('patch-8.2.0750')
          nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          nnoremap <nowait><expr> <C-v> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
          inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
          inoremap <nowait><expr> <C-v> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'S',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'D',
                \ 'Dirty'     :'',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:gitgutter_diff_args='--cached'
