--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

map('n', 'nt', [[:NvimTreeToggle <CR>]], {})
map('n', 'll', [[:IndentLinesToggle]], {})
map('n', 'tg', [[:TagbarToggle<CR>]], {})
map('n', 'ff', [[:Telescope find_files <CR>]], {})
map('n', 'fg', [[:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], {})
map('t', '<Esc><Esc>', [[<C-\><C-n>:FloatermToggle<CR>]], {})
map('n', 'tt', [[:FloatermToggle<CR>]], {})
map('n', 'te', [[:Telescope<CR>]], {})
map('n', 'ca', [[:lua vim.lsp.buf.code_action() <CR>]], {})

