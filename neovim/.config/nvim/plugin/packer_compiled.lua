-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/wzttype/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/wzttype/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/wzttype/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/wzttype/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/wzttype/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  ["focus.nvim"] = {
    commands = { "FocusSplitNicely" },
    config = { "\27LJ\1\0023\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\nfocus\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/focus.nvim"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/fzf-lua"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2í\3\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\21context_patterns\1\16\0\0\nclass\rfunction\vmethod\b^if\nwhile\bfor\twith\17func_literal\nblock\btry\vexcept\18argument_list\vobject\15dictionary\felement\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\0\a\24disable_with_nolist\2\ndebug\2\16strict_tabs\2\24max_indent_increase\3\1\25space_char_blankline\6 \25show_current_context\2\18show_foldtext\1\1\n\0\0\fvimwiki\bman\22gitmessengerpopup\20diagnosticpopup\flspinfo\vpacker\20TelescopePrompt\21TelescopeResults\5\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\1\2T\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\24jump_to_first_match\1\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\1\2¡\2\0\0\3\0\v\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0012\2\0\0:\2\n\1>\0\2\1G\0\1\0\rmappings\15bookmark_0\1\0\2\tsign\bâš‘\14virt_text\16hello world\18sign_priority\1\0\4\fbuiltin\3\b\nlower\3\n\nupper\3\15\rbookmark\3\20\18builtin_marks\1\5\0\0\6.\6<\6>\6^\1\0\4\vcyclic\2\22force_write_shada\1\21default_mappings\2\21refresh_interval\3ú\1\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/marks.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\1\2Ù\1\0\0\3\0\t\0\0164\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\b\0>\0\1\1G\0\1\0\tload\finverse\1\0\3\vsearch\2\vvisual\2\16match_paren\2\vstyles\1\0\3\rcomments\vitalic\rkeywords\tbold\14functions\16italic,bold\1\0\1\bfox\rnightfox\nsetup\rnightfox\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2q\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\30enable_check_bracket_line\1\22enable_afterquote\1\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer" },
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-treesitter"] = {
    after = { "playground", "vim-matchup" },
    config = { "\27LJ\1\2½\3\0\0\4\0\16\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0003\3\t\0:\3\n\2:\2\v\1>\0\2\0014\0\0\0%\1\f\0>\0\2\0023\1\14\0:\1\r\0004\0\0\0%\1\f\0>\0\2\2)\1\2\0:\1\15\0G\0\1\0\15prefer_git\1\3\0\0\nclang\bgcc\14compilers\28nvim-treesitter.install\26incremental_selection\fkeymaps\1\0\3\19init_selection\bgnn\21node_decremental\bgnd\21node_incremental\bgna\1\0\1\venable\2\14highlight\1\0\3&additional_vim_regex_highlighting\2\18use_languages\2\venable\2\21ensure_installed\1\0\0\1\t\0\0\tbash\tfish\blua\tyaml\tjson\bvim\nlatex\vledger\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\1\2d\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fsymbols\1\0\0\1\5\0\0\bâ—‰\bâ—‹\bâœ¸\bâœ¿\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/org-bullets.nvim"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    config = { "\27LJ\1\2Ô\1\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0003\3\a\0:\3\b\2:\2\t\1>\0\2\1G\0\1\0\17query_linter\16lint_events\1\4\0\0\rBufWrite\15CursorHold\16CursorMoved\1\0\2\21use_virtual_text\2\venable\2\15playground\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/stabilize.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "/home/wzttype/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\1\2g\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fmatchup\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20wlsample.bubble\frequire\0" },
    loaded = true,
    path = "/home/wzttype/.local/share/nvim/site/pack/packer/start/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^focus"] = "focus.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\1\2d\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fsymbols\1\0\0\1\5\0\0\bâ—‰\bâ—‹\bâœ¸\bâœ¿\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20wlsample.bubble\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\1\2¡\2\0\0\3\0\v\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0012\2\0\0:\2\n\1>\0\2\1G\0\1\0\rmappings\15bookmark_0\1\0\2\tsign\bâš‘\14virt_text\16hello world\18sign_priority\1\0\4\fbuiltin\3\b\nlower\3\n\nupper\3\15\rbookmark\3\20\18builtin_marks\1\5\0\0\6.\6<\6>\6^\1\0\4\vcyclic\2\22force_write_shada\1\21default_mappings\2\21refresh_interval\3ú\1\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\1\2T\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\24jump_to_first_match\1\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2q\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\30enable_check_bracket_line\1\22enable_afterquote\1\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\1\2Ù\1\0\0\3\0\t\0\0164\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\b\0>\0\1\1G\0\1\0\tload\finverse\1\0\3\vsearch\2\vvisual\2\16match_paren\2\vstyles\1\0\3\rcomments\vitalic\rkeywords\tbold\14functions\16italic,bold\1\0\1\bfox\rnightfox\nsetup\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FocusSplitNicely lua require("packer.load")({'focus.nvim'}, { cmd = "FocusSplitNicely", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerDetachFromBuffer lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerDetachFromBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerAttachToBuffer lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerAttachToBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
