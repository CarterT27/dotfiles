# Neovim Cheatsheet

Leader key: **Space**

## Navigation & Search
- **Find file**: `<leader>pf` or `Ctrl-p` (git files only)
- **Search text**: `<leader>ps` (grep search)
- **File explorer**: `<leader>pv`

## LSP (Code Intelligence)
- **Go to definition**: `gd`
- **Go to references**: `<leader>vrr`
- **Hover/documentation**: `K`
- **Show error/warning details**: `<leader>vd` (opens float)
- **Jump to next diagnostic**: `[d`
- **Jump to prev diagnostic**: `]d`
- **Code actions**: `<leader>vca`
- **Rename**: `<leader>vrn`
- **Format code**: `<leader>f`
- **Workspace symbol search**: `<leader>vws`

## Diagnostics (Warnings/Errors)
- **Virtual text is always visible by default**
- To toggle diagnostics on/off, add this mapping to init.lua:
```lua
vim.keymap.set("n", "<leader>dt", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
```

## Editing
- **Move line down (visual)**: `J`
- **Move line up (visual)**: `K`
- **Join lines**: `J` (normal mode)
- **Search & replace word under cursor**: `<leader>s`
- **Yank to system clipboard**: `<leader>y` (normal/visual)
- **Paste without overwriting clipboard**: `<leader>p` (visual)
- **Delete to black hole register**: `<leader>d`

## Quick Lists
- **Next quickfix**: `Ctrl-k`
- **Prev quickfix**: `Ctrl-j`
- **Next location list**: `<leader>k`
- **Prev location list**: `<leader>j`

## Git
- **Git status (fugitive)**: `<leader>gs`
- **LazyGit**: `<leader>gg`

## File History
- **Undo tree**: `<leader>u`

## Harpoon (Quick File Switching)
- **Add to harpoon**: `<leader>ha`
- **Open harpoon menu**: `<leader>hm`
- **Jump to file 1-4**: `<leader>1` through `<leader>4`

## Commenting
- Uses Comment.nvim (check `:help comment.nvim` for keybindings)
- `gcc` (line), `gc` (visual/motion)

## Other
- **Help docs**: `<leader>vh`
- **Reload config**: `<leader><leader>`
- **Make file executable**: `<leader>x`
- **Signature help**: `Ctrl-h` (insert mode)
- **Tmux sessionizer**: `Ctrl-f`

## Scrolling
- **Half page down**: `Ctrl-d` (centers cursor)
- **Half page up**: `Ctrl-u` (centers cursor)
- **Next search result**: `n` (centers cursor)
- **Prev search result**: `N` (centers cursor)
