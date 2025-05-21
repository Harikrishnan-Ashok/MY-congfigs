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

-- Simple Tab behavior (fallback that should work regardless of completion plugin)
vim.cmd([[
  inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "  "
]])

-- Terminal shortcut
vim.keymap.set("n", "ter", ":term<CR>i", { noremap = true, silent = true })
