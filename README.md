# dotfiles
My dotfiles

## Overview

This is my macOS development environment configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/) for symlink-based dotfile management.

### Window Management

I use [AeroSpace](https://github.com/nikitabobko/AeroSpace) for tiling window management on macOS. It provides i3-like keyboard-driven workflow with workspaces, automatic window tiling, and seamless navigation using `alt+h/j/k/l` for focus and `alt+shift+h/j/k/l` for moving windows.

### Editor & Terminal

- **Neovim** (nightly) - My primary editor, configured with LSP support via `nvim-lspconfig` and `mason.nvim`, Treesitter for syntax highlighting, Telescope for fuzzy finding, and `vim.pack` for plugin management.
- **tmux** - Terminal multiplexer with `vim-tmux-navigator` for seamless pane navigation between tmux and Neovim, plus `tmux-resurrect` and `tmux-continuum` for session persistence.
- **Kitty** - GPU-accelerated terminal with remote control support and powerline tab bar.

### AI-Assisted Development

I use [OpenCode](https://opencode.ai) as my AI coding assistant. The configuration includes custom agent modes (tutor, yolo), MCP server integrations (Context7 for docs), and the `opencode.nvim` plugin for Neovim integration.

### Package Management

[Homebrew](https://brew.sh/) handles all package installation via a `Brewfile` that includes:
- Development tools: `neovim`, `tmux`, `git`, `mise`, `uv`, `ripgrep`, `fd`, `fzf`
- Languages/runtimes: `lua-language-server`, `tree-sitter`, `texlive`, `pandoc`, `typst`
- CLI utilities: `zoxide`, `lazygit`, `htop`, `gh`, `awscli`
- Casks: `aerospace`, `kitty`, `zen`, `cursor`, `obsidian`, `zotero`

### Shell

Zsh configured with [z4h (zsh4humans)](https://github.com/romkatv/zsh4humans) for fast startup, autosuggestions, and modern completions. Includes `zoxide` for smart directory jumping and `mise` for runtime version management.

### Browser

I'm currently using [Zen Browser](https://github.com/zen-browser/desktop) for its single-window workspace functionality, container support for isolating contexts, and because it's open source.

# Features
- Improves MacOS UI/UX
- Edit text files in vim

# Requirements
Ensure you have the following on your system
- Git
- Stow
- Neovim nightly: `brew install neovim --HEAD`

# Installation
First, clone the repository to your $HOME directory using git
```Bash
git clone git@github.com:CarterT27/dotfiles.git
cd dotfiles
```
Then use GNU Stow to create symlinks

**WARNING**: This might not play nicely with existing configurations. I recommend selectively adding configurations as you see fit.

```Bash
stow .
```

# Custom macOS opener app (Kitty + Neovim)

This repo includes a Finder opener app source that launches files in Kitty tabs with Neovim (via Kitty remote control).

Install the app bundle:

```Bash
./scripts/install-open-in-kitty-nvim-app.sh
```

This installs `Open in Kitty nvim.app` into `~/Applications`.

Optional flags:

- `--system`: install into `/Applications` (may require sudo permissions)
- `--set-defaults`: set `.md`, `.txt`, and `.log` defaults using `duti` (`brew install duti`)

Example:

```Bash
./scripts/install-open-in-kitty-nvim-app.sh --set-defaults
```

To set all PDFs to open with Skim:

```Bash
./scripts/set-pdf-default-to-skim.sh
```
