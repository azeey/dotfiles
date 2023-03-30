inoremap jj <Esc>
" Use c-k and c-j as arrow keys in command mode
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>

nnoremap ci; ciw;
nnoremap ciw; diwct;
nnoremap caw; dawct;

"Convert unix epoch time to datetime.  Removes the last 3 digits assuming that they are milliseconds
nnoremap <leader>e :echo system("date +%c -u -d @" . <C-r><C-w><del><del><del>)<CR>
nnoremap <leader>ec :echo system("date +%c -d @" . <C-r><C-w>)<CR>

" Don't move on *
" nnoremap * *<c-o>
" nnoremap g* g*<c-o>
" Keep search matches in the middle of the window.
"nnoremap n nzzzv
"nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Put the current date and time on the next line
nmap <leader>dt :put =strftime('* %Y-%m-%d %H:%M')<CR>A

" Toggle paste mode
nnoremap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nnoremap <silent> <leader>cd :lcd %:h<CR>

" Run the command that was just yanked
nnoremap <silent> <leader>rc :@"<cr>

" Maps to make handling windows a bit easier
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>

" Buffer commands
noremap <silent> ,bd :bd<CR>

" Edit the vimrc file
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

"Insert the string under the cursor to the search bar
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

" Delete all buffers
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>

" Select just pasted block
nnoremap <silent> vv v']

" When you forget to sudo
cmap w!! w !sudo tee % > /dev/null

" Setting this on two buffers makes them scroll together
nnoremap <silent> <leader>sb :set scrollbind<CR>

"Highlight or underline
nnoremap <silent> <leader>c :set cursorline! cursorcolumn! <CR>

" Clean trailing whitespace
nnoremap <silent> <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
" vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
"
" clang-format {{{
" Use this to format with my fork of clang-format
map <localleader>f :py3f /data/code/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
let g:clang_format_path="/data/code/llvm/Release/bin/clang-format"
"}}}
