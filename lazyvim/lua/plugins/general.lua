return {
  {"vim-scripts/ReplaceWithRegister"},
  {"preservim/vim-pencil"},
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gy", "<cmd>lua require('gitlinker').get_buf_range_url('n')<cr>", desc = "Copy Git Link" },
      {
        "<leader>gY",
        "<cmd>lua require('gitlinker').get_buf_range_url('n', {action_callback = require('gitlinker.actions').open_in_browser})<cr>",
        desc = "Open Git Link",
      },
    },
    opts = {},
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    enabled = function() return vim.fn.executable('gh') == 1 end,
    opts = {
      mappings = {
        submit_win = {
            approve_review = { lhs = "<C-a>"},    -- approve review
            comment_review = { lhs = "<C-t>"},     -- comment review, different from original because <c-m> is interpretted by terminal as <cr>
            request_changes = { lhs = "<C-r>"},   -- request changes review
            close_review_tab = { lhs = "<C-c>"},  -- close review tab
          }
      }
    }

  },
  {
    "stevearc/conform.nvim", -- part of lazyvim
    opts = {
      formatters = {
          prettier = {
            prepend_args = { "--prose-wrap", "always" }
          }
        }
    }
  },
  {"tpope/vim-fugitive"},
  {
    "peterhoeg/vim-qml",
  },
  {"bergercookie/vim-deb-preview"},
  {"godlygeek/tabular"},
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { 'c', 'python'},
    opts = {
      indent = {
        enable = true
      }
    }
  },
  {"tpope/vim-abolish"},
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]]
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  }
}
