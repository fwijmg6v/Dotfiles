-- ~/.config/nvim/colors/icemono.lua
-- Built directly from the "Light Blue & Saturated Black" palette + its own
-- documented ANSI usage roles (e.g. "Cyan: Strings", "Magenta: Keywords") --
-- those usage notes are used here as the actual semantic mapping, not just
-- terminal colors.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "icemono"

local c = {
    bg        = "#090A0F", -- Ink Black
    surface   = "#161B22", -- Dark Charcoal
    border    = "#212830", -- Slate Border
    muted     = "#6E7A8A", -- Muted Slate      -- comments
    subtle    = "#A3B8CC", -- High-Vis Slate   -- identifiers/vars/dirs (ANSI blue)
    fg        = "#E6F0FA", -- Soft Sky Blue    -- primary text
    accent    = "#BCE3FF", -- Electric Ice     -- strings/special (ANSI cyan)
    error     = "#FF7B8E", -- Soft Coral Red   -- errors/diff removal (ANSI red)

    green     = "#98C379", -- git add / success (ANSI green)
    yellow    = "#E5C07B", -- warnings / constants / types (ANSI yellow)
    magenta   = "#C678DD", -- keywords / control statements (ANSI magenta)

    inactive  = "#30363D", -- bright black -- subtle borders, inactive selections
    soft_err  = "#FFA0AD", -- bright red
    soft_ok   = "#B5E096", -- bright green
    soft_warn = "#F5D08B", -- bright yellow
    secondary = "#C2D4E5", -- bright blue -- active params / secondary text
    soft_mag  = "#D688ED", -- bright magenta
    focus     = "#E0F2FF", -- bright cyan -- focused accents / function names
    white     = "#FFFFFF", -- bright white
}

local hl = vim.api.nvim_set_hl

-- ===== Base editor =====
hl(0, "Normal",       { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat",  { fg = c.fg, bg = c.surface })
hl(0, "NormalNC",     { fg = c.fg, bg = c.bg })
hl(0, "FloatBorder",  { fg = c.border, bg = c.surface })
hl(0, "FloatTitle",   { fg = c.accent, bg = c.surface, bold = true })
hl(0, "SignColumn",   { bg = c.bg })
hl(0, "LineNr",       { fg = c.muted })
hl(0, "CursorLineNr", { fg = c.accent, bold = true })
hl(0, "CursorLine",   { bg = c.surface })
hl(0, "CursorColumn", { bg = c.surface })
hl(0, "ColorColumn",  { bg = c.surface })
hl(0, "Visual",       { bg = c.border })
hl(0, "VisualNOS",    { bg = c.border })
hl(0, "Search",       { fg = c.bg, bg = c.soft_warn })
hl(0, "IncSearch",    { fg = c.bg, bg = c.accent })
hl(0, "CurSearch",    { fg = c.bg, bg = c.accent, bold = true })
hl(0, "MatchParen",   { fg = c.focus, bold = true, underline = true })
hl(0, "Pmenu",        { fg = c.subtle, bg = c.surface })
hl(0, "PmenuSel",     { fg = c.bg, bg = c.accent, bold = true })
hl(0, "PmenuSbar",    { bg = c.surface })
hl(0, "PmenuThumb",   { bg = c.border })
hl(0, "StatusLine",   { fg = c.fg, bg = c.surface })
hl(0, "StatusLineNC", { fg = c.muted, bg = c.surface })
hl(0, "WinSeparator", { fg = c.border })
hl(0, "VertSplit",    { fg = c.border })
hl(0, "TabLine",      { fg = c.muted, bg = c.surface })
hl(0, "TabLineFill",  { bg = c.bg })
hl(0, "TabLineSel",   { fg = c.bg, bg = c.accent, bold = true })
hl(0, "NonText",      { fg = c.inactive })
hl(0, "Whitespace",   { fg = c.inactive })
hl(0, "EndOfBuffer",  { fg = c.bg })
hl(0, "FoldColumn",   { fg = c.muted, bg = c.bg })
hl(0, "Folded",       { fg = c.subtle, bg = c.surface })
hl(0, "Directory",    { fg = c.subtle, bold = true })
hl(0, "Title",        { fg = c.accent, bold = true })
hl(0, "ErrorMsg",     { fg = c.error })
hl(0, "WarningMsg",   { fg = c.yellow })
hl(0, "Question",     { fg = c.accent })
hl(0, "ModeMsg",      { fg = c.subtle })
hl(0, "MoreMsg",      { fg = c.accent })

-- ===== Syntax (using the palette's own documented usage roles) =====
hl(0, "Comment",       { fg = c.muted, italic = true })
hl(0, "Constant",      { fg = c.yellow })
hl(0, "String",        { fg = c.accent })
hl(0, "Character",     { fg = c.accent })
hl(0, "Number",        { fg = c.yellow })
hl(0, "Boolean",       { fg = c.yellow, bold = true })
hl(0, "Float",         { fg = c.yellow })
hl(0, "Identifier",    { fg = c.subtle })
hl(0, "Function",      { fg = c.focus, bold = true })
hl(0, "Statement",     { fg = c.magenta })
hl(0, "Conditional",   { fg = c.magenta })
hl(0, "Repeat",        { fg = c.magenta })
hl(0, "Label",         { fg = c.magenta })
hl(0, "Operator",      { fg = c.fg })
hl(0, "Keyword",       { fg = c.magenta, bold = true })
hl(0, "Exception",     { fg = c.error, bold = true })
hl(0, "PreProc",       { fg = c.soft_mag })
hl(0, "Include",       { fg = c.magenta })
hl(0, "Define",        { fg = c.magenta })
hl(0, "Macro",         { fg = c.soft_mag })
hl(0, "PreCondit",     { fg = c.soft_mag })
hl(0, "Type",          { fg = c.yellow })
hl(0, "StorageClass",  { fg = c.yellow, italic = true })
hl(0, "Structure",     { fg = c.yellow })
hl(0, "Typedef",       { fg = c.yellow })
hl(0, "Special",       { fg = c.focus })
hl(0, "SpecialChar",   { fg = c.focus })
hl(0, "Tag",           { fg = c.magenta })
hl(0, "Delimiter",     { fg = c.secondary })
hl(0, "SpecialComment", { fg = c.muted, italic = true, bold = true })
hl(0, "Debug",         { fg = c.error })
hl(0, "Underlined",    { underline = true, fg = c.accent })
hl(0, "Ignore",        { fg = c.inactive })
hl(0, "Error",         { fg = c.error, bold = true })
hl(0, "Todo",          { fg = c.bg, bg = c.soft_warn, bold = true })

-- ===== Treesitter capture groups =====
hl(0, "@comment",             { link = "Comment" })
hl(0, "@string",              { link = "String" })
hl(0, "@string.escape",       { fg = c.focus })
hl(0, "@number",               { link = "Number" })
hl(0, "@boolean",              { link = "Boolean" })
hl(0, "@function",             { link = "Function" })
hl(0, "@function.builtin",     { fg = c.focus, italic = true })
hl(0, "@function.call",        { link = "Function" })
hl(0, "@function.method",      { link = "Function" })
hl(0, "@constructor",          { fg = c.secondary })
hl(0, "@keyword",              { link = "Keyword" })
hl(0, "@keyword.function",     { fg = c.magenta, italic = true })
hl(0, "@keyword.return",       { fg = c.magenta, bold = true })
hl(0, "@keyword.operator",     { fg = c.magenta })
hl(0, "@conditional",          { link = "Conditional" })
hl(0, "@repeat",               { link = "Repeat" })
hl(0, "@variable",             { fg = c.fg })
hl(0, "@variable.builtin",     { fg = c.subtle, italic = true })
hl(0, "@variable.parameter",   { fg = c.secondary })
hl(0, "@field",                { fg = c.subtle })
hl(0, "@property",             { fg = c.subtle })
hl(0, "@constant",             { link = "Constant" })
hl(0, "@constant.builtin",     { fg = c.yellow, bold = true })
hl(0, "@type",                 { link = "Type" })
hl(0, "@type.builtin",         { fg = c.yellow, italic = true })
hl(0, "@operator",             { link = "Operator" })
hl(0, "@punctuation.delimiter", { fg = c.secondary })
hl(0, "@punctuation.bracket",  { fg = c.secondary })
hl(0, "@punctuation.special",  { fg = c.focus })
hl(0, "@tag",                  { link = "Tag" })
hl(0, "@tag.attribute",        { fg = c.subtle, italic = true })
hl(0, "@tag.delimiter",        { fg = c.secondary })
hl(0, "@text.title",           { fg = c.accent, bold = true })
hl(0, "@text.literal",         { fg = c.subtle })
hl(0, "@text.uri",             { fg = c.accent, underline = true })
hl(0, "@markup.heading",       { fg = c.accent, bold = true })
hl(0, "@markup.link",          { fg = c.focus, underline = true })

-- ===== Diagnostics =====
hl(0, "DiagnosticError", { fg = c.error })
hl(0, "DiagnosticWarn",  { fg = c.yellow })
hl(0, "DiagnosticInfo",  { fg = c.subtle })
hl(0, "DiagnosticHint",  { fg = c.muted })
hl(0, "DiagnosticOk",    { fg = c.green })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.error })
hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = c.subtle })
hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = c.muted })
hl(0, "DiagnosticVirtualTextError", { fg = c.error, bg = c.surface })
hl(0, "DiagnosticVirtualTextWarn",  { fg = c.yellow, bg = c.surface })
hl(0, "DiagnosticVirtualTextInfo",  { fg = c.subtle, bg = c.surface })
hl(0, "DiagnosticVirtualTextHint",  { fg = c.muted, bg = c.surface })

-- ===== Diff / Git =====
hl(0, "DiffAdd",    { fg = c.green, bg = c.surface })
hl(0, "DiffChange", { fg = c.yellow, bg = c.surface })
hl(0, "DiffDelete", { fg = c.error, bg = c.surface })
hl(0, "DiffText",   { fg = c.accent, bg = c.border })
hl(0, "GitSignsAdd",    { fg = c.green })
hl(0, "GitSignsChange", { fg = c.yellow })
hl(0, "GitSignsDelete", { fg = c.error })

-- ===== blink.cmp =====
hl(0, "BlinkCmpMenu",          { fg = c.subtle, bg = c.surface })
hl(0, "BlinkCmpMenuBorder",    { fg = c.border, bg = c.surface })
hl(0, "BlinkCmpMenuSelection", { fg = c.bg, bg = c.accent, bold = true })
hl(0, "BlinkCmpDoc",           { fg = c.fg, bg = c.surface })
hl(0, "BlinkCmpDocBorder",     { fg = c.border, bg = c.surface })
hl(0, "BlinkCmpLabel",         { fg = c.fg })
hl(0, "BlinkCmpLabelMatch",    { fg = c.focus, bold = true })
hl(0, "BlinkCmpLabelDetail",   { fg = c.muted })
hl(0, "BlinkCmpKind",          { fg = c.subtle })

-- ===== snacks.nvim (picker/notifier fall back to sane defaults; a few overrides) =====
hl(0, "SnacksPickerBorder", { fg = c.border, bg = c.surface })
hl(0, "SnacksPickerTitle",  { fg = c.accent, bg = c.surface, bold = true })
hl(0, "SnacksNotifierInfo",  { fg = c.subtle })
hl(0, "SnacksNotifierWarn",  { fg = c.yellow })
hl(0, "SnacksNotifierError", { fg = c.error })

-- ===== dadbod-ui =====
hl(0, "db_ui_saved_query_name", { fg = c.accent, bold = true })
hl(0, "db_ui_table",            { fg = c.subtle })
