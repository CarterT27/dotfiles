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
})
