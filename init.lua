-- ===================================================================================================================
--                                                                                                                     
--                                            ,,                                                ,,                    
--      db                                  `7MM      `7MN.   `7MF'                             db                    
--     ;MM:                                   MM        MMN.    M                                                     
--    ,V^MM.    `7MMpMMMb.  .P"Ybm   .gP"Ya   MM        M YMb   M  .gP"Ya   ,pW"Wq.`7M'   `MF'`7MM  `7MMpMMMb.pMMMb.  
--   ,M  `MM      MM    MM :MI  I8  ,M'   Yb  MM        M  `MN. M ,M'   Yb 6W'   `Wb VA   ,V    MM    MM    MM    MM  
--   AbmmmqMA     MM    MM  WmmmP"  8M""""""  MM        M   `MM.M 8M"""""" 8M     M8  VA ,V     MM    MM    MM    MM  
--  A'     VML    MM    MM 8M       YM.    ,  MM        M     YMM YM.    , YA.   ,A9   VVV      MM    MM    MM    MM  
--.AMA.   .AMMA..JMML  JMML.YMMMMMb  `Mbmmd'.JMML.    .JML.    YM  `Mbmmd'  `Ybmd9'     W     .JMML..JMML  JMML  JMML.
--                         6'     dP                                                                                  
--                         Ybmmmd'
-- ===================================================================================================================
--
-- This is the main file for lazy requirements i do not recommend to change anything that has been already made here but feel free
-- to add any new features that you feel confortable here

-- Links to the main options and keymaps
require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypa }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Main setup for the plugins, this is where you might want to start adding your plugins
require('lazy').setup({
    require 'plugins.colortheme',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    require 'plugins.gitsigns',
    require 'plugins.indent-blankline',
    require 'plugins.misc',
    require 'plugins.flash',
})
