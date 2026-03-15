-- Set leader key to space
vim.g.mapleader = " "

-- Basic options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.mouse = "a"
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.o.showmode = false

-- Terminal shortcut
vim.keymap.set("n", "ter", ":term<CR>i", { noremap = true, silent = true })

-- Map 'cls' in normal mode to clear search highlight
vim.keymap.set("n", "cls", ":noh<CR>", { noremap = true, silent = true })

-- for tab jumbing
vim.keymap.set("n", "t1", "<Cmd>tabn 1<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "t2", "<Cmd>tabn 2<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "t3", "<Cmd>tabn 3<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "t4", "<Cmd>tabn 4<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "t5", "<Cmd>tabn 5<CR>", { noremap = true, silent = false })
