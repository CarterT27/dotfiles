-- ============================================================================
-- NEOVIM CONFIGURATION - Single File Setup with vim.pack
-- ============================================================================

-- ----------------------------------------------------------------------------
-- SECTION 1: Leader Key (must be set before plugins)
-- ----------------------------------------------------------------------------
vim.g.mapleader = " "

-- ----------------------------------------------------------------------------
-- SECTION 2: Settings
-- ----------------------------------------------------------------------------
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd('set background=dark')

vim.loader.enable()

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

-- VimTeX settings
vim.g.tex_flavor = 'latex'
vim.opt.conceallevel = 0

-- Magma settings
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "kitty"

-- ----------------------------------------------------------------------------
-- SECTION 3: General Keymaps (non-plugin specific)
-- ----------------------------------------------------------------------------
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>pu", function()
    vim.pack.update()
end, { desc = "Update all plugins" })

vim.keymap.set("n", "gr", "gd[{V%::s/<C-R>///gc<left><left><left>")
vim.keymap.set("n", "gR", "gD:%s/<C-R>///gc<left><left><left>")

-- ----------------------------------------------------------------------------
-- SECTION 4: Plugin Registration (vim.pack)
-- ----------------------------------------------------------------------------
vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/ThePrimeagen/harpoon",
    "https://github.com/mbbill/undotree",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/VonHeikemen/lsp-zero.nvim",
    "https://github.com/wakatime/vim-wakatime",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/kdheepak/lazygit.nvim",
    "https://github.com/jpalardy/vim-slime",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/NickvanDyke/opencode.nvim",
    -- Lazy-loaded plugins (opt = true)
    { src = "https://github.com/epwalsh/obsidian.nvim", opt = true },
    { src = "https://github.com/lervag/vimtex", opt = true },
    { src = "https://github.com/chomosuke/typst-preview.nvim", opt = true },
    { src = "https://github.com/morsecodist/magma-nvim", opt = true },
    { src = "https://github.com/ellisonleao/carbon-now.nvim", opt = true },
})

-- ----------------------------------------------------------------------------
-- SECTION 5: Plugin Configurations
-- ----------------------------------------------------------------------------

-- Colorscheme (Catppuccin)
require("catppuccin").setup({
    transparent_background = true,
    float = {
        enabled = true,
        transparent = true,
        solid = false,
    },
    custom_highlights = function(colors)
        local u = require("catppuccin.utils.colors")
        return {
            CursorLine = {
                bg = u.vary_color(
                    { latte = u.lighten(colors.mantle, 0.70, colors.base) },
                    u.darken(colors.surface0, 0.64, colors.base)
                ),
            },
        }
    end,
})
vim.cmd.colorscheme("catppuccin")

-- Which-key
require("which-key").setup()

-- Lazydev
require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- Harpoon 2 - Temporarily disabled due to JSON encoding bug with function references
local harpoon = require("harpoon")
harpoon.setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- LSP Zero + Mason + nvim-cmp
local lsp_zero = require("lsp-zero")

local lsp_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp_zero.extend_lspconfig({
    sign_text = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    },
    lsp_attach = lsp_attach,
})

-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        -- Default handler for all servers
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

-- Modern Neovim v0.11+ approach for lua_ls configuration
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

-- nvim-cmp setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        {name = 'lazydev', group_index = 0},
        {name = 'nvim_lsp'},
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

vim.diagnostic.config({
    virtual_text = true
})

-- Comment.nvim
require('Comment').setup()

-- LazyGit
vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)

-- nvim-notify
require("notify").setup({
    background_colour = '#000000',
    merge_duplicates = true,
})

-- Snacks.nvim (required for opencode.nvim)
require("snacks").setup({
    input = {},
    picker = {},
    terminal = {},
})

-- Opencode.nvim
vim.g.opencode_opts = {
    port = 3210,
    provider = {
        enabled = "tmux",
        cmd = "opencode --port 3210"
    }
}
vim.o.autoread = true

-- Opencode keymaps
vim.keymap.set({ "n", "x" }, "<leader>oa", function()
    require("opencode").ask("@this: ", { submit = true })
end, { desc = "OpenCode: Ask with context" })

vim.keymap.set({ "n", "x" }, "<leader>os", function()
    require("opencode").select()
end, { desc = "OpenCode: Select command" })

vim.keymap.set({ "n", "t" }, "<leader>ot", function()
    require("opencode").toggle()
end, { desc = "OpenCode: Toggle interface" })

vim.keymap.set({ "n", "x" }, "go", function()
    return require("opencode").operator("@this ")
end, { expr = true, desc = "OpenCode: Operator mode" })

-- ----------------------------------------------------------------------------
-- SECTION 6: Autocmds
-- ----------------------------------------------------------------------------

-- PackChanged autocmd for automatic treesitter updates
vim.api.nvim_create_autocmd("User", {
    pattern = "PackChanged",
    callback = function()
        vim.cmd("TSUpdate")
    end,
})

-- ----------------------------------------------------------------------------
-- Lazy-loaded plugin configurations
-- ----------------------------------------------------------------------------

-- Obsidian.nvim - load on markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.cmd.packadd("obsidian.nvim")
        require("obsidian").setup({
            workspaces = {
                {
                    name = "garden",
                    path = "~/Development/digital_garden/content",
                }
            },
            daily_notes = {
                folder = "daily notes",
                date_format = "%Y-%m-%d",
                template = "Daily Note.md",
            },
            note_id_func = function(title)
                return title
            end,
            disable_frontmatter = true,
            templates = {
                subdir = "templates",
            },
            follow_url_func = function(url)
                vim.fn.jobstart({"open", url})
            end,
        })

        vim.keymap.set("n", "<C-n>d", vim.cmd.ObsidianToday, { buffer = true })
        vim.keymap.set("n", "<C-n>f", vim.cmd.ObsidianQuickSwitch, { buffer = true })
        vim.keymap.set("n", "<C-n>o", vim.cmd.ObsidianOpen, { buffer = true })
        vim.keymap.set("n", "<C-n>t", vim.cmd.ObsidianTemplate, { buffer = true })
    end,
    once = true,
})

-- VimTeX - load on tex/latex files
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"tex", "latex"},
    callback = function()
        vim.cmd.packadd("vimtex")
    end,
    once = true,
})

-- Typst Preview - load on typst files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        vim.cmd.packadd("typst-preview.nvim")
        require('typst-preview').setup({
            debug = true,
        })
    end,
    once = true,
})

-- Magma - load on python files or manual init
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.cmd.packadd("magma-nvim")

        vim.api.nvim_set_keymap('n', '<Leader>mi', "<cmd>MagmaInit<CR>", { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>r', "<cmd>MagmaEvaluateLine<CR>", { silent = true })
        vim.api.nvim_set_keymap('v', '<Leader>r', ":<C-u>MagmaEvaluateVisual<CR>", { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>rc', "<cmd>MagmaReevaluateCell<CR>", { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>rd', "<cmd>MagmaDelete<CR>", { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>ro', "<cmd>MagmaShowOutput<CR>", { silent = true })

        local function MagmaInitPython()
            vim.cmd('MagmaInit python3')
        end

        vim.api.nvim_create_user_command('MagmaInitPython', MagmaInitPython, {})
    end,
    once = true,
})

-- Carbon Now - load on first visual mode selection (deferred)
local carbon_loaded = false

local function load_carbon()
    if not carbon_loaded then
        vim.cmd.packadd("carbon-now.nvim")
        require('carbon-now').setup({
            base_url = "https://carbon.now.sh/",
            open_cmd = "open",
            options = {
                bg = "gray",
                drop_shadow = false,
                drop_shadow_blur = "68px",
                drop_shadow_offset = "20px",
                drop_shadow_offset_y = "20px",
                font_family = "Hack",
                font_size = "18px",
                line_height = "133%",
                line_numbers = false,
                padding_horizontal = "56px",
                padding_vertical = "56px",
                theme = "monokai",
                titlebar = "",
                watermark = false,
                width = "680",
                window_theme = "none",
            },
        })
        carbon_loaded = true
    end
end

vim.keymap.set("v", "<leader>cn", function()
    load_carbon()
    vim.cmd("'<,'>CarbonNow")
end, { silent = true })

vim.keymap.set("n", "<leader>cn", function()
    load_carbon()
    vim.cmd("%CarbonNow")
end, { silent = true })

vim.keymap.set("n", "<leader>tp", function()
    vim.cmd("TypstPreview")
end, { silent = true })
