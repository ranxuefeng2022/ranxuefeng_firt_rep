call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'Yggdroot/LeaderF'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'git@github.com:vim-scripts/c.vim.git'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-scripts/taglist.vim'
Plug 'git@github.com:easymotion/vim-easymotion.git'
Plug 'xavierd/clang_complete'
"Plug 'ycm-core/YouCompleteMe'
call plug#end()
filetype indent off
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let loaded_matchparen=1
syntax on
syntax enable
colorscheme molokai
set mousetime=100000
set mouse=a
set hlsearch
set nonu
set background=dark
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
set autoread
set foldcolumn=2
set lazyredraw
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set switchbuf+=useopen
set switchbuf+=usetab
set wildignore+=.*
set foldenable
set foldmethod=manual
set sessionoptions-=options
autocmd BufRead,BufNewFile * source ~/.vim/plugged/c.vim/ftplugin/c.vim
autocmd BufRead,BufNewFile * source ~/.vim/plugged/c.vim/ftplugin/make.vim
autocmd BufRead,BufNewFile *  hi Visual ctermfg=white ctermbg=darkblue
autocmd BufRead,BufNewFile *  hi Search ctermfg=white ctermbg=darkblue
au FocusGained,BufEnter * silent! checktime

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
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

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
vnoremap <Leader>t :s/^\s\+//<CR>:s/\s\+$//<CR>
nnoremap <leader>l :LeaderfFunction<CR>
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>f :LeaderfFile<CR>
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>a :FZF<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-g> :pwd<CR>
nnoremap <C-w> <C-w>w
nnoremap <C-@> :
vnoremap < <gv
vnoremap > >gv
let g:Lf_PopupHeight = 200
let g:Lf_NoChdir = 1
let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_EnableCircularScroll = 1
let g:Lf_QuickSelectAction = 'v'
let g:Lf_PopupAutoAdjustHeight = 1
let g:Lf_PopupColorscheme = "LeaderF/autoload/leaderf/colorscheme/popup/"
let g:Lf_FollowLinks = 1 
let g:Lf_WindowPosition = 'popup'  " 设置弹出窗口的位置，可以是 'popup'、'topleft'、'botright' 等
let g:Lf_PopupHighlightGroup = 'Normal'  " 设置弹出窗口文本的高亮组
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeOpenOnStartup=0 " 不在启动时打开NERDTree
let NERDTreeWinPos="right" " 将NERDTree置于右侧
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
map <leader>nm :NERDTreeMirror<cr>
let g:is_fullscreen = 0
function! ToggleVerticalSize()
if g:is_fullscreen == 0
  execute "vertical resize 999"
  let g:is_fullscreen = 1
else
  execute "vertical resize 110"
  let g:is_fullscreen = 0
endif
endfunction
nnoremap <silent> <leader>z :call ToggleVerticalSize()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if !exists('g:vim_first_open_dir') | let g:vim_first_open_dir = expand('%:p:h') | execute 'cd' g:vim_first_open_dir | endif
nnoremap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>
autocmd BufRead * if filereadable("cscope.out") | execute "cs add cscope.out" | endif
autocmd BufRead * if filereadable("tags") | execute "set tags=tags" | endif
" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
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
let g:fzf_vim = {}
let g:fzf_follow_links = 1
let g:fzf_preview_window = ['right,50%', 'ctrl-/']
let g:fzf_layout = {
      \ 'window': 'vertical'
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gbk,gb18030,gb2312,ucs-bom,cp936,latin1
if 0
let g:clang_library_path = '/usr/lib/llvm-10/lib/libclang.so.1'
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_auto_select = 1
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_error_format = ''
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
set completeopt=menu,menuone,noselect
let g:clang_complete_delay = 50
let g:clang_user_options='-std=c11 -I/E/code/linux-master'
let g:clang_complete_diagnostics = 0
endif
set dictionary+=~/.vim/words
vnoremap<C-c> :w! ~/.vim/cvbuf<CR>
nmap<C-v> :r ~/.vim/cvbuf<CR>
