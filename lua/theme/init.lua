local M = {}
function M.setup()
  package.loaded["theme.colors"] = nil
  local c = require("theme.colors")
  vim.o.background = "dark"
  vim.g.colors_name = "flavours"
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end
  -- flavours always emits base10-base17 fields, but they render as
  -- just "#" when the applied scheme isn't base24-compatible. This
  -- catches that case and falls back to the base16 equivalent.
  local function b(bright, fallback)
    if bright and bright ~= "#" and bright ~= "" then
      return bright
    end
    return fallback
  end
  hl("Normal", { fg = c.base05, bg = c.base00 })
  hl("NormalFloat", { fg = c.base05, bg = c.base01 })
  hl("FloatBorder", { fg = c.base03, bg = c.base01 })
  hl("Cursor", { fg = c.base00, bg = c.base05 })
  hl("CursorLine", { bg = c.base01 })
  hl("CursorLineNr", { fg = c.base0D, bold = true })
  hl("LineNr", { fg = c.base03 })
  hl("SignColumn", { fg = c.base03, bg = c.base00 })
  hl("Visual", { bg = c.base02 })
  hl("Search", { fg = c.base00, bg = c.base0A })
  hl("IncSearch", { fg = c.base00, bg = c.base09 })
  hl("Pmenu", { fg = c.base05, bg = b(c.base22, c.base01) })
  hl("PmenuSel", { fg = c.base00, bg = b(c.base15, c.base0D) })
  hl("StatusLine", { fg = c.base05, bg = c.base01 })
  hl("StatusLineNC", { fg = b(c.base28, c.base03), bg = c.base01 })
  hl("VertSplit", { fg = b(c.base21, c.base02) })
  hl("WinSeparator", { fg = b(c.base21, c.base02) })
  hl("ColorColumn", { bg = c.base01 })
  hl("MatchParen", { fg = b(c.base13, c.base0A), bold = true })
  hl("Folded", { fg = b(c.base29, c.base03), bg = b(c.base20, c.base01) })
  hl("NonText", { fg = b(c.base26, c.base02) })
  hl("Whitespace", { fg = b(c.base25, c.base01) })
  hl("EndOfBuffer", { fg = b(c.base25, c.base01) })
  hl("Comment", { fg = c.base03, italic = true })
  hl("Constant", { fg = c.base09 })
  hl("String", { fg = c.base0B })
  hl("Character", { fg = c.base0B })
  hl("Number", { fg = c.base09 })
  hl("Boolean", { fg = c.base09 })
  hl("Identifier", { fg = c.base08 })
  hl("Function", { fg = c.base0D })
  hl("Statement", { fg = c.base0E })
  hl("Conditional", { fg = c.base0E })
  hl("Repeat", { fg = c.base0E })
  hl("Keyword", { fg = c.base0E })
  hl("Operator", { fg = c.base05 })
  hl("PreProc", { fg = c.base0A })
  hl("Type", { fg = c.base0A })
  hl("Structure", { fg = c.base0A })
  hl("Special", { fg = c.base0C })
  hl("Underlined", { fg = c.base0D, underline = true })
  hl("Error", { fg = c.base08 })
  hl("Todo", { fg = c.base0A, bold = true })
  hl("@variable", { fg = c.base05 })
  hl("@variable.builtin", { fg = c.base08 })
  hl("@parameter", { fg = c.base08, italic = true })
  hl("@field", { fg = c.base08 })
  hl("@property", { fg = c.base08 })
  hl("@function", { fg = c.base0D })
  hl("@function.builtin", { fg = c.base0D })
  hl("@method", { fg = c.base0D })
  hl("@constructor", { fg = c.base0A })
  hl("@keyword", { fg = c.base0E })
  hl("@keyword.function", { fg = c.base0E })
  hl("@keyword.return", { fg = c.base0E })
  hl("@conditional", { fg = c.base0E })
  hl("@string", { fg = c.base0B })
  hl("@number", { fg = c.base09 })
  hl("@boolean", { fg = c.base09 })
  hl("@type", { fg = c.base0A })
  hl("@type.builtin", { fg = c.base0A })
  hl("@comment", { fg = c.base03, italic = true })
  hl("@punctuation.bracket", { fg = c.base05 })
  hl("@punctuation.delimiter", { fg = c.base05 })
  hl("@tag", { fg = c.base08 })
  hl("@tag.attribute", { fg = c.base09 })

  -- Diagnostics: base24 bright variants when available, base16 fallback otherwise
  hl("DiagnosticError", { fg = b(c.base12, c.base08) })
  hl("DiagnosticWarn", { fg = b(c.base14, c.base0A) })
  hl("DiagnosticInfo", { fg = c.base0D })
  hl("DiagnosticHint", { fg = b(c.base1C, c.base0C) })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = b(c.base12, c.base08) })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = b(c.base14, c.base0A) })

  hl("DiffAdd", { fg = c.base0B, bg = c.base01 })
  hl("DiffChange", { fg = c.base0A, bg = c.base01 })
  hl("DiffDelete", { fg = c.base08, bg = c.base01 })

  -- Git signs: base24 bright variants when available, base16 fallback otherwise
  hl("GitSignsAdd", { fg = b(c.base13, c.base0B) })
  hl("GitSignsChange", { fg = b(c.base14, c.base0A) })
  hl("GitSignsDelete", { fg = b(c.base12, c.base08) })

  hl("TelescopeBorder", { fg = c.base02 })
  hl("TelescopeSelection", { bg = b(c.base22, c.base01) })
  hl("TelescopePromptBorder", { fg = c.base0D })
  hl("CmpItemAbbrMatch", { fg = c.base0D, bold = true })
  hl("CmpItemKindFunction", { fg = c.base0D })
  hl("CmpItemKindVariable", { fg = c.base08 })
  hl("CmpItemKindKeyword", { fg = c.base0E })
  hl("LspInlayHint", { fg = c.base04, bg = b(c.base20, c.base01), italic = true })

  -- Title was previously unthemed; snacks dashboard header links to it
  hl("Title", { fg = c.base0D, bold = true })

  -- snacks.nvim: dashboard
  hl("SnacksDashboardHeader", { fg = c.base0D, bold = true })
  hl("SnacksDashboardTitle", { fg = c.base0D })
  hl("SnacksDashboardDesc", { fg = c.base05 })
  hl("SnacksDashboardKey", { fg = c.base09, bold = true })
  hl("SnacksDashboardIcon", { fg = c.base0C })
  hl("SnacksDashboardFooter", { fg = c.base03, italic = true })
  hl("SnacksDashboardDir", { fg = c.base03 })
  hl("SnacksDashboardFile", { fg = c.base05 })
  hl("SnacksDashboardSpecial", { fg = c.base0E })

  -- snacks.nvim: notifier
  hl("SnacksNotifierInfo", { fg = c.base0B })
  hl("SnacksNotifierWarn", { fg = b(c.base14, c.base0A) })
  hl("SnacksNotifierError", { fg = b(c.base12, c.base08) })
  hl("SnacksNotifierDebug", { fg = c.base03 })
  hl("SnacksNotifierTrace", { fg = c.base0E })
  hl("SnacksNotifierIconInfo", { fg = c.base0B })
  hl("SnacksNotifierIconWarn", { fg = b(c.base14, c.base0A) })
  hl("SnacksNotifierIconError", { fg = b(c.base12, c.base08) })
  hl("SnacksNotifierBorderInfo", { fg = c.base0B })
  hl("SnacksNotifierBorderWarn", { fg = b(c.base14, c.base0A) })
  hl("SnacksNotifierBorderError", { fg = b(c.base12, c.base08) })
  hl("SnacksNotifierTitleInfo", { fg = c.base0B })
  hl("SnacksNotifierTitleWarn", { fg = b(c.base14, c.base0A) })
  hl("SnacksNotifierTitleError", { fg = b(c.base12, c.base08) })

  -- snacks.nvim: misc
  hl("SnacksIndent", { fg = b(c.base21, c.base02) })
  hl("SnacksIndentScope", { fg = c.base0D })

  -- nvim-tree (and generic directory color, also used by oil header)
  M.apply_nvimtree()

  local ok, lualine = pcall(require, "lualine")
  if ok then
    package.loaded["theme.lualine"] = nil
    lualine.setup({
      options = {
        theme = require("theme.lualine").build(),
        component_separators = "|",
        section_separators = "",
      },
    })
  end

  if pcall(require, "barbar") then
    M.apply_barbar()
  end
end

-- Applies just the nvim-tree highlights. Kept separate so nvim-tree (which
-- lazy-loads after the theme) can re-apply only these on load, without
-- re-running the whole theme setup (that would also re-init bufferline and
-- disturb its sidebar offset).
function M.apply_nvimtree()
  local c = require("theme.colors")
  local function b(bright, fallback)
    if bright and bright ~= "#" and bright ~= "" then
      return bright
    end
    return fallback
  end
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end
  hl("Directory", { fg = c.base0D })
  hl("NvimTreeNormal", { fg = c.base05, bg = c.base00 })
  hl("NvimTreeNormalNC", { fg = c.base05, bg = c.base00 })
  hl("NvimTreeWinSeparator", { fg = b(c.base21, c.base02), bg = c.base00 })
  hl("NvimTreeRootFolder", { fg = c.base0E, bold = true })
  hl("NvimTreeFolderName", { fg = c.base0D })
  hl("NvimTreeOpenedFolderName", { fg = c.base0D, bold = true })
  hl("NvimTreeFolderIcon", { fg = c.base0D })
  hl("NvimTreeIndentMarker", { fg = b(c.base21, c.base02) })
  hl("NvimTreeGitDirty", { fg = b(c.base14, c.base0A) })
  hl("NvimTreeGitNew", { fg = b(c.base13, c.base0B) })
  hl("NvimTreeGitDeleted", { fg = b(c.base12, c.base08) })
  hl("NvimTreeSpecialFile", { fg = c.base0A })
  hl("NvimTreeCursorLine", { bg = c.base01 })
end

-- barbar.nvim tab bar colors, derived from the flavours palette. Re-applied
-- after barbar loads (it generates its own highlights on setup).
function M.apply_barbar()
  local c = require("theme.colors")
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end
  local cur = c.base01
  local fill = c.base00
  local accent = c.base0D
  hl("BufferTabpageFill", { fg = c.base03, bg = fill })
  -- current buffer
  hl("BufferCurrent", { fg = c.base05, bg = cur, bold = true })
  hl("BufferCurrentIndex", { fg = accent, bg = cur, bold = true })
  hl("BufferCurrentMod", { fg = c.base09, bg = cur })
  hl("BufferCurrentSign", { fg = accent, bg = cur })
  hl("BufferCurrentTarget", { fg = c.base08, bg = cur, bold = true })
  -- visible (shown in another window)
  hl("BufferVisible", { fg = c.base05, bg = fill })
  hl("BufferVisibleIndex", { fg = c.base05, bg = fill })
  hl("BufferVisibleMod", { fg = c.base09, bg = fill })
  hl("BufferVisibleSign", { fg = c.base03, bg = fill })
  hl("BufferVisibleTarget", { fg = c.base08, bg = fill, bold = true })
  -- inactive
  hl("BufferInactive", { fg = c.base03, bg = fill })
  hl("BufferInactiveIndex", { fg = c.base03, bg = fill })
  hl("BufferInactiveMod", { fg = c.base09, bg = fill })
  hl("BufferInactiveSign", { fg = c.base02, bg = fill })
  hl("BufferInactiveTarget", { fg = c.base08, bg = fill, bold = true })
end

return M
