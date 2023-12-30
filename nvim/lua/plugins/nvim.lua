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
      vim.keymap.set("n", "<leader>gs", "[[:vert Git<CR>]]")
      vim.keymap.set("n", "<leader>ga", function() vim.cmd.Git({ "adog" }) end)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plugins.config.telescope-config")
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
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
    end,
  },
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          shell =
          "pwsh -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -File /home/descalon/.dotfiles/psprofile/profiles/terminalProfile.ps1",
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
  },
  {
    "Shatur/neovim-session-manager",
    config = function()
      local Path = require('plenary.path')
      local config = require('session_manager.config')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
        autoload_mode = config.AutoloadMode.CurrentDir,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_dirs = {},
        autosave_ignore_filetypes = {
          'gitcommit',
          'gitrebase',
        },
        autosave_ignore_buftypes = {},
        autosave_only_in_session = false,
        max_path_length = 80,
      })
      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        callback = function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_get_option_value("buftype", { buf = buf }) == 'nofile' then
              return
            end
          end
          require('session-manager').save_current_session()
        end
      })
    end
  },
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    ft = "org",
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })
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
