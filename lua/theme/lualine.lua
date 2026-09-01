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
function M.build()
  local c = require("theme.colors")
  return {
    normal = {
      a = { fg = c.base00, bg = c.base0D, gui = "bold" },
      b = { fg = c.base05, bg = c.base02 },
      c = { fg = c.base05, bg = c.base01 },
    },
    insert = {
      a = { fg = c.base00, bg = b(c.base13, c.base0B), gui = "bold" },
    },
    visual = {
      a = { fg = c.base00, bg = b(c.base16, c.base0E), gui = "bold" },
    },
    replace = {
      a = { fg = c.base00, bg = b(c.base12, c.base08), gui = "bold" },
    },
    command = {
      a = { fg = c.base00, bg = b(c.base14, c.base0A), gui = "bold" },
    },
    inactive = {
      a = { fg = b(c.base28, c.base03), bg = b(c.base20, c.base01) },
      b = { fg = b(c.base28, c.base03), bg = b(c.base20, c.base01) },
      c = { fg = b(c.base28, c.base03), bg = b(c.base20, c.base01) },
    },
  }
end
return M
