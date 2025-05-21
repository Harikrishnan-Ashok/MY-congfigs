-- CoC Configuration
vim.g.coc_global_extensions = {
  'coc-tsserver',       -- JavaScript/TypeScript support
  'coc-html',           -- HTML support
  'coc-css',            -- CSS support
  'coc-json',           -- JSON support
  'coc-go',             -- Go support
  'coc-sh',             -- Shell script support
  'coc-prettier',       -- Code formatting
  'coc-eslint',         -- JavaScript linting
}

-- Tab for completion confirmation
vim.cmd([[
  inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#confirm() :
    \ "  "
]])

-- Use K to show documentation in preview window
vim.api.nvim_set_keymap('n', 'K', ':call CocAction("doHover")<CR>', {silent = true, noremap = true})

-- GoTo code navigation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})
