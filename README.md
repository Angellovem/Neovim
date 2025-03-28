Welcome to my Neovim setup! This isn't meant to be the fastest, most minimal, or "best" config out there—but it's mine. Everything here is crafted (and tinkered with) to fit my workflow, my preferences, and my vibes.

| File                   | What's it do?                                                               |
| ---------------------- | --------------------------------------------------------------------------- |
| `autocompletion.lua`   | Sets up autocompletion using `nvim-cmp` and related sources.                |
| `bufferline.lua`       | Configures `bufferline.nvim` for tab-like buffer navigation.                |
| `colortheme.lua`       | Applies and configures the current colorscheme (`rose-pine`, for now).      |
| `flash.lua`            | Adds motion enhancements via the `flash.nvim` plugin for faster navigation. |
| `gitsigns.lua`         | Integrates `gitsigns.nvim` to show Git changes in the sign column.          |
| `indent-blankline.lua` | Displays indentation guides and context using `indent-blankline.nvim`.      |
| `lsp.lua`              | Sets up the Language Server Protocol with `mason.nvim` and `lspconfig`.     |
| `lualine.lua`          | Configures `lualine.nvim` as the statusline.                                |
| `misc.lua`             | Miscellaneous settings and small utilities that don’t fit elsewhere.        |
| `telescope.lua`        | Sets up `telescope.nvim` with keybindings and extensions.                   |
| `treesitter.lua`       | Configures `nvim-treesitter` for better syntax highlighting and parsing.    |
## Design goals

- **Modular**: Each major plugin or feature lives in its own file.
- **Maintainable**: Easy to update or remove components independently.
- **No frameworks**: Everything is configured manually using `lazy.nvim`.
- **Minimal global state**: Tries to keep config isolated and organized.
## Notes

I’m using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. All plugin declarations are elsewhere — this directory only handles the actual configuration.

This config works well for general-purpose programming (e.g., Lua, TypeScript, Python, Go), but is easy to extend for other languages.

## KeyMaps

### General
| Keymap       | Mode(s) | Description               |
| ------------ | ------- | ------------------------- |
| `<M-q>`      | `n`     | Quit file                 |
| `<M-d>`      | `n`     | Scroll down and center    |
| `<M-u>`      | `n`     | Scroll up and center      |
| `n`          | `n`     | Find next and center      |
| `N`          | `n`     | Find previous and center  |
| `<leader>lw` | `n`     | Toggle line wrapping      |
| `<leader>f`  | `n`     | Open file manager (`:Ex`) |
### Window & Buffer Management
| Keymap       | Mode(s) | Description                   |
| ------------ | ------- | ----------------------------- |
| `<Up>`       | `n`     | Decrease window height        |
| `<Down>`     | `n`     | Increase window height        |
| `<Left>`     | `n`     | Decrease window width         |
| `<Right>`    | `n`     | Increase window width         |
| `<Tab>`      | `n`     | Go to next buffer             |
| `<S-Tab>`    | `n`     | Go to previous buffer         |
| `<leader>x`  | `n`     | Close current buffer          |
| `<leader>b>` | `n`     | Open new buffer               |
| `<leader>v>` | `n`     | Split window vertically       |
| `<leader>h>` | `n`     | Split window horizontally     |
| `<leader>se` | `n`     | Make split windows equal size |
| `<leader>xs` | `n`     | Close current split           |
| `<M-k>`      | `n`     | Move to upper split           |
| `<M-j>`      | `n`     | Move to lower split           |
| `<M-h>`      | `n`     | Move to left split            |
| `<M-l>`      | `n`     | Move to right split           |
### Tab Management
| Keymap       | Mode(s) | Description        |
| ------------ | ------- | ------------------ |
| `<leader>to` | `n`     | Open new tab       |
| `<leader>tx` | `n`     | Close current tab  |
| `<leader>tn` | `n`     | Go to next tab     |
| `<leader>tp` | `n`     | Go to previous tab |
### Visual Mode Enhancements
| Keymap | Mode(s) | Description                          |
| ------ | ------- | ------------------------------------ |
| `<`    | `v`     | Indent left and stay in visual mode  |
| `>`    | `v`     | Indent right and stay in visual mode |
| `p`    | `v`     | Paste without overwriting register   |
### Diagnostics
| Keymap      | Mode(s) | Description               |
| ----------- | ------- | ------------------------- |
| `[d`        | `n`     | Go to previous diagnostic |
| `]d`        | `n`     | Go to next diagnostic     |
| `<leader>d` | `n`     | Show floating diagnostic  |
| `<leader>q` | `n`     | Open diagnostics list     |
### LSP
| Keymap       | Mode(s)   | Description                       |
|--------------|-----------|-----------------------------------|
| `gd`         | `n`       | Go to definition                  |
| `gr`         | `n`       | Go to references                  |
| `gI`         | `n`       | Go to implementation              |
| `gD`         | `n`       | Go to declaration                 |
| `<leader>D`  | `n`       | Type definition                   |
| `<leader>ds` | `n`       | Document symbols                  |
| `<leader>ws` | `n`       | Workspace symbols                 |
| `<leader>rn` | `n`       | Rename                            |
| `<leader>ca` | `n`, `x`  | Code action                       |

### Telescope
| Keymap         | Mode(s) | Description                            |
|----------------|---------|----------------------------------------|
| `<leader>sf`   | `n`     | [S]earch [F]iles                        |
| `<leader>sg`   | `n`     | [S]earch by [G]rep                      |
| `<leader>sb`   | `n`     | [S]earch [B]uffers                      |
| `<leader>sh`   | `n`     | [S]earch [H]elp                         |
| `<leader>sk`   | `n`     | [S]earch [K]eymaps                      |
| `<leader>ss`   | `n`     | [S]elect Telescope builtin pickers     |
| `<leader>sw`   | `n`     | [S]earch current [W]ord                 |
| `<leader>sd`   | `n`     | [S]earch [D]iagnostics                  |
| `<leader>sr`   | `n`     | [S]earch [R]esume last search          |
| `<leader>s.`   | `n`     | [S]earch Recent Files (`oldfiles`)     |
| `<leader>/`    | `n`     | Fuzzily search in current buffer       |
| `<leader>s/`   | `n`     | Live grep in open buffers              |
### Completion (`nvim-cmp`)
| Keymap       | Mode(s)   | Description                                     |
|--------------|-----------|-------------------------------------------------|
| `<M-n>`      | `i`       | Select next completion item                     |
| `<M-p>`      | `i`       | Select previous completion item                 |
| `<M-b>`      | `i`       | Scroll docs up                                  |
| `<M-f>`      | `i`       | Scroll docs down                                |
| `<M-y>`      | `i`       | Confirm selected completion                     |
| `<M-Space>`  | `i`       | Trigger completion manually                     |
| `<Tab>`      | `i`, `s`  | Next completion/snippet/fallback                |
| `<S-Tab>`    | `i`, `s`  | Previous completion/snippet/fallback            
### Snippets (`luasnip`)
| Keymap  | Mode(s)  | Description                          |
| ------- | -------- | ------------------------------------ |
| `<M-l>` | `i`, `s` | Jump to next snippet placeholder     |
| `<M-h>` | `i`, `s` | Jump to previous snippet placeholder |
### Flash.nvim

| Keymap     | Mode(s)      | Description                              |
|------------|--------------|------------------------------------------|
| `s`        | `n`, `x`, `o`| Flash jump                               |
| `S`        | `n`, `x`, `o`| Flash Treesitter jump                    |
| `r`        | `o`          | Remote flash                             |
| `R`        | `o`, `x`     | Treesitter search                        |
| `<C-s>`    | `c`          | Toggle flash in command line             |
