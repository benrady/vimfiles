
" Tabfix Settings
"
" Airline Config
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't show warnings about whitespace
let g:airline#extensions#whitespace#enabled = 0

" Remap tabs to buffers
" Use hidden buffers for argdo goodness
set hidden

" Move to the prev/next buffer with Ctrl-k/Ctrl-j
map <silent> <C-k> :bprevious<CR>
map <silent> <C-j> :bnext<CR>

