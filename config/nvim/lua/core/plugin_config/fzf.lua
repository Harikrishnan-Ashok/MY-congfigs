-- FZF configuration
-- Make sure FZF uses ripgrep if available for better performance
if vim.fn.executable('rg') == 1 then
  vim.g.rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '
  vim.o.grepprg = "rg --vimgrep --no-heading"
  vim.o.grepformat = "%f:%l:%c:%m"
end

-- Set up preview window
vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }

-- Set <space>ff to search for files with preview
vim.api.nvim_set_keymap('n', '<space>ff', ':Files<CR>', { noremap = true, silent = true })

-- Set <space>fg to search for content in files with preview
vim.api.nvim_set_keymap('n', '<space>fg', ':Rg<CR>', { noremap = true, silent = true })

-- Set <space>fb to search open buffers
vim.api.nvim_set_keymap('n', '<space>fb', ':Buffers<CR>', { noremap = true, silent = true })

-- Custom FZF colors to match your color scheme
vim.g.fzf_colors = {
  ['fg'] = {'fg', 'Normal'},
  ['bg'] = {'bg', 'Normal'},
  ['hl'] = {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  ['info'] = {'fg', 'PreProc'},
  ['border'] = {'fg', 'Ignore'},
  ['prompt'] = {'fg', 'Conditional'},
  ['pointer'] = {'fg', 'Exception'},
  ['marker'] = {'fg', 'Keyword'},
  ['spinner'] = {'fg', 'Label'},
  ['header'] = {'fg', 'Comment'}
}
