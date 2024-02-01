function ColorMyAustere()
    vim.cmd.colorscheme("austere")

    vim.api.nvim_set_hl(0, "Constant", { fg = "#ce5252" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#252525" })
end

function ColorMyBreakingBad()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
	vim.cmd.colorscheme("breakingbad")

	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#404040" })
end

function ColorMyGruvbox()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("gruvbox")

    vim.cmd("hi Normal guibg=None")
end

return {
    { "rose-pine/neovim", name = "rose-pine" },
    { "morhetz/gruvbox", name = "gruvbox", config = ColorMyGruvbox },
    { "folke/tokyonight.nvim", name = "tokyonight" },
    { "w0ng/vim-hybrid", name = "hybrid" },
    "i3d/vim-jimbothemes" ,
    "chrisbra/Colorizer",
    "lurst/austere.vim",
}
