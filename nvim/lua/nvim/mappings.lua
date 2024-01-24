local A = vim.api
local cmd = A.nvim_command

local quitfn = function (c)
  local buftype = vim.bo.buftype
  if buftype ~= '' then
    cmd(c)
  else
    cmd('w' .. c)
  end
end

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", [[:w<CR>]], { silent = true })
vim.keymap.set("n", "<leader>W", [[:wa<CR>]], { silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true })
vim.keymap.set("n", "<leader>q", function() quitfn('q') end, { silent = true })
vim.keymap.set("n", "<leader>Q", function() quitfn('qa') end, { silent = true })

-- window management
local nav = require('nvim.navigation')
vim.keymap.set({ "n", "t" }, "<M-j>", function() nav.navigate("j") end)
vim.keymap.set({ "n", "t" }, "<M-h>", function() nav.navigate("h") end)
vim.keymap.set({ "n", "t" }, "<M-k>", function() nav.navigate("k") end)
vim.keymap.set({ "n", "t" }, "<M-l>", function() nav.navigate("l") end)

vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))

local focus = require('focus')
vim.keymap.set("n", "<c-o>", function() focus.split_nicely() end)
