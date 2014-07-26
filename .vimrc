" ================================= 
" Last change:	2014 May 20 by Steven Chen
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	    for Amiga:  s:.vimrc
"     for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" ===================================


" ----------------------------
" edit tips
" ----------------------------
" :e ++ff=unix " 显示结束符
" :set list " 显示TAB


au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict





" ----------------------------
" base setting
" ----------------------------
syntax enable
syntax on
colorscheme	desert256
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set nobackup
set mouse=a
set nu

set shiftwidth=4     "设定自动缩进为4个字符
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4        "设定tab宽度为4个字符
set expandtab
" set ts=4 "空格替换为TAB：
" set noexpandtab
" %retab!

set cursorline              " 突出显示当前行
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

" ----------------------------
" advanced setting
" ----------------------------
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set autochdir               " 自动切换当前目录为当前文件所在的目录
nmap tt :%s/\t/    /g<CR> "将tab替换为空格
nmap sd :%s= *$==<CR>  "删除行为的空格
nmap dl :%s/\r/<CR>



" ----------------------------
" plugin - C.VIM setting
" ----------------------------
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" ----------------------------
" plugin - Taglist setting
" ----------------------------
let Tlist_Show_One_File=1 " 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 " 如果 taglist 窗口是最后一个窗口，则退出 vim  

" ----------------------------
" plugin - Cscope setting
" ----------------------------
set cscopequickfix=s-,c-,d-,i-,t-,e-

" ----------------------------
" plugin - OmniCppComplete setting
" ----------------------------
set nocp
filetype plugin on

" ----------------------------
" plugin - SuperTab setting
" ----------------------------
let g:SuperTabDefaultCompletionType="context"  

" ----------------------------
" plugin - MiniBufExplorer setting   
" ----------------------------

" ----------------------------
" plugin - bufexplorer setting   
" ----------------------------
"\be打开历史文件列表，\bv水平新建历史文件列表窗口，\bs垂直新建历史文件列表

" ----------------------------
" plugin - Winmanager setting   
" ----------------------------
 let g:persistentBehaviour=0 "只剩一个窗口时, 退出vim.
let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer' 
let g:winManagerWidth = 30 "设置winmanager的宽度，默认为25 
nmap wm : WMToggle <CR> "定义打开关闭winmanager按键

let g:AutoOpenWinManager = 1 "在进入vim时自动打开winmanager
"set auto open Winmanager
"if g:AutoOpenWinManager  
"autocmd VimEnter * nested call s:StartWindowsManager()|1wincmd w     
"endif 

" make the explorers window always stay on the right   wincmd H wincmd L    in winmanager.vim

" ----------------------------
" plugin - NERDTree setting   
" ----------------------------
let NERDTreeDirArrows=0
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"  
  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction

" ----------------------------
" plugin - javacomplete setting   
" ----------------------------
setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags







" ----------------------------
" func - C，C++ 按F5编译运行
" ----------------------------
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

