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
