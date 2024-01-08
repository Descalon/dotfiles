local A = vim.api
local cmd = A.nvim_command

---@class Nav
---@field last_pane boolean
local N = {
  last_pane = false,
}

A.nvim_create_autocmd('WinEnter', {
  group = A.nvim_create_augroup('NAVIGATOR', { clear = true }),
  callback = function()
    N.last_pane = false
  end,
})

A.nvim_create_autocmd('FocusGained', {
  group = A.nvim_create_augroup('NAVIGATOR', { clear = true }),
  callback = function()
    if(N.last_pane == true) then
      N.last_pane = false
    end
  end,
})

local keymap = {
  h = 'left',
  j = 'down',
  k = 'up',
  l = 'right'
}

---Checks whether we need to move to the nearby mux pane
---@param at_edge boolean
---@return boolean
local function back_to_mux(at_edge)
  return N.last_pane or at_edge
end

---For smoothly navigating through neovim splits and mux panes
---@param direction string
function N.navigate(direction)
  -- window id before navigation
  local cur_win = A.nvim_get_current_win()
  if not N.last_pane then
    cmd('wincmd ' .. direction)
  end

  local next_win = A.nvim_get_current_win()
  local at_edge = cur_win == next_win

  if back_to_mux(at_edge) then
    os.execute('wt -w "0" move-focus ' .. keymap[direction])
    N.last_pane = true
  else
    N.last_pane = false
  end
end

return N
