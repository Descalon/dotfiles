return {
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          shell =
          "pwsh -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -File ~/.dotfiles/psprofile/profiles/terminalProfile.ps1",
          list = {},
          type_opts = {
            float = {
              relative = 'editor',
              row = 0.3,
              col = 0.25,
              width = 0.5,
              height = 0.4,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = .3, },
            vertical = { location = "rightbelow", split_ratio = .34 },
          }
        },
        behavior = {
          autoclose_on_quit = {
            enabled = true,
            confirm = false,
          },
          close_on_exit = true,
          auto_insert = true,
        },
      })
      vim.keymap.set("n", "<leader>v", function()
        require("nvterm.terminal").new "vertical"
        vim.cmd [[file pwsh]]
      end)
      vim.keymap.set("n", "<leader>h", function()
        require("nvterm.terminal").new "horizontal"
        vim.cmd [[file pwsh]]
      end)
    end,
  }
}
