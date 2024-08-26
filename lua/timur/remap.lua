vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<C-S-c>y", '"+yy', { noremap = true, silent = true })
vim.keymap.set("x", "<C-S-c>", '"+yy', { noremap = true, silent = true })
