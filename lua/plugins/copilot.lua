return {
  "github/copilot.vim",
  lazy = false,  -- force immediate loading (for now)
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', {
      expr = true,
      silent = true,
      noremap = true,
      script = true,
    })
  end,
}

