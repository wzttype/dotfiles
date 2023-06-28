return {
  "cshuaimin/ssr.nvim",
  event = "BufReadPost",
  config = function()
    vim.keymap.set({ "n", "x" }, "<leader>ssr", function()
      require("ssr").open()
    end)
  end,
}
