return {
  "trimclain/builder.nvim",
  cmd = "Build",
  -- stylua: ignore
  keys = {
    {"<C-b>", function() require("builder").build() end, desc = "Build",},
  },
  opts = {
    commands = {
      c = "gcc % -o $basename.out && ./$basename.out",
      cpp = "g++ % -o $basename.out && ./$basename.out",
      go = "go run %",
      java = "java %",
      javascript = "node %",
      markdown = "glow %",
      python = "python %",
      rust = "cargo run",
      sh = "sh %",
      typescript = "ts-node %",
      zsh = "zsh %",
    },
  },
}
