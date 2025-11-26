return {
  "echasnovski/mini.operators",
  version = "*",

  opts = {
    -- Each entry configures one operator.
    -- `prefix` defines keys mapped during `setup()`: in Normal mode
    -- to operate on textobject and line, in Visual - on selection.

    -- Evaluate text and replace with output
    evaluate = {
      prefix = "<leader>m=",
    },

    -- Exchange text regions
    exchange = {
      -- NOTE: Default `gx` is remapped to `gX`
      prefix = "<leader>mx",
    },

    -- Multiply (duplicate) text
    multiply = {
      prefix = "<leader>mm",
    },

    -- Replace text with register
    replace = {
      prefix = "<leader>mr",
    },

    -- Sort text
    sort = {
      prefix = "<leader>ms",
    },
  },
}
