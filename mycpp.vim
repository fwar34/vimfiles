" Vim indent file
" Language:	C++
" Maintainer:	liang.feng
" Last Change:	2019/2/22 
" modify from java.cpp indent template code in namespace

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" C++ indenting is built-in, thus this is very simple
setlocal cindent

" Set the function to do the work.
setlocal indentexpr=GetJavaIndent()

" Only define the function once.
if exists("*GetJavaIndent")
  finish
endif

let b:undo_indent = "setl cin<"

let s:keepcpo= &cpo
set cpo&vim

function! SkipJavaBlanksAndComments(startline)
  let lnum = a:startline
  while lnum > 1
    let lnum = prevnonblank(lnum)
    if getline(lnum) =~ '\*/\s*$'
      while getline(lnum) !~ '/\*' && lnum > 1
        let lnum = lnum - 1
      endwhile
      if getline(lnum) =~ '^\s*/\*'
        let lnum = lnum - 1
      else
        break
      endif
    elseif getline(lnum) =~ '^\s*//'
      let lnum = lnum - 1
    else
      break
    endif
  endwhile
  return lnum
endfunction

function GetJavaIndent()
  " Java is just like C; use the built-in C indenting and then correct a few
  " specific cases.
  let theIndent = cindent(v:lnum)

  " If we're in the middle of a comment then just trust cindent
  "if getline(v:lnum) =~ '^\s*\*'
    "return theIndent
  "endif

  " find start of previous line, in case it was a continuation line
  let lnum = SkipJavaBlanksAndComments(v:lnum - 1)

  " If the previous line starts with '@', we should have the same indent as
  " the previous one
  "if getline(lnum) =~ '^\s*@.*$'
  if getline(lnum) =~ '^\s*template\s*.*>$'
    return indent(lnum)
  endif

  return theIndent
endfunction
