set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set background=dark
set t_Co=256

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vim Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-ruby/vim-ruby'
Plugin 'stanangeloff/php.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all'  }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'lepture/vim-jinja'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'neomake/neomake'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plugin 'heavenshell/vim-prettier'
Plugin 'joonty/vim-phpqa'
call vundle#end()

filetype plugin indent on

set backspace=indent,eol,start
set ruler " Show cursor position
set title " Show file title at the top of terminal window

" Display relative line numbers, with absolute number for current line
set number
set numberwidth=5
set relativenumber

"search settings
set hlsearch " Highlight all matches. To turn it off, use :noh
set incsearch " When searching, shows patterns typed so far

"set shiftround
"set shiftwidth=2
"set tabstop=2
" Always use spaces when inserting a <Tab>, so formatting 
" won't be messed up if tabstop is changed
set expandtab 

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

syntax enable
syntax on

au FileType python setlocal ts=4 sts=4 sw=4
au FileType php setlocal ts=4 sts=4 sw=4
au FileType ruby setlocal ts=2 sts=2 sw=2
au FileType javascript setlocal ts=2 sts=2 sw=2
au FileType html setlocal ts=2 sts=2 sw=2
au FileType css setlocal ts=2 sts=2 sw=2
au FileType json setlocal ts=2 sts=2 sw=2

set noswapfile " Prevent vim from generate .swp files

let mapleader="\<space>"

" save with Space + w
nnoremap <leader>w :w!<CR>
vnoremap <leader>w <Esc>:w!<CR>

" close with Space + q
nnoremap <leader>q :q!<CR>
vnoremap <leader>q <Esc>:q!<CR>

" Open new tab with Ctrl + t.
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" Close tab with Ctrl + w
nnoremap <C-w> :tabclose<CR>
inoremap <C-w> <Esc>:tabclose<CR>

" Ident files with F7
map <F7> mzgg=G`z

" FZF ignore files in gitignore
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" Open FZF in new tab
noremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>

let g:airline_theme='tomorrow'

colorscheme obsidian

imap <C-Space> <C-y>,

" use lint while typing
call neomake#configure#automake('w')

autocmd InsertLeave,BufWritePost * update | Neomake

" Eslint
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']

let g:indent_guides_enable_on_vim_startup = 1

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Config phpcs
let g:phpqa_codesniffer_cmd='vendor/bin/phpcs'
let g:phpqa_codesniffer_args = '--standard=PSR2'
" Ignore phpmd
let g:phpqa_messdetector_autorun = 0

autocmd BufWritePost *.js,*.jsx call prettier#run(1)
