" ===========================
" Let's start with the basics
" ===========================

set nocompatible

filetype plugin indent on
syntax on

" ====================
"       Plugins
" ====================

" === Dir for plugins ===
call plug#begin('~/.config/nvim/plugged')
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'jhawthorn/fzy'
Plug 'alvan/vim-closetag'
Plug 'cloudhead/neovim-fuzzy'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tmsvg/pear-tree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'tomlion/vim-solidity'
Plug 'elixir-editors/vim-elixir'
Plug 'wakatime/vim-wakatime'
call plug#end()

" === Change leader to something better
let mapleader=";"

" === Show mode & match ===
set showmode
set showmatch

" === Set line numbers and use ruler ===
set ruler
set number
set relativenumber

" === Wildmenu ===
set wildmenu
set wildmode=longest:full,full

" === Sensible splitting
set splitbelow
set splitright

" === Indentation ===
set autoindent

" === Search behavior
set incsearch
set hlsearch
set ignorecase
set smartcase

" === Hide buffers ===
set hidden

" === Show incomplete commands ===
set showcmd

" === Gotta go fast
set ttyfast

" === Tab settings ===
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set shiftround

" === Backspace behavior ===
set backspace=indent,eol,start

" === Completion ===
set complete-=i
set omnifunc=syntaxcomplete#Complete

" ====================
" File explorer things
" ====================

" === Aesthetics ===
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_winsize=20
let g:netrw_browse_split=4

" === Delete dirs too ===
let g:netrw_localrmdir='rm -rf'

" === Bind file exlporer to <Leader>n
nnoremap <leader>n :Lexplore<CR>

set syntax
set background=dark
colorscheme afterglow
let g:afterglow_blackout=1
let g:afterglow_italic_comments=1
if has('termguicolors')
  set termguicolors
endif

" Fuzzy
nnoremap <C-p> :FuzzyOpen<CR>

" ====================
"       Pear Tree
" ====================

let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

" ====================
"     ALE/Prettier
" ====================
" Fix files with prettier, then eslint.

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\}
nnoremap <leader>p :Prettier<CR> :ALEFix<CR>


" ====================
"       closetag
" ====================

let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx,*.njk,*.vue'
let g:closetag_xhtml_filenames = '*.js,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,js,jsx,tsx,vue,njk'
let g:closetag_xhtml_filetypes = 'js,jsx,tsx'
let g:closetag_shortcut = '>'

" ====================
"       Coc.nvim
" ====================

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ====================
" Misc. Remaps
" ====================

nnoremap <leader>t :sp \| term<CR>
nnoremap <leader>T :vsp \| term<CR>
nnoremap <leader>h :sp \| enew<CR>
nnoremap <leader>v :vsp \| enew<CR>

" .astro fix
au BufRead,BufNewFile *.astro set filetype=html
