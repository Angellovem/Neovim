return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    require('nvim-tree').setup({
      view = {
        width = 40,
        relativenumber = false,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        custom = {},
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      actions = {
        open_file = {
          quit_on_open = true, 
        },
      },
    })
  end
}

