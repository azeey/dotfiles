" Plugins -----------------------------------------------------------------{{{
call plug#begin('~/.vim_run/plugged')

Plug 'tpope/vim-sensible'

" Code review - {{{
Plug 'will133/vim-dirdiff'
Plug 'junkblocker/patchreview-vim'
Plug 'pwntester/octo.nvim'
" }}}
" Color schemes - {{{
Plug 'ayu-theme/ayu-vim'
" Plug 'itchyny/lightline.vim'
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
" Plug 'scrooloose/nerdtree'
" vim-eunuch interferes with vim-pencil. nvim-genghis is an alternative for
" some of the operations like :Rename and :Delete
" Plug 'tpope/vim-eunuch'
Plug 'chrisgrieser/nvim-genghis'
" }}}
" Linting and Language Server (LSP)- {{{
"Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

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
" Plug 'Lokaltog/vim-easymotion'
Plug 'austintaylor/vim-commaobject'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-unimpaired'
"Plug 'vim-scripts/matchit.zip'
" }}}
" Snippets - {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
" Text Editing - {{{
Plug 'godlygeek/tabular'
"Plug 'scrooloose/nerdcommenter'
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
"Plug 'ruanyl/vim-gh-line'
Plug 'ruifm/gitlinker.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jlanzarotta/bufexplorer'
" Plug 'vim-scripts/auto-pairs-gentle'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarnpkg install'  }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
"Plug 'PratikBhusal/vim-grip'
Plug 'tpope/vim-characterize'
Plug 'simrat39/symbols-outline.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'nvim-orgmode/orgmode'
Plug 'folke/trouble.nvim'
if has('nvim')
  " Plug 'nvim-neorg/neorg', {'tag': '0.0.15'}
  Plug 'nvim-neorg/neorg'
endif
Plug 'p00f/clangd_extensions.nvim'
Plug 'edluffy/specs.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'sindrets/diffview.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


" Plug 'phaazon/hop.nvim', {'tag': 'v1.3.0'}
Plug 'folke/twilight.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'jremmen/vim-ripgrep'
Plug 'rickhowe/diffchar.vim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim',
Plug 'tami5/sqlite.lua' " dependency of telescope-frecency
Plug 'goldfeld/ctrlr.vim'
"Plug 'nvim-treesitter/nvim-treesitter-context'
" Plug 'stevearc/stickybuf.nvim' " Disabled for now since it causes to start
" in insert mode when using telescope
" Plug 'aymericbeaumet/vim-symlink' " helps with bazel cache files
Plug 'moll/vim-bbye' " optional dependency of vim-symlink
Plug 'ggandor/leap.nvim'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'chrisbra/SaveSigns.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'ruifm/gitlinker.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'cdelledonne/vim-cmake'
Plug 'andymass/vim-matchup'
Plug 'norcalli/nvim-terminal.lua'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'nvim-pack/nvim-spectre'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'cshuaimin/ssr.nvim'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-jdaddy'
" }}}
"
call plug#end()

"}}}

" Plugin Settings ---------------------------------------------------------{{{
" Color Scheme {{{
" lightline {{{
" Add diagnostic info for https://github.com/itchyny/lightline.vim
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
" Sonokai {{{
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 0

function! s:sonokai_custom() abort
  let l:configuration = sonokai#get_configuration()
  let l:palette = sonokai#get_palette(l:configuration.style, {})
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
" }}}
"
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
let g:surround_{char2nr("m")} = "<!--{{{--> \r <!--}}}-->"
let g:surround_{char2nr("c")} = "```\r```"
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
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

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
"
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_hijack_netrw = 0

lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "norg", "ruby", "html", "lua", "vim", "css", "graphql", "javascript"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = false,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = {"vim"},  -- optional, list of language that will be disabled
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  context_commentstring = {
    enable = true,
  },
}


EOF

set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
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
nnoremap <leader>fm <cmd>Telescope oldfiles only_cwd=true<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').find_files({cwd=require('telescope.utils').buffer_dir()})<cr>
command! -nargs=0 Map :Telescope keymaps
command! -nargs=? -complete=dir Files :Telescope find_files cwd=<args>

lua <<EOF
local actions = require('telescope.actions')
local utils = require('telescope.utils')
local action_state = require("telescope.actions.state")

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
        -- actions.file_edit throws - context of picker seems to change
        --actions.file_edit(prompt_bufnr)
        actions.send_selected_to_qflist(prompt_bufnr)
        actions.open_qflist()
    else
        actions.file_edit(prompt_bufnr)
    end
end

-- Global remapping
------------------------------
local telescope = require('telescope')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<cr>"] = custom_actions.fzf_multi_select
      },
      n = {
          ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
          ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
          ["<cr>"] = custom_actions.fzf_multi_select
      }
    },
    path_display = {shorten = 3},
  },
  pickers = {
    buffers = {
      sort_lastused = true
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
local lspkind = require('lspkind')

lspkind.init('symbol')

local lsp_status = require('lsp-status')
lsp_status.config {
  show_filename = false,
  status_symbol = '',
  kind_labels = lspkind.symbol_map
}

lsp_status.register_progress()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_option('formatexpr', 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
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
  buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR><ESC>', opts)

  lsp_status.on_attach(client)

  vim.cmd [[autocmd! CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

  require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach

  require("nvim-navbuddy").attach(client, bufnr)
  require("nvim-navic").setup({highlight = true})
  require("nvim-navic").attach(client, bufnr)
end

  -- Setup nvim-cmp.


cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
      { name = 'orgmode' },
      { name = 'neorg' },
    }, {
      { name = 'buffer' },
    }
  ),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

require("clangd_extensions").setup {
  server = {
    handlers = lsp_status.extensions.clangd.setup(),
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      clangdFileStatus = true
    },
  },
  extensions = {
    inlay_hints = {
      only_current_line = true,
      highlight = "NonText"
    }
  }
}
require'lspconfig'.pylsp.setup{
  -- handlers = lsp_status.extensions.pylsp.setup(),
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true, line_length = 79 },
        isort = { enabled = true, profile = "black" },
      }
    }
  }
}

require'lspconfig'.cmake.setup{
  on_attach = on_attach,
}

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
    " return luaeval("require('lsp-status').status()")
    if luaeval('require('')')
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
" Trouble {{{

lua << EOF
  require("trouble").setup {
  }
EOF
" }}}
" Octo {{{
lua <<EOF
require("octo").setup{
  mappings = {
    submit_win = {
        approve_review = { lhs = "<C-a>"},    -- approve review
        comment_review = { lhs = "<C-t>"},     -- comment review, different from original because <c-m> is interpretted by terminal as <cr>
        request_changes = { lhs = "<C-r>"},   -- request changes review
        close_review_tab = { lhs = "<C-c>"},  -- close review tab
      }
  }
}
EOF
" }}}
" Specs {{{
lua <<EOF
require("specs").setup{
  show_jumps  = true,
  min_jump = 30,
  popup = {
      delay_ms = 0, -- delay before popup displays
      inc_ms = 10, -- time increments used for fade/resize effects
      blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 30,
      winhl = "PMenu",
      fader = require('specs').linear_fader,
      resizer = require('specs').shrink_resizer
  },
}

vim.api.nvim_set_keymap('n', '<C-h>', ':lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
EOF
" }}}
" nvim-dap {{{
lua <<EOF
local dap = require('dap')


dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv('HOME') .. '/vscode/extension/debugAdapters/bin/OpenDebugAD7',
}
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "cppdbg",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--
--     setupCommands = {
--       {
--         text = '-enable-pretty-printing',
--         description =  'enable pretty printing',
--         ignoreFailures = false
--       },
--     },
--   },
-- }

require('dap.ext.vscode').load_launchjs()
dap.configurations.cpp = dap.configurations.cppdbg

require("dapui").setup()
EOF

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F9> :lua require'dap'.terminate()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <localleader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <localleader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <localleader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <localleader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <localleader>dl :lua require'dap'.run_last()<CR>

nnoremap <silent> <F3> :lua require'dapui'.toggle()<CR>

" }}}
" hop {{{
" lua <<EOF
" require'hop'.setup()
"
" vim.api.nvim_set_keymap('n', '<leader><leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
" vim.api.nvim_set_keymap('n', '<leader><leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
" vim.api.nvim_set_keymap('n', '<leader><leader>t', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
" vim.api.nvim_set_keymap('n', '<leader><leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
" vim.api.nvim_set_keymap('n', '<leader><leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
" vim.api.nvim_set_keymap('n', '<leader><leader>w', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>", {})
" vim.api.nvim_set_keymap('n', '<leader><leader>b', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>", {})
" EOF
" }}}
" twilight {{{
lua << EOF
  -- require("twilight").setup { }
EOF
" }}}
" aerial {{{
lua <<EOF
-- require('aerial').setup({})
EOF
" }}}
" neorg {{{
if has('nvim')
lua <<EOF
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                }
            }
        },
        -- ["core.gtd.base"] = {
        --   config = {
        --     workspace = "work"
        --   }
        -- },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        -- ["core.export"] = {},
    }
}
EOF
endif
" }}}
" Leap {{{
nmap s <Plug>(leap-forward-to)
nmap S <Plug>(leap-backward-to)
" }}}
" markdown-preview {{{
let g:mkdp_command_for_global = 1
let g:mkdp_markdown_css = expand('~/.vim/markdown_style.css')
" }}}

" telescope-ultisnips {{{
lua <<EOF
require('telescope').load_extension('ultisnips')
EOF
" }}}
"
" lua based plugins:
lua <<EOF
-- Refactoring {{{
require('refactoring').setup {}
-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
-- }}}

-- Comment {{{
require('Comment').setup()
local api = require('Comment.api')
-- Mapping from Nerd-commenter
vim.keymap.set('n', '<leader>cu', api.uncomment.linewise.current)
vim.keymap.set('n', '<leader>cl', api.comment.linewise.current)
vim.keymap.set('n', '<leader>cy', "yy<leader>cl", {remap=true})
-- }}}

-- gitlinker {{{
require("gitlinker").setup()
-- }}}

-- terminal {{{
require'terminal'.setup()
-- }}}

-- lualine {{{
require('lualine').setup({
   winbar = {
        lualine_c = {
            "navic",
            color_correction = nil,
            navic_opts = nil,
        }
    },
    sections = {
        lualine_x = {
          'lsp_progress',
        }
      }
   })
-- }}}

-- nvim-tree {{{
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup{
  hijack_netrw = true,
  disable_netrw = false,
}
vim.keymap.set('n', '<leader>fe', "<cmd>NvimTreeToggle<cr>")
-- }}}

EOF
" }}}
" }}}
