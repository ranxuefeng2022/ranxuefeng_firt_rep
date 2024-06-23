call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/LeaderF'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'git@github.com:vim-scripts/c.vim.git'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'vim-scripts/c.vim'
Plug 'voldikss/vim-floaterm'
Plug 'terryma/vim-multiple-cursors'
Plug 'francoiscabrol/ranger.vim'
call plug#end()
filetype indent off
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let loaded_matchparen=1
set t_Co=256
syntax on
syntax enable
colorscheme molokai
set mousetime=100000
set mouse=a
set hlsearch
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
set signcolumn=yes
set title
set tabstop=4
set shiftwidth=4
set nowritebackup
set nobackup
set noautowrite
set history=50
set copyindent
set ttyfast
set report=0
set synmaxcol=200
set autoread
set foldcolumn=0
set lazyredraw
set lbr
set tw=500
set ai "Auto indent
set nu
set relativenumber
set si "Smart indent
set wrap "Wrap lines
set switchbuf+=useopen
set switchbuf+=usetab
set wildignore+=.*
set foldenable
set foldmethod=manual
set sessionoptions-=options
set ttymouse=xterm2
autocmd BufRead,BufNewFile * source ~/.vim/plugged/c.vim/ftplugin/c.vim
autocmd BufRead,BufNewFile * source ~/.vim/plugged/c.vim/ftplugin/make.vim
autocmd BufRead,BufNewFile *  hi Visual ctermfg=white ctermbg=darkblue
autocmd BufRead,BufNewFile *  hi Search ctermfg=white ctermbg=darkblue
autocmd InsertLeave * silent! write
au FocusGained,BufEnter * silent! checktime
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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
let g:Lf_FollowLinks = 1
vnoremap <silent> <leader>d :s/\s\+$//<CR>
nnoremap <leader>l :LeaderfFunction<CR>
nnoremap <leader>a :FZF<CR>
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>f :LeaderfFile<CR>
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>c :source ~/.vim/plugged/c.vim/ftplugin/c.vim<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-w> <C-w>w
nnoremap <C-@> :
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

vnoremap y "ay
nnoremap p "ap
nnoremap P "aP

nnoremap <C-s> :w<CR>
nnoremap <S-s> :sp<CR>
nnoremap <S-x> :vsp<CR>

inoremap jj <Esc>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Right> <Nop>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

nnoremap # #N
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeOpenOnStartup=0
let NERDTreeWinPos="left"
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
map <leader>nm :NERDTreeMirror<cr>
let g:is_fullscreen = 0
function! ToggleVerticalSize()
  execute g:is_fullscreen ? "vertical resize 110" : "vertical resize 999"
  let g:is_fullscreen = !g:is_fullscreen
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
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_WinWidth = 50
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 50
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_vim = {}
let g:fzf_follow_links = 1
let g:fzf_vim_dir = expand('%:p:h')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gbk,gb18030,gb2312,ucs-bom,cp936,latin1
set dictionary+=~/.vim/words
vnoremap<C-c> :w! ~/.vim/cvbuf.c<CR>
nnoremap<C-v> :r ~/.vim/cvbuf.c<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
" JK motions: Line motions
map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap<leader>t :terminal<CR>
let g:ranger_map_keys = 0
map <leader>g :Ranger<CR>

" Move lines in normal mode
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" Move lines in visual mode
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

nnoremap f :execute "normal! \<C-o>"<CR>

