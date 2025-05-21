return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    -- Disable netrw (recommended by nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Keymap: <leader>f to toggle the file explorer
    vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    -- Setup nvim-tree
    require('nvim-tree').setup({
      view = {
        width = 30,
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end
}
