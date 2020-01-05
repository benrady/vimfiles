let g:jedi#goto_stubs_command = "<leader>js"

" Load Pathogen
call pathogen#infect('bundle/{}')
call pathogen#helptags()

" Map Ctrl-t to ctrlp tag lookup
let g:ctrlp_extensions = ['tag']

" Smarter working directory for CTRL-P
let g:ctrlp_working_path_mode = 'a'

nmap <silent> <C-t> :CtrlPTag<CR>

" Set the path
set path=.,,**

" Replace all instances of the word under the cursor
nnoremap <Leader>s :%s/\V\<<C-r><C-w>\>/

" Show buffer number in airline tabs
let g:airline#extensions#tabline#buffer_nr_show = 1

" Allow undo after quitting vim
set undofile
set undodir=~/.vim/undodir//

" Command history length
set history=10000

" Color Scheme
colorscheme peachpuff

" Better tab settings
set sts=2
set shiftwidth=2
set expandtab
set smartindent

" Disable mouse support, so that the terminal handles mouse highlighting
" instead of vim
set mouse=

" Automatically read and write files as needed
set autowrite

" With these options together, we only use case sensitive search when there is a captial letter in the search term
set ignorecase
set smartcase

" Always syntax format the whole file
syntax sync fromstart

" Don't update the screen while macros are running
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

" Global ignores
set wildignore+=tmp

" My Favorite font
set guifont=Inconsolata:h18.00

" Prevent extra file system events when writing files
set backupcopy=yes

" central backup directores
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Disable F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Remap omni-completion to CTRL+Space
nmap <C-space> ea<C-n>
imap <C-space> <C-n>

" Use escape to enter normal mode in terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Source project local .vimrc files
set exrc

" Turn on Clojure Rainbow Parens
au BufRead * RainbowParenthesesActivate
