" ====================================================================
" Last change:	2015 Jul 28 by Steven Chen
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	    for Amiga:  s:.vimrc
"     for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" ====================================================================


" ------------------------------------------------------
" VIM basic settings
" ------------------------------------------------------
syntax enable "Highlight syntax




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

if &diff  
    colors peaksea  
endif


" git clone git://github.com/altercation/solarized.git
"set t_Co=256
set background=dark
colorscheme solarized


set ruler		"show the Ruler
set laststatus=2 		" start shows the status bar(1),always shows the status bar(2)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "show he status line content
set nocompatible  "Remove the annoying about vi consistency model, avoid the previous versions of some of the bugs and limitations

set cursorline              " Highlight the current line
set incsearch               " Display the search results, when the content inputted
set hlsearch                " Highlighted the text, when it was be found


set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  


set shortmess=atI   " Do not displayed the prompts aid children in Uganda at start time

set showcmd

set nobackup
set mouse=a
set nu

set shiftwidth=4     "set automatic indentation be four characters
set softtabstop=4           " set the backspace key to delete four Spaces at a time
set tabstop=4        "set the TAB width is four characters
set expandtab
" set ts=4 "set Space is replaced by the TAB
" set noexpandtab
" %retab!





" ----------------------------
" advanced setting
" ----------------------------
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set autochdir               " 自动切换当前目录为当前文件所在的目录
nmap tt :%s/\t/    /g<CR> "replace the tab with spaces
nmap sd :%s= *$==  "delete the space in the end of line
nmap dl :%s/\r/<CR>


" ######################################################################################################################
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
let g:SuperTabDefaultCompletionType="context"  

" ----------------------------
" plugin - MiniBufExplorer setting   
" ----------------------------
" plugin - OmniCppComplete setting
" ----------------------------
set nocp
filetype plugin on

" ----------------------------
" plugin - SuperTab setting
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


set nosplitbelow "窗口的分割会把新窗口放到当前窗口之下
set nosplitright "窗口的分割会把新窗口放到当前窗口之右
"set numberwidth=1 "行号使用的最小列数
set spell "打开拼写检查。拼写有错的单词下方会有红色波浪线，将光标放在单词上，按 z= 就会出现拼写建议，按 ]s 可以直接跳到下一个拼写错误处。
set showmatch "插入括号时，短暂地跳转到匹配的对应括号

"自动插入文件头
autocmd BufNewFile *.sh,*.py,*.lua,*.h,*.hpp,*.c,*.cc,*.cpp,*.htm,*.html,*.xml,*.proto,CMakeLists.txt exec ":call SetFileTitle()"
func! SetFileTitle()
    let l:ext = expand("%:e")
    "call append(line(".") - 1, "File Type:       " . &filetype)
    "call append(line(".") - 1, "File Name:       " . expand("%"))
    if &filetype == 'sh'
        call append(line(".") - 1, "\#!/bin/bash")
        call append(line(".") - 1, "\# Created By:      " . g:signature)
        call append(line(".") - 1, "\# Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\# Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
    elseif &filetype == 'python'
        call append(line(".") - 1, "\#!/usr/bin/env python")
        call append(line(".") - 1, "\# coding=utf-8")
        call append(line(".") - 1, "\# Created By:      " . g:signature)
        call append(line(".") - 1, "\# Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\# Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "if __name__ == \"__main__\":")
        call append(line(".") - 1, "    pass")
    elseif &filetype == 'lua'
        call append(line(".") - 1, "\-\- Created By:      " . g:signature)
        call append(line(".") - 1, "\-\- Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\-\- Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\#!/usr/bin/env lua")
    elseif l:ext == 'h'
        call append(line(".") - 1, "\#pragma once")
    elseif &filetype == 'c'
        call append(line(".") - 1, "\/\/ Created By:      " . g:signature)
        call append(line(".") - 1, "\/\/ Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\/\/ Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "#include \<stdio.h\>")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "int main(int argc, char *argv[]) {")
        call append(line(".") - 1, "    return 0;")
        call append(line(".") - 1, "}")
    elseif &filetype == 'cpp'
        call append(line(".") - 1, "\/\/ Created By:      " . g:signature)
        call append(line(".") - 1, "\/\/ Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\/\/ Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "#include \<iostream\>")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "using namespace std;")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "int main(int argc, char *argv[]) {")
        call append(line(".") - 1, "    return 0;")
        call append(line(".") - 1, "}")
    elseif &filetype == 'html'
        call append(line(".") - 1, "<!--")
        call append(line(".") - 1, "Created By:      " . g:signature)
        call append(line(".") - 1, "Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\-->")
        call append(line(".") - 1, "<html>")
        call append(line(".") - 1, "<head>")
        call append(line(".") - 1, "<title>Hello</title>")
        call append(line(".") - 1, "</head>")
        call append(line(".") - 1, "<body bgcolor=\"#ffffff\">")
        call append(line(".") - 1, "    Hello, world！")
        call append(line(".") - 1, "</body>")
        call append(line(".") - 1, "</html>")
    elseif &filetype == 'xml'
        call append(line(".") - 1, "<!--")
        call append(line(".") - 1, "Created By:      " . g:signature)
        call append(line(".") - 1, "Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\-->")
        call append(line(".") - 1, "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>")
        call append(line(".") - 1, "<hello>")
        call append(line(".") - 1, "</hello>")
    elseif &filetype == 'proto'
        call append(line(".") - 1, "\/\/ Created By:      " . g:signature)
        call append(line(".") - 1, "\/\/ Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\/\/ Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "package company.app;")
        call append(line(".") - 1, "option optimize_for = SPEED; // SPEED, CODE_SIZE, LITE_RUNTIME")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "message demo {")
        call append(line(".") - 1, "    required int64 accid = 1;")
        call append(line(".") - 1, "    optional bool sex = 2;")
        call append(line(".") - 1, "    repeated string book = 3;")
        call append(line(".") - 1, "}")
    elseif &filetype == 'cmake'
        call append(line(".") - 1, "\# Created By:      " . g:signature)
        call append(line(".") - 1, "\# Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\# Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "cmake_minimum_required(VERSION 2.7.4 FATAL_ERROR)")
        call append(line(".") - 1, "project(DEMO)")
        "call append(line(".") - 1, "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Werror -fno-strict-aliasing\")")
        "call append(line(".") - 1, "set(CMAKE_CXX_FLAGS_DEBUG \"${CMAKE_CXX_FLAGS_DEBUG} -O0 -D_DEBUG\")")
        "call append(line(".") - 1, "set(CMAKE_CXX_FLAGS_RELEASE \"${CMAKE_CXX_FLAGS_RELEASE}\")")
        "call append(line(".") - 1, "message(STATUS \"Compile flag: ${CMAKE_CXX_FLAGS}\")")
        "call append(line(".") - 1, "message(STATUS \"Cmake build type: ${CMAKE_BUILD_TYPE}\")")
        "call append(line(".") - 1, "message(STATUS \"Debug mode flag: ${CMAKE_CXX_FLAGS_DEBUG}\")")
        "call append(line(".") - 1, "message(STATUS \"Release mode flag: ${CMAKE_CXX_FLAGS_RELEASE}\")")
        "call append(line(".") - 1, "message(STATUS \"Project binary dir: ${PROJECT_BINARY_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Project source dir: ${PROJECT_SOURCE_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Cmake binary dir: ${CMAKE_BINARY_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Cmake source dir: ${CMAKE_SOURCE_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Cmake current binary dir: ${CMAKE_CURRENT_BINARY_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Cmake current source dir: ${CMAKE_CURRENT_SOURCE_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Demo binary dir: ${DEMO_BINARY_DIR}\")")
        "call append(line(".") - 1, "message(STATUS \"Demo source dir: ${DEMO_SOURCE_DIR}\")")
        "call append(line(".") - 1, "set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \"${CMAKE_SOURCE_DIR}/bin\")")
        "call append(line(".") - 1, "set(CMAKE_LIBRARY_OUTPUT_DIRECTORY \"${CMAKE_SOURCE_DIR}/lib\")")
        "call append(line(".") - 1, "set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY \"${CMAKE_SOURCE_DIR}/lib\")")
        "call append(line(".") - 1, "set(CMAKE_MODULE_OUTPUT_DIRECTORY \"${CMAKE_SOURCE_DIR}/mod\")")
        "call append(line(".") - 1, "")
        "call append(line(".") - 1, "include_directories(${PROJECT_SOURCE_DIR})")
        "call append(line(".") - 1, "link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})")
        "call append(line(".") - 1, "link_directories(${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})")
        "call append(line(".") - 1, "link_directories(${CMAKE_MODULE_OUTPUT_DIRECTORY})")
        "call append(line(".") - 1, "")
        "call append(line(".") - 1, "add_custom_command(")
        "call append(line(".") - 1, "DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/hello.rl")
        "call append(line(".") - 1, "OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/hello.rl.cpp")
        "call append(line(".") - 1, "COMMAND ragel -C ${CMAKE_CURRENT_SOURCE_DIR}/hello.rl -o ${CMAKE_CURRENT_BINARY_DIR}/hello.rl.cpp")
        "call append(line(".") - 1, ")")
        "call append(line(".") - 1, "")
        "call append(line(".") - 1, "SET(demo_src_list demo.cpp ${CMAKE_CURRENT_BINARY_DIR}/hello.rl.cpp)")
        "call append(line(".") - 1, "SET(demo_link_lib rt)")
        "call append(line(".") - 1, "#add_library(demo_a STATIC ${demo_src_list})")
        "call append(line(".") - 1, "#target_link_libraries(demo_a ${demo_link_lib})")
        "call append(line(".") - 1, "#set_target_properties(demo_a PROPERTIES OUTPUT_NAME \"demo\")")
        "call append(line(".") - 1, "#add_library(demo_so SHARED ${demo_src_list})")
        "call append(line(".") - 1, "#target_link_libraries(demo_so ${demo_link_lib})")
        "call append(line(".") - 1, "#set_target_properties(demo_so PROPERTIES OUTPUT_NAME \"demo\")")
        "call append(line(".") - 1, "add_executable(demo ${demo_src_list})")
        "call append(line(".") - 1, "target_link_libraries(demo ${demo_link_lib})")
        "call append(line(".") - 1, "#add_dependencies(demo demo_a demo_so)")
        "call append(line(".") - 1, "")
        "call append(line(".") - 1, "#add_subdirectory(src)")
    endif
    "自动定位到文件末尾
    "autocmd BufNewFile * normal g
endfunc


"二进制文件
"vim -b : 用xxd格式编辑二进制文件
augroup Binary
    autocmd!
    autocmd BufReadPre  *.bin,*.o,*.so,*.a let &bin=1
    autocmd BufReadPost *.bin,*.o,*.so,*.a if &bin | %!xxd
    autocmd BufReadPost *.bin,*.o,*.so,*.a set ft=xxd | endif
    autocmd BufWritePre *.bin,*.o,*.so,*.a if &bin | %!xxd -r
    autocmd BufWritePre *.bin,*.o,*.so,*.a endif
    autocmd BufWritePost *.bin,*.o,*.so,*.a if &bin | %!xxd
    autocmd BufWritePost *.bin,*.o,*.so,*.a set nomod | endif
augroup End

autocmd BufWritePre,FileWritePre *.* exec ":call LastModified()"
func! LastModified()
    let l:lines = line("$")
    if l:lines > 10
        let l:lines = 10
    endif
    let l:cur_line = line(".")
    let l:cur_col = col(".")
    exe "1,".l:lines."s/Modified Time: .*/Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S") . "/e"
    call cursor(l:cur_line, l:cur_col)
endfunc


" ----------------------------
" VI/VIM graphicla cheat sheet
" ----------------------------
"	
" Esc [normal mode] |
" ~ [toggle case]   | ! [external filter] | @ [play macro] | # [prev ident] | $ [eol] | % [goto match] | ^ ["soft" bol] | & [repeat :s] | * [next ident] | ( [begin sentence] | ) [end sentence] | _ ["soft" bol down] | + [next line]
" ` [goto mark]     | 1                   | 2              | 3              | 4       | 5              | 6              | 7             | 8              | 9                  | 0                | -                   | = [auto format]
"
"                         Q [ex mode]      | W [next WORD] | E [end WORD] | R [replace mode] | T [back till] | Y [yank line] | U [undo line] | I [insert at bol] | O [open above] | P [paste before] | { [begin parag] | } [end parag]
"                         q [record macro] | w [next word] | e [end word] | r [replace char] | t [till]      | y [yank]      | u [undo]      | i [insert mode]   | o [open below] | p [[aste after]  | [ [misc]        | ] [misc]
"
"                                 A [append at eol] | S [subst line] | D [delete to eol] | F ["back" find ch] | G [eof/goto ln] | H [screen top] | J [join lines] | K [help] | L [screen bottom] | : [ex cmd line]    | " [reg spec]     | | [bol/ goto col]
"                                 a [append]        | s [subst char] | d [delete]        | f [find char]      | g [extra cmds]  | h [<---------] | j [down]       | k [up]   | l [----------- >] | ; [repeat t/T/f/F] | ' [goto mk. bol] | \ [not used!]
"
"                                         Z [quit]       | X [back space]  | C [change to eol] | V [visual lines] | B [prev WORD] | N [prev (find)] | M [screen mid] | < [unident]         | > [indent]   | ? [find (rev)]
"                                         z [extra cmds] | x [delete char] | c [change]        | v [visual mode]  | b [prev word] | n [next (find)] | m [set mark]   | , [reverse t/T/f/F] | . repeat cmd | / [find]




" ------------------------------------------------------
" VIM command help
" ------------------------------------------------------
" :e ++ff=unix " show the EOF characters
" :set list " show the TAB key
"	:	vim +line
" Ctrl + Z 
" fg 
" jobs
"

" vimdiff
"	:vertical diffsplit FILE_RIGHT
" Ctrl-w K（把当前窗口移到最上边）
"	Ctrl-w H（把当前窗口移到最左边）
"	Ctrl-w J（把当前窗口移到最下边）
" Ctrl-w L（把当前窗口移到最右边）
" :set noscrollbind 屏幕滚动是同步的
"	zo folding open
"	zc folding close
"	dp （diff "put"）
"	do (diff "get"，之所以不用dg，是因为dg已经被另一个命令占用了)
"	:set diffopt=context:6 Vimdiff 缺省是会把不同之处上下各 6 行的文本都显示出来以供参考
" :diffupdate	刷新比较结果
"	Ctrl-w, w	两个文件之间来回跳转

"	git config --global diff.tool vimdiff  
"	git config --global difftool.prompt No
"	git config --global merge.tool vimdiff
"	$ git config --global color.status auto 
"	$ git config --global color.diff auto 
"	$ git config --global color.branch auto 
"	$ git config --global color.interactive auto 


" (1) gg=G 是一个自动缩进的命令 (在命令状态下直接输入，不需要输入冒号)，gg是文件首，G是文件尾，所以 gg=G 是整理全部代码。
" (2) == 整理当行，加行数整理多行。
" (3) ={ 或者 =i{ 整理一个代码块。
" (4) mG=nG 当 m 不等于 n 的时候能完成从 m 行到 n 行的局部的缩进。例如，从80行缩进直到100行，你可以用 80G=100G，在命令状态下使用 :set nu 查看行号，一般更习惯将 se nu 直接写入Vim的配置文件，这样每次打开都会显示行号。
" (5) 在写代码前，设置自己的代码风格。在配置文件里添加命令：
" 设置缩进和行号
" set nu ru ai si ts=4 sw=4
" (6) :set equalprg=indent
" 意思是用indent程序处理等号命令，indent默认是gnu风格。

