" Default indentation
set shiftwidth=2 softtabstop=2 tabstop=2

" Set color scheme {{{
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 0

function! s:sonokai_custom() abort
  let l:configuration = sonokai#get_configuration()
  let l:palette = sonokai#get_palette(l:configuration.style)
  call sonokai#highlight('DiffDelete', l:palette.diff_red, l:palette.diff_red)
endfunction

augroup SonokaiCustom
  autocmd!
  autocmd ColorScheme sonokai call s:sonokai_custom()
augroup END
colorscheme sonokai

let g:lightline.colorscheme = 'sonokai'
" When treesitter has a parsing error, it sets TSError on every line which 
" causes every line to be underlined, so we clear the highlight group here.
hi clear TSError

" hi Search cterm=bold ctermfg=235 ctermbg=176 gui=bold guifg=#282c34 guibg=#c678dd
" hi! DiffAdd   cterm=NONE gui=NONE guifg=NONE ctermfg=NONE  term=NONE 
" }}}
"

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Don't wrap lines by default
set nowrap

" Show line numbers
set number

" Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set shiftround

" Highlight column after 'textwidth'
set colorcolumn=+1

" Enable mouse in terminal
set mouse=a

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase

" Permanent undo
set undofile

" Location of undo files
set undodir=~/.vim_run/tmp/undo/

" No need for swap file
set noswapfile

" Display <tab>s etc...
set list
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

" Set the update time to 500ms so ...
"set updatetime=500

" Use clipboard
set clipboard=unnamedplus

set modeline

" Turn tabs into spaces
set expandtab

" Set the tags files to be the following
set tags=./tags,tags,~/tags

" Diffs
set diffopt& diffopt+=algorithm:histogram,indent-heuristic

" Folding -----------------------------------------------------------------{{{

" set foldlevelstart=0

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
