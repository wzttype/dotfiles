return {
  "gennaro-tedesco/nvim-possession",
  event = "VeryLazy",
  opts = {
    sessions = {
      sessions_icon = "",
    },
    autoswitch = {
      enable = true,
    },
    fzf_winopts = {
      height = 0.8,
      width = 0.8,
    },
  },
  vim.keymap.set("n", "<leader>sl", function()
    require("nvim-possession").list()
  end),
  vim.keymap.set("n", "<leader>sn", function()
    require("nvim-possession").new()
  end),
  vim.keymap.set("n", "<leader>su", function()
    require("nvim-possession").update()
  end),
}
