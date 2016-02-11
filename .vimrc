" Load Pathogen
"
call pathogen#infect('bundle/{}')
call pathogen#helptags()

" Map Ctrl-t to ctrlp tag lookup
let g:ctrlp_extensions = ['tag']
nmap <silent> <C-S-l> :CtrlPTag<CR>

" Remap Ctrl-j to: Save All; Return to normal mode
imap <silent> <C-j> <Esc>:wa<CR>
nmap <silent> <C-j> :wa<CR>

" Set the path
set path=.,,**

" Replace all instances of the word under the cursor
nnoremap <Leader>s :%s/\V\<<C-r><C-w>\>/

" Command history length
set history=10000

" Color Scheme
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Better tab settings
set sts=2
set shiftwidth=2
set expandtab
set smartindent

" Automatically read and write files as needed
set autowrite
set autoread

" With these options together, we only use case sensitive search when there is a captial letter in the search term
set ignorecase
set smartcase

" Always syntax format the whole file
syntax sync fromstart

set lazyredraw

" completion on the command line
set wildmode=list:longest

" numbered lines
set number

" Prevents searched terms from remaining highlighted once search is done
set nohlsearch

" word wrapping
set wrap
set linebreak

" no beeps
set visualbell

" Ignore directories that have crap in them
set wildignore+=tmp,target,*.pyc,*.class

" My Favorite font
set guifont=Inconsolata:h18.00

" central backup directores
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Remap omni-completion to CTRL+Space
nmap <C-space> ea<C-n>
imap <C-space> <C-n>

" Filetype hacks
au BufRead,BufNewFile *_spec.rb set filetype=rspec

" Source project local .vimrc files
set exrc
