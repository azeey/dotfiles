return {
  {
    "ggandor/leap.nvim",
    enabled = false,
    keys = {
      { "<localleader>s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
      { "<localleader>S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
      { "<localleader>gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    },
    config = function(_, _)
      vim.keymap.set({ "n", "x", "o" }, "<localleader>s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "<localleader>S", "<Plug>(leap-backward)")
      vim.keymap.set("n", "<localleader>gs", "<Plug>(leap-from-window)")
    end,
  },
}
