local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print "Problem with lspconfig"
  return
end

require("sasha.lsp.lsp-installer")
require("sasha.lsp.handlers").setup()
