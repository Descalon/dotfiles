return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "backdround/improved-ft.nvim",
    config = function()
      require("improved-ft").setup({
        use_default_mappings = true,
        ignore_char_case = true,
        use_relative_repetition = true,
      })
    end
  },
  {
    "nat-418/boole.nvim",
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
        additions = {
          --{'tic', 'tac', 'toe'}
        },
      })
    end
  },
}
