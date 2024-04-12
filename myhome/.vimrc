set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/LeaderF'
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
call plug#end()
" You can revert the settings after the call like so:
filetype indent off   " Disable file-type-specific indentation
syntax off            " Disable syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable
set ignorecase
set mousetime=1
set scroll=20
set mouse=a
set hlsearch
set nonu
set background=dark
"colorscheme molokai
set ai
set tabstop=4
set sw=4
set cindent
set nocompatible
set cursorline
set encoding=utf-8
set showcmd
set ruler
set incsearch
set showmatch
set matchtime=10
set softtabstop=4
set nowrapscan
set shiftwidth=4
let g:rainbow_active = 1
set clipboard+=unnamed "将系统剪贴板与 Vim 的默认寄存器相关联。这意味着当你复制或剪切文本时，该文本将自动放入系统剪贴板，从而可以在其他应用程序中粘贴
set clipboard=unnamedplus
set helplang=cn
set langmenu=zh_CN.UTF-8
set nobackup
set noswapfile
set mousemodel=extend
set ttymouse=xterm2
set statusline+=%F  "Vim 的状态栏中显示当前文件的完整路径

map <space> :
let mapleader = "\\"
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>l :LeaderfFunction<CR>
nnoremap <leader>v :LeaderfLine<CR>
nnoremap <leader>o :!subl %<CR>
let g:leaderf_cwd = 'auto'
let g:Lf_StlColorscheme = 1
let g:Lf_WindowHeight = 40

