return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    opts = {
      preset = "obsidian",
      heading = {
        -- border = true,
        border_virtual = true,
      },
    },
  },
}
