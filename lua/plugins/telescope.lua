-- Telescope configuration for Neovim
-- Telescope is a fuzzy finder that helps you quickly find files, buffers, help, symbols, and more.
-- https://github.com/nvim-telescope/telescope.nvim

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter', -- Load Telescope when Neovim starts
    branch = '0.1.x',
    dependencies = {
        -- Required dependency for Telescope to work
        'nvim-lua/plenary.nvim',

        -- Optional: Native performance boost for Telescope using FZF (requires 'make')
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },

        -- Optional: Allows Telescope to replace built-in Neovim UI selectors
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Optional: Adds file icons (requires a Nerd Font to display properly)
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },

    config = function()
        -- Import Telescope
        local telescope = require('telescope')

        -- Setup Telescope
        telescope.setup {
            defaults = {
                -- Key mappings in insert mode (when the Telescope window is open)
                mappings = {
                    i = {
                        ['<C-k>'] = require('telescope.actions').move_selection_previous, -- Move up the list
                        ['<C-j>'] = require('telescope.actions').move_selection_next,     -- Move down the list
                        ['<C-l>'] = require('telescope.actions').select_default,          -- Open the selected item
                    },
                },
            },

            -- Configuration for specific Telescope pickers
            pickers = {
                find_files = {
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' }, -- Skip heavy or unneeded folders
                    hidden = true, -- Include hidden files (like .env, .gitignore, etc.)
                },
            },

            -- Settings for live_grep (search text across files)
            live_grep = {
                file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                additional_args = function(_)
                    return { '--hidden' } -- Include hidden files in search
                end,
            },

            -- Configuration for extensions
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(), -- Use a simple dropdown menu for UI select
                },
            },
        }

        -- Load Telescope extensions if installed
        pcall(telescope.load_extension, 'fzf')        -- Enable native FZF if available
        pcall(telescope.load_extension, 'ui-select')  -- Enable UI-select if available

        -- Telescope built-in pickers
        local builtin = require('telescope.builtin')

        -- Keymaps to quickly access Telescope features
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep,  { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers,    { desc = '[S]earch [B]uffers' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags,  { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps,    { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin,    { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string,{ desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics,{ desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume,     { desc = '[S]earch [R]esume previous search' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles,   { desc = '[S]earch Recent Files ("." for repeat)' })

        -- Search within the current buffer using fuzzy match (dropdown style)
        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                previewer = false,
                layout_config = {
                    width = 0.8,
                    height = 0.6,
                },
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- Live grep only in open buffers
        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })
    end,
}

