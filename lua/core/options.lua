local o = vim.opt

o.number = true
o.relativenumber = true
o.numberwidth = 4
o.termguicolors = true
o.signcolumn = "yes"
o.cursorline = true

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

o.wrap = false
o.scrolloff = 8
o.updatetime = 250
o.timeoutlen = 300

o.ignorecase = true
o.smartcase = true

o.splitright = true
o.splitbelow = true

o.undofile = true
o.swapfile = false

o.clipboard = "unnamedplus"
o.completeopt = "menu,menuone,noselect"

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

