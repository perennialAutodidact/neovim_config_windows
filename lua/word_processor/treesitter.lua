local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- one of "all", "maintained" (parsers with maintainers) or a list of languages
  ensure_installed = "maintained",
  ensure_installed = "all",
  sync_install = false, -- install "ensure_installed" languages synchronously
  ignore_install = {""},
  auto_pairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" }, -- list of languages to disable
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = { enable = true, enable_autocmd = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil, -- disable for files with >= n lines
    colors = {}, -- table of hex strings
    termcolors = {}, -- table of hex strings
  },
  text_objects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@class.outer",
				["ic"] = "@class.inner",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
      }
    }
  }
})
