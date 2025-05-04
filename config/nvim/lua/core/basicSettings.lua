vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab= true
vim.o.softtabstop = 4
vim.o.mouse = "a"
vim.opt.clipboard = {"unnamed","unnamedplus"}

-- Custom Tab behavior: 
-- If suggestions are visible, select the suggestion
-- Otherwise, move cursor 2 characters to the right
vim.keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn['coc#_select_confirm']()
    else
        -- Move cursor 2 characters to the right
        return "  "
    end
end, {
    expr = true,
    silent = true
})

--for terminal
vim.keymap.set("n", "ter", ":term<CR>i", { noremap = true, silent = true })
--for hiding the mode
vim.o.showmode = false
