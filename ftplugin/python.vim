" Map help key to pydoc
let g:pydoc_cmd = '.venv/bin/python3 -m pydoc'

map <buffer> K :let save_isk = &iskeyword \|
    \ set iskeyword+=. \|
    \ execute "!pydoc " . expand("<cword>") \|
    \ let &iskeyword = save_isk<CR>

set wildignore+=*.pyc
