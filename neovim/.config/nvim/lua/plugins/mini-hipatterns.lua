return {
  "echasnovski/mini.hipatterns",
  version = false,
  event = "BufReadPre",
  config = function()
    require("mini.hipatterns").setup({
      highlighters = {
        fix = { pattern = "%f[%w]()FIX()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    })
  end,
}
