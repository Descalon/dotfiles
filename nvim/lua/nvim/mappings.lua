vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", [[:w<CR>]])
vim.keymap.set("x", "<leader>p", [["_dP]])

-- window management
vim.keymap.set("n", "<M-J>", "<C-w>j")
vim.keymap.set("n", "<M-H>", "<C-w>h")
vim.keymap.set("n", "<M-K>", "<C-w>k")
vim.keymap.set("n", "<M-L>", "<C-w>l")

vim.keymap.set("t", "<C-J>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-H>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-K>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-L>", "<C-\\><C-n><C-w>l")

vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
