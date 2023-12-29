return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    cond = not vim.g.vscode,
  },
  {
    "mbbill/undotree",
    cond = not vim.g.vscode,
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
  {
    "tpope/vim-fugitive",
    cond = not vim.g.vscode,
    config = function()
      vim.keymap.set("n", "<leader>gs", "[[:vert Git<CR>]]")
      vim.keymap.set("n", "<leader>ga", function() vim.cmd.Git({ "adog" }) end)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not vim.g.vscode,
    config = function()
      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
      vim.keymap.set('n', '<leader>pb', telescope.buffers, {})
      vim.keymap.set('n', '<leader>pg', telescope.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        telescope.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end
  },
  {
    "nvim-lua/plenary.nvim",
    cond = not vim.g.vscode
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    cond = not vim.g.vscode
  },
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode
  },
  {
    "williamboman/mason.nvim",
    cond = not vim.g.vscode
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cond = not vim.g.vscode
  },
  {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    cond = not vim.g.vscode
  },
  {
    "L3MON4D3/LuaSnip",
    cond = not vim.g.vscode
  },
  {
    "theprimeagen/harpoon",
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
    cond = not vim.g.vscode
  },
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          shell =
          "pwsh -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -File c:/users/nagla/.dotfiles/psprofile/profiles/terminalProfile.ps1",
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
        vim.cmd[[file pwsh]]
      end)
      vim.keymap.set("n", "<leader>h", function()
        require("nvterm.terminal").new "horizontal"
        vim.cmd[[file pwsh]]
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
  }
}
