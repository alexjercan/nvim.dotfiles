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

function ColorMyPencils(color)
    if color == nil then
        -- TODO: Try to detect my terminal colorscheme and set the correct colorscheme
        ColorMyAustere()
    else
        vim.cmd.colorscheme(color)
    end
end

ColorMyPencils()
