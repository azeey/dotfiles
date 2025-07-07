-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

vim.keymap.set('n','<leader>dt', "<cmd>:put =strftime('* %Y-%m-%d %H:%M')<CR>", {
  desc = "Put the current date and time on the next line"
})

-- Enable formatting a selection
vim.keymap.set("v", "<leader>cs", "<cmd>lua vim.lsp.buf.format()<CR><ESC>", { noremap = true, silent = true, desc = "Format selection only" })

vim.keymap.set('n', '<leader>cw', '<cmd>lcd %:h <CR>', { desc = 'Set Files Location As local CWD'})
vim.keymap.set('n', '<leader>cW', '<cmd>cd %:h <CR>', { desc = 'Set Files Location As global CWD'})
