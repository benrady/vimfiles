
function! s:ExpandModulePath()
  " Extract the 'word' at the cursor, expanding leftwards across identifiers
  " and the . operator, and rightwards across the identifier only.
  "
  " For example:
  "   import xml.dom.minidom
  "           ^   !
  "
  " With the cursor at ^ this returns 'xml'; at ! it returns 'xml.dom'.
  let l:line = getline(".")
  let l:pre = l:line[:col(".") - 1]
  let l:suf = l:line[col("."):]
  return substitute(matchstr(pre, "[A-Za-z0-9_.]*$") . matchstr(suf, "^[A-Za-z0-9_]*"), '\.', ' ', 'g')
endfunction


" FIXME
" Would be great to strip out leading slashes from the query results so
" that you could use gf to navigate to files
" | sed 's#/##'"
"
" FIXME 
" Replace this with a call to `go env`
" set path+=/usr/local/Cellar/go/1.0.3

function! s:FindOrQuery(term)
  call ExecuteInShell("if godoc " . a:term . " 2> /dev/null; then godoc " . a:term . "; else godoc -q ". a:term . "; fi")
endfunction

map <buffer> K :call <SID>FindOrQuery(<SID>ExpandModulePath())<CR>

