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

      -- Some languages (like Ruby) still rely on Vim’s built-in regex-based highlighting
      -- This option tells Treesitter to use Vim regex in addition for better results
      additional_vim_regex_highlighting = { 'ruby' },
    },

    -- Indentation support (Treesitter-based)
    indent = {
      enable = true,

      -- Ruby doesn’t work well with Treesitter-based indentation, so we disable it
      disable = { 'ruby' },
    },
  },

  -- NOTE:
  -- You can extend this setup with other plugins built on top of Treesitter for more features:
  -- - Incremental selection: lets you expand and shrink selection by syntax node
  --   See: `:help nvim-treesitter-incremental-selection-mod`
  --
  -- - Treesitter Context: shows the current function/class context at the top
  --   https://github.com/nvim-treesitter/nvim-treesitter-context
  --
  -- - Textobjects for advanced navigation and selection
  --   https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}

