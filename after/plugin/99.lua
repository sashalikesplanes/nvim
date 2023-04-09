-- Startup functions
function startup()
  -- Toggle the terminal to make sure it exists
  vim.cmd('FloatermToggle')
  vim.cmd('FloatermToggle')
  vim.cmd('stopinsert')

  local ui = require('harpoon.ui')
  ui.nav_file(2)

  -- Create a vertical split
  vim.cmd('vsplit')

  -- Open the first file in the left side of split
  ui.nav_file(1)

  vim.cmd('stopinsert')
end

vim.cmd [[ autocmd VimEnter * lua vim.defer_fn(startup, 0) ]]
