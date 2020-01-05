" Map help key to pydoc
let g:pydoc_cmd = '.venv/bin/python3 -m pydoc'

map <buffer> K :let save_isk = &iskeyword \|
    \ set iskeyword+=. \|
    \ execute "!pydoc " . expand("<cword>") \|
    \ let &iskeyword = save_isk<CR>

set wildignore+=*.pyc,.venv

" Do not show vim-jedi when typing
let g:jedi#popup_on_dot = 0

" Do not show method signatures when typing (
let g:jedi#show_call_signatures = "0"
