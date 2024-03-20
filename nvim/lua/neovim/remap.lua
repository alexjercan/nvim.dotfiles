vim.g.mapleader = " "
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex, { desc = "File Navigator" })

-- cool move line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- don't ask
vim.keymap.set("n", "Y", "yg$")

-- better moves
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- never press Q
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list" })

-- for fast repalce
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- do this on the bash script you download from the internet
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- for when you have to share the screen and they ask you
-- "what does the code from the line 10 mean?"
vim.keymap.set("n", "<leader>mnu", ":set rnu!<CR>", { desc = "Toggle relative numbers" })

-- don't be a pussy, just use hjkl
vim.keymap.set("i", "<Up>", "<C-o>:echom \"--> k <-- \"<CR>")
vim.keymap.set("i", "<Down>", "<C-o>:echom \"--> j <-- \"<CR>")
vim.keymap.set("i", "<Right>", "<C-o>:echom \"--> l <-- \"<CR>")
vim.keymap.set("i", "<Left>", "<C-o>:echom \"--> h <-- \"<CR>")
vim.keymap.set("n", "<Up>", ":echom \"--> k <-- \"<CR>")
vim.keymap.set("n", "<Down>", ":echom \"--> j <-- \"<CR>")
vim.keymap.set("n", "<Right>", ":echom \"--> l <-- \"<CR>")
vim.keymap.set("n", "<Left>", ":echom \"--> h <-- \"<CR>")
