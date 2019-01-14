

inoremap jj <Esc>
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>
"nnoremap ; :
nnoremap ci; ciw;
nnoremap ciw; diwct;
nnoremap caw; dawct;


"Convert unix epoch time to datetime.  Removes the last 3 digits assuming that they are milliseconds
nnoremap <leader>e :echo system("date +%c -u -d @" . <C-r><C-w><del><del><del>)<CR>
nnoremap <leader>ec :echo system("date +%c -d @" . <C-r><C-w>)<CR>

" Don't move on *
nnoremap * *<c-o>
nnoremap g* g*<c-o>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>


