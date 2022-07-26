local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print "Treesitter configs had a problem loading"
  return
end

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- list of parsers to ignore
  highlight = {
    enable = true, -- false will disable everything
    disable = { "" }, -- list of languages for which to disable
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
