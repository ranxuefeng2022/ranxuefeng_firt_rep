" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set nocompatible              " be iMproved, require
filetype off
" PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PlugInstall
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/vim-easymotion'
call plug#end()
" You can revert the settings after the call like so:
filetype indent off   " Disable file-type-specific indentation
syntax off            " Disable syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let loaded_matchparen=1
syntax on
syntax enable
set mousetime=100000
set mouse=a
set hlsearch
set nonu
set background=dark
colorscheme molokai
set ai
set cindent
set nocompatible
set encoding=utf-8
set showcmd
set ruler
set incsearch
set showmatch
set matchtime=10
set nowrapscan
let g:rainbow_active = 1
set clipboard=unnamedplus
set clipboard=autoselect
set helplang=cn
set langmenu=zh_CN.UTF-8
set noswapfile
set mousemodel=extend
set smartcase
set ttymouse=xterm2
set title
set tabstop=4
set shiftwidth=4
set nowritebackup
set nobackup
set noautowrite
set nonu
set autoread
set history=50
set copyindent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>l :LeaderfFunction<CR>
nnoremap <leader>v :LeaderfLine<CR>
nnoremap <leader>o :!subl %<CR>
"nnoremap <leader>t :terminal<CR>
nnoremap <leader>a :FZF<CR>
nnoremap <leader>p :LeaderfFile pri-charge<CR>
nnoremap <leader>k :LeaderfFile kernel<CR>
vnoremap <Leader>t :s/^\s\+//<CR>:s/\s\+$//<CR>
nnoremap <C-g> :pwd<CR>
let g:Lf_PopupHeight = 120
let g:Lf_NoChdir = 1
let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_WorkingDirectory=expand('%:p:h')
let g:Lf_PopupWidth = 120 
let g:Lf_EnableCircularScroll = 1
let g:Lf_AutoResize = 1
let g:Lf_QuickSelectAction = 'v'
let g:Lf_PopupAutoAdjustHeight = 1
let g:Lf_PopupColorscheme = "LeaderF/autoload/leaderf/colorscheme/popup/"
let g:Lf_PreviewHorizontalPosition = "cursor"
let g:Lf_UseRelativePath = 1
let g:Lf_FollowLinks = 0
let g:leaderf_cwd = 'auto'
let g:Lf_StlColorscheme = 1
let g:Lf_WindowHeight = 40
let g:Lf_WindowPosition = 'popup'  " 设置弹出窗口的位置，可以是 'popup'、'topleft'、'botright' 等
let g:Lf_PopupBorder = 0  " 设置是否显示弹出窗口的边框
let g:Lf_PopupBorderColor = 'blue'  " 设置弹出窗口边框的颜色
let g:Lf_PopupMinWidth = 60  " 设置弹出窗口的最小宽度
let g:Lf_PopupMaxWidth = 80  " 设置弹出窗口的最大宽度
let g:Lf_PopupMinHeight = 20  " 设置弹出窗口的最小高度
let g:Lf_PopupMaxHeight = 30  " 设置弹出窗口的最大高度
let g:Lf_PopupHighlightGroup = 'Normal'  " 设置弹出窗口文本的高亮组
let g:Lf_PopupMapping = 0  " 禁用 Leaderf 的默认按键映射，以便你可以自定义按键映射
let g:Lf_RememberLastSearch = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeOpenOnStartup=0 " 不在启动时打开NERDTree
let NERDTreeWinPos="right" " 将NERDTree置于右侧
map <F8> :NERDTreeMirror<CR>
map <F8> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if !exists('g:vim_first_open_dir') | let g:vim_first_open_dir = expand('%:p:h') | execute 'cd' g:vim_first_open_dir | endif "设置vim工作目录为第一次打开文件所在目录
"let $DIR1 = expand('%:p:h')
"let $DIR2 = expand('#2:p:h')
"nnoremap <C-a> :cd $DIR1<CR>
"nnoremap <C-s> :cd $DIR2<CR>

" 创建一个键映射来调用 cscope 查找函数被调用的位置 <C-R>=expand("<cword>")<CR> 用来获取当前光标下的单词，并将其作为参数传递给 cscope 命令
nnoremap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

"vim刚打开时候加载cscope和ctags
autocmd BufRead * if filereadable("cscope.out") | execute "cs add cscope.out" | endif
autocmd BufRead * if filereadable("tags") | execute "set tags=tags" | endif
set tags=./tags,tags;/
cs add cscope.out

" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

nnoremap <C-@> :
nnoremap<C-Space> :
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#tabline#enabled = 1
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_theme='solarized_flood'
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_WinWidth = 50
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 50
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" provide path directly to the library file
 let g:clang_library_path='/usr/lib/llvm-14/lib/libclang-14.so.1'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FZF config
let g:fzf_vim = {}
let g:fzf_preview_window = ['right,50%', 'ctrl-/']
let g:fzf_layout = {
      \ 'window': 'vertical'
      \ }
