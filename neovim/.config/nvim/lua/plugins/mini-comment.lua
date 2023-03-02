require("mini.comment").setup({
  options = {
    ignore_blank_line = true,
  },
  hooks = {
    pre = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  },
})
