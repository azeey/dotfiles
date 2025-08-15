return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "ibhagwan/fzf-lua", -- optional
    },
    opts = {
      graph_style = "kitty",
    },
    config = true,
  },
}
