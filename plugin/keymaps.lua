-- Note
-- Cmd key is not supperted in nvim so we have to map Cmd+[key] to M+[key] in iterm
-- And then use M (Meta) for Cmd command

local set = vim.keymap.set

-- General
set("i", "jk", "<Esc>", { noremap = true, silent = true })
set("i", "Jk", "<Esc>", { noremap = true, silent = true })
set("i", "JK", "<Esc>", { noremap = true, silent = true })

-- Movement
set("n", "<C-j>", "10j", { noremap = true, silent = true })
set("v", "<C-j>", "10j", { noremap = true, silent = true })
set("n", "<C-k>", "10k", { noremap = true, silent = true })
set("v", "<C-k>", "10k", { noremap = true, silent = true })

set("c", "<M-j>", "<C-n>", { noremap = true, silent = true })
set("n", "<M-j>", "<C-n>", { noremap = true, silent = true })
set("c", "<M-k>", "<C-p>", { noremap = true, silent = true })
set("n", "<M-k>", "<C-p>", { noremap = true, silent = true })

-- Clipboard
set("n", "d", '"_d', { noremap = true, silent = true })
set("v", "d", '"_d', { noremap = true, silent = true })
set("n", "dd", '"_dd', { noremap = true, silent = true })
set("n", "x", '"_x', { noremap = true, silent = true })

-- Moving selected code block
set("v", ">", ">gv", { noremap = true, silent = true })
set("v", "<", "<gv", { noremap = true, silent = true })

-- Window split
set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true })
set("n", "<leader>wb", ":split<CR>", { noremap = true, silent = true })

set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true })
set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true })
set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true })
set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true })

set("n", "<C-=>", ":vertical resize +5<CR>", { noremap = true, silent = true })
set("n", "<C-_>", ":vertical resize -5<CR>", { noremap = true, silent = true })

-- Back/Forward
vim.keymap.set("n", "<M-o>", "<C-o>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-i>", "<C-i>", { noremap = true, silent = true })
vim.keymap.set("i", "<M-o>", "<C-o>", { noremap = true, silent = true })
vim.keymap.set("i", "<M-i>", "<C-i>", { noremap = true, silent = true })

-- Disable
set("n", "s", "<Nop>", { noremap = true, silent = true })

-- Debug
-- print("loaded keymaps.lua")
