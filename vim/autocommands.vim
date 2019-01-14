" Filetype-specific -------------------------------------------------------
" Any file - Line Return {{{

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
" Binary {{{
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

"" }}}
" C and C++ {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
    au FileType c set sw=4 sts=4 ts=4
augroup END

augroup ft_cpp
    au!
    au FileType cpp setlocal foldmethod=syntax sw=2 sts=2 ts=2 tw=80
    au FileType cpp let NERDSpaceDelims=1
    au FileType cpp setlocal makeprg=GCC_COLORS=\ catkin\ build\ --this
    au FileType cpp set comments^=:///
autocmd FileType cpp set sw=2 sts=2 ts=2


augroup END
" }}}
" QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    "au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}
" Python {{{
augroup ft_python
    au!

    "au FileType python setlocal omnifunc=pysmell#Complete
    au FileType python setlocal sw=4 sts=4 ts=4
    au FileType python set textwidth=79
    au Filetype python setlocal foldmethod=expr
    " Use the same mapping as slimv for vim-ipython
    au Filetype python map ;s <C-s>
    au FileType python let g:ultisnips_python_style = "numpy"
augroup END
" }}}
" Markdown {{{
augroup ft_mkd
    au!
    " Bolden a word
  au BufNewFile,BufRead *.md   set filetype=markdown
    au Filetype mkd let b:surround_45 = "**\r**"
    au Filetype mkd nnoremap <leader>b ysw-
augroup END
" }}}
" Pandoc {{{
augroup ft_pandoc
    au!
    " Bolden a word
    au Filetype pandoc let b:surround_45 = "**\r**"
    au Filetype pandoc nnoremap <leader>b ysw-
    au Filetype pandoc vmap <leader>b S-
    au Filetype pandoc set tw=120
    au Filetype pandoc nnoremap <F2>:PandocPdf<CR>:bd<CR>
augroup END
" }}}
" Latex {{{
augroup ft_latex
    au!
    au Filetype latex set ts=2 sts=2 sw=2
    "au Filetype latex set makeprg scons
    au Filetype latex map <F2> :Neomake!<CR>
    au Filetype tex set ts=2 sts=2 sw=2
    au Filetype tex map <F2> :Neomake!<CR>
    au Filetype tex let g:Tex_ViewRule_pdf='zathura'
    au Filetype tex let g:latex_viewer='zathura'
    au Filetype tex set iskeyword+=:
    au Filetype tex set formatoptions-=at
    au Filetype tex set nojoinspaces
    au Filetype tex set synmaxcol=0
    au Filetype tex set tw=0 wm=0

    au Filetype tex set wrap nolist linebreak

augroup END
" }}}
" Launch (ROS) {{{
augroup ft_launch
    au!
    au BufNewFile,BufRead *.launch set ft=xml ts=2 sts=2 sw=2
augroup END
" }}}
" Restructured Text {{{
  au BufNewFile,BufRead *.rst   set filetype=pandoc
" }}}
" SDF (Gazebo) {{{
augroup ft_launch
    au!
    au BufNewFile,BufRead *.sdf set ft=xml ts=2 sts=2 sw=2
    au BufNewFile,BufRead *.world set ft=xml ts=2 sts=2 sw=2
augroup END
" }}}
" }}}

