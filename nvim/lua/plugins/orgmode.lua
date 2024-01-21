return {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
  },
  config = function()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
      org_agenda_files = '/mnt/c/Users/nagla/orgfiles/**/*',
      org_default_notes_file = '/mnt/c/Users/nagla/orgfiles/refile.org',
      org_todo_keywords = { 'TODO', 'ACTIVE', '|', 'DONE' },
      org_capture_templates = {
        m = {
          description = "Master thesis todo",
          template = "* TODO %?",
          target = "/mnt/c/Users/nagla/orgfiles/thesis.org"
        },
        M = {
          description = "Master thesis notes",
          template = "* %?",
          target = "/mnt/c/Users/nagla/orgfiles/thesis.org"
        }
      }
    })
  end,

}
