return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy", -- lazy-load safely
  opts = {},
  keys = {
    {
      "<leader>cc",
      function()
        require("CopilotChat").toggle()
      end,
      desc = "Copilot Chat: Toggle",
    },
  },
}
