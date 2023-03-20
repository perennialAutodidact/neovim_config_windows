local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local modules = {
  -- "lsp-installer",
  "mason",
  "null-ls",
}

for i in ipairs(modules) do
  module = modules[i]
  require("word_processor.lsp." .. module)
end

-- require("word_processor.lsp.handlers").setup()
-- require("word_processor.lsp.null-ls")
