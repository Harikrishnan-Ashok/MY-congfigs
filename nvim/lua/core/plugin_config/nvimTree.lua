require'nvim-tree'.setup({
  renderer = {
    icons = {
      show = {
        file = true,
        folder_arrow = true,
        git = false,
      },
    },
  },
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.o.columns
        local screen_h = vim.o.lines
        local pad_w = math.floor(screen_w * 0.2)
        local pad_h = math.floor(screen_h * 0.2)
        local win_w = screen_w - (pad_w * 2)
        local win_h = screen_h - (pad_h * 2)
        local col = pad_w
        local row = pad_h - 1  -- -1 because Neovim UI starts at row 0
        return {
          relative = "editor",
          border = "rounded",
          width = win_w,
          height = win_h,
          row = row,
          col = col,
        }
      end,
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- Custom mappings - no conflict
    local map = vim.keymap.set
    map('n', 't', api.node.open.tab, opts("Open in New Tab"))
    map('n', 'm', api.fs.rename_sub, opts("Move (Rename Path)"))
    map('n', 'r', api.fs.rename, opts("Rename"))
    map('n', 'd', api.fs.remove, opts("Delete"))
    
    -- Added vertical split mapping
    map('n', 'sv', api.node.open.vertical, opts("Open in Vertical Split"))
    
    -- Added horizontal split mapping
    map('n', 'sh', api.node.open.horizontal, opts("Open in Horizontal Split"))
  end,
})
-- Global toggle keymap
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
