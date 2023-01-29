function get_file_name()
  local file = vim.fn.expand('%')
  return string.match(file, "^.+(%..+)$")
end

local indent = 2
local isTextFile = get_file_name() == ".txt"

local options = {
	clipboard = "unnamedplus", -- allows neovim access to system clipboard
	cmdheight = 2, -------------- more space in the neovim command line for messages
	conceallevel = 0, ----------- makes `` invisible in markdown files
	cursorline = true, ---------- highlight the current line
	expandtab = true, ----------- convert tabs to spaces
	fileencoding = "utf-8", ----- encoded character set
	hlsearch = true, ------------ highlight all matches on previous search pattern
	ignorecase = true, ---------- ignore case in search patterns
  number = true, -------------- set numbered lines
	mouse = "a", ---------------- allow the mouse to be used
	pumheight = 10, ------------- pop up menu height
	relativenumber = true, ------ set relative numbered lines
	scrolloff = 8, -------------- min number of lines above or below cursor
	shiftwidth = indent, -------- number of spaces to insert for tab
	showtabline = indent, ------- always show tabs
	sidescrolloff = 8, ---------- min number of columns left or right of cucursor
  signcolumn = "yes", --------- always shown the sign column
	smartcase = true, ----------- override ignorecase if pattern contains uppercase letters ( if ignorecase is true)
	smartindent = true, --------- smart autoindenting when starting a new line
	softtabstop = indent, ------- number of spaces to insert for tab
	spell = isTextFile,---------- enable spellcheck
	spelllang = { "en_us" }, ---- spellcheck languages
	tabstop = indent, ----------- number of spaces to insert for tab
	timeoutlen = 500, ----------- time to wait for mapped sequence to compplete (ms)
  ttimeout = false, ----------- disable timeoutlen
	undofile = true, ------------ create undo file to persist undo history
	wrap = true, ---------------- display lines as one long line
}

-- apply options from table
for k, v in pairs(options) do
	vim.opt[k] = v
end
