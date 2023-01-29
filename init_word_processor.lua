vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local modules = {
  "options",
  "keymaps",
  "plugins",
  "telescope",
  "lualine",
  "nvim-tree",
  "zen-mode",
  "tokyonight",
  "colorscheme",
}

for i in ipairs(modules) do
  local module = modules[i]
  require ("word_processor."..module)
end
