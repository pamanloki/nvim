return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5" },
    { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to buffer 6" },
    { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to buffer 7" },
    { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to buffer 8" },
    { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to buffer 9" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
    { "<leader>bc", function() Snacks.bufdelete() end, desc = "Close buffer" },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Close other buffers" },
    {
      "<leader>bd",
      function()
        local cur = vim.api.nvim_get_current_buf()
        if vim.bo[cur].modifiable and vim.bo[cur].buftype == "" then
          vim.cmd("write")
        end
        -- Snacks.bufdelete keeps the window layout so the bufferline offset
        -- over the nvim-tree sidebar is not disturbed on close.
        Snacks.bufdelete(cur)
      end,
      desc = "Save & close buffer (keep nvim open)",
    },
  },
  config = function()
    require("theme.bufferline").setup()
  end,
}
