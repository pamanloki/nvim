return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree (sidebar)" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal file in tree" },
  },
  opts = {
    -- oil already disables netrw; leave it be so the two don't fight over dirs
    disable_netrw = false,
    hijack_netrw = false,
    view = {
      width = 32,
      side = "left",
      preserve_window_proportions = true,
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      root_folder_label = false,
      indent_markers = { enable = true },
    },
    filters = {
      dotfiles = false,
    },
    git = { enable = true },
    actions = {
      open_file = {
        quit_on_open = false, -- keep the sidebar open after opening a file
        window_picker = { enable = true },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    -- nvim-tree loads after the theme (it is lazy) and overwrites our
    -- NvimTree* highlights with its own defaults. Re-apply ONLY the tree
    -- highlights (not the full theme) so we don't re-init bufferline and
    -- break its sidebar offset.
    pcall(function()
      require("theme.init").apply_nvimtree()
    end)
  end,
}
