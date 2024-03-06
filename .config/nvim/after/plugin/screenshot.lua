require('carbon-now').setup({open_cmd = "open"})

vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true })
