# dotfiles
My dotfiles

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
$ git clone git@github.com:CarterT27/dotfiles.git
$ cd dotfiles
```
Then use GNU Stow to create symlinks

**WARNING**: This might not play nicely with existing configurations. I recommend selectively adding configurations as you see fit.

```Bash
$ stow .
```

# Custom macOS opener app (Kitty + Neovim)

This repo includes a Finder opener app source that launches files in Kitty tabs with Neovim (via Kitty remote control).

Install the app bundle:

```Bash
$ ./scripts/install-open-in-kitty-nvim-app.sh
```

This installs `Open in Kitty nvim.app` into `~/Applications`.

Optional flags:

- `--system`: install into `/Applications` (may require sudo permissions)
- `--set-defaults`: set `.md`, `.txt`, and `.log` defaults using `duti` (`brew install duti`)

Example:

```Bash
$ ./scripts/install-open-in-kitty-nvim-app.sh --set-defaults
```

To set all PDFs to open with Skim:

```Bash
$ ./scripts/set-pdf-default-to-skim.sh
```
