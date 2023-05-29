require("mini.align").setup()
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
require("mini.indentscope").setup({
  symbol = "|",
})
require("mini.jump").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup({
  mappings = {
    toggle = "<leader>sj",
  },
})
require("mini.surround").setup({
  mappings = {
    add = "<leader>sa",
    delete = "<leader>sd",
    find = "",
    find_left = "",
    highlight = "",
    replace = "<leader>sr",
    update_n_lines = "",
  },
})
