"=========================================
"  Author: liang.feng
"  Version: 1
"  Date: 2018-12-11 12:14
"  Sections: gvim
"=========================================

"--------------------------------------------------------------------------
" һЩ��⺯�� 
"--------------------------------------------------------------------------
function! s:read_total_memory()
    if isdirectory("/proc")
        let s:line = readfile("/proc/meminfo")
        let s:memory = split(s:line[0])
        let s:memory_enough = s:memory[1] > 1000000
    else
        let s:memory_enough = 1
    endif
endfunc

call s:read_total_memory()
let s:memory_enough = 1
"--------------------------------------------------------------------------
"
"--------------------------------------------------------------------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ����ȫ��
if has('win32')
    autocmd GUIEnter * simalt ~x
endif

"200~250
if executable("vimtweak.dll") 
    autocmd guienter * call libcallnr("vimtweak","SetAlpha",245) 
endif 

" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��
if has('gui_running')
    set mouse=a
else
    set mouse=
endif

"set autochdir
" vim ����������ģʽ���ܲ�ȫ
set wildmenu
set nocompatible              " be iMproved, required
filetype off                  " required

"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
noremap!;g <C-c>
vnoremap ;g <Esc>
vnoremap <C-g> <Esc>
nnoremap <Space><Space> :
nnoremap <silent> <Space>qq :q<CR>
nnoremap <silent> <Space>qm <C-z>
let mapleader = ";"
let g:mapleader = ";"

"--------------------------------------------------------------------------
" Ӫ��רע����
"--------------------------------------------------------------------------
" ��ֹ�����˸
"set gcr=a:block-blinkon0
" ��ֹ��ʾ������
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" ��ֹ��ʾ�˵��͹�����
set guioptions-=m
set guioptions-=T

" �������ͬ����ǩ
nnoremap <Leader>tn :tnext<CR>
" �������ͬ����ǩ
nnoremap <Leader>tp :tprevious<CR>

"--------------------------------------------------------------------------
" ��ʾ���
"--------------------------------------------------------------------------
set shortmess=atI   " ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
set number              " ��ʾ�к�
set go=             " ��Ҫͼ�ΰ�ť

"��������
if has('win32') && has('gui_running')
    set guifont=Courier_New:h12:cANSI
endif

syntax on           " �﷨����
syntax enable
set showcmd         " �����������ʾ�������������Щ
set novisualbell    " ��Ҫ��˸(������)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "״̬����ʾ������
set laststatus=2    " ������ʾ״̬��(1),������ʾ״̬��(2)
set nofoldenable    "�����۵�
"set foldenable      " �����۵�
"set foldmethod=manual   " �ֶ��۵�

let $LANG='en'  "set message language
set langmenu=en   "set menu's language of gvim. no spaces beside '='
"language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set helplang=cn
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936

"--------------------------------------------------------------------------
"
"--------------------------------------------------------------------------
inoremap <expr> <Leader>k col('.') ==# col('$') ? "\<Delete>" : "\<C-o>D"
noremap! <Leader>u <C-u>

"a->begin
inoremap <Leader>a <Esc>I
noremap <Leader>a ^
cnoremap <Leader>a <Home>
cnoremap <C-g> <Esc>
"e->end
inoremap <Leader>e <End>
noremap <Leader>e $
cnoremap <Leader>e <End>
"move in insert mod or cmd mod
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <Leader>n <Down>
noremap! <Leader>p <Up>

noremap! <Leader>f <S-Right>
noremap! <Leader>b <S-Left>

inoremap <Leader>o <C-o>O

"adjust in insert mod
"inoremap <Leader>t <C-t>
"inoremap <Leader>d <C-d>
"delete in insert mod
noremap! <C-d> <Delete>
noremap! <Leader>w <C-w>
nnoremap <silent> <Leader>xx :nohl<CR>
nnoremap ge G
nnoremap . ;
nnoremap <Leader>zz :w<CR>
inoremap <Leader>zz <Esc>:w<CR>a
nnoremap <Leader>yy mgy'a`g
nnoremap <Leader>dd d'a
cnoremap <Leader>rr <C-r><C-w>

"--------------------------------------------------------------------------
"
"--------------------------------------------------------------------------
"can see :h registers
":di == :reg
cnoremap <Leader>rc <C-r>*
cnoremap <Leader>ry <C-r>"
"cnoremap <Leader>ry <C-r>0
"

"--------------------------------------------------------------------------
"
"--------------------------------------------------------------------------
nnoremap <Leader>ia mgA;<Esc>`gmg
nnoremap <Leader><TAB> <C-w><C-w>
nnoremap <Leader>bb <C-^>
nnoremap <Leader>mm %
nnoremap <Leader>dj :e .<CR>
nnoremap <Leader>df :Explore<CR>

"--------------------------------------------------------------------------
" ʵ������
"--------------------------------------------------------------------------
" ���õ��ļ����Ķ�ʱ�Զ�����
set autoread
" quickfixģʽ
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"���벹ȫ
set completeopt=longest,preview,menu
"������
filetype plugin on
"���������
set clipboard+=unnamed
"�Ӳ�����
set nobackup
"make ����
:set makeprg=g++\ -Wall\ \ -std=c++11\ %
set noshowmode       "״̬������ʾģʽ
"�Զ�����
set autowrite
set ruler                   " ��״̬�����
set cursorline              " ͻ����ʾ��ǰ��
set magic                   " ����ħ��
set guioptions-=T           " ���ع�����
set guioptions-=m           " ���ز˵���
" ������״̬����ʾ����Ϣ
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
" ȥ������������ʾ����
set noeb
" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set confirm
" �Զ�����
set autoindent
set smartindent    "���ܵ�ѡ�����ʽ��
" Tab���Ŀ��
set tabstop=4
" ͳһ����Ϊ4
set softtabstop=4
set shiftwidth=4
set cindent
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set cinoptions+=g0,(1s,:0
set cinoptions=g0,:0,(0
" �ÿո�����Ʊ��
set expandtab
" ���кͶο�ʼ��ʹ���Ʊ��
set smarttab
" ��ʷ��¼��
set history=1000
"��ֹ������ʱ�ļ�
set nobackup
set noswapfile
"�������Դ�Сд
"set ignorecase
"�������ַ�����
set hlsearch
set incsearch
"�����滻
set gdefault
"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set cmdheight=2
" ����ļ�����
filetype on
" �����ļ����Ͳ��
filetype plugin on
" Ϊ�ض��ļ�����������������ļ�
filetype indent on
" ����ȫ�ֱ���
set viminfo+=!
" �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-
" �ַ���������������Ŀ
set linespace=0
" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu
" ʹ�ظ����backspace����������indent, eol, start��
set backspace=2
" ����backspace�͹�����Խ�б߽�
set whichwrap+=<,>,h,l
set selection=exclusive
set selectmode=mouse,key
" ͨ��ʹ��: commands������������ļ�����һ�б��ı��
set report=0
" �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�
set fillchars=vert:\ ,stl:\ ,stlnc:\
" ������ʾƥ�������
set showmatch
" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set matchtime=1
" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���
set scrolloff=3
" ������ʾ��ͨtxt�ļ�����Ҫtxt.vim�ű���
au BufRead,BufNewFile *  setfiletype txt
"--------------------------------------------------------------------------
"
"--------------------------------------------------------------------------
"vim�д�Сдת����������gu����gU
"ֻת��ĳ������
"guw ��gue
"gUw��gUe
"����ǰ������ڵĵ���ת���� ��д��ʽ
inoremap <M-u> <Esc>viwUA
inoremap <M-i> <Esc>viwuA
"����ǰ������ڵĵ���ת���� Сд��ʽ
nnoremap <M-u> mgviwU`g
nnoremap <M-i> mgviwu`g

" ������ɫ����
if !has('gui_running')
    set t_Co=256
endif

if !has('nvim')
    if has('win32')
        set term=win32
    else
        "set term=screen-256color
        "set term=xterm-256color
    endif
endif

colorscheme desert
"colorscheme wombat256

"--------------------------------------------------------------------------
"
"--------------------------------------------------------------------------
"����һ��������(inside next parentheses)
onoremap in( :<C-U>normal! f(vi(<CR>
onoremap in" :<C-U>normal! f"lvi"<CR>
onoremap in' :<C-U>normal! f'lvi'<CR>
onoremap in{ :<C-U>normal! f{vi{<CR>
onoremap in< :<C-U>normal! f<vi<<CR>
"����һ��������(inside last parentheses)
onoremap il( :<C-U>normal! F)vi)<CR>
onoremap il" :<C-U>normal! F"hvi"<CR>
onoremap il' :<C-U>normal! F'hvi'<CR>
onoremap il} :<C-U>normal! F}vi}<CR>
onoremap il> :<C-U>normal! F>vi><CR>


"--------------------------------------------------------------------------
" auto close pair ( { [ ' "
"--------------------------------------------------------------------------
function! AutoClosePair()
    inoremap ( ()<Esc>i
    inoremap ) <c-r>=ClosePair(')')<CR>
    inoremap { {}<Esc>i
    inoremap } <c-r>=ClosePair('}')<CR>
    inoremap [ []<Esc>i
    inoremap ] <c-r>=ClosePair(']')<CR>
    inoremap " ""<Esc>i
    inoremap ' ''<Esc>i
endfunction

function! RestoreClosePair()
    inoremap ( (
    inoremap { {
    inoremap [ [
    inoremap " "
    inoremap ' '
endfunction

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"call AutoClosePair()
"nnoremap <Leader>nau :call RestoreClosePair()<CR>
"nnoremap <Leader>hau :call AutoClosePair()<CR>

"--------------------------------------------------------------------------
" inside terminal
"--------------------------------------------------------------------------
if has('tnoremap')
    nnoremap <silent> <Leader>tm :term zsh<CR>
    if !has('nvim')
        tnoremap <silent> <Leader>g exit<CR><C-w>:q!<CR>
    else
        tnoremap <silent> <Leader>g exit<CR>
    endif

    tnoremap <Leader><Tab> <C-w><C-w>
endif


"--------------------------------------------------------------------------
"--------------------------------------------------------------------------
" Plugins begin
"--------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

"--------------------------------------------------------------------------
" asyncrun 
"--------------------------------------------------------------------------
Plug 'skywind3000/asyncrun.vim'
 
" �Զ��� quickfix window ���߶�Ϊ 6
let g:asyncrun_open = 6
" �������ʱ����������
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

nnoremap <Leader>vv :AsyncRun 
nnoremap <Leader>vt :AsyncStop<CR>
"Ȼ���� AsyncRun �������У��� <root> ���� $(VIM_ROOT) 
"����ʾ��Ŀ����·�����������ǿ��Զ��尴 F7 ����������Ŀ
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" ���� <leader>ww ��/�ر� Quickfix ����
nnoremap <silent> <Leader>ww :call asyncrun#quickfix_toggle(6)<CR>


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'terryma/vim-expand-region'

"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
if !(s:memory_enough)
    Plug 'rkulla/pydiction'
    let g:pydiction_location = '~/.vim/plugged/pydiction/complete-dict'
endif


"--------------------------------------------------------------------------
" ����
"--------------------------------------------------------------------------
Plug 'ianva/vim-youdao-translater'
vnoremap <silent> <C-y> :<C-u>Ydv<CR>
nnoremap <silent> <C-y> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>


"--------------------------------------------------------------------------
" ����ƥ�� 
"--------------------------------------------------------------------------
if (s:memory_enough)
    Plug 'vim-scripts/matchit.zip'
endif


"--------------------------------------------------------------------------
" ƽ������ 
"--------------------------------------------------------------------------
Plug 'yuttie/comfortable-motion.vim'
""""""""""""""""yuttie/comfortable-motion.vim setting"""""""""""""""""""
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1


"--------------------------------------------------------------------------
" ctrlp and ctrlp-funky 
"--------------------------------------------------------------------------
if (s:memory_enough)
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    nnoremap <Space>ii :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Space>iw :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

    "Change the default mapping and the default command to invoke CtrlP:
    "let g:ctrlp_map = '<c-p>'
    "let g:ctrlp_cmd = 'CtrlP'

    "When invoked without an explicit starting directory, CtrlP will 
    "set its local working directory according to this variable:
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_regexp = 1
    nnoremap <Space>ff :CtrlP<CR>
    nnoremap <Space>bs :CtrlPBuffer<CR>
    "����ʷ�ļ���ģ������
    nnoremap <Space>rf :CtrlPMRU<CR>
    nnoremap <Space>rm :CtrlPMixed<CR>
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
                \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
                \ }

    let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
    let g:ctrlp_working_path = 0

    "����ag�������������ٶ�
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
        "��ʹ�û����ļ�
        "let g:ctrlp_use_caching = 0
    else
        if has('unix')
            let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
        elseif has('win32') || has('win64')
            let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
        endif
    endif
endif


"--------------------------------------------------------------------------
" fzf
"--------------------------------------------------------------------------
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
"   " Both options are optional. You don't have to install fzf in ~/.fzf
"     " and you don't have to run install script if you use fzf only in Vim.
"

 "let g:fzf_colors =
     "\ { 'fg':      ['fg', 'Normal'],
       "\ 'bg':      ['bg', 'Normal'],
       "\ 'hl':      ['fg', 'Comment'],
       "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
       "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
       "\ 'hl+':     ['fg', 'Statement'],
       "\ 'info':    ['fg', 'PreProc'],
       "\ 'border':  ['fg', 'Ignore'],
       "\ 'prompt':  ['fg', 'Conditional'],
       "\ 'pointer': ['fg', 'Exception'],
       "\ 'marker':  ['fg', 'Keyword'],
       "\ 'spinner': ['fg', 'Label'],
       "\ 'header':  ['fg', 'Comment'] }

nnoremap <Leader>fi :FZF<CR>
nnoremap <Leader>fm :FZF!<CR>
nnoremap <Leader>fh :FZF! ~<CR>


"--------------------------------------------------------------------------
" ag.vim
"--------------------------------------------------------------------------
Plug 'rking/ag.vim'
" ag�ĺ����ļ���~/.agignore
let g:ag_working_path_mode="r" "search from project root
let g:ag_highlight=1
nnoremap <Space>fa :Ag 
nnoremap <Space>fw :Ag <C-R>=expand("<cword>")<CR><CR>
nnoremap <Space>fb :AgBuffer <C-R>=expand("<cword>")<CR><CR>
nnoremap <Space>fc :AgFile 

"--------------------------------------------------------------------------
" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2  
"--------------------------------------------------------------------------
Plug 'dyng/ctrlsf.vim'
"Input :CtrlSF in command line for you, just a handy shortcut.
nmap <Leader>fa <Plug>CtrlSFPrompt
"Input :CtrlSF in command line for you, just a handy shortcut.
nmap <Leader>fv <Plug>CtrlSFVwordPath<CR>
"Like <Plug>CtrlSFVwordPath, but execute it immediately.
nmap <Leader>fe <Plug>CtrlSFVwordExec<CR>
"Input :CtrlSF foo in command line where foo is word under the cursor.
nmap <Leader>fw <Plug>CtrlSFCwordPath<CR>
"Like <Plug>CtrlSFCwordPath, but also add word boundary around searching word.
nmap <Leader>fc <Plug>CtrlSFCCwordPath<CR>
"Input :CtrlSF foo in command line where foo is the last search pattern of vim.
nmap <Leader>fp <Plug>CtrlSFPwordPath<CR>

nnoremap <Leader>ft :CtrlSFOpen<CR>
nnoremap <Leader>fn :CtrlSFToggle<CR>
inoremap <Leader>fn <Esc>:CtrlSFToggle<CR>


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'Chun-Yang/vim-action-ag'
"Normal Mode:
"gagiw to search the word
"gagi' to search the words inside single quotes.
"Visual Mode:
"gag to search the selected text


"--------------------------------------------------------------------------
" Vim �綨���Զ����루delimitMate�����
"--------------------------------------------------------------------------
"Plug 'Raimondi/delimitMate'


"--------------------------------------------------------------------------
" Vim �綨���Զ�����auto-pairs
"--------------------------------------------------------------------------
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = '<Leader>pp'


"--------------------------------------------------------------------------
" �����ƶ�
"--------------------------------------------------------------------------
Plug 'easymotion/vim-easymotion'
"map <Space><Space> <Plug>(easymotion-prefix)


"--------------------------------------------------------------------------
" Perform all your vim insert mode completions with Tab
"--------------------------------------------------------------------------
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


"--------------------------------------------------------------------------
" status line 
"--------------------------------------------------------------------------
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


"--------------------------------------------------------------------------
"ȫ�첽��ʾ�ļ������б����õ�ʱ�򲻻�ռ�����κ���Ļ�ռ䣬
"�� ALT+P �󶨵� `:LeaderfFunction!` ��������ϣ��� ALT+P 
"�͵�����ǰ�ļ��ĺ����б�Ȼ����Խ���ģ��ƥ���������������¼��ƶ�ѡ���⣬
"����vim����ת�������������ʼ�ã��س���תȻ��رպ����б�
"����֮�ⰴ i ����ģ��ƥ�䣬��TAB�л����б�ѡ��
"--------------------------------------------------------------------------
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

let g:Lf_ShortcutF = '<Leader>ff'
let g:Lf_ShortcutB = '<Leader>bs'
nnoremap <Leader>db :bd<CR>
nnoremap <Leader>do :on<CR>
noremap <Leader>rm :LeaderfMru<cr>
noremap <Leader>ii :LeaderfFunction!<cr>
noremap <Leader>tb :LeaderfTag<cr>
"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_PreviewCode = 1
if executable('/usr/local/bin/ctags')
    let g:Lf_Ctags = "/usr/local/bin/ctags"
endif
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'lightline'
"let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\ }

let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_MruMaxFiles = 2048
let g:Lf_CommandMap = {'<Esc>': ['<C-g>']}
let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
            \            ["<C-g>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']
            \           ],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
            \            ["<C-g>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']
            \           ],
            \ "Mru":    [["<Esc>", ':exec g:Lf_py "mruExplManager.quit()"<CR>'],
            \            ["<C-g>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']
            \           ],
            \ "Tag":    [],
            \ "BufTag": [],
            \ "Function": [["<Esc>", ':exec g:Lf_py "functionExplManager.quit()"<CR>'],
            \              ["<C-g>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']
            \           ],
            \ "Line":   [],
            \ "History":[],
            \ "Help":   [],
            \ "Self":   [],
            \ "Colorscheme": []
            \}


"--------------------------------------------------------------------------
"��ǰ�ĵ�����-���ž��ܲ��д��ڵ�������ڵ�ǰ����ֱ�ӷ��ص�ǰ�ĵ����ڵ�Ŀ¼��
"�ٰ�һ�μ��žͷ�����һ��Ŀ¼�����س�������һ��Ŀ¼�����ٵ�ǰ���ڴ򿪹���µ��ļ���
"��һ��ӳ�� ��<tab>7�� , ��<tab>8�� �� ��<tab>9�� �ֱ��������µ� split, vsplit 
"���±�ǩ�򿪵�ǰ�ļ�����Ŀ¼��������һ���ļ����֣��������ҵ��͸��ļ���ص�������Ŀ�ļ�
"--------------------------------------------------------------------------
Plug 'justinmk/vim-dirvish'
function! s:setup_dirvish()
	if &buftype != 'nofile' && &filetype != 'dirvish'
		return
	endif
	let text = getline('.')
	if ! get(g:, 'dirvish_hide_visible', 0)
		exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
	endif
	exec 'sort ,^.*[\/],'
	let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
	" let name = '\V\^'.escape(text, '\').'\$'
	" echom "search: ".name
	call search(name, 'wc')
	noremap <silent><buffer> ~ :Dirvish ~<cr>
	noremap <buffer> % :e %
endfunc

function! DirvishSetup()
	let text = getline('.')
	for item in split(&wildignore, ',')
		let xp = glob2regpat(item)
		exec 'silent keeppatterns g/'.xp.'/d'
	endfor
	if ! get(g:, 'dirvish_hide_visible', 0)
		exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
	endif
	exec 'sort ,^.*[\/],'
	let name = '^' . escape(text, '.*[]~\') . '[/*|@=]\=\%($\|\s\+\)'
	" let name = '\V\^'.escape(text, '\').'\$'
	call search(name, 'wc')
endfunc

" let g:dirvish_mode = 'call DirvishSetup()'


"----------------------------------------------------------------------
" augroup
"----------------------------------------------------------------------
augroup MyPluginSetup
	autocmd!
	autocmd FileType dirvish call s:setup_dirvish()
augroup END


"--------------------------------------------------------------------------
" Git support for dirvish.vim  
"--------------------------------------------------------------------------
if has('unix')
    Plug 'kristijanhusak/vim-dirvish-git'
    autocmd FileType dirvish nmap <silent><buffer><C-n> <Plug>(dirvish_git_next_file)
    autocmd FileType dirvish nmap <silent><buffer><C-p> <Plug>(dirvish_git_prev_file)
    "These are default indicators used that can be overridden in vimrc:
    "let g:dirvish_git_indicators = {
    "\ 'Modified'  : '�7�5',
    "\ 'Staged'    : '�7�4',
    "\ 'Untracked' : '�7�3',
    "\ 'Renamed'   : '�7�4',
    "\ 'Unmerged'  : '�T',
    "\ 'Deleted'   : '�7�0',
    "\ 'Ignored'   : '�7�2',
    "\ 'Unknown'   : '?'
    "\ }
endif


"--------------------------------------------------------------------------
" Print documents in echo area. 
"--------------------------------------------------------------------------
Plug 'Shougo/echodoc.vim'


"--------------------------------------------------------------------------
" A (Neo)vim plugin for formatting code. 
"--------------------------------------------------------------------------
Plug 'sbdchd/neoformat'

"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component_function': {
"      \   'filename': 'LightlineFilename',
"      \ },
"      \ }
"
"function! LightlineFilename()
"    return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
"                \ &filetype ==# 'unite' ? unite#get_status_string() :
"                \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
"                \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
"endfunction
"
"let g:unite_force_overwrite_statusline = 0
"let g:vimfiler_force_overwrite_statusline = 0
"let g:vimshell_force_overwrite_statusline = 0

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'filename': '%F%m%r%h%w'
      \ },
      \ }


"--------------------------------------------------------------------------
" syntax color  
"--------------------------------------------------------------------------
Plug 'https://github.com/fwar34/vim-color-wombat256.git'


"--------------------------------------------------------------------------
" vim themes 
"--------------------------------------------------------------------------
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'https://github.com/altercation/vim-colors-solarized.git'


"--------------------------------------------------------------------------
" switch c with cpp
"--------------------------------------------------------------------------
Plug 'derekwyatt/vim-fswitch'
nnoremap <Leader>fo :FSHere<CR>


"--------------------------------------------------------------------------
" Automatically opens popup menu for completions 
"--------------------------------------------------------------------------
Plug 'vim-scripts/AutoComplPop'

"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'tpope/vim-surround'


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'tpope/vim-commentary'
nnoremap <Leader>cc :commentary<CR>


"--------------------------------------------------------------------------
" Omni
"--------------------------------------------------------------------------
if (s:memory_enough)
    Plug 'vim-scripts/OmniCppComplete'
endif
"set completeopt=menu,menuone " �ص����ܲ�ȫʱ��Ԥ������
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_DefaultNamespaces=["_GLIBCXX_STD"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

""setlocal omnifunc=tern#Complete
""call tern#Enable()


"--------------------------------------------------------------------------
" Powerline����
"--------------------------------------------------------------------------
"Plug 'https://github.com/Lokaltog/vim-powerline.git'
" ����״̬��������
let g:Powerline_colorscheme='solarized256'


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
"vimdoc����
Plug 'https://github.com/yianwillis/vimcdoc.git'


"--------------------------------------------------------------------------
" �﷨���
"--------------------------------------------------------------------------
"Plug 'w0rp/ale'
"ʼ�տ�����־��
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"��ʾLinter����,����򾯸�������Ϣ
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"if s:windows == 0 && has('win32unix') == 0
	"let g:ale_command_wrapper = 'nice -n5'
"endif

"ʹ��clang��c��c++�����﷨��飬��pythonʹ��pylint�����﷨���
let g:ale_linters = { 'c++': ['clang'], 'c': ['clang'], 'python': ['pylint'] }

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)

"�����Ͼ��Ƕ�����һ�����й�����Ϣ��ʾ��ʽ�Լ����� linter �����в��������� 6��7 ���бȽ���Ҫ��
"���涨����� normal ģʽ�����ָı��Լ��뿪 insert ģʽ��ʱ������ linter��������Ա��ص�������
"���û�еĻ����ᵼ�� YouCompleteMe �Ĳ�ȫ�Ի���Ƶ��ˢ�¡��ǵ�����һ�¸��� linter �Ĳ�����
"����һЩ�����û����Ĺ��򣬲�Ȼ����̫��û������Ĭ�ϴ���;���ķ��̫�ѿ��ˣ�����Ҫ�޸�һ�£�
"������ʹ�� GVim�������¶����˾���ʹ������ʽ��ȥ��Ĭ���ѿ��ĺ�ɫ��������������ʹ�øɾ��Ĳ����»��߱�ʾ��
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"<Leader>d�鿴����򾯸����ϸ��Ϣ
"nmap <Leader>d :ALEDetail<CR>

"�ļ����ݷ����仯ʱ�����м��
"let g:ale_lint_on_text_changed = 'never'
"���ļ�ʱ�����м��
"let g:ale_lint_on_enter = 0


"--------------------------------------------------------------------------
" �ı����� 
"i, �� a, ����������д����һ�����޸ģ����ڿ����� di, �� ci, һ����ɾ��/��д��ǰ����
"ii �� ai ����������ͬһ��������εĴ��룬������ vii ѡ�У�dii / cii ɾ�����д
"if �� af ���������󣬿����� vif / dif / cif ��ѡ��/ɾ��/��д����������
"--------------------------------------------------------------------------
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'


"--------------------------------------------------------------------------
" ǰ���������ʱ��ҪƵ���Ĳ��� quickfix ���ڣ�ale���ʱҲ��Ҫ�����ٴ������ת��location list����
" �����ļ��Ƚ�Ҳ���õ�������ת����/��һ�����촦��unimpaired ������㶨����һϵ�з����ſ�ͷ�Ŀ�ݼ���
" ����Ϊ�ٷ� Vim �ж�ʧ�Ŀ�ݼ���
"--------------------------------------------------------------------------
Plug 'tpope/vim-unimpaired'
"Note we're not using the noremap family because we do want to recursively
"invoke unimpaired.vim's maps.
"See :help unimpaired-customization for more advanced options.
"let g:nremap = {"[": "<", "]": ">"}
"let g:xremap = {"[": "<", "]": ">"}
"let g:oremap = {"[": "<", "]": ">"}

"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
"��ͼ�� STL ����ģ���� unordered\_multimap ��δ�������ԵΣ�vim �� C++
"�﷨����֧�ֲ����ã��ر��� C++11/14 ����Ԫ�أ���������ɲ��
"vim-cpp-enhanced-highlight
"Plug 'octol/vim-cpp-enhanced-highlight'
""Highlighting of class scope is disabled by default. To enable set
"let g:cpp_class_scope_highlight = 1
""Highlighting of member variables is disabled by default. To enable set
"let g:cpp_member_variable_highlight = 1
""Highlighting of class names in declarations is disabled by default. To enable set
"let g:cpp_class_decl_highlight = 1
""Highlighting of library concepts is enabled by
"let g:cpp_concepts_highlight = 1
"
""There are two ways to highlight template functions. Either
"let g:cpp_experimental_simple_template_highlight = 1
""which works in most cases, but can be a little slow on large files. Alternatively set
""let g:cpp_experimental_template_highlight = 1
""which is a faster implementation but has some corner cases where it doesn't work.


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
"Plug 'https://github.com/fwar34/vim-cpp-enhanced-highlight.git'
let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1


"--------------------------------------------------------------------------
" ��ǩ���ӻ�
"--------------------------------------------------------------------------
Plug 'https://github.com/kshenoy/vim-signature.git'
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


"--------------------------------------------------------------------------
" completor
"--------------------------------------------------------------------------
if has('win32')
    Plug 'maralla/completor.vim'
    "Use Tab to trigger completion (disable auto trigger)
    let g:completor_auto_trigger = 0
    inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
    "
    "C++
    let g:completor_clang_binary = '/usr/bin/clang'
    let g:completor_python_binary = '/usr/bin/python3'
    "Plug 'davidhalter/jedi-vim'
    map <tab> <Plug>CompletorCppJumpToPlaceholder
    imap <tab> <Plug>CompletorCppJumpToPlaceholder
endif


"--------------------------------------------------------------------------
" deoplete
"--------------------------------------------------------------------------
if has('unix') && s:memory_enough
    "if (s:memory_enough)
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'tag': '4.1', 'do': ':UpdateRemotePlugins' }
        else
            Plug 'Shougo/deoplete.nvim', { 'tag': '4.1' }
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif
        let g:deoplete#enable_at_startup = 1

        Plug 'zchee/deoplete-jedi'
        "Plug 'Shougo/deoplete-clangx'
        "" Change clang binary path
        "call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')

        "" Change clang options
        "call deoplete#custom#var('clangx', 'default_c_options', '')
        "call deoplete#custom#var('clangx', 'default_cpp_options', '')

        Plug 'zchee/deoplete-clang'
        if isdirectory('/usr/lib/llvm-6.0/')
            let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
            let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-6.0/lib/clang'
        elseif isdirectory('/usr/lib/llvm-3.8/')
            let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
            let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
        elseif findfile("libclang.so", "/usr/lib")
            let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
            let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
        endif

        Plug 'Shougo/neoinclude.vim'
    "endif
endif

"--------------------------------------------------------------------------
" This script is for generating a .clang_complete that could be 
" utilized by emacs irony-mode or company-clang mode.
"--------------------------------------------------------------------------
Plug 'WenxiJin/.clang_complete'


"--------------------------------------------------------------------------
" �ʺ�����
"--------------------------------------------------------------------------
if (s:memory_enough)
    Plug 'luochen1990/rainbow'
endif
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}


"--------------------------------------------------------------------------
" ����ɫ��� 
"--------------------------------------------------------------------------
Plug 'guns/xterm-color-table.vim'


"--------------------------------------------------------------------------
" �ݸ� normalģʽgs
"--------------------------------------------------------------------------
Plug 'mtth/scratch.vim'
let g:scratch_autohide=1


"--------------------------------------------------------------------------
" nerdtree 
"--------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
nnoremap <Leader>tt :NERDTreeToggle<CR>
" ���� NERDTree �Ӵ��ڿ��
let NERDTreeWinSize=35
" ���� NERDTree �Ӵ���λ��
let NERDTreeWinPos="right"
" ��ʾ�����ļ�
let NERDTreeShowHidden=1
" NERDTree �Ӵ����в���ʾ���������Ϣ
let NERDTreeMinimalUI=1
" ɾ���ļ�ʱ�Զ�ɾ���ļ���Ӧ buffer
let NERDTreeAutoDeleteBuffer=1
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"How can I change default arrows?
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

"Allow configuration for multiple highlighting based on file type
"https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' 
                \ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let NERDTreeIgnore = ['\.o$', '\.lo$', '\.swp$', '\.pyc$', '\.la$'] 
let NERDTreeIgnore += ['cscope\..*', 'tags', 'GPATH', 'GTAGS', 'GRTAGS']


"--------------------------------------------------------------------------
" A plugin of NERDTree showing git status 
"--------------------------------------------------------------------------
Plug 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeIndicatorMapCustom = {
    "\ "Modified"  : "�7�5",
    "\ "Staged"    : "�7�4",
    "\ "Untracked" : "�7�3",
    "\ "Renamed"   : "�7�4",
    "\ "Unmerged"  : "�T",
    "\ "Deleted"   : "�7�0",
    "\ "Dirty"     : "�7�1",
    "\ "Clean"     : "�7�8�1�4",
    "\ 'Ignored'   : '�7�2',
    "\ "Unknown"   : "?"
    "\ }


"--------------------------------------------------------------------------
" Async plugin for vim and neovim to ease the use of ctags/gtags
"--------------------------------------------------------------------------
" Plug 'jsfaint/gen_tags.vim'


"--------------------------------------------------------------------------
" ����ģ�岹ȫ
"--------------------------------------------------------------------------
"Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"--------------------------------------------------------------------------
" ultisnips 
"--------------------------------------------------------------------------
"Plug 'SirVer/ultisnips'
" UltiSnips �� tab ���� YCM ��ͻ�������趨
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"
"let g:UltiSnipsSnippetDirectories=["mycppsnippets"]

if isdirectory("/home/liang.feng")
    let g:UltiSnipsSnippetDirectories=["/home/liang.feng/.vim/plugged/cppsnippets"]
    let g:UltiSnipsSnippetDirectories=[expand("~/.vim/plugged/cppsnippets")]
elseif isdirectory("/home/fwar3")
    let g:UltiSnipsSnippetDirectories=["/home/fwar3/.vim/plugged/cppsnippets"]
endif


"--------------------------------------------------------------------------
" Complete parameter after select the completion. Integration with YouCompleteMe(ycm), deoplete, neocomplete. 
" Install a complete engine have supported. Goto the completion item of the completion popup menu you want to select, 
" and then type ((minimal setting), the parameters will be inserted and select the the first parameter. <c-j>/<c-k>(minimal setting) 
" will jump to the next/previous parameter and select it.
"--------------------------------------------------------------------------
"NOTE: If you use ultinsips, you must load ultisnips before this plugin. In other 
"words, if you use plug to load plugins, Plug 'SirVer/ultisnips' must 
"before Plug 'tenfyzhong/CompleteParameter.vim' in your vimrc.

if (s:memory_enough)
    Plug 'tenfyzhong/CompleteParameter.vim'
    " Minimal setting
    inoremap <silent><expr> ( complete_parameter#pre_complete("()")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    " Goto next parameter and select it.
    nmap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    " Goto previous parameter and select it.
    nmap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    " Select next overload function.
    nmap <m-d> <Plug>(complete_parameter#overload_down)
    imap <m-d> <Plug>(complete_parameter#overload_down)
    smap <m-d> <Plug>(complete_parameter#overload_down)
    " Select previous overload function.
    nmap <m-u> <Plug>(complete_parameter#overload_up)
    imap <m-u> <Plug>(complete_parameter#overload_up)
    smap <m-u> <Plug>(complete_parameter#overload_up)

    "Can't work with plugin auto-pairs use the default mapping (
    "https://github.com/tenfyzhong/CompleteParameter.vim
    let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
    inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
endif




"--------------------------------------------------------------------------
" minibufexpl 
"--------------------------------------------------------------------------
"Plug 'fholgado/minibufexpl.vim'
 "��ʾ/���� MiniBufExplorer ����
"nnoremap <Leader>mb :MBEToggle<cr>
"nnoremap <Leader>mh :MBEbn<cr>
"nnoremap <Leader>mq :MBEbp<cr>
 "minibufexpl�����һ������
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"not auto start
"let g:miniBufExplorerAutoStart = 0


"--------------------------------------------------------------------------
" doxygen
"--------------------------------------------------------------------------
Plug 'https://github.com/scrooloose/nerdcommenter.git'


"--------------------------------------------------------------------------
" YouCompleteMe 
"--------------------------------------------------------------------------
"Plug 'Valloric/YouCompleteMe'
" ��������Ĵ��뵼��
"nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
" ֻ���� #include ���Ѵ򿪵��ļ�
"nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
"nnoremap <Leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
"3���ر��﷨���
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'       "����ȫ��·��
let g:ycm_confirm_extra_conf=0   "ÿ��ֱ�Ӽ��ظ��ļ�������ʾ�Ƿ�Ҫ����

"let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_server_python_interpreter='/usr/bin/python2'

"" ��ȫ������ע����ͬ����Ч
let g:ycm_complete_in_comments=1
let g:ycm_min_num_of_chars_for_completion = 3 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" ���� YCM ��ǩ��ȫ����
let g:ycm_collect_identifiers_from_tags_files=1
"YCM ���� OmniCppComplete ��ȫ���棬�������ݼ�
inoremap <Leader><Tab> <C-x><C-o>
"
" ��ȫ���ݲ��Էָ��Ӵ�����ʽ���֣�ֻ��ʾ��ȫ�б�
set completeopt-=preview
" �ӵ�һ�������ַ��Ϳ�ʼ����ƥ����
let g:ycm_min_num_of_chars_for_completion=1
" ��ֹ����ƥ���ÿ�ζ���������ƥ����
let g:ycm_cache_omnifunc=0
" �﷨�ؼ��ֲ�ȫ
let g:ycm_seed_identifiers_with_syntax=1


"--------------------------------------------------------------------------
" YCM-Generator
" This is a script which generates a list of compiler flags from a project
" with an arbitrary build system
"--------------------------------------------------------------------------
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'marijnh/tern_for_vim'


"{{{
"Plug 'Shougo/neosnippet-snippets'
"}}}

"{{{
"Plug 'maralla/completor-neosnippet'
"}}}


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
"Plug 'https://github.com/fwar34/cppsnippets.git'
" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git', 'svn']
let g:signify_difftool = 'diff'
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '^'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
nnoremap <Leader>di :SignifyDiff<CR>

"Hunk jumping:~
    "]c   Jump to next hunk.
    "[c   Jump to previous hunk.

    "]C   Jump to last hunk.
    "[C   Jump to first hunk.

"If you don't like these mappings, you can map them yourself:
">
    "nmap <leader>gj <plug>(signify-next-hunk)
    "nmap <leader>gk <plug>(signify-prev-hunk)
    "nmap <leader>gJ 9999<leader>gj
    "nmap <leader>gK 9999<leader>gk
"<
"------------------------------------------------------------------------------
"Hunk text object:~
">
    "omap ic <plug>(signify-motion-inner-pending)
    "xmap ic <plug>(signify-motion-inner-visual)
    "omap ac <plug>(signify-motion-outer-pending)
    "xmap ac <plug>(signify-motion-outer-visual)
"<
"ic" operates on all lines of the current hunk. "ac" does the same, but also
"removes all trailing empty lines.


"--------------------------------------------------------------------------
" vim-gutentags 
"--------------------------------------------------------------------------
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.root']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"https://zhuanlan.zhihu.com/p/36279445
"let g:gutentags_auto_add_gtags_cscope = 0

" �����Ų飺gutentags: gutentags: gtags-cscope job failed, returned: 1
"������Ϊ gutentags ���� gtags ʱ��gtags �����˴���ֵ 1��������ʲô�����
"��Ҫ��һ������־���鿴 gtags �Ĵ��������
"let g:gutentags_define_advanced_commands = 1
"���� vimrc �����������һ�仰������ gutentags ��һЩ�߼������ѡ�
"Ȼ���������Դ�ļ������� ��:GutentagsToggleTrace���������־��
"Ȼ�󱣴�һ�µ�ǰ�ļ������� gtags ���ݿ���£���������Ӧ���ܿ���һЩ�������־�����
"���ﲻ���Ļ���~/.cache/tags Ŀ¼�»��ж�Ӧ��Ŀ���ֵ� log �ļ���
"�򿪿��� gtags ���������ʲô��Ȼ�������Ӧ�Ĵ���
let g:gutentags_define_advanced_commands = 1

"���trace��Ϣ
"let g:gutentags_trace = 1

if has('win32')
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

let g:gutentags_plus_nomap = 1
noremap <silent> <Leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <Leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <Leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <Leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <Leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <Leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <Leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <Leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <Leader>ga :GscopeFind a <C-R><C-W><cr>

"gutentags.txt
augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END


"--------------------------------------------------------------------------
" ʹ�� vim-preview �����Ч���� quickfix ���ȿ���Ԥ�����н������������ԵĴ򿪱�Ҫ�ļ�
" This plugin solves a series of user experience problems in vim's preview window and 
" provide a handy way to preview tags, files and function signatures.
"--------------------------------------------------------------------------
Plug 'skywind3000/vim-preview'
noremap <C-k> :PreviewScroll -1<cr>
noremap <C-j> :PreviewScroll +1<cr>
inoremap <C-k> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <C-j> <c-\><c-o>:PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> q :PreviewClose<cr>
noremap <F4> :PreviewSignature!<cr>
inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>


"--------------------------------------------------------------------------
" https://zhuanlan.zhihu.com/p/36279445 
"--------------------------------------------------------------------------
"let $GTAGSLABEL = 'native-pygments'
if !has('win32') && executable('/usr/local/bin/ctags')
    let $GTAGSLABEL = 'universal-ctags'
endif
"let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'
"let $GTAGSCONF = '~/.globalrc'


"--------------------------------------------------------------------------
" incsearch 
"--------------------------------------------------------------------------
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"--------------------------------------------------------------------------
" Plugins end
"--------------------------------------------------------------------------
" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


"--------------------------------------------------------------------------
" ���ļ�����
"--------------------------------------------------------------------------
"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""���庯��SetTitle���Զ������ļ�ͷ 
func SetTitle() 
    "����ļ�����Ϊ.sh�ļ� 
    if &filetype == 'sh'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Feng") 
        "ԭ����ʱ����ʽ�Ƚϸ��ӣ���ϲ�����ı�һ��
        call append(line(".")+2, "\# Created Time: ".strftime("%c")) 
        "call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
        call append(line(".")+3, "\# Content: ") 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Feng") 
        " ͬ���� �ı�ʱ���ʽ
        call append(line(".")+2, "    > Created Time: ".strftime("%c")) 
        "call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d",localtime()))
        call append(line(".")+3, "    > Content: ") 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "�½��ļ����Զ���λ���ļ�ĩβ
    autocmd BufNewFile * normal G

endfunc 

" Suzzz��  ģ�����棬�½�python�ļ�ʱ������ļ�ͷ
autocmd BufNewFile *py exec ":call SetPythonTitle()"

func SetPythonTitle()
    call setline(1,"#!/usr/bin/env python3")
    call append( line("."),"#-*- coding: utf-8 -*-" )
    call append(line(".")+1," ")
    call append(line(".")+2, "\# File Name: ".expand("%")) 
    call append(line(".")+3, "\# Author: Feng") 
	call append(line(".")+4, "\# Created Time: ".strftime("%c"))
    "call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))    
    call append(line(".")+5, "\# Content: ") 
    autocmd BufNewFile * normal G
endfunc

func InsertVimCommit()
    call append(line(".") - 1, "\"--------------------------------------------------------------------------")
    call append(line(".") - 1, "\" ")
    call append(line(".") - 1, "\"--------------------------------------------------------------------------")
endfunc

nnoremap <Leader>ic :call InsertVimCommit()<CR>


"--------------------------------------------------------------------------
" �������� 
"--------------------------------------------------------------------------
nnoremap <Leader>ht g<C-]>

"--------------------------------------------------------------------------
" Gtags
"--------------------------------------------------------------------------
"let Gtags_Auto_Map = 1          "use a suggested key-mapping
let Gtags_Auto_Update = 1       "keep tag files up-to-date automatically
let Gtags_No_Auto_Jump = 1      "don't jump to the first tag at the time of search
let Gtags_Close_When_Single = 1 "close quickfix windows in case of single tag
nnoremap <Leader>hg :GtagsCursor<CR>
"----���Һ������ꡢö�ٵȶ����λ��
"nnoremap <Leader>ga :Gtags -a <C-R>=expand("<cword>")<CR><CR>
"----���ҵ��ñ������ĺ���
nnoremap <Leader>hc :Gtags -rxa <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ha :Gtags -ga <C-R>=expand("<cword>")<CR><CR>
let GtagsCscope_Auto_Load = 1


"-----------------------------------------------------
" netrw
"-----------------------------------------------------
let g:netrw_liststyle = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\.swp\($\|\t\),\.py[co]\($\|\t\),\.o\($\|\t\),\.bak\($\|\t\),\(^\|\s\s\)\zs\.\S\+'
let g:netrw_sort_sequence = '[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$'
let g:netrw_preview = 0
"let g:netrw_special_syntax = 1
let g:netrw_sort_options = 'i'

if isdirectory(expand('~/.vim'))
	let g:netrw_home = expand('~/.vim')
endif

"let g:netrw_timefmt = "%Y-%m-%d %H:%M:%S"

"let g:netrw_banner=0 
"let g:netrw_browse_split=4   " open in prior window
"let g:netrw_altv=1           " open splits to the right
"let g:netrw_liststyle=3      " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()


"--------------------------------------------------------------------------
" �����ָ�
"--------------------------------------------------------------------------
" ���û���������
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" ���� undo ��ʷ���������д��� .undo_history/
set undodir=~/.undo_history/
set undofile
" �����ݼ�
nnoremap <Leader>ss :mksession! ~/.my.vim<cr> :wviminfo! ~/.my.viminfo<cr>
"nnoremap <leader>sv :mksession! ~/.my.vim<cr>
" �ָ���ݼ�
nnoremap <leader>rs :source ~/.my.vim<cr> :rviminfo ~/.my.viminfo<cr>
"nnoremap <leader>rs :source ~/.my.vim<cr>


"--------------------------------------------------------------------------
" 
"--------------------------------------------------------------------------
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"nnoremap <Leader>se :e $MYVIMRC<CR>
"nnoremap <Leader>se :e ~/.vimrc<CR>
"nnoremap <Leader>ss :source $MYVIMRC<CR>

:iabbrev @@ liang.feng@quanshi.com
:iabbrev //// ///////////////////////////////////////////////////////////////////
