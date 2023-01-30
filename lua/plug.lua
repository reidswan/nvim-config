-- [[ plug.lua ]]

return require('packer').startup(function(use)
    use {                                              -- filesystem navigation
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
    }
    -- [[ Theme ]]
    use { 'mhinz/vim-startify' }                       -- start screen
    use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
    use {
        'nvim-lualine/lualine.nvim',                     -- statusline
        requires = {'kyazdani42/nvim-web-devicons',
                    opt = true}
     }
    use { 'Mofiqul/dracula.nvim' }
    -- [[ DEV ]]
    use {
        'reidswan/telescope.nvim',                 -- fuzzy finder
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "kkharji/sqlite.lua" },
            { "nvim-telescope/telescope-smart-history.nvim"},
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("live_grep_args")
            telescope.load_extension("ui-select")
            telescope.load_extension("smart_history")
        end
    }
    use { 'majutsushi/tagbar' }                         -- code structure
    use { 'Yggdroot/indentLine' }                       -- see indentation
    use { 'tpope/vim-fugitive' }                        -- git integration
    use { 'junegunn/gv.vim' }                           -- commit history
    use { 'windwp/nvim-autopairs' }
    use { 'voldikss/vim-floaterm' }                     -- floating terminal
    
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup ({})
        end
    }

    -- [[ LSP stuff ]]
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'neovim/nvim-lspconfig' } 

    -- [[ Completion ]]
    -- Completion framework:
    use {'hrsh7th/nvim-cmp'} 

    -- LSP completion source:
    use {'hrsh7th/cmp-nvim-lsp'}

    -- Useful completion sources:
    use {'hrsh7th/cmp-nvim-lua'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/cmp-calc'}
    
    -- Go
    use {'fatih/vim-go'}

    end,
    {
        package_root = vim.fn.stdpath('config') .. '/site/pack'
    }
)

