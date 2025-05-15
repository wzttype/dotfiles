return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  config = function()
    require("fzf-lua").setup("max-perf")
  end,
  vim.keymap.set("n", "<leader>ff", ":lua require('fzf-lua').files()<CR>"),
  vim.keymap.set("n", "<leader>fb", ":lua require('fzf-lua').buffers()<CR>"),
  vim.keymap.set(
    "n",
    "<leader>fg",
    ":lua require('fzf-lua').live_grep({ cmd = 'rg --column --line-number --hidden --smart-case' })<CR>"
  ),
}
