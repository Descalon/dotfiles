return {
  -- 'nvim-orgmode/orgmode',
  -- dependencies = {
  --   { 'nvim-treesitter/nvim-treesitter', lazy = true },
  -- },
  -- config = function()
  --   require('orgmode').setup_ts_grammar()
  --   require('orgmode').setup({
  --     org_agenda_files = '~/orgfiles/**/*',
  --     org_default_notes_file = '~/orgfiles/refile.org',
  --     org_todo_keywords = { 'TODO', 'ACTIVE', '|', 'DONE' },
  --   })
  -- end,
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
    { "pysan3/neorg-templates",    dependencies = { "L3MON4D3/LuaSnip" } },
    { "pritchett/neorg-capture" },
  },
  config = function()
    local n = require "neorg"
    n.setup {
      load = {
        ["external.templates"] = {
          config = {
            templates_dir = "c:/Users/nagla/.dotfiles/nvim/templates/norg/"
          }
        },
        ["external.capture"] = {
          config = {
            templates = {
              {
                description = "Todo",
                name = "refile",
                file = "~/notes/refile",
              },
              {
                description = "Thesis",
                name = "thesis_todo",
                file = "~/notes/thesis",
              },
            } } },
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
    vim.keymap.set("n", "<leader>oc", [[:Neorg capture<CR>]], { silent = true })
  end,
} -- neorg.lua
