return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Documents/Journal",
        overrides = {
          notes_subdir = "notes",
        },
      },
    },
    templates = {
      folder = "templates",
      customizations = {
        weekly_notes = {
          notes_subdir = "notes/weekly",
          note_id_func = function(_)
            return os.date("%Y-%U", os.time())
          end,
        },
      },
    },
  },

  -- UI needs to be disabled because there's a conflict with the render-markdown plugin (https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file#obsidiannvim)
  ui = { enable = false },
}
