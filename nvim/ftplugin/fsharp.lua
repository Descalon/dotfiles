vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

require("nvim-surround").buffer_setup {
  surrounds = {
        ["m"] = {
          add = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Enter the Monad instance to wrap: ")
            if result then
                return { { result .. "(" }, { ")" } }
            end
        end
        }
  }
}
