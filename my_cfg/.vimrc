" Configuration file for vim
set modelines=0		" CVE-2007-2438
set t_Co=256
set number
set laststatus=2
set tabstop=4
set shiftwidth=4
set showtabline=2
set smartindent
set expandtab   
set noautoindent
set rnu
set autoread
set autowriteall
set fileencodings=utf-8,gbk
set ai
set hls
set helplang=cn
set history=400
" 快捷输入
" " 自动完成括号和引号
"inoremap ( ()<esc>i
"inoremap { {}<esc>i<cr><esc>O<tab>
"inoremap [ []<esc>i
"inoremap ' ''<esc>i
"inoremap " ""<esc>i

"不自动创建备份文件
set nobackup 
set noswapfile 

"快捷命令
nnoremap <silent> <F5> :!open % <cr> 

set cursorline
colorscheme monokai
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
nnoremap <C-l> gt
nnoremap <C-h> gT
syntax enable
syntax on
colorscheme desert
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
Bundle 'WinManager'
Bundle 'scrooloose/nerdtree'
Bundle 'neocomplcache'
Bundle 'command-T'
Bundle 'vim-powerline'
Bundle 'surround.vim'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on     " required!
"
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"commandT {
    let g:CommandTMaxFiles=500
    let g:CommandTMaxHeight = 5 
"}

"powerline {
    set guifont=PowerlineSymbols\ for\ Powerline
    left g:Powerline_symbols = 'fancy'
"}

"Nerdtree{ 
    let g:NERDTree_title="[NERDTree]"  
    let g:NERTreeWinPos='left'
    function! NERDTree_Start()  
        exec 'NERDTree'  
    endfunction  
          
    function! NERDTree_IsValid()  
            return 1  
    endfunction  
"}

"Neocomplcache{

let g:neocomplcache_enable_at_startup = 1
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"}

"Winmanager {
    "let g:winManagerWindowLayout="NERDTree|TagList"  
    "let g:winManagerWidth = 30                  
    "let g:defaultExplorer = 0    "Don't write backup file if vim is being called by "crontab -e"
    "let g:persistentBehaviour = 0
    noremap <F2> :NERDTreeToggle<cr>
    ":nmap <C-K> <C-W>w
    " open nerdtree when vim enter
    ":autocmd BufEnter *.* :set rnu
"}

"color config
"pup Menu
hi Pmenu ctermfg=white ctermbg=017


au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
