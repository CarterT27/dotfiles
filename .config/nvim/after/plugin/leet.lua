require("leetcode").setup({
    lang = 'python3',
    injector = { ---@type table<lc.lang, lc.inject>
        ["python3"] = {
            before = true
        },
    }
})

vim.keymap.set("n", "<C-'>", ":Leet run<CR>")
vim.keymap.set("n", "<C-=>", ":Leet submit<CR>")
