return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", }, cmd = "Neogit",
  keys = {
    { "<leader>g", function() require("neogit").open({ kind = "tab" }) end, desc = "Open Neogit (tab)" },
    { "<leader>gd", ":DiffviewOpen<CR>", desc = "Open Diffview" },
    { "<leader>gD", ":DiffviewClose<CR>", desc = "Close Diffview" },
    { "<leader>gc", ":Neogit kind=split<CR>", desc = "View conflicts in Neogit" },
  },
  config = function()
    require("neogit").setup({
      integrations = {
        diffview = true,
      },
      disable_commit_confirmation = false,
      signs = {
        section = { "▸", "▾" },
        item = { "▸", "▾" },
        hunk = { "", "" },
      },
      mappings = {
        status = {
          ["q"] = "Close",
          ["<tab>"] = "Toggle",
          ["x"] = "Discard",
          ["s"] = "Stage",
          ["u"] = "Unstage",
        },
      },
    })

    local hl = vim.api.nvim_set_hl
    hl(0, "NeogitUntrackedfiles", { fg = "#f6c177" })
    hl(0, "NeogitUnstagedchanges", { fg = "#eb6f92" })
    hl(0, "NeogitStagedchanges", { fg = "#9ccfd8" })
    hl(0, "NeogitBranch", { fg = "#c4a7e7", bold = true })
    hl(0, "NeogitRemote", { fg = "#9ccfd8", italic = true })
    hl(0, "NeogitRecentCommit", { fg = "#31748f", bold = true })
  end,
}
