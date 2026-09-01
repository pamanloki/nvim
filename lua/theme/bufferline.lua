local M = {}

-- flavours always emits base10-base17 fields, but they render as
-- just "#" when the applied scheme isn't base24-compatible. This
-- catches that case and falls back to the base16 equivalent.
local function b(bright, fallback)
  if bright and bright ~= "#" and bright ~= "" then
    return bright
  end
  return fallback
end

function M.highlights()
  local c = require("theme.colors")
  local bg = c.base00
  local bg_alt = c.base01
  local dim = c.base03
  local fg = c.base05
  local accent = c.base0D
  local sep = b(c.base21, c.base02)
  local selected = { fg = bg, bg = accent, bold = true }
  return {
    fill = { bg = bg },
    background = { fg = dim, bg = bg_alt },
    buffer_visible = { fg = fg, bg = bg_alt },
    buffer_selected = { fg = bg, bg = accent, bold = true, italic = false },
    numbers = { fg = dim, bg = bg_alt },
    numbers_visible = { fg = fg, bg = bg_alt },
    numbers_selected = selected,
    separator = { fg = bg, bg = bg_alt },
    separator_visible = { fg = bg, bg = bg_alt },
    separator_selected = { fg = bg, bg = accent },
    indicator_visible = { fg = bg_alt, bg = bg_alt },
    indicator_selected = { fg = accent, bg = accent },
    modified = { fg = c.base09, bg = bg_alt },
    modified_visible = { fg = c.base09, bg = bg_alt },
    modified_selected = { fg = bg, bg = accent },
    duplicate = { fg = dim, bg = bg_alt, italic = true },
    duplicate_visible = { fg = fg, bg = bg_alt, italic = true },
    duplicate_selected = { fg = bg, bg = accent, italic = true },
    close_button = { fg = dim, bg = bg_alt },
    close_button_visible = { fg = fg, bg = bg_alt },
    close_button_selected = { fg = bg, bg = accent },
    offset_separator = { fg = sep, bg = bg },
  }
end

function M.setup()
  require("bufferline").setup({
    options = {
      mode = "buffers",
      numbers = "ordinal",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = true,
      show_close_icon = false,
      separator_style = "thin",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "NvimTreeRootFolder",
          text_align = "left",
          separator = true,
        },
        {
          filetype = "oil",
          text = "File Manager",
          highlight = "Directory",
          separator = true,
        },
      },
    },
    highlights = M.highlights(),
  })
end

return M
