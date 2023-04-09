vim.g.floaterm_wintype = 'split'
vim.g.floaterm_height = 0.8
vim.g.floaterm_position = 'botright'
vim.g.floaterm_autoclose = 0

vim.keymap.set('n', '<leader>t', function()
  vim.cmd('FloatermToggle')
  vim.cmd('stopinsert')
end)
