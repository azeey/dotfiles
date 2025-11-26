return {
  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    enabled = true,
    opts = {}
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "<localleader>s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
      { "<localleader>S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
      { "<localleader>gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    },
  },

  -- rename surround mappings from gs to gz to prevent conflict with leap
  {
    "echasnovski/mini.surround",
    enabled = true,
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
    keys = {
      { "s", "", desc = "surround"},
    },
  },
}
