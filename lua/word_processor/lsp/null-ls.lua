local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- use :Nulllsinfo to find what sources are being used for formatting, diagnostics, etc
local actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion


null_ls.setup({
  debug = true,
  sources = {
    -- diagnostics
    null_ls.diagnostics.misspell,
    null_ls.diagnostics.vale,

    -- formatting
    
    -- hover
    
    -- completion
    null_ls.completion.spell,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]])
    end
  end
})
