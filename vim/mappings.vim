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

nmap <leader>dt :put =strftime('%Y-%m-%d %H:%M')<CR>A

" Toggle paste mode
nnoremap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nnoremap <silent> <leader>cd :lcd %:h<CR>
nnoremap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nnoremap <silent> <leader>n :set invhls<CR>:set hls?<CR>

" put the vim directives for my file editing settings in
nnoremap <silent> <leader>vi
     \ ovim:set ts=2 sts=2 sw=2:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" set text wrapping toggles
nnoremap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

" Run the command that was just yanked
nnoremap <silent> <leader>rc :@"<cr>

" Maps to make handling windows a bit easier
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> <leader>s8 :vertical resize 83<CR>
noremap <silent> <leader>s1 :vertical resize 123<CR>

" Buffer commands
noremap <silent> ,bd :bd<CR>

" Edit the vimrc file
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>


"Insert the string under the cursor to the search bar
":nnoremap <leader>s :%s/\<<C-r><C-w>\>/
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Search the current file for what's currently in the search
" register and display matches
nnoremap <silent> <leader>gs
     \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nnoremap <silent> <leader>gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nnoremap <silent> <leader>gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>

" Select just pasted block
nnoremap <silent> vv v']

" When you forget to sudo
cmap w!! w !sudo tee % > /dev/null


nnoremap <silent> <leader>hx :%!xxd <CR>
nnoremap <silent> <leader>nhx :%!xxd -r <CR>
nnoremap <silent> <leader>sb :set scrollbind<CR>

"Highlight or underline
nnoremap <silent> <leader>c :set cursorline! cursorcolumn! <CR>

" Clean trailing whitespace
nnoremap <silent> <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

noremap <silent> <F12> :Ctag '.'<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
