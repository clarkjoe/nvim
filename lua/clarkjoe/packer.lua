return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- nvim-jdtls
        use 'mfussenegger/nvim-jdtls'

        -- Colorschemes
        use "EdenEast/nightfox.nvim"

        -- Lualine
        use 'nvim-lualine/lualine.nvim'

        -- gitblame
        use 'f-person/git-blame.nvim'

        -- gitsigns
        --use 'lewis6991/gitsigns.nvim'

        -- lsp server configuration
        use 'williamboman/mason.nvim'
        use('williamboman/mason-lspconfig.nvim', { branch = 'main' })
        use 'neovim/nvim-lspconfig'

        -- autocompletion
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

        -- linter
        use 'mfussenegger/nvim-lint'

        -- Tree View
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        -- Telescope (fuzzy finder)
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.4',
            -- or                            , branch = '1.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }
        -- TreeSitter
        use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
        use('nvim-treesitter/playground')
        -- UndoTree
        use('mbbill/undotree')

        -- Comment
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }
        -- Fold
        use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

        -- Vim-Fugitive
        use 'tpope/vim-fugitive'

        -- nvim-dbee
        use {
            "kndndrj/nvim-dbee",
            requires = {
                "MunifTanjim/nui.nvim",
            },
            run = function()
                -- Install tries to automatically detect the install method.
                -- if it fails, try calling it with one of these parameters:
                --    "curl", "wget", "bitsadmin", "go"
                require("dbee").install()
            end,
            config = function()
                require("dbee").setup(--[[optional config]])
            end
        }

        use 'aklt/plantuml-syntax'
        use 'tyru/open-browser.vim'
        use 'weirongxu/plantuml-previewer.vim'
        --use 'dhruvasagar/vim-table-mode'

        -- markdown preview
        use {
            "ellisonleao/glow.nvim",
            config = function()
                require("glow").setup()
            end
        }
    end)
