if vim.g.vscode then return {} end

return {
  {
    "micangl/cmp-vimtex",
  },
  {
    "lervag/vimtex",
    config = function()
      vim.g['vimtex_view_method'] = 'zathura'
      vim.g['vimtex_quickfix_mode'] = 0

      vim.g['vimtex_mappings_enabled'] = 0

      vim.g['vimtex_indent_enabled'] = 0


      vim.g['vimtex_syntax_enabled'] = 1


      vim.g['vimtex_log_ignore'] = ({
        'Underfull',
        'Overfull',
        'specifier changed to',
        'Token not allowed in a PDF string',
      })

      vim.g['vimtex_context_pdf_viewer'] = 'okular'

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
  },
  {
    "nvim-telescope/telescope-bibtex.nvim",
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require "telescope".load_extension("bibtex")
    end,
  },
}
