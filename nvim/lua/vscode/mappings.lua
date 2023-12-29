local vscode = require("vscode-neovim")

-- visual mode mappings
--vim.keymap.set("v", "gB", function() vscode.call("editor.action.changeAll") end)
vim.keymap.set("v", "gI", function() vscode.call("editor.action.insertCursorAtEndOfEachLineSelected") end)

-- normal mode mappings
vim.keymap.set("n", "<TAB>", function() vscode.call("workbench.action.nextEditorInGroup") end)
vim.keymap.set("n", "<S-TAB>", function() vscode.call("workbench.action.previousEditorInGroup") end)
vim.keymap.set("n", "<leader>x", function() vscode.call("workbench.action.closeOtherEditors") end)
vim.keymap.set("n", "\\e", function() vscode.call("workbench.action.openSettingsJson") end)
vim.keymap.set("n", "\\n", function() vscode.call("workbench.action.files.newUntitledFile") end)
vim.keymap.set("n", "\\r", function() vscode.call("workbench.action.reloadWindow") end)
vim.keymap.set("n", "gh", function() vscode.call("workbench.action.navigateBack") end)
vim.keymap.set("n", "gl", function() vscode.call("workbench.action.navigateforward") end)
vim.keymap.set("n", "<leader>X", function() vscode.call("workbench.action.closeActiveEditor") end)
vim.keymap.set("n", "<leader>f", function() vscode.call("editor.action.formatDocument") end)
vim.keymap.set("n", "<leader><leader>tl", function() vscode.call("testing.reRunLastRun") end)
vim.keymap.set("n", "<leader><leader>tdl", function() vscode.call("testing.debugLastRun") end)
vim.keymap.set("n", "<leader><leader>tc", function() vscode.call("testing.runAtCursor") end)
vim.keymap.set("n", "<leader><leader>tC", function() vscode.call("testing.runCurrentFile") end)
vim.keymap.set("n", "<leader><leader>tdc", function() vscode.call("testing.debugAtCursor") end)
vim.keymap.set("n", "<leader>lr", function() vscode.call("editor.action.rename") end)
vim.keymap.set("n", "<leader>w", function() vscode.call("workbench.action.files.save") end)
vim.keymap.set("n", "gn", function() vscode.call("workbench.action.quickOpen") end)
vim.keymap.set("n", "<leader>pf", function() vscode.call("workbench.action.quickOpen") end)
vim.keymap.set("n", "K", function() vscode.call("editor.action.showDefinitionPreviewHover") end)


vim.keymap.set("n", "<leader>sbe", function() vscode.call("workbench.view.explorer") end)
vim.keymap.set("n", "<leader>sbx", function() vscode.call("workbench.view.extensions") end)