vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = "100"

require("nvim-surround").buffer_setup {
  surrounds = {
        ["e"] = {
          add = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Enter the environment: ")
            if result then
                return { { "\\begin{".. result .. "}"}, { "\\end{".. result .."}" } }
            end
        end
        }
  }
}
