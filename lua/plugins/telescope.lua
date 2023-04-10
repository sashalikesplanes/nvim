return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = '[P]roject [B]uffers' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git Files' })
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[P]roject [S]earch' })
    vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[P]roject [D]iagnostics' })
    vim.keymap.set('n', '<leader>cd', function ()
      builtin.diagnostics({ bufnr=0 })
    end, { desc = '[C]urrent [D]iagnostics' })
    vim.keymap.set('n', '<leader>ff', function ()
      local parent_dir = vim.fn.expand('%:p:h')
      print(parent_dir)
      builtin.find_files({
        prompt_title = 'Find files in Parent Directory',
        cwd = parent_dir,
      })
    end, { desc = '[F]ind Nearby [F]ile' })
  end
}
