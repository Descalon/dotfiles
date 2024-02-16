if vim.g.vscode then return {} end

return {
  {
    'sathishmanohar/quick-buffer-jump',
    config = function ()
      require('quick_buffer_jump').setup{
        ergonomic_alphabet = true
      }
      vim.keymap.set("n", "<leader>pu", [[:QuickBufferJump<CR>]], { silent = true })
    end

  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", "[[:vert Git<CR>]]", { silent = true })
      vim.keymap.set("n", "<leader>ga", function() vim.cmd.Git({ "adog" }) end)
    end
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          --    { name = 'orgmode' } Turned off after switching to neorg
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-space>'] = cmp.mapping.complete(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')

      dap.adapters.coreclr = {
        type = 'executable',
        command = 'c:/Users/nagla/lib/netcoredbg/netcoredbg.exe',
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/net8.0', 'file')
          end,
        },
      }

      vim.keymap.set("n", "<leader>db", [[:DapToggleBreakpoint <CR>]])
      vim.keymap.set("n", "<leader>dr", [[:DapContinue <CR>]])
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      require("dapui").setup()
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require('nvim-web-devicons').setup()
    end
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "<leader>pv", [[:Oil<CR>]], { silent = true })
    end
  },
  {
    "miversen33/sunglasses.nvim",
    config = {
      filter_type = "NOSYNTAX",
      filter_percent = .65
    }
  },
  {
    "theprimeagen/harpoon",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
    config = function()
      require('Comment').setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      -- Lua
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
      vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
      vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
      vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
      vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
      vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
    end
  },
  {
    "ojroques/nvim-hardline",
    config = function()
      require('hardline').setup {
        theme = 'catppuccin_minimal'
      }
    end
  }
}
