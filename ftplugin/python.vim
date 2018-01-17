" Map help key to pydoc
map <buffer> K :let save_isk = &iskeyword \|
    \ set iskeyword+=. \|
    \ execute "!pydoc " . expand("<cword>") \|
    \ let &iskeyword = save_isk<CR>

set wildignore+=lib,*.class,tracks,*.pyc
