require("catppuccin").setup({
  transparent_background = true,
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


-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- function ColorMyPencils(color)
--     color = color or "catppuccin"
--     vim.cmd.colorscheme(color)
--  
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--  
-- ColorMyPencils()
