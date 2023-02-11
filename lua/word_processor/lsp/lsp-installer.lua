local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lsp_root = "kg.word_processor.lsp"
lsp_installer.on_server_ready(function(server) 
  local opts = {
    on_attach = require(lsp_root .. "handlers").on_attach,
    capabilities = require(lsp_root .. "handlers").capabilities,
  }

  if server.name == "jsonls" then
    local server_opts = require(lsp_root .. "jsonls")
  elseif server.name == "sumneko_lua" then
    local server_opts = require(lsp_root .. "sumneko_lua")
  end

  installer_opts = vim.tbl_deep_extend("force", server_opts, opts)

  server:setup(opts)
end)
