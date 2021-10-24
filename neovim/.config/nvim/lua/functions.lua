require 'util'.add_autocommand({
  name = 'my_remember_last_file_position',
  target = '*',
  events = {{
    trigger = 'BufReadPost',
    handler = function ()
      local cur_l, end_l = vim.fn.line("'\""), vim.fn.line('$')
      if 0 < cur_l and cur_l < end_l and vim.bo.filetype ~= 'commit' then
        vim.cmd('normal! g`"')
      end
    end,
  }}})

require 'util'.add_autocommand({
  name = 'my_remove_trailing_spaces',
  target = '*',
  events = {{
    trigger = 'BufWrite' ,
    handler = function ()
      if vim.api.nvim_eval('!exists("b:noStripWhitespace")') then
        vim.cmd('normal mz')
        vim.cmd([[%s/\s\+$//ge]])
        vim.cmd('normal `z')
      end
    end,
  }}})

require 'util'.add_autocommand({
  name = 'my_unlist_terminal',
  target = '*',
  events = {{
    trigger = 'TermOpen',
    handler = function() vim.bo.buflisted = false end
}}})

local disabled_fts = {
  'NvimTree',
  'packer',
  'dap-repl',
  'dapui_scopes', 'dapui_stacks', 'dapui_watches', 'dapui_repl',
  'LspTrouble',
  'TelescopePrompt',
  'neoterm',
  'DiffviewFiles',
}

