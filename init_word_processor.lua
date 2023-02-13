vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local modules = {
  "options",
  "keymaps",
  "plugins",
  "telescope",
  "treesitter",
  "lualine",
  -- "nvim-tree",
  "null-ls",
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
