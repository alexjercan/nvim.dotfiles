local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- misc
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'romgrk/nvim-treesitter-context',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'kylechui/nvim-surround',
    'folke/zen-mode.nvim',
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    'github/copilot.vim',
    'alexjercan/codehint',
    'epwalsh/obsidian.nvim',
    "luckasRanarison/tree-sitter-hypr",
    'andweeb/presence.nvim',
    "folke/neodev.nvim",
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- lsp
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    -- color schemes
    { 'rose-pine/neovim', name = 'rose-pine' },
    { 'morhetz/gruvbox', name = 'gruvbox' },
    { 'folke/tokyonight.nvim', name = 'tokyonight' },
    { 'w0ng/vim-hybrid', name = 'hybrid' },
    'i3d/vim-jimbothemes' ,
    'chrisbra/Colorizer',
})
