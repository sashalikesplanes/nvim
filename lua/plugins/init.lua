-- All the plugins which do not deserve their own file
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set('n', '<leader>u', function()
        vim.cmd.UndotreeToggle()
      end, { desc = 'Toggle [U]ndo [T]ree' })
    end
  },
  "nvim-tree/nvim-web-devicons",
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require('gitsigns').setup({
        -- See `:help gitsigns.txt`
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', '<leader>gS', function()
        vim.cmd.Git()
      end, { desc = '[G]it [S]tatus' })
    end
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  { 'tpope/vim-commentary' },
  { 'j-hui/fidget.nvim', config = function () require('fidget').setup({}) end },
  { 'echasnovski/mini.nvim', version = '*' },
}
