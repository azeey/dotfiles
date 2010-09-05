"Mostly borrowed from Derek Wyatt's vimrc http://www.derekwyatt.org/
"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

source ~/.vim/vimrc

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on


" Tabstops are 3 spaces
set tabstop=3
set softtabstop=3
set shiftwidth=3

" Show line numbers
set nu

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
"set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
"set cpoptions=ces$

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
"set guioptions=ac

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in millisecons.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
"set virtualedit=all

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 120 chars
set textwidth=120

" get rid of the silly characters in window separators
set fillchars=""

" Turn tabs into spaces
set expandtab

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Initial path seeding
set path=.
set path+=/usr/include/**

" Set the tags files to be the following
set tags=./tags,tags

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" put the vim directives for my file editing settings in
nmap <silent> ,vi
     \ ovim:set ts=3 sts=3 sw=3:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Show all available VIM servers
nmap <silent> ,ss :echo serverlist()<CR>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     \ . ">"<CR>

" set text wrapping toggles
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Run the command that was just yanked
nmap <silent> ,rc :@"<cr>

" Maps to make handling windows a bit easier
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>

" Buffer commands
noremap <silent> ,bd :bd<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
"nmap <silent> <C-o> 10zl
"nmap <silent> <C-i> 10zh

"Insert the string under the cursor to the search bar
":nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Highlight all instances of the current word under the cursor
"nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Eclim mapping
"nnoremap <silent> <buffer> <cr> :CSearchContext<cr> 

" Search the current file for what's currently in the search
" register and display matches
nmap <silent> ,gs
     \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

"-----------------------------------------------------------------------------
" MiniBufExplorer Plugin Settings
"-----------------------------------------------------------------------------
" Yup, I don't like this one either
let loaded_minibufexplorer = 1

"-----------------------------------------------------------------------------
" Source Explorer Plugin Settings
"-----------------------------------------------------------------------------
" The switch of the Source Explorer
nmap <silent> <F5> :SrcExplToggle<CR>

" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 16

" Set 10 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 10

" In order to Avoid conflicts, the Source Explorer should know what plugins
" are using buffers. And you need add their bufname into the list below
" according to the command ":buffers!"
let g:SrcExpl_pluginList = [
            \ "_NERD_tree_",
            \ "Source_Explorer"
            \ ]
" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" Use program 'ctags' with argument '--sort=foldcase -R' to create or
" update a tags file
"let g:SrcExpl_updateTagsCmd = "retag.ksh"

" Set "<F9>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F9>" 

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Store the bookmarks file in perforce
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

"-----------------------------------------------------------------------------
" FSwitch Settings
"-----------------------------------------------------------------------------
nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>

"-----------------------------------------------------------------------------
" SnipMate Settings
"-----------------------------------------------------------------------------

function! ListKnownSnippetLanguageTypes(A, L, P)
    let filesanddirs = split(globpath(g:snippets_dir, a:A . "*"), "\n")
    let dirsonly = []
    for f in filesanddirs
        if isdirectory(f)
            let each = split(f, '/')
            let dirsonly = add(dirsonly, each[-1])
        end
    endfor
    return dirsonly
endfunction

function! ReloadSnippets(type)
    call ResetSnippets()
    if a:type != ""
        call ExtractSnips(g:snippets_dir . a:type, a:type)
    else
        let alltypes = ListKnownSnippetLanguageTypes("", "", "")
        for type in alltypes
            call ExtractSnips(g:snippets_dir . type, type)
        endfor
    endif
endfunction

command! -complete=customlist,ListKnownSnippetLanguageTypes
         \ -nargs=? RS call ReloadSnippets("<args>")

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
nmap ,fb :FuzzyFinderBuffer<CR>
nmap ,ff :FuzzyFinderFile<CR>
nmap ,ft :FuzzyFinderTag<CR>

"-----------------------------------------------------------------------------
" UltiSnips Settings
"-----------------------------------------------------------------------------
set runtimepath+=~/.vim/ultisnips
let g:UltiSnipsExpandTrigger="<c-9>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

function! RunSystemCall(systemcall)
    let output = system(a:systemcall)
    let output = substitute(output, "\n", '', 'g')
    return output
endfunction

function! PrepForSimulator()
    %s/dev\/ttyS1/tmp\/rec0
    %s/dev\/ttyS2/tmp\/rec1
    %s/dev\/ttyS3/tmp\/rec2
    %s/dev\/ttyUSB0/tmp\/rec3
    %s/dev\/ttyUSB1/tmp\/rec4
    %s/dev\/ttyS0/tmp\/rec5
endfunction

function! FormatCalibration()
   %s/], /], /g
   normal gg=G
endfunction

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------

au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript

au BufNewFile,BufRead *.mxml set filetype=mxml | execute "compiler ant"
au BufNewFile,BufRead *.as set filetype=actionscript | execute "compiler ant"
augroup derek_scons
    au!
    au BufNewFile,BufRead SCons* setf scons
augroup END

augroup derek_xsd
    au!
    au BufEnter *.xsd,*.wsdl,*.xml setl tabstop=4 | setl shiftwidth=4
    au BufEnter *.xsd,*.wsdl,*.xml setl formatoptions=crq | setl textwidth=80
augroup END

augroup Binary
    au!
    au BufReadPre   *.bin let &bin=1
    au BufReadPost  *.bin if &bin | %!xxd
    au BufReadPost  *.bin set filetype=xxd | endif
    au BufWritePre  *.bin if &bin | %!xxd -r
    au BufWritePre  *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------

iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate
iab fone      phone
iab Fone      Phone

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    "colors desert  
    colors twilight2
    set guifont=Monaco\ 11.5
    "set guifont=Terminus\ 13.5
    runtime ftplugin/man.vim
    "nmap K :Man <cword><CR>
    "set guifont="Droid Sans Mono"\ 11
    if !exists("g:vimrcloaded")
        winpos 0 0
        if ! &diff
            winsize 130 90
        else
            winsize 227 90
        endif
        let g:vimrcloaded = 1
    endif
 else
    colors desert
endif

" Addisu's settings

set linespace=0 " Pixels of space between lines
set autoindent
set cindent
"let loaded_matchit = 1

nmap <silent> ,hx :%!xxd <CR>
nmap <silent> ,nhx :%!xxd -r <CR>
nmap <silent> ,sb :set scb<CR>
nmap <silent> ,x "_x
"Highlight or underline
nmap <silent> ,c :set cursorline! <CR>


set grepprg=ack 
set grepformat=%f:%l:%c:%m

nmap <silent> ,mt \mt
nmap <silent> ,mh \mh
nmap <silent> ,ma \ma
nmap <silent> ,mm \mm

"let g:showmarks_enable = 1
"hi SignColumn guibg=NONE
nmap <F6> :TlistToggle<CR>

" Set the update time to 500ms so showmarks is more responsive
set updatetime=500 
"autocmd FileType python setlocal omnifunc=pysmell#Complete

"autocmd BufNewFile,BufRead *.mxml,*.as :nmap <C-B> :!bash ~/bin/fcshcmp.sh %:p
autocmd BufNewFile,BufRead *.mxml,*.as :nmap <C-B> :!~/bin/fcshcmp.sh %:p run

nmap <S-t> <C-t>
nmap <S-]> <C-]>

"Manpageviewer extensions
let g:manpageview_pgm_py = "pydoc"
let g:manpageview_options_py= ";-f;-q"

let g:manpageview_pgm_rb = "ri"
let g:manpageview_options_rb= ";-f;-q"

autocmd FileType python setlocal omnifunc=pysmell#Complete

"Tskeleton settings
let g:tskelUserName = "Addisu Z. Taddese"
let g:tskelUserEmail = "addisu.taddese@ciholas.com"
let g:tskelUserWWW = "http://www.ciholas.com"
autocmd BufNewFile *.py TSkeletonSetup python.py
autocmd BufNewFile *.cpp TSkeletonSetup cpp.cpp

nmap <C-B> :FuzzyFinderBuffer<CR>

"ConqueTerm
let g:ConqueTerm_TERM='xterm'

set tabstop=3
set sts=3
set shiftwidth=3
" Display <tab>s etc...
set list
" Some cool display variants for tabs (which will almost certainly break if
" your gvim/terminal is not unicode-aware).
" If you want to make your own I recommend look up the unicode table 2500 on
" the web (or any other that includes your desired characters).
" Inserting the unicode character 2500 is done by pressing: Ctrl-V Ctrl-U 2500

" Depending on your encoding the following lines might be broken for you, in
" that case try to view this in utf-8 encoding or just make your own lcs
" string as described above.


"set lcs=tab:│\ ,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:└─,trail:·,extends:>,precedes:<,nbsp:&
set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth
set fo=croqnvt

function! SwitchSourceHeader()
  "update!
  if (expand ("%:t") == expand ("%:t:r") . ".cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction

nmap ,h :call SwitchSourceHeader()<CR>

map <F12> :!ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaS --extra=+q .<CR>
