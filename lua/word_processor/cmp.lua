local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return 
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return 
end

cmp.setup.cmdline(":", {
  source = cmp.config.sources(
    {
      { name = "path" },
    },
    {
      { name = "cmdline" }
    }
  )
})

cmp.setup.cmdline("/", {
  sources = { name = "buffer" }
})

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspaces = function ()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

require("cmp_dictionary").setup()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- for luasnip users
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }

  },
  mapping = {},
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- kind icons 
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  sorting = {},
  confirm_opts = {},
  experimental = {},
})
