" A better autoread that works on a timer
"
set autoread
augroup checktime
    au!
    "silent! necessary otherwise throws errors when using command
    "line window.
    autocmd BufEnter        * silent! checktime
    autocmd CursorHold      * silent! checktime
    autocmd CursorHoldI     * silent! checktime
augroup END

if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(500,'CheckUpdate')
endfunction
