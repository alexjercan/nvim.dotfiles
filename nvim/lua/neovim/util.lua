local M = {}

M.has = function(name)
    local ok, _ = pcall(require, name)
    return ok
end

return M
