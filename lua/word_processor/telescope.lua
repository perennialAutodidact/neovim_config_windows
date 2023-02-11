local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require("telescope.actions")
-- telescope.load_extensions("media_files")
-- telescope.load_extensions("file_browser")
-- telescope.load_extensions("zoxide")
-- telescope.load_extensions("repo")
-- telescope.load_extensions("zk")
-- telescope.load_extensions("notify")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

    mappings = {},
    pickers = {},
    extensions = {},
  }
})
