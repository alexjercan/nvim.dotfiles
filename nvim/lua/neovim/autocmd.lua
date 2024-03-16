local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})
local trim_ws_group = augroup('trim_ws', {})
local file_type_group = augroup('file_type', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = trim_ws_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({"BufRead", "BufNewFile"}, {
    group = file_type_group,
    pattern = "*.cl",
    command = [[set filetype=cool]],
})
