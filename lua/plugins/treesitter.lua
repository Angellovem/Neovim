-- Treesitter configuration for advanced syntax highlighting and code understanding
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',

    -- Automatically run :TSUpdate after installation to get the latest parsers
    build = ':TSUpdate',

    -- Load on VeryLazy to avoid early initialization issues
    event = { 'BufReadPre', 'BufNewFile' },

    -- Dependencies must be loaded first
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },

    config = function()
        require('nvim-treesitter.configs').setup({
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
                enable = true,
                -- Disable vim regex highlighting to prevent conflicts
                additional_vim_regex_highlighting = false,
                -- Disable highlighting for large files to prevent performance issues
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                    -- Also disable for files with too many lines
                    local line_count = vim.api.nvim_buf_line_count(buf)
                    if line_count > 1000 then
                        return true
                    end
                end,
            },

            -- Indentation support (Treesitter-based)
            indent = {
                enable = true,
                disable = { 'ruby' },
            },

            -- Treesitter textobjects config (simplified)
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                    -- Prevent selection in invalid windows
                    selection_modes = {
                        ['@parameter.outer'] = 'v',
                        ['@function.outer'] = 'V',
                        ['@class.outer'] = '<c-v>',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
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
        })

        -- Folding configuration
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false -- Start with folds open
    end,
}
