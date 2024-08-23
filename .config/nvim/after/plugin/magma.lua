-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>mi', "<cmd>MagmaInit<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', "<cmd>MagmaEvaluateLine<CR>", { silent = true })
vim.api.nvim_set_keymap('v', '<Leader>r', ":<C-u>MagmaEvaluateVisual<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rc', "<cmd>MagmaReevaluateCell<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rd', "<cmd>MagmaDelete<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ro', "<cmd>MagmaShowOutput<CR>", { silent = true })

-- Settings
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "kitty"

-- Function definition using Lua
local function MagmaInitPython()
    vim.cmd('MagmaInit python3')
end

-- Command creation
vim.api.nvim_create_user_command('MagmaInitPython', MagmaInitPython, {})
