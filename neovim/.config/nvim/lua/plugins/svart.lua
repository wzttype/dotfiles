return {
  "https://gitlab.com/madyanov/svart.nvim",
  keys = { "f", mode = { "n", "x", "o" }, desc = "jump forward to" },
  config = function()
    require("svart").configure({
      ui_dim_content = false,
    })
    vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>Svart<CR>")
  end,
}
