local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local cmd_ui = require('harpoon.cmd-ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>we', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>wt', cmd_ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>w1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>w2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>w3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>w4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>w5', function() ui.nav_file(4) end)

mark.on('changed', function ()
  require('lualine').refresh({
    scope = 'tabpage',
    place = { 'tabline' }
  })
end)
