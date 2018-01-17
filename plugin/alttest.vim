function! AlternateForCpp(file)
  if match(a:file, 'Test') != -1
    let alt = substitute(a:file, 'Test\.cpp$', '.cpp', '')
    let alt = substitute(alt, 'test/', 'src/', '')
    return alt
  else
    let alt = substitute(a:file, '.cpp$', 'Test.cpp', '')
    let alt = substitute(alt, 'src/', 'test/', '')
    return alt
  endif
endfunction

function! AlternateForRuby(file)
  if match(a:file, 'spec') != -1
    let alt = substitute(a:file, '_spec\.rb$', '.rb', '')
    let alt = substitute(alt, '^spec/', 'lib/', '')
    return alt
  else
    let alt = substitute(a:file, '.rb$', '_spec.rb', '')
    let alt = substitute(alt, '^lib/', 'spec/', '')
    return alt
  endif
endfunction

function! AlternateForJavascript(file)
  if match(a:file, 'test') != -1
    let alt = substitute(a:file, '_spec\.js$', '.js', '')
    let alt = substitute(alt, 'tests/', '', '')
    return alt
  else
    let alt = substitute(a:file, '.js$', '_spec.js', '')
    let alt = substitute(alt, 'public/', 'public/tests/', '')
    return alt
  endif
endfunction

function! AlternateForClojure(file)
  if match(a:file, 'spec') != -1
    let alt = substitute(a:file, '_spec\.clj$', '.clj', '')
    let alt = substitute(alt, 'spec/', 'src/', '')
    return alt
  else
    let alt = substitute(a:file, '.clj$', '_spec.clj', '')
    let alt = substitute(alt, 'src/', 'spec/', '')
    return alt
  endif
endfunction

function! AlternateForPython(file)
  if match(a:file, 'test') != -1
    let alt = substitute(a:file, '_test\.py$', '.py', '')
    let alt = substitute(alt, 'test/', 'src/', '')
    return alt
  else
    let alt = substitute(a:file, '.py$', '_test.py', '')
    let alt = substitute(alt, 'src/', 'test/', '')
    return alt
  endif
endfunction

function! Alternate()
  let current_file = expand("%")
  if match(current_file, '.rb$') != -1
    return AlternateForRuby(current_file)
  elseif match(current_file, '.cpp$') != -1
    return AlternateForCpp(current_file)
  elseif match(current_file, '.js$') != -1
    return AlternateForJavascript(current_file)
  elseif match(current_file, '.clj$') != -1
    return AlternateForClojure(current_file)
  elseif match(current_file, '.py$') != -1
    return AlternateForPython(current_file)
  else
    return current_file
  endif
endfunction

nnoremap <Leader>t :only<CR>:e `=Alternate()`<CR><C-w>w<CR>
" set splitright
