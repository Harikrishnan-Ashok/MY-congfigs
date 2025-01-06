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
Plug 'https://github.com/vim-airline/vim-airline'           " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes'     " Color schemes
Plug 'https://github.com/ryanoasis/vim-devicons'            " Icons
Plug 'https://github.com/xiyaowong/transparent.nvim'        " Transparency
Plug 'nvim-lua/plenary.nvim'                                " Required by telescope
Plug 'nvim-telescope/telescope.nvim'                        " Fuzzy finder
Plug 'https://github.com/neoclide/coc.nvim'                 " Auto completion

" New plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
Plug 'windwp/nvim-autopairs'                                " Auto close brackets
Plug 'folke/which-key.nvim'                                 " Show key bindings
Plug 'phaazon/hop.nvim'                                     " Quick navigation
Plug 'numToStr/Comment.nvim'                                " Better commenting
call plug#end()

" Basic Keymaps
let mapleader = " "  " Set leader key to space

" Trigger autocomplete with Tab if suggestions are available, otherwise insert tab
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm(): "\<Tab>"

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Hop
nnoremap <leader>hw :HopWord<CR>
nnoremap <leader>hl :HopLine<CR>

" Buffer navigation
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

" Appearance
colorscheme ayu
autocmd VimEnter * ++nested TransparentEnable

" Lua Configuration
lua << EOF
-- Treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = {"lua", "vim", "javascript", "python","go","c"},
    highlight = { enable = true },
})

-- Autopairs
require('nvim-autopairs').setup()

-- Which Key
require('which-key').setup()

-- Hop
require('hop').setup()

-- Comment
require('Comment').setup()
EOF
