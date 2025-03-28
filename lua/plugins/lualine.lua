-- Lualine statusline configuration for Neovim
-- https://github.com/nvim-lualine/lualine.nvim
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Mode section with custom icon
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    -- Filename section with file status indicators (modified, readonly)
    local filename = {
      'filename',
      file_status = true,
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    -- Helper function to hide components when window width is too small
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    -- Diagnostics section (errors and warnings from LSP)
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    -- Git diff section showing added/modified/removed lines
    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    -- Final Lualine setup
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'nord',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = {
          diagnostics,
          diff,
          { 'encoding', cond = hide_in_width },
          { 'filetype', cond = hide_in_width },
        },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}

