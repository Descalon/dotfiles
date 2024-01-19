-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", [[:w<CR>]], { silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true })
vim.keymap.set("n", "<leader>q", [[:wq<CR>]], { silent = true })
vim.keymap.set("n", "<leader>Q", [[:wqa<CR>]], { silent = true })

-- window management
local nav = require('nvim.navigation')
vim.keymap.set({"n", "t"}, "<M-j>", function() nav.navigate("j") end)
vim.keymap.set({"n", "t"}, "<M-h>", function() nav.navigate("h") end)
vim.keymap.set({"n", "t"}, "<M-k>", function() nav.navigate("k") end)
vim.keymap.set({"n", "t"}, "<M-l>", function() nav.navigate("l") end)

vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))


-- autocmd BufWinEnter,WinEnter term://* startinsert

