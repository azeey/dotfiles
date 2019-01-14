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
