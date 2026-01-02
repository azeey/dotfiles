return {
  { "preservim/vim-pencil" },
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
    "stevearc/conform.nvim", -- part of lazyvim
    opts = {
      formatters = {
        prettier = {
          prepend_args = { "--prose-wrap", "always" },
        },
      },
    },
  },
  { "tpope/vim-fugitive" },
  {
    "peterhoeg/vim-qml",
  },
  { "bergercookie/vim-deb-preview" },
  { "godlygeek/tabular" },
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "c", "python" },
    opts = {
      indent = {
        enable = true,
      },
    },
  },
  { "tpope/vim-abolish" },
  {
    "folke/todo-comments.nvim",
    opts = {
      -- keywords = {
      --   TODO = {
      --     alt = { "azeey"}
      --   }
      -- },
      highlight = {
        pattern = {[[.*<(KEYWORDS):\s+]], [[.*<(KEYWORDS)\s*]]},
        keyword = "bg"
      },
      search = {
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      -- Ensure the cpp table exists
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.cpp = opts.linters_by_ft.cpp or {}
      if vim.fn.executable("ament_cpplint") == 1 then
        local cpplint = require('lint').linters.cpplint
        cpplint.cmd = "ament_cpplint"
        cpplint.args = {'--quiet'}
      end

      -- Add cpplint to the list of linters for C++ files
      table.insert(opts.linters_by_ft.cpp, "cpplint")
    end,
  },
  {
    "danymat/neogen",
    opts = function(_, opts)
      local i = require("neogen.types.template").item
      opts.languages = {
        cpp = {
          template = {
            use_default_comment = false,
            annotation_convention = "gz_doxygen",
            gz_doxygen = {
              { nil, "/// \\file", { no_results = true, type = { "file" } } },
              { nil, "/// \\brief $1", { no_results = true, type = { "func", "file", "class" } } },

              { i.ClassName, "/// \\class %s", { type = { "class" } } },
              { i.Type, "/// \\typedef %s", { type = { "type" } } },
              { nil, "/// \\brief $1", { type = { "func", "class", "type" } } },
              { i.Tparam, "/// \\tparam %s $1" },
              { i.Parameter, "/// \\param[in] %s $1" },
              { i.Return, "/// \\return $1" },
            }
          }
        }
      }
    end
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled=false
      }
    }
  }, 
  {
    "lewis6991/hover.nvim",
    opts = {
      init = function()
        require("hover.providers.lsp")
        require('hover.providers.gh')
      end
    },
    keys = {
      {"<localleader>k", "<cmd>lua require('hover').hover<cr>", desc="hover.nvim"}
    }
  }
}
}
