return {
    'akinsho/bufferline.nvim', -- Plugin for a better-looking and feature-rich buffer/tab bar

    dependencies = {
        'moll/vim-bbye', -- Allows buffer deletion without closing the window
        'nvim-tree/nvim-web-devicons', -- Adds icons (file types, etc.) to the bufferline
    },

    config = function()
        require('bufferline').setup {
            options = {
                -- Show individual buffers (files) instead of tabpages
                mode = 'buffers',

                -- Allows themes or highlight overrides to work easily
                themable = true,

                -- Controls numbering style in the bufferline (none, ordinal, buffer_id, or a custom function)
                numbers = 'none',

                -- Command used to close buffers from the bufferline
                -- %d is replaced by the buffer number
                close_command = 'Bdelete! %d',

                -- Icon shown on the buffer for closing it
                buffer_close_icon = '✗',
                -- Icon shown on the far right to close the bufferline itself (if supported)
                close_icon = '✗',

                -- How much of the file path to show; 1 means just the file name
                path_components = 1,

                -- Icon shown when a buffer has unsaved changes
                modified_icon = '●',

                -- Truncation markers when there are too many buffers to display
                left_trunc_marker = '',
                right_trunc_marker = '',

                -- Limit the visible name length of each buffer
                max_name_length = 30,
                max_prefix_length = 30, -- prefix used when buffer names are duplicated

                -- Width of each buffer "tab"
                tab_size = 21,

                -- Whether or not to show diagnostics (like LSP errors) in the bufferline
                diagnostics = false,
                diagnostics_update_in_insert = false, -- Don't update diagnostics while typing

                -- Show filetype icons with colors
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,

                -- Save your custom buffer sort order between sessions
                persist_buffer_sort = true,

                -- Style of separators between buffers
                -- Other options: "slant", "thick", "thin", or any custom pair of characters
                separator_style = { '│', '│' },

                -- Forces bufferline to look more like regular tabs (spacing, layout)
                enforce_regular_tabs = true,

                -- Always show the bufferline even if only one buffer is open
                always_show_bufferline = true,

                -- Disable tiny indicators on tabs like "▎"
                show_tab_indicators = false,

                -- Custom indicator settings
                indicator = {
                    -- icon = '▎', -- You can enable this if `style` is set to 'icon'
                    style = 'none', -- Options: 'icon', 'underline', 'none'
                },

                -- Icon shown on a "pinned" buffer (buffers that shouldn't get closed easily)
                icon_pinned = '󰐃',

                -- Control spacing between buffer tabs
                minimum_padding = 1,
                maximum_padding = 5,

                -- Truncate tab names longer than this
                maximum_length = 15,

                -- Sort buffers in the order they were opened
                sort_by = 'insert_at_end',
            },

            -- Highlight settings: customize colors, bold, italic, etc.
            highlights = {
                separator = {
                    fg = '#434C5E', -- Set separator color (Nord dark gray)
                },
                buffer_selected = {
                    bold = true,
                    italic = false,
                },
                -- Other highlight groups can be added if needed:
                -- background = {},
                -- fill = {},
                -- indicator_selected = {},
                -- separator_selected = {},
                -- tab_selected = {},
            },
        }
    end,
}

