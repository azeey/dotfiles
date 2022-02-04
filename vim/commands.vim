" Commands ----------------------------------------------------------------

function! s:Ctag(dir)
    echomsg "!ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaSl --extra=+q " . a:dir
    exec "!ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaSl --extra=+q --langmap=c++:+.inl --langmap=c++:+.hh" . a:dir
endfunction
command! -nargs=1 -complete=dir Ctag call s:Ctag('<args>')

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

function! s:SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! SyntaxQuery call s:SynStack()

function s:PRReviewMode()
  nmap <F5> :tabc<CR>
  set diffopt-=iwhite 
  "set diffopt+=algorithm:patience,linematch:500
  TSDisableAll indent
  TSDisableAll highlight
  " ALEDisable
endfunc
command! -bar PRReviewMode call s:PRReviewMode()
