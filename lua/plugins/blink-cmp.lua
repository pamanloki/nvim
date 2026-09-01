return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true },
      menu = {
        border = "rounded",
      },
      list = {
        selection = { preselect = false }, -- atau true, sesuaikan
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
    sources = {
      default = function()
        local ok, node = pcall(vim.treesitter.get_node)
        if ok and node then
          local node_type = node:type()
          if node_type == "string" or node_type == "string_content" then
            -- jika ingin tetap bisa snippet di dalam string, tambahkan "snippets"
            return { "path", "snippets" }  -- <-- ubah sesuai selera
          end
        end
        return { "lsp", "path", "snippets", "buffer" }
      end,
      -- opsional: tambahkan provider path jika perlu
      -- providers = {
      --   path = { enabled = true },
      -- },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
