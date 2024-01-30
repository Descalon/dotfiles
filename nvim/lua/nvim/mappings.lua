local A = vim.api
local cmd = A.nvim_command

local quitfn = function()
  local bufname = vim.fn.expand("%")
  if vim.bo.buftype == 'acwrite' then
    cmd('wq')
  elseif vim.bo.buftype ~= '' then
    cmd('q')
  elseif
      string.find(bufname, "Temp\\nvim.0")
      or string.find(bufname, ".+%git-rebase-todo$")
      or string.find(bufname, ".+%.git.COMMIT_EDITMSG$")
  then
    cmd('wq')
  elseif vim.bo.filetype == 'norg' then
    cmd('wa')
    cmd('Neorg return')
  else
    cmd('wa')
    cmd('qa') -- workaroud for `wqa`, which fails when a terminal window is open. (probably fails if any buftype~='' is open)
  end
end

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>W", [[:w<CR>]], { silent = true })
vim.keymap.set("n", "<leader>w", [[:wa<CR>]], { silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true })
-- vim.keymap.set("n", "<leader>Q", function() quitfn('q') end, { silent = true })
vim.keymap.set("n", "<leader>q", function() quitfn() end, { silent = true })

-- window management
local nav = require('nvim.navigation')
vim.keymap.set({ "n", "t" }, "<M-j>", function() nav.navigate("j") end)
vim.keymap.set({ "n", "t" }, "<M-h>", function() nav.navigate("h") end)
vim.keymap.set({ "n", "t" }, "<M-k>", function() nav.navigate("k") end)
vim.keymap.set({ "n", "t" }, "<M-l>", function() nav.navigate("l") end)

vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))

vim.keymap.set("i", "kj", "<Esc>", { silent = true }) -- trial
