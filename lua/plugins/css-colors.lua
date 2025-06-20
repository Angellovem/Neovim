return {
  "brenoprata10/nvim-highlight-colors",
  opts = {
    render = "background", -- or "virtual", "foreground"
    enable_hex = true,
    enable_short_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_ansi = true,
    enable_hsl_without_function = true,
    enable_var_usage = true,
    enable_named_colors = true,
    enable_tailwind = true, -- if you use Tailwind, keep it true
    exclude_filetypes = {}, -- ensure no filetypes are excluded
    exclude_buftypes = {},
    exclude_buffer = function(_) return false end, -- disable large buffer exclusion
  },
}

