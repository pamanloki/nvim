return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("oil").toggle_float()
      end,
      desc = "File manager (Oil float)",
    },
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory (Oil)" },
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0.9,
      max_height = 0.9,
      border = "rounded",
    },
    keymaps = {
      ["q"] = "actions.close",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
