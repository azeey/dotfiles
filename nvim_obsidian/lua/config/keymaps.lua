-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

vim.keymap.set("n", "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

vim.keymap.set("n", "<leader>dt", "<cmd>:put =strftime('* %Y-%m-%d %H:%M')<CR>", {
  desc = "Put the current date and time on the next line",
})

vim.keymap.set("n", "<leader>dd", "<cmd>:put =strftime('%Y-%m-%d')<CR>", {
  desc = "Put the current date on the next line",
})

-- Enable formatting a selection
vim.keymap.set(
  "v",
  "<leader>cs",
  "<cmd>lua vim.lsp.buf.format()<CR><ESC>",
  { noremap = true, silent = true, desc = "Format selection only" }
)

vim.keymap.set("n", "<leader>cw", "<cmd>lcd %:h <CR>", { desc = "Set Files Location As local CWD" })
vim.keymap.set("n", "<leader>cW", "<cmd>cd %:h <CR>", { desc = "Set Files Location As global CWD" })

function SetAutoCmp(mode)
  local cmp = require("cmp")
  if mode then
    cmp.setup({
      completion = {
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
      },
    })
  else
    cmp.setup({
      completion = {
        autocomplete = false,
      },
    })
  end
end
SetAutoCmp(false)

-- enable automatic completion popup on typing
vim.cmd("command AutoCmpOn lua SetAutoCmp(true)")

-- disable automatic competion popup on typing
vim.cmd("command AutoCmpOff lua SetAutoCmp(false)")
