local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  -- A lot of plugins relly on these next two plugins
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used in lots of plugins

  -- for pretty icons
  use "ryanoasis/vim-devicons"
  use "kyazdani42/nvim-web-devicons"

  -- for navigation
  use "kyazdani42/nvim-tree.lua" -- side nativationg tree - <leader>e
  use "nvim-telescope/telescope.nvim" -- Telescope - <leader>f


  -- generic plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "moll/vim-bbye" -- for keeping nvim open when closing last buffer

  -- terminal access
  use "akinsho/toggleterm.nvim"

  -- highlight 1st searchable letter
  use "unblevable/quick-scope"

  -- cover page when initializing nvim
  use "goolord/alpha-nvim"

  use "nvim-lualine/lualine.nvim" -- status line

  use "ahmedkhalf/project.nvim" -- project management
  use "lewis6991/impatient.nvim" -- spead up loading
  use "lukas-reineke/indent-blankline.nvim" -- adds nice visual indentation
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim" -- popup window with keymaps

  use "lambdalisue/nerdfont.vim"      -- for handling nerd fonts

  use "tpope/vim-characterize"  -- for revealing character representation with: ga
  use "tpope/vim-surround" -- change surround thing like parenthesis
  use "tpope/vim-fugitive" -- git

  -- Colorschemes
  use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"          -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-buffer"        -- buffer completions
  use "hrsh7th/cmp-path"          -- path completions
  use "hrsh7th/cmp-cmdline"       -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"  -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"           -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"    -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "RRethy/vim-illuminate"           -- for highlighting keywords

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- gives context of the file for commenting
  use "p00f/nvim-ts-rainbow"  -- for colouring brackets

  -- for commenting text (depend on treesitter)
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
