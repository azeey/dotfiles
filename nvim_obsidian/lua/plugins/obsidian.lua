return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  cmd = "ObsidianWeeklies",
  config = function(_, opts)
    require("obsidian").setup(opts)

    vim.api.nvim_create_user_command("ObsidianWeeklies", function()
      local obsidian = require("obsidian")
      local weekly_dir = Obsidian.dir / "notes" / "weekly"

      local week_id = string.format("%s", os.date("%Y-%V"))

      local note = obsidian.Note.create({
        id = week_id,
        dir = weekly_dir,
        title = "Weekly " .. week_id,
        template = "weekly_notes",
        should_write = true,
      })

      obsidian.Note.open(note)
    end, { desc = "Open current weekly note" })
  end,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "MeanderingProgrammer/render-markdown.nvim",
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
