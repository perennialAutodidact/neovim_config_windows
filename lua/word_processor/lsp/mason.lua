local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
  return
end

local mason_config_ok, mason_config = pcall(require, "mason-lspconfig")

if not mason_configok then
  return
end

print(mason)
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    }
  }
})

mason_config.setup({
  ensure_installed = { "sumneko_lua" }
})
