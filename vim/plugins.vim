" Plugins -----------------------------------------------------------------{{{
call plug#begin('~/.vim_run/plugged')

Plug 'tpope/vim-sensible'

" Code review - {{{
Plug 'will133/vim-dirdiff'
Plug 'junkblocker/patchreview-vim'
" }}}
" Color schemes - {{{
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'
Plug 'navarasu/onedark.nvim'
" }}}
" External commands - {{{
" Plug 'benekastah/neomake'
Plug 'tpope/vim-dispatch'
" }}}
" File manipulation - {{{
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
" }}}
" Linting and Language Server (LSP)- {{{
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'nvim-lua/lsp-status.nvim'
" }}}
" Misc - {{{
" YankRink alternative
Plug 'bfredl/nvim-miniyank'
" Gundo alternative
Plug 'simnalamburt/vim-mundo'
" }}}
" Motion - {{{
Plug 'Lokaltog/vim-easymotion'
Plug 'austintaylor/vim-commaobject'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
" }}}
" Snippets - {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
" Text Editing - {{{
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
" }}}
" Syntax - {{{
Plug 'jlconlin/cpp.vim'
"Plug 'othree/xml.vim'
Plug 'plasticboy/vim-markdown'
" }}}
" VCS - {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}
" Writing - {{{
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'mikewest/vimroom'
Plug 'junegunn/vim-journal'
" }}}
" Evaluating Plugins {{{

Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-rsi'
Plug 'peterhoeg/vim-qml'
Plug 'ruanyl/vim-gh-line'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
"Plug 'PratikBhusal/vim-grip'
Plug 'tpope/vim-characterize'
Plug 'simrat39/symbols-outline.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'nvim-orgmode/orgmode'
Plug 'folke/trouble.nvim'
Plug 'nvim-neorg/neorg'
" }}}
"
call plug#end()

"}}}

" Plugin Settings ---------------------------------------------------------{{{
" Ag {{{

nnoremap <leader>a :Ag<space>
" Ag for the last search.
nnoremap <leader>a :Ag<space>
nnoremap <silent> <leader>/ :execute "Ag '" . substitute(substitute(substitute(@/, "\\\\<", "", ""), "\\\\>", "", ""), "\\\\v", "", "") . "'"<CR>
" }}}
" Miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <C-p> <Plug>(miniyank-cycle)
let g:miniyank_filename = $HOME."/.miniyank.mpack"
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
" Mundo {{{
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
" Vim-latex {{{
let g:tex_flavor = 'latex'
" }}}
" Vim-Pencil {{{
let g:pencil#conceallevel = 0
let g:rainbow_active = 1
let g:pencil#textwidth = 79
" }}}
" FzF {{{
" Mapping selecting mappings

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
" }}}
" C-Support {{{
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen  = 'yes'
" }}}
" Signify {{{
let g:signify_vcs_list = [ 'hg' ]
" }}}
" lightline {{{
" " Add diagnostic info for https://github.com/itchyny/lightline.vim
 let g:lightline = {
       \ 'colorscheme': 'one',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'fileformat', 'fileencoding', 'filetype'], ['lspstatus' ] ]
       \ },
       \ 'component_function': {
       \   'gitbranch': 'FugitiveHead',
       \   'lspstatus': 'LspStatus',
       \ },
       \ }
" }}}
" Unimpaired {{{
nmap <Left>l [l
nmap <Right>l ]l
" }}}
" vim-dirdiff {{{
nnoremap ]j :DirDiffNext<cr>
nnoremap ]k :DirDiffPrev<cr>
" }}}
" vim-markdown {{{
" vim-markdown's ]c mapping conflicts with the builtin mapping for navigating 
" in diff mode
map <localleader>c <Plug>Markdown_MoveToCurHeader
" }}}
" auto-pairs {{{
"
let g:AutoPairsUseInsertedCount = 1
let g:AutoPairsShortcutBackInsert='<C-b>'
" }}}
" patchreview {{{
" Enable events for autocmds
let g:patchreview_ignore_events = 0
" Enable syntax highlighting
let g:patchreview_disable_syntax = 0
" Almost disable folding
"let g:patchreview_foldlevel = 20
" Current file on the left
"let g:patchreview_split_right = 1
" }}}
" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "norg"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = false,
  }
}

EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}
" telescope {{{
" Find files using Telescope command-line sugar.
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>fw <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>m <cmd>Telescope oldfiles<cr>
command! -nargs=0 Map :Telescope keymaps
command! -nargs=? -complete=dir Files :Telescope find_files cwd=<args>

lua <<EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
local telescope = require('telescope')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
EOF
" }}}
" lspconfig and nvim-cmp {{{

set completeopt=menu,menuone,noselect

lua <<EOF
local nvim_lsp = require('lspconfig')
local cmp = require'cmp'

local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[v', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']v', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>', opts)

  lsp_status.on_attach(client)
end

  -- Setup nvim-cmp.

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'orgmode' },
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'clangd'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    handlers = lsp_status.extensions.clangd.setup(),
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      clangdFileStatus = true
    }
  }
end

function format_range_operator()
  local old_func = vim.go.operatorfunc
  _G.op_func_formatting = function()
    local start = vim.api.nvim_buf_get_mark(0, '[')
    local finish = vim.api.nvim_buf_get_mark(0, ']')
    vim.lsp.buf.range_formatting({}, start, finish)
    vim.go.operatorfunc = old_func
    _G.op_func_formatting = nil
  end
  vim.go.operatorfunc = 'v:lua.op_func_formatting'
  vim.api.nvim_feedkeys('g@', 'n', false)
end
vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", {noremap = true})
EOF

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
" }}}
" symbols-outline {{{

lua <<EOF
vim.g.symbols_outline = { 
  show_symbol_details = false,
  auto_preview = false
  }
EOF
" }}}
" }}}
" }}}
" Trouble {{{

lua << EOF
  require("trouble").setup {
  }
EOF
" }}}

" }}}
