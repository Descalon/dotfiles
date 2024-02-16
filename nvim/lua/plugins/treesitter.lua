return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
      require('nvim-treesitter.configs').setup {
      ensure_installed = { "lua", "vim", "yaml", "json", "c_sharp", "markdown",  "markdown_inline", "regex" }
    }
    end
  },
}
