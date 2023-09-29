-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('romgrk/nvim-treesitter-context')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('kylechui/nvim-surround')
  use('folke/zen-mode.nvim')
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- color schemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({ 'morhetz/gruvbox', as = 'gruvbox' })
  use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
  use({ 'w0ng/vim-hybrid', as = 'hybrid' })
  use({ 'i3d/vim-jimbothemes' })
  use('chrisbra/Colorizer')

  use('github/copilot.vim')

  -- use('/home/alex/Documents/codehint')
  use('alexjercan/codehint')

  use('epwalsh/obsidian.nvim')

  use({ "luckasRanarison/tree-sitter-hypr" })
end)

