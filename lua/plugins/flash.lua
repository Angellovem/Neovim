return {
  {
    "folke/flash.nvim", -- Flash.nvim is a motion plugin for fast navigation and search

    event = "VeryLazy", -- Load the plugin only when needed (delayed/lazy loading)

    ---@type Flash.Config
    opts = {}, -- Default settings are used here. You can pass custom configuration if needed.

    -- Key mappings for different features provided by Flash
    keys = {
      {
        "s",
        mode = { "n", "x", "o" }, -- Normal, Visual, and Operator-pending modes
        function() require("flash").jump() end,
        desc = "Flash", -- Basic jump to visible text
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter", -- Jump to syntax-aware locations (functions, variables, etc.)
      },
      {
        "r",
        mode = "o", -- Operator-pending mode only (e.g. after pressing 'd', 'y', etc.)
        function() require("flash").remote() end,
        desc = "Remote Flash", -- Jump remotely with operators
      },
      {
        "R",
        mode = { "o", "x" }, -- Operator-pending and Visual modes
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search", -- Search using syntax tree elements
      },
      {
        "<c-s>",
        mode = { "c" }, -- Command-line mode
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search", -- Toggle Flash while typing in the command line
      },
    },
  }
}

