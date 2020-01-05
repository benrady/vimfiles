
" Turn on Clojure Rainbow Parens
au BufRead * RainbowParenthesesActivate

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ignore jar files when editing clojure
set wildignore+=lib,*.class,target
