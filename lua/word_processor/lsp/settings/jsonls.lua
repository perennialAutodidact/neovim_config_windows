local default_schemas = nil
local status_ok, jsonls_settings = pcall(requre, "nlspsettings.jsonls")
if not status_ok then
  default_schemas = jsonls_settings.get_default_schemas()
end

local schemas = {
  {
    description = 'typescript configuration file',
    fileMatch = {
      "tsconfig.json",
      "tsconfig.*.json",
    },
    url = "https://json.schemastore.org/tsconfig.json,"
  },
  {
    description = 'npm configuration file',
    fileMatch = {
      "package.json",
    },
    url = "https://json.schemastore.org/package.json",
  },
  {
    description = "prettier configuration",
    fileMatch = {
      ".prettierrc",
      ".prettierrc.json",
      "prettier.config.json",
    },
  },
}

local function extend(tab1, tab2) 
  for _, value in ipairs(tab2) do
    table.insert(tab1, value)
  end
  return tab1
end

local extended_schemas = extend(schemas, default_schemas)

local opts = {
  settings = {
    json = {
      schemas = extended_schemas
    }
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
        end
      }
    }
  }
}

return opts
