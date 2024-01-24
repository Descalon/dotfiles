return {
  {
    'nvim-focus/focus.nvim',
    version = "*",
    config = function()
      local focus = require('focus')
      focus.setup()
      vim.keymap.set("n", "<c-o>", function() focus.split_nicely() end) -- Deprecated?
      vim.keymap.set("n", "<leader>ow", function() focus.split_nicely() end)
      -- vim.keymap.set("n", "<leader>ot", function() focus.terminal_split_nicely() end) need to figure out how to get here
    end
  },
}
