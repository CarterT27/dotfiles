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
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
            "BufReadPre " .. vim.fn.expand "~" .. "/Library/Mobile\\ Documents/iCloud\\~md\\~obsidian/Documents/Carter\\ Tran/**.md",
            "BufNewFile " .. vim.fn.expand "~" .. "/Library/Mobile\\ Documents/iCloud\\~md\\~obsidian/Documents/Carter\\ Tran/**.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            daily_notes = {
                folder = "Daily Notes",
                date_format = "%Y%m%d",
                template = "Daily Note",
            },
            templates = {
                subdir = "Templates",
            },
        },
    },
    { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' },
    { "lervag/vimtex", lazy = false },
})
