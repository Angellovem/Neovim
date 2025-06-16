-- Treesitter configuration for advanced syntax highlighting and code understanding
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',

    -- Automatically run :TSUpdate after installation to get the latest parsers
    build = ':TSUpdate',

    -- Tells lazy.nvim to use the 'configs' module for setting up Treesitter
    main = 'nvim-treesitter.configs',

    -- Treesitter setup options
    opts = {
        -- List of languages to install parsers for
        ensure_installed = {
            'lua',
            'python',
            'javascript',
            'typescript',
            'vimdoc',
            'vim',
            'regex',
            'sql',
            'dockerfile',
            'json',
            'java',
            'groovy',
            'go',
            'gitignore',
            'bash',
            'tsx',
            'css',
            'html',
        },

        -- Automatically install missing language parsers when opening a file
        auto_install = true,

        -- Syntax highlighting powered by Treesitter
        highlight = {
            enable = true, -- Enables highlighting
            additional_vim_regex_highlighting = { 'ruby' },
        },

        -- Indentation support (Treesitter-based)
        indent = {
            enable = true,
            disable = { 'ruby' },
        },

        -- Treesitter textobjects config
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to matching textobj
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- Add movements to jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
    },

    -- You must also ensure this plugin is loaded:
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
}
