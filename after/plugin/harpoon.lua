local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local cmd_ui = require('harpoon.cmd-ui')

-- Open the first and second windows in a split on startup
local function open_files_in_split()
    -- Open the second file
    ui.nav_file(2)

    -- Create a vertical split
    vim.cmd('vsplit')

    -- Open the first file in the left side of split
    ui.nav_file(1)

    vim.cmd('stopinsert')
end


vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>we', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>wt', cmd_ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>w1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>w2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>w3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>w4', function() ui.nav_file(4) end)

vim.keymap.set('n', '<leader>os', open_files_in_split)

mark.on('changed', function()
  for i = 1, mark.get_length() do
    print('mark ' .. i .. ' is ' .. mark.get_marked_file_name(i))
  end
end)

return {
  open_files_in_split = open_files_in_split
}
