require("obsidian").setup({
    workspaces = {
        {
            name = "garden",
            path = "~/dev/digital_garden/content",
        }
    },
    daily_notes = {
        -- folder = "Daily Notes",
        date_format = "%Y-%m-%d",
        template = "Daily Note.md",
    },
    note_id_func = function(title)
        -- Disable Zettelkasten title format
        return title
    end,
    disable_frontmatter = true,
    templates = {
        subdir = "templates",
    },
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({"open", url})  -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
})

vim.keymap.set("n", "<C-n>d", vim.cmd.ObsidianToday)
vim.keymap.set("n", "<C-n>f", vim.cmd.ObsidianQuickSwitch)
vim.keymap.set("n", "<C-n>o", vim.cmd.ObsidianOpen)
vim.keymap.set("n", "<C-n>t", vim.cmd.ObsidianTemplate)
