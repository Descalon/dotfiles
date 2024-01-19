if vim.g.vscode then return {} end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("nvim.config.telescope-config")
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
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
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
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require('nvim-web-devicons').setup()
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension "file_browser"
      vim.keymap.set("n", "<leader>pv", [[:Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>]],
        { silent = true })
    end
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
  },
  {
    "micangl/cmp-vimtex"
  },
  {
    "lervag/vimtex",
    config = function()
      -- PDF Viewer:
      -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
      vim.g['vimtex_view_method'] = 'zathura'
      vim.g['vimtex_quickfix_mode'] = 0

      -- Ignore mappings
      vim.g['vimtex_mappings_enabled'] = 0

      -- Auto Indent
      vim.g['vimtex_indent_enabled'] = 0


      -- Syntax highlighting
      vim.g['vimtex_syntax_enabled'] = 1

      -- Error suppression:
      -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

      vim.g['vimtex_log_ignore'] = ({
        'Underfull',
        'Overfull',
        'specifier changed to',
        'Token not allowed in a PDF string',
      })

      vim.g['vimtex_context_pdf_viewer'] = 'okular'

      -- vim.g['vimtex_complete_enabled'] = 1
      -- vim.g['vimtex_compiler_progname'] = 'nvr'
      -- vim.g['vimtex_complete_close_braces'] = 1

      require('cmp_vimtex').setup({
        additional_information = {
          info_in_menu = true,
          info_in_window = true,
          info_max_length = 60,
          match_against_info = true,
          symbols_in_menu = true,
        },
        bibtex_parser = {
          enabled = true,
        },
      })
    end
  }
}
