-- This is necessary for VimTeX to load properly.
-- The "indent" is optional.
-- Note that most plugin managers will do this automatically.
vim.api.nvim_command('filetype plugin indent on')

-- This enables Neovim's syntax-related features. Without this, some VimTeX features will not work.
vim.api.nvim_command('syntax enable')
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g:vimtex_quickfix_mode=0
vim.api.nvim_command('set conceallevel=1')
g:tex_conceal='abdmg'
