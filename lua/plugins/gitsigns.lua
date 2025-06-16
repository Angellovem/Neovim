-- Adds Git-related signs to the gutter (sign column) and provides Git utilities inside Neovim
return {
    'lewis6991/gitsigns.nvim',

    opts = {
        signs = {
            add          = { text = '+' }, -- Line added
            change       = { text = '~' }, -- Line changed
            delete       = { text = '-' }, -- Line deleted
            topdelete    = { text = '-' }, -- Top line of a block of deleted lines
            changedelete = { text = '~' }, -- Changed then deleted
        },

        -- These are the signs shown for **staged** changes (e.g. after `git add`)
        signs_staged = {
            add          = { text = '+' },
            change       = { text = '~' },
            delete       = { text = '-' },
            topdelete    = { text = '-' },
            changedelete = { text = '~' },
        },
    },
}

