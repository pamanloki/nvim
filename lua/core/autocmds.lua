vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

-- Force bufferline to recompute its sidebar offset when buffers/windows
-- change, so closing a buffer next to the nvim-tree sidebar doesn't leave
-- the tabs drawn over the sidebar.
vim.api.nvim_create_autocmd({ "BufEnter", "BufDelete", "BufWipeout", "WinEnter", "WinClosed" }, {
  callback = function()
    vim.schedule(function()
      pcall(vim.cmd, "redrawtabline")
    end)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.stdpath("config") .. "/lua/theme/colors.lua",
  callback = function()
    package.loaded["theme.colors"] = nil
    require("theme.init").setup()
  end,
})

-- Buka socket tetap biar Flavours bisa kirim perintah reload tema
-- ke instance nvim yang lagi jalan, tanpa perlu spawn instance baru
if vim.fn.filereadable("/tmp/nvim-server") == 0 and #vim.fn.serverlist() == 0 then
  pcall(vim.fn.serverstart, "/tmp/nvim-server")
end
