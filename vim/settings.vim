" Leaders -----------------------------------------------------------------{{{
let mapleader = ","
let maplocalleader = "\\"
"}}}

" Don't show current mode down the bottom
"set noshowmode

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=100

" hilight searches by default
"set hlsearch

" dont wrap lines
set nowrap
set number
set relativenumber

set termguicolors
colorscheme ayu

" Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set shiftround

" Highlight column after 'textwidth'
set colorcolumn=+1

" some stuff to get the mouse going in term
set mouse=a

" set the search scan so that it ignores case when the search is all lower case but recognizes uppercase if it's specified
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" Make sure that unsaved buffers that are to be put in the background are allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden


set csto=1
set cst

set undofile
set undodir=~/.vim_run/tmp/undo//     " undo files
set nobackup                        " enable backups
set noswapfile                    " It's 2012, Vim

set linespace=0 " Pixels of space between lines
set cindent
set cinoptions=i-s
" Follow google c++ style guide
set cinoptions=g1,h1-s,N-s

" default shiftwidth, softtabstop, and tabstop
"set sw=2 sts=2 ts=2

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
"set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
set listchars=tab:▸\ ,trail:·,eol:¬,extends:❯,precedes:❮
" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth
set formatoptions=crqnvtw

" Set the update time to 500ms so showmarks is more responsive
set updatetime=500

" Use clipboard
set clipboard=unnamedplus

" Folding -----------------------------------------------------------------{{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" "Refocus" folds
nnoremap <leader>z zMzvzz

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
"
set modelines=0


"set textwidth=120 " Set the textwidth to be 120 chars
set expandtab " Turn tabs into spaces
set diffopt+=iwhite " Add ignorance of whitespace to diff
set hlsearch " Enable search highlighting
set incsearch " Incrementally match the search
set path=.  " Initial path seeding
set tags=./tags,tags,~/tags " Set the tags files to be the following
