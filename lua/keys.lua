--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

map('n', 'nt', [[:NvimTreeToggle <CR>]], {})
map('n', 'll', [[:IndentLinesToggle]], {})
map('n', 'tg', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files <CR>]], {})
map('n', 'fg', [[:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], {})
map('n', 'tt', [[:FloatermToggle <CR>]], {})
map('t', '<Esc><Esc>', [[<C-\><C-n>:FloatermToggle <CR>]], {})

