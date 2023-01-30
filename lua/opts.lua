--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command
local g = vim.g

-- [[ Context ]]
opt.colorcolumn = '120' -- str:  Show col for max line length
opt.number = true -- bool: Show line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column

-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable
cmd('colorscheme dracula') -- cmd:  Set the colorscheme


-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 2 -- num:  Size of an indent
opt.softtabstop = 2 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 2 -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

g.startify_change_to_dir = 0 -- Don't change working directory when opening files
g.startify_change_to_vcs_root = 1 -- Change working dir to version control root
g.startify_fortune_use_unicode = 1 -- Enable unicode box drawing in fortune message
