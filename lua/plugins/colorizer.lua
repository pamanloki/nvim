return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    user_default_options = {
      names = false, -- don't colorize words like "red"/"blue"
      css = true,
      css_fn = true,
      tailwind = true,
      mode = "background",
    },
  },
}
