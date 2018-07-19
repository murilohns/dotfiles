set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set background=dark
set t_Co=256

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vim Plugins
Plugin 'pangloss/vim-javascript'
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

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
  autocmd BufWritePre *.json :normal gg=G
augroup END

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

colorscheme molokai

imap <C-Space> <C-y>,
