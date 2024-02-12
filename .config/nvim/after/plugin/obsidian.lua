require("obsidian").setup({
    workspaces = {
        {
            name = "garden",
            path = "~/dev/digital_garden/content",
        }
    },
    daily_notes = {
        -- folder = "Daily Notes",
        date_format = "%Y%m%d",
        template = "Daily Note Template",
    },
    templates = {
        subdir = "templates",
    },
})
