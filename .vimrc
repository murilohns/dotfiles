set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Vim Plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'stanangeloff/php.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all'  }
Plugin 'elzr/vim-json'

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

" Tab settings
set shiftround
set shiftwidth=2
set tabstop=2
" Always use spaces when inserting a <Tab>, so formatting 
" won't be messed up if tabstop is changed
set expandtab 

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

syntax enable
colorscheme monokai

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
=======
>>>>>>> b0215a73b48b60eb8c1a4b34b3a5a558730370a2
