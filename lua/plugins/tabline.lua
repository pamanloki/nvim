return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  keys = {
    { "<leader>1", "<cmd>BufferGoto 1<cr>", desc = "Go to buffer 1" },
    { "<leader>2", "<cmd>BufferGoto 2<cr>", desc = "Go to buffer 2" },
    { "<leader>3", "<cmd>BufferGoto 3<cr>", desc = "Go to buffer 3" },
    { "<leader>4", "<cmd>BufferGoto 4<cr>", desc = "Go to buffer 4" },
    { "<leader>5", "<cmd>BufferGoto 5<cr>", desc = "Go to buffer 5" },
    { "<leader>6", "<cmd>BufferGoto 6<cr>", desc = "Go to buffer 6" },
    { "<leader>7", "<cmd>BufferGoto 7<cr>", desc = "Go to buffer 7" },
    { "<leader>8", "<cmd>BufferGoto 8<cr>", desc = "Go to buffer 8" },
    { "<leader>9", "<cmd>BufferLast<cr>", desc = "Go to last buffer" },
    { "<leader>bp", "<cmd>BufferPick<cr>", desc = "Pick buffer" },
    { "<leader>bc", "<cmd>BufferClose<cr>", desc = "Close buffer" },
    { "<leader>bo", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close other buffers" },
    {
      "<leader>bd",
      function()
        if vim.bo.modifiable and vim.bo.buftype == "" then
          vim.cmd("write")
        end
        vim.cmd("BufferClose")
      end,
      desc = "Save & close buffer",
    },
    { "<S-l>", "<cmd>BufferNext<cr>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferPrevious<cr>", desc = "Prev buffer" },
    { "<leader>b<", "<cmd>BufferMovePrevious<cr>", desc = "Move buffer left" },
    { "<leader>b>", "<cmd>BufferMoveNext<cr>", desc = "Move buffer right" },
  },
  opts = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    -- Reserve space for the nvim-tree sidebar (this is what fixes the
    -- "tabs drawn over the sidebar" problem, natively).
    sidebar_filetypes = {
      NvimTree = { text = "File Explorer", align = "left" },
    },
    icons = {
      buffer_index = true, -- show ordinal 1,2,3 numbers like NvChad
      button = "×", -- close button; plain × renders in every font (Nerd Font glyphs get stripped on save)
      separator = { left = "▎", right = "" },
      separator_at_end = false,
      modified = { button = "●" },
      inactive = { separator = { left = "▎", right = "" } },
    },
  },
  config = function(_, opts)
    require("barbar").setup(opts)
    -- barbar loads after the theme and generates its own highlights, so
    -- re-apply the flavours colors for barbar right after setup.
    pcall(function()
      require("theme.init").apply_barbar()
    end)
  end,
}
