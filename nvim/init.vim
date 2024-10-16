set number
set relativenumber
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a

" Plugin Management
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/preservim/nerdtree'                " NerdTree
Plug 'https://github.com/tpope/vim-commentary'              " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'           " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim'              " PSQL Plugin needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color'                  " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes'     " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons'            " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors'      " CTRL + N for multiple cursors
Plug 'https://github.com/xiyaowong/transparent.nvim'        " transparency
Plug 'nvim-lua/plenary.nvim'                                " telescope requirement
Plug 'nvim-telescope/telescope.nvim'                        " telescope
Plug 'https://github.com/neoclide/coc.nvim'                 " Auto Completion
call plug#end()

" Remaps
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm(): "\<Tab>"
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" NerdTree Settings
let g:neotrem_default_mod="vertical"
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Appearance
colorscheme ayu
autocmd VimEnter * ++nested TransparentEnable

" Clipboard
set clipboard+=unnamedplus

" Custom Directory Management
let s:custom_dirs_file = expand('~/.config/nvim/custom_dirs.txt')

function! LoadCustomDirs()
    if filereadable(s:custom_dirs_file)
        return readfile(s:custom_dirs_file)
    endif
    return []
endfunction

function! SaveCustomDirs(dirs)
    call writefile(a:dirs, s:custom_dirs_file)
endfunction

function! AddCustomDir()
    let dir = input('Enter directory path: ')
    if isdirectory(dir)
        let custom_dirs = LoadCustomDirs()
        call add(custom_dirs, dir)
        call SaveCustomDirs(custom_dirs)
        echo "Directory added. Restart Neovim to see changes."
    else
        echo "Invalid directory path."
    endif
endfunction

function! RemoveCustomDir()
    let custom_dirs = LoadCustomDirs()
    if len(custom_dirs) == 0
        echo "No custom directories to remove."
        return
    endif
    let index = inputlist(['Select a directory to remove:'] + map(copy(custom_dirs), {i, v -> i+1.'. '.v}))
    if index > 0 && index <= len(custom_dirs)
        call remove(custom_dirs, index-1)
        call SaveCustomDirs(custom_dirs)
        echo "Directory removed. Restart Neovim to see changes."
    endif
endfunction

" Directory Navigation Dashboard
function! StartupDashboard()
    " Clear the buffer
    silent! %delete _
    
    " Add a header
    let l:lines = [
        \ '   Welcome to Neovim!   ',
        \ '',
        \ '   [1] Projects Directory   ',
        \ '   [2] Config Directory     ',
        \ '   [3] Home Directory       ',
        \ ''
        \ ]
    
    " Add custom directories
    let custom_dirs = LoadCustomDirs()
    let l:count = 4
    for dir in custom_dirs
        call add(l:lines, '   [' . l:count . '] ' . dir)
        let l:count += 1
    endfor
    
    call extend(l:lines, [
        \ '',
        \ '   [f] Find Files           ',
        \ '   [r] Recent Files         ',
        \ '   [e] Edit Config          ',
        \ '   [s] Add Custom Directory ',
        \ '   [d] Remove Custom Directory',
        \ '',
        \ '   Press the key to select an option'
        \ ])
    
    call append(0, l:lines)
    
    " Make the buffer non-modifiable
    setlocal nomodifiable nomodified
    
    " Set up key mappings for the dashboard
    nnoremap <buffer> 1 :cd ~/PotsFolder/Projects \| NERDTree<CR>
    nnoremap <buffer> 2 :cd ~/.config \| NERDTree<CR>
    nnoremap <buffer> 3 :cd ~ \| NERDTree<CR>
    
    " Set up mappings for custom directories
    let l:count = 4
    for dir in custom_dirs
        execute 'nnoremap <buffer> ' . l:count . ' :cd ' . dir . ' \| NERDTree<CR>'
        let l:count += 1
    endfor
    
    nnoremap <buffer> f :Telescope find_files<CR>
    nnoremap <buffer> r :Telescope oldfiles<CR>
    nnoremap <buffer> e :edit $MYVIMRC<CR>
    nnoremap <buffer> s :call AddCustomDir()<CR>
    nnoremap <buffer> d :call RemoveCustomDir()<CR>
    
    " Move cursor to the top
    normal! gg
endfunction

" Autocommand to show the dashboard on startup
autocmd VimEnter * if argc() == 0 | call StartupDashboard() | endif
