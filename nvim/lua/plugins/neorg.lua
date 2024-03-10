return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
  },
  config = function()
    vim.g.maplocalleader = ","
    local n = require "neorg"
    n.setup {
      load = {
        ["core.defaults"] = {},               -- Loads default behaviour
        ["core.integrations.telescope"] = {}, -- Loads default behaviour
        ["core.summary"] = {},
        ["core.concealer"] = {},              -- Adds pretty icons to your documents
        ["core.dirman"] = {                   -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            index = "index.norg",
            default_workspace = "notes"
          },
        },
      },
    }
    vim.keymap.set("n", "<leader>oi", [[:Neorg index<CR>]], { silent = true })
  end,
}
