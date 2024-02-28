local function createPane(orientation)
    local cwd = "-d " .. vim.fn.getcwd()
    os.execute('wt -w "0" split-pane -s .4 ' .. cwd .. " " .. orientation)
end

vim.keymap.set({ "n" }, "<leader>h", function() createPane("--horizontal") end)
vim.keymap.set({ "n" }, "<leader>v", function() createPane("--vertical") end)
