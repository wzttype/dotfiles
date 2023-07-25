return {
  "catppuccin/nvim",
  name = "catppuccin",
  event = "VimEnter",
  opts = {
    flavour = "frappe",
    background = {
      light = "latte",
      dark = "frappe",
    },
    transparent_background = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
