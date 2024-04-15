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
    -- lazy-load on filetype
    ft = "norg",
    -- lazy = false,
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- options for neorg. This will automatically call `require("neorg").setup(opts)`
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
}
