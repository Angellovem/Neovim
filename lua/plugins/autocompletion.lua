return { -- Autocompletion
    'hrsh7th/nvim-cmp', -- Main completion plugin for Neovim
    dependencies = {
        -- Snippet engine and integration
        {
            'L3MON4D3/LuaSnip', -- Powerful snippet engine for Neovim
            build = (function()
                -- Required build step for advanced snippet regex support.
                -- Not supported on many Windows setups.
                -- You can remove this condition if you're not on Windows.
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                -- A huge collection of ready-to-use snippets for many languages and frameworks
                {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        -- Lazy-load snippets when needed
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
        },

        -- Bridges LuaSnip with nvim-cmp so snippets show up in completion menu
        'saadparwaiz1/cmp_luasnip',

        -- Extra completion sources:
        'hrsh7th/cmp-nvim-lsp', -- Suggestions from Language Server
        'hrsh7th/cmp-buffer',   -- From current open file (buffer)
        'hrsh7th/cmp-path',     -- File system paths
    },

    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        -- Basic LuaSnip setup
        luasnip.config.setup {}

        -- Icons to show in the completion menu for different kinds of items
        local kind_icons = {
            Text = '󰉿', Method = 'm', Function = '󰊕', Constructor = '',
            Field = '', Variable = '󰆧', Class = '󰌗', Interface = '',
            Module = '', Property = '', Unit = '', Value = '󰎠',
            Enum = '', Keyword = '󰌋', Snippet = '', Color = '󰏘',
            File = '󰈙', Reference = '', Folder = '󰉋', EnumMember = '',
            Constant = '󰇽', Struct = '', Event = '', Operator = '󰆕',
            TypeParameter = '󰊄',
        }

        cmp.setup {
            -- How snippets are expanded
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- Controls how the completion menu behaves
            completion = { completeopt = 'menu,menuone,noinsert' },

            -- Key mappings for using and navigating the completion menu
            mapping = cmp.mapping.preset.insert {
                -- Select the next/previous item
                ['<M-n>'] = cmp.mapping.select_next_item(), -- Alt+n
                ['<M-p>'] = cmp.mapping.select_prev_item(), -- Alt+p

                -- Scroll documentation window up/down
                ['<M-b>'] = cmp.mapping.scroll_docs(-4), -- Alt+b
                ['<M-f>'] = cmp.mapping.scroll_docs(4),  -- Alt+f

                -- Confirm the selected item (equivalent to saying "yes")
                ['<M-y>'] = cmp.mapping.confirm { select = true }, -- Alt+y

                -- Manually trigger completion menu
                ['<M-Space>'] = cmp.mapping.complete {}, -- Alt+Space

                -- Move inside snippet placeholders
                ['<M-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<M-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),

                -- Tab / Shift-Tab fallback logic:
                -- If completion is visible, move through it.
                -- If in a snippet, jump between placeholders.
                -- Otherwise, do normal tab behavior.
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },

            -- Completion sources
            sources = {
                {
                    name = 'lazydev',
                    group_index = 0, -- Recommended by lazydev to avoid conflicts with LuaLS
                },
                { name = 'nvim_lsp' }, -- Language Server
                { name = 'luasnip' },  -- Snippets
                { name = 'buffer' },   -- Current file
                { name = 'path' },     -- File paths
            },

            -- Customize how each completion item looks in the menu
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
                    vim_item.menu = ({
                        nvim_lsp = '[LSP]',
                        luasnip = '[Snippet]',
                        buffer = '[Buffer]',
                        path = '[Path]',
                    })[entry.source.name]
                    return vim_item
                end,
            },
        }
    end,
}
