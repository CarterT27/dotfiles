local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    -- {"dylanaraps/wal.vim", priority = 1000},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"nvim-telescope/telescope.nvim", branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-treesitter/nvim-treesitter", init = TSUpdate },
	"nvim-treesitter/playground",
	"nvim-lua/plenary.nvim",
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
    "wakatime/vim-wakatime",
    "christoomey/vim-tmux-navigator",
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        version = "*",
        ft = "markdown",
        dependencies = {
            -- Required
            "nvim-lua/plenary.nvim",
            -- Optional
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter",

            -- see below for full list of optional dependencies 👇
        },
    },
    { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        'lervag/vimtex',
        lazy = false,
    },
    {
        'SirVer/ultisnips',
        'honza/vim-snippets'
    },
    {
        "ellisonleao/carbon-now.nvim",
        lazy = true,
        cmd = "CarbonNow",
        ---@param opts cn.ConfigSchema
        opts = {
            options = {
                font_family = "Fira Code",
                theme = "dracula-pro",
                titlebar = ""
            }
        }
    }
})
