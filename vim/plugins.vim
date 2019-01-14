" Plugins -----------------------------------------------------------------{{{

Plug 'sjl/badwolf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-markdown'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'

Plug 'bfredl/nvim-miniyank' "YankRink alternative
Plug 'simnalamburt/vim-mundo' "Gundo alternative
"Plug 'vim-scripts/ShowMarks'
"Plug 'vim-airline/vim-airline' , {'tag': 'v0.8'}
"Plug 'vim-airline/vim-airline-themes'

"" All others
Plug 'altercation/vim-colors-solarized'
Plug 'austintaylor/vim-commaobject'
Plug 'vim-scripts/matchit.zip'
" For supertab and smartinput, the order matters
Plug 'kana/vim-smartinput'
Plug 'cohama/vim-smartinput-endwise'
Plug 'godlygeek/tabular'
"Plug 'ivanov/vim-ipython'
"Plug 'kien/ctrlp.vim'
"Plug 'klen/python-mode'
Plug 'Lokaltog/vim-easymotion'
" Plug 'markabe/bufexplorer'
Plug 'michaeljsmith/vim-indent-object'
"Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'othree/xml.vim'
Plug 'plasticboy/vim-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'Source-Explorer-srcexpl.vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'moll/vim-node'
"Plug 'pangloss/vim-javascript'

Plug 'luochen1990/rainbow'

"The silver searcher
Plug 'rking/ag.vim'
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'

"Testing
Plug 'justinmk/vim-sneak'
"Plug 'justmao945/vim-clang'
Plug 'taketwo/vim-ros'
"Plug 'quickfixsigns'
"Plug 'tlib'
"Plug 'nielsadb/df_mode.vim'
"Plug 'jalcine/cmake.vim', {'pinned': 1} "Until I get a new version of vim with the 'uniq' function
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'tmhedberg/SimpylFold' "Slows everything down

Plug 'benekastah/neomake'

Plug 'chrisbra/NrrwRgn'
Plug 'mikewest/vimroom'
Plug 'mmai/vim-zenmode'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
"Plug 'davidhalter/jedi-vim' " Too slow. Need async
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mhinz/vim-signify'

Plug 'lambdalisue/vim-improve-diff'
Plug 'lambdalisue/vim-unified-diff'
Plug 'junkblocker/patchreview-vim'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Color schemes
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'


Plug 'itchyny/lightline.vim'
Plug 'jlconlin/cpp.vim'

"}}}
" Plugin Settings ---------------------------------------------------------{{{
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Ag {{{
" Ag for the last search.
nnoremap <silent> <leader>/ :execute "Ag '" . substitute(substitute(substitute(@/, "\\\\<", "", ""), "\\\\>", "", ""), "\\\\v", "", "") . "'"<CR>
" }}}
" Miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <C-p> <Plug>(miniyank-cycle)
" }}}
" Pandoc {{{
let g:pandoc_use_hard_wraps = 1
let g:pandoc_auto_format = 0
" }}}
" NERDTree {{{
" Toggle the NERD Tree on an off with F7
nnoremap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nnoremap <S-F7> :NERDTreeClose<CR>

" Store the bookmarks file in perforce
let NERDTreeBookmarksFile=$HOME . "/.vim/.NERDTreeBookmarks"

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

"}}}
" Surround {{{
" Use the surround plugin to create markers
let g:surround_99 = "<!--{{{--> \r <!--}}}-->"
" }}}
" Gundo {{{
"Gundo mapping
" nnoremap <F4> :GundoToggle<CR>
nnoremap <F4> :MundoToggle<CR>
" }}}
" BufExplorer {{{
"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>
" }}}
" ManpageViewer {{{
let g:manpageview_pgm_py = "pydoc"
let g:manpageview_options_py= ";-f;-q"

let g:manpageview_pgm_rb = "ri"
let g:manpageview_options_rb= ";-f;-q"
" }}}
" Ultisnips {{{
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}
" Vim-ROS {{{
let g:ros_build_system='catkin-tools'
" }}}
" Yapf {{{
map <c-y> :call yapf#YAPF()<cr>
imap <c-y> <c-o>:call yapf#YAPF()<cr>
" }}}
" Vim-latex {{{
let g:tex_flavor = 'latex'
" }}}
" Vim-Pencil {{{
let g:pencil#conceallevel = 0
" }}}
" Vim-Pencil {{{
let g:rainbow_active = 1
" }}}
" FzF {{{
" Mapping selecting mappings

let g:fzf_nvim_statusline = 0 " disable statusline overwriting

nnoremap <silent> <c-f> :Files<CR>
nnoremap <silent> <c-b> :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>m :FZFMru<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction

function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" }}}
" C-Support {{{
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen  = 'yes'
" }}}
" Signify {{{
let g:signify_vcs_list = [ 'hg' ]
" }}}
" ALE {{{
let g:ale_c_parse_compile_commands = 0
" let g:ale_c_build_dir_names = []
"let g:ale_linters_ignore = {'cpp': ['cppcheck', 'flawfinder', 'cquery', 'clangtidy']}
let g:ale_linters= {'cpp': ['clangtidy']}
let g:ale_cpp_clangtidy_checks=[]
let g:ale_completion_enabled = 0
let g:ale_command_wrapper = 'nice -n5'
let g:ale_fixers=['trim_whitespace']
let g:ale_fix_on_save=1
" }}}
" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
"}}}
" Coc {{{
" Unimpaired {{{
nmap <Left>l [l
nmap <Right>l ]l
"}}}
" if hidden not set, TextEdit might fail.
set hidden

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[q` and `]q` for navigate diagnostics
nmap <silent> [v <Plug>(coc-diagnostic-prev)
nmap <silent> ]v <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" TODO: gr is used by ReplaceWithRegister.
" nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,c,cpp setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
" }}}
"}}}
