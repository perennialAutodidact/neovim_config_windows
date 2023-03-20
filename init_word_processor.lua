vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- do not source the default filetypes.vim
vim.g.did_load_filetypes = 1

local modules = {
  "options",
  "keymaps",
  "plugins",
  "telescope",
  "treesitter",
  "lsp",
  "lualine",
  -- "nvim-tree",
  -- "null-ls",
  "zen-mode",
  "tokyonight",
  "colorscheme",
  -- "pencil",
  -- "cmp",
}

for i in ipairs(modules) do
  local module = modules[i]
  require ("word_processor."..module)
end
