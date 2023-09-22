function ColorMyPencils(color)
	color = color or "rose-pine"

    vim.opt.background = "dark"
    vim.opt.termguicolors = true
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#404040" })
end

ColorMyPencils()
