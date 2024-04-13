set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'vim-airline/vim-airline'
Plugin 'tomasr/molokai'
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'vim-scripts/taglist.vim'
Plug 'Valloric/YouCompleteMe'
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
colorscheme molokai
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
set laststatus=0
set title
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\\"
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>l :LeaderfFunction<CR>
nnoremap <leader>v :LeaderfLine<CR>
nnoremap <leader>o :!subl %<CR>
nnoremap <silent> <Leader>f :LeaderfFile<CR>
let g:Lf_PreviewInPopup = 1
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeOpenOnStartup=0 " 不在启动时打开NERDTree
let NERDTreeWinPos="right" " 将NERDTree置于右侧
map <F8> :NERDTreeMirror<CR>
map <F8> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if !exists('g:vim_first_open_dir') | let g:vim_first_open_dir = expand('%:p:h') | execute 'cd' g:vim_first_open_dir | endif "设置vim工作目录为第一次打开文件所在目录


" 创建一个键映射来调用 cscope 查找函数被调用的位置 <C-R>=expand("<cword>")<CR> 用来获取当前光标下的单词，并将其作为参数传递给 cscope 命令
nnoremap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <F12> :cs add cscope.out<CR>

"vim刚打开时候加载cscope和ctags
autocmd VimEnter * silent! lcd %:p:h | set tags=./tags;
autocmd VimEnter * silent! execute "cs add " . getcwd() . "/cscope.out " . getcwd()
set tags=./tags,tags;/
cs add cscope.out


" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

map <C-@> <C-c>
map <C-z> <C-o>
map <C-a> <C-i>
map <Space> :
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_WinWidth = 50
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 50
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启用 YouCompleteMe 插件
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 设置自动补全触发的方式
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" 设置触发自动补全的快捷键
let g:ycm_key_invoke_completion = '<C-Space>'

" 设置自动补全的选项
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 设置 C/C++ 语言的自动补全选项
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,objc,objcpp' : ['re!\w{2}'],
    \ 'python,java,javascript,go,php,scala' : ['re!\w{2}'],
    \ }

" 设置自动补全弹窗的宽度
let g:ycm_min_num_of_chars_for_completion = 2

" 启用语义补全
let g:ycm_semantic_triggers = {
\   'c': ['->', '.', 're!\w{2}'],
\   'cpp,objcpp': ['->', '.', 're!\w{2}'],
\   'rust': ['.', 're!\w{2}']
\ }

" 设置 Python 的路径（如果你的 Python 不在系统默认路径中）
"let g:ycm_path_to_python_interpreter = '/path/to/python'

" 开启实时语法检查
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在命令模式下调用 FZF 查找文件内容
command! -bang -nargs=* FzfContent call fzf#vim#grep('grep', fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <q-args>)

" 将 FZFContent 映射到快捷键
nnoremap <leader>ff :FzfContent<CR>
