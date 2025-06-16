return {
    'lukas-reineke/indent-blankline.nvim', -- Plugin to show indentation guides in your code

    main = 'ibl', -- Specifies the entry point/module to load (since the plugin supports multiple)

    opts = {
        indent = {
            char = '▏', -- Character used to draw the indentation line (you can change this to '|', '│', etc.)
        },

        scope = {
            show_start = false,         -- Do not show a line at the start of the current scope
            show_end = false,           -- Do not show a line at the end of the current scope
            show_exact_scope = false,   -- Do not highlight the exact scope range
        },

        exclude = {
            filetypes = {
                'help',          -- Exclude help files
                'startify',      -- Exclude startify startup screen
                'dashboard',     -- Exclude custom dashboards
                'packer',        -- Exclude plugin manager views
                'neogitstatus',  -- Exclude git status view
                'NvimTree',      -- Exclude file explorer
                'Trouble',       -- Exclude diagnostics view
            },
        },
    },
}

