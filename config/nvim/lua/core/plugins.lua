local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Use plugins here
  use 'nvim-lualine/lualine.nvim'                  -- Statusline
  use 'xiyaowong/transparent.nvim'                 -- Transparency
  use 'windwp/nvim-autopairs'                      -- Auto-close brackets
  use 'folke/which-key.nvim'                       -- Show key bindings
  use 'nvim-tree/nvim-web-devicons'                -- Dev Icons	
  use { 'junegunn/fzf', run = ': { -> fzf#install() }' }
  use { 'junegunn/fzf.vim' } 
	use 'nvim-tree/nvim-tree.lua'                    -- File Explorer


  -- CoC (Conqueror of Completion) - Uncomment if you want to use CoC instead
   use {
     'neoclide/coc.nvim',
	 branch = 'release'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

