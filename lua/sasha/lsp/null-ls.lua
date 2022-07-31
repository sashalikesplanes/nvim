local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with { filetypes = {
      "javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown", "graphql", "md", "txt",
    },
      extra_args = { "--single-quote", "--jsx-single-quote", "--print-width 100" } },
    formatting.black.with { extra_args = { "--fast" } },
    diagnostics.eslist,
    -- formatting.yapf,
    formatting.stylua,
    diagnostics.flake8,
  },
}
