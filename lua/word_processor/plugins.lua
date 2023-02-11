local fn = vim.fn

--Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo_url = "https://github.com/wbthomason/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    packer_repo_url,
    install_path
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so first use doesn't error out
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({border = "rounded"})
    end,
  },
})

-- Install plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -------- Have packer manager itself
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  -- comments
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }

  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require ("nvim-autopairs").setup {} end,
  }
  
  -- telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1", 
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  use("nvim-telescope/telescope-media-files.nvim")
  use("nvim-telescope/telescope-symbols.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("rudism/telescope-dict.nvim")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- zen mode
  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup()
    end
  })

  -- word processing
  use("preservim/vim-pencil")
  
  -- nvim-tree file explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" }, 
    tag = "nightly",
    config = function() 
      require("nvim-tree").setup()
    end,
  })

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  })
  use("p00f/nvim-ts-rainbow")

  -- color schemes
  use("folke/tokyonight.nvim")

  -- LSP
  use("neovim/nvim-lspconfig") -- enable lsp
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }) 

  -- cmp
  use("hrsh7th/nvim-cmp") ---------- the completion plugin
  use("hrsh7th/cmp-buffer") -------- buffer completions
  use("hrsh7th/cmp-path") ---------- path completions
  use("hrsh7th/cmp-cmdline") ------- command line completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-calc")
  use("hrsh7th/cmp-emoji")
  use("hrsh7th/cmp-nvim-lua")
  use("f3fora/cmp-spell")
  use("uga-rosa/cmp-dictionary")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
