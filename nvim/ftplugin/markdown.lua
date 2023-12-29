require("nvim-surround").buffer_setup {
  surrounds = {
        ["~"] = {
            add = function()
                return { { "~~" }, { "~~" } }
            end,
        }
  }
}
