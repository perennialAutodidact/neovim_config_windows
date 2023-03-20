local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, ------------ shows a list of marks on ' and `'
    registers = true, -------- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -------- show which-key when pressing z= to show spelling suggestions
      suggestions = 20, ------ how many suggestions should be in the list
    },

    -------------------------- the presets plugin adds help for many default keybindings in NeoVim
    -------------------------- No actual keybinidngs are created
    presets = {
      operators = true, ------ adds help for operators like d, y, etc and registers them for motion/text completion
      motions = true, -------- adds help for motions
      text_objects = true, --- help for text objects triggered after entering an operator
      windows = true, -------- default bindings on <C-w>
      nav = true, ------------ misc bindings to work with windows
      z = true, -------------- bindings for folds, spelling and others prefixed with z
      g = true, -------------- bindings prefixed with g
    },
  },
  ---------------------------- add operators that will trigger motion and text object completion
  ---------------------------- to enable all native operators, set the preset / operations plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -------------------------- override the label used to display some keys. 
    -------------------------- doesn't affect WK in any other way
    -------------------------- For example:
    ---------------------------- ["space"] = "SPC"
    ---------------------------- ["<cr>"] = "RET"
    ---------------------------- ["tab"] = "TAB"
  },
  icons = {
    breadcrumb = "»", -------- symbol used in the command line area that shows your active key combo
		separator = "➜", --------- symbol used between a key and it's label
		group = "+", ------------- symbol prepended to a group
  },
  popup_mappings = {
    scroll_up = "<c-k>", ----- binding to scroll up inside the popup
    scroll_down = "<c-j>", --- binding to scroll down inside the popup
  },
  window = {
    border = "rounded", ------ none, single, double, shadow
    position = "bottom", ----- bottom, top
    margin = {1, 0, 1, 0}, --- extra window margin { top, right, bottom, left }
    padding = {2, 2, 2, 2}, -- extra window padding { top, right, buttom, left }
    winblend = 0,
  },
  layout = {
    -------------------------- min and max height of the columns
    height = {
      min = 4,
      max = 25
    }, 
    -------------------------- min and max width of the columns
    width = {
      min = 4,
      max = 25
    }, 
    spacing = 3 -------------- spacing between columns
    align = "left" ----------- align columns left, center, or right
  },
  -- ignore_missing = true, ----- enable this to hide mappings which you didn't specifically label
  hidden = {},
  show_help = true,
  triggers = "auto",
  triggers_backlist = {
    -------------------------- list of mode / prefixes that should never be hooked by Wk
    -------------------------- mostly relevant for keymaps that start with a native binding
    -------------------------- this probably won't need to be changed
    i = { "j", "k"},
    v = { "j", "k"},
  },
}

local opts = {
  mode = "n", ---------------- normal mode
  prefix = "<leader>",
  buffer = nil, -------------- global mappings. Specify a buffer number for local mappings
  silent = true, ------------- use 'silent' when creating keymaps
  noremap = true, ------------ use 'noremap' when creating keymaps
  nowait = true, ------------- use 'nowait' when creating keymaps
}

local mappings = {
  ---------------------------- add mappings here
  ---------------------------- examples:
  ------------------------------ ["binding"] = { "command", "label" }
  ------------------------------ ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }
  ------------------------------ ["w"] = { "w!", "Save" }
}

which_key.setup(setup)
which_key.register(mappings, opts)
