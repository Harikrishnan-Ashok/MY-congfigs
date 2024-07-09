:set number
:set relativenumber
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/preservim/nerdtree'								" NerdTree
Plug 'https://github.com/tpope/vim-commentary'								" For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'							" Status bar
Plug 'https://github.com/lifepillar/pgsql.vim'								" PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color'									" CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes'						" Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'									" Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons'							" Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors'						" CTRL + N for multiple cursors
Plug 'https://github.com/xiyaowong/transparent.nvim'						" transparency
Plug 'nvim-lua/plenary.nvim'												" telescope requirment
Plug 'nvim-telescope/telescope.nvim'										" telescope
Plug 'glepnir/dashboard-nvim'												" dashboard

call plug#end()

" #### REMAPS ####

"NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>

"AutoComplition
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm(): "\<Tab>"

"telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

"##################

"change icons in nerd tree
let g:neotrem_default_mod="vertical"
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

colorscheme afterglow
