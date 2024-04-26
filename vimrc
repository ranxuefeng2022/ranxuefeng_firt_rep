"function"""""""""""""""""""""""""""""
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

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
set nowb
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
set history=50
set copyindent
set ttyfast
set report=0
set synmaxcol=200
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime
" Set 7 lines to the cursor - when moving vertically using j/k
set foldcolumn=2
set lazyredraw
" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set switchbuf+=useopen
set switchbuf+=usetab
set wildignore+=.*
autocmd BufRead,BufNewFile * source ~/.vim/bundle/c.vim
"autocmd BufRead,BufNewFile *  hi Visual ctermfg=white ctermbg=darkblue
autocmd BufRead,BufNewFile *  hi Search ctermfg=white ctermbg=darkblue


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv
map <C-c> "+y
map <C-v> "+p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>l :LeaderfFunction<CR>
nnoremap <leader>v :LeaderfLine<CR>
nnoremap <leader>f :LeaderfFile<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <leader>a :FZF<CR>
vnoremap <Leader>t :s/^\s\+//<CR>:s/\s\+$//<CR>
nnoremap <F5> :mksession! .ss.vim<CR>
nnoremap <leader>s :source .ss.vim<CR>
set sessionoptions-=options  " 避免保存不必要的选项
nnoremap <C-g> :pwd<CR>
let g:Lf_PopupHeight = 120
let g:Lf_NoChdir = 1
let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_EnableCircularScroll = 1
let g:Lf_QuickSelectAction = 'v'
let g:Lf_PopupAutoAdjustHeight = 1
let g:Lf_PopupColorscheme = "LeaderF/autoload/leaderf/colorscheme/popup/"
let g:Lf_FollowLinks = 1 
let g:Lf_WindowPosition = 'popup'  " 设置弹出窗口的位置，可以是 'popup'、'topleft'、'botright' 等
let g:Lf_PopupHighlightGroup = 'Normal'  " 设置弹出窗口文本的高亮组
let g:Lf_PopupMapping = 0  " 禁用 Leaderf 的默认按键映射，以便你可以自定义按键映射
let g:Lf_RememberLastSearch = 1
let g:Lf_UseGrep = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeOpenOnStartup=0 " 不在启动时打开NERDTree
let NERDTreeWinPos="right" " 将NERDTree置于右侧
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
map <leader>nm :NERDTreeMirror<cr>
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Dirty'     : '✗',
            \ 'Clean'     : '✔︎',
            \ 'Unknown'   : '?'
            \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if !exists('g:vim_first_open_dir') | let g:vim_first_open_dir = expand('%:p:h') | execute 'cd' g:vim_first_open_dir | endif "设置vim工作目录为第一次打开文件所在目录
" 创建一个键映射来调用 cscope 查找函数被调用的位置 <C-R>=expand("<cword>")<CR> 用来获取当前光标下的单词，并将其作为参数传递给 cscope 命令
nnoremap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>

"vim刚打开时候加载cscope和ctags
autocmd BufRead * if filereadable("cscope.out") | execute "cs add cscope.out" | endif
autocmd BufRead * if filereadable("tags") | execute "set tags=tags" | endif
set tags+=${HOME}/2362/lk/tags
set tags+=${HOME}/2362/pl/tags
set tags+=${HOME}/2362/kernel/tags
cs add ${HOME}/2362/kernel/cscope.out
cs add ${HOME}/2362/pl/cscope.out
cs add ${HOME}/2362/lk/cscope.out

set tags+=${HOME}/2406/lk/tags
set tags+=${HOME}/2406/pl/tags
set tags+=${HOME}/2406/kernel/tags
cs add ${HOME}/2406/kernel/cscope.out
cs add ${HOME}/2406/pl/cscope.out
cs add ${HOME}/2406/lk/cscope.out
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
let g:airline_powerline_fonts = 0
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
let g:fzf_follow_links = 1
let g:fzf_preview_window = ['right,50%', 'ctrl-/']
let g:fzf_layout = {
      \ 'window': 'vertical'
      \ }
