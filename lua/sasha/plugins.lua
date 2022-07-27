-- Stuff to make packer play nice!!!!! IDK how this works
local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Something went wrong with packer"
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- Install your plugins here
return packer.startup(function(use)
  -- Basics
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "kyazdani42/nvim-web-devicons" -- Nice icons

  -- Colorscheme
  use "folke/tokyonight.nvim"

  -- cmp and extensions
  use "hrsh7th/nvim-cmp" -- base completion engine
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions (for searching with /)
  use "saadparwaiz1/cmp_luasnip" -- snippet completion
  use "hrsh7th/cmp-nvim-lsp" -- lsp completion
  use "hrsh7th/cmp-nvim-lua" -- lua specific autocomplete

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets

  -- LSP
  use "neovim/nvim-lspconfig" -- lsp engine
  use "williamboman/nvim-lsp-installer" -- easy language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- coloured bracket pairs

  use "windwp/nvim-autopairs" -- autocloses brackets

  -- Nice commenting out
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring" -- recognize what is a comment

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Nvim-Tree
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline
  use "akinsho/bufferline.nvim" -- bufferline itself
  use "moll/vim-bbye" -- nice buffer closing

  -- Lualine (statusline)
  use "nvim-lualine/lualine.nvim"

  -- Toggleterm
  use "akinsho/toggleterm.nvim"

  -- Project manager
  use "ahmedkhalf/project.nvim"

  -- Fast loading of shit
  use "lewis6991/impatient.nvim"

  -- Indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
