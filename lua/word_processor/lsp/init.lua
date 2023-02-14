local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local modules = {
  "lsp-installer",
}

for i in ipairs(modules) do
  module = modules[i]
  require("kg.word_processor.lsp." .. module)
end

require("kg.word_processor.lsp.handlers").setup()
-- require("kg.word_processor.lsp.null-ls")
