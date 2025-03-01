" Basic Settings
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard+=unnamedplus

" Plugin Management
call plug#begin('~/.config/nvim/plugged')
" Existing plugins
Plug 'https://github.com/preservim/nerdtree'                " File explorer
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/xiyaowong/transparent.nvim'        " Transparency
Plug 'windwp/nvim-autopairs'                                " Auto close brackets
Plug 'folke/which-key.nvim'                                 " Show key bindings
" Add Treesitter and HTML autotag
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting
Plug 'windwp/nvim-ts-autotag'                              " Auto close HTML tags
" LSP plugins
Plug 'neovim/nvim-lspconfig'                               " LSP configuration
Plug 'hrsh7th/nvim-cmp'                                    " Completion engine
Plug 'hrsh7th/cmp-nvim-lsp'                                " LSP completion source
Plug 'hrsh7th/cmp-buffer'                                  " Buffer completion source
Plug 'williamboman/mason.nvim'                             " LSP installer
Plug 'williamboman/mason-lspconfig.nvim'                   " Mason LSP config
Plug 'nvim-lua/plenary.nvim'                               " Dependency for telescope
Plug 'nvim-telescope/telescope.nvim'                       " Fuzzy finder
call plug#end()

" Fix for HTML closing tags display issue (without font switching)
" This uses syntax highlighting instead of font switching
au FileType html,xml,jsx,tsx,vue,svelte syntax match HtmlEndTag "</.*>" contains=HtmlEndClose
au FileType html,xml,jsx,tsx,vue,svelte syntax match HtmlEndClose "</\@=" contained
au FileType html,xml,jsx,tsx,vue,svelte hi HtmlEndClose ctermfg=red guifg=red

" Enable transparency (Vimscript way)
autocmd VimEnter * TransparentEnable

" Basic Keymaps
" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

lua << EOF
-- Setup for lualine
require('lualine').setup {
  options = { theme = 'ayu' }, 
  sections = {
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'filetype', 'encoding', 'location'},
  },
}

-- Setup for nvim-autopairs
require('nvim-autopairs').setup{
  disable_filetype = { "TelescopePrompt" },
  check_ts = true,
  ts_config = {
    lua = {'string'},
    javascript = {'template_string'},
    java = false,
  }
}

-- Setup for which-key
require('which-key').setup{}

-- Setup Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "html", "css", "javascript", "typescript", "lua" },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}

-- Setup nvim-ts-autotag for HTML tags
require('nvim-ts-autotag').setup{}

-- Setup Mason for easy LSP installation
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'cssls', 'html', 'emmet_ls' }
})

-- Simple completion setup
local cmp = require 'cmp'
cmp.setup {
  mapping = cmp.mapping.preset.insert({
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      if cmp.get_selected_entry() then
        cmp.confirm({ select = false })
      else
        cmp.select_next_item()
      end
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
}),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
}

-- Set up lspconfig with minimal settings
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript
require('lspconfig').ts_ls.setup({
  capabilities = capabilities
})

-- CSS
require('lspconfig').cssls.setup({
  capabilities = capabilities
})

-- HTML
require('lspconfig').html.setup({
  capabilities = capabilities
})

-- Emmet for HTML completion
require('lspconfig').emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
})
EOF
