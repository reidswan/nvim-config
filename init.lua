--[[ init.lua ]]
-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps
require('plug') -- Plugin

-- PLUGINS
require('nvim-tree').setup {}
require('lualine').setup {
    options = {
        theme = 'dracula-nvim'
    }
}
require('nvim-autopairs').setup {}
require("mason").setup()
local telescope = require("telescope")
telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    defaults = {
        history = {
            path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
            cycle_wrap = true,
        },
        mappings = {
            i = {
                ["<C-.>"] = require('telescope.actions').cycle_history_next,
                ["<C-,>"] = require('telescope.actions').cycle_history_prev,
            }
        }
    }
})
telescope.load_extension("ui-select")
telescope.load_extension("smart_history")

-- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

require('lspconfig').gopls.setup({})
require('lspconfig').sumneko_lua.setup({})

-- Completion plugin
local cmp = require('cmp')
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Esc>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    -- Installed sources:
    sources = {
        { name = 'path' }, -- file paths
        { name = 'nvim_lsp', keyword_length = 2 }, -- from language server
        { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 }, -- source current buffer
        { name = 'vsnip', keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
        { name = 'calc' }, -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- auto format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
