return {
    "github/copilot.vim",
    lazy = false, -- load immediately
    config = function()
        -- Don't map <Tab> by default
        vim.g.copilot_no_tab_map = true

        -- Map <C-l> to accept Copilot suggestion
        vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {
            expr = true,
            silent = true,
            noremap = true,
            script = true,
        })
    end,
}

