
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
fish_add_path -m ~/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Users/cartertran/.cargo/bin

set -gx GOPATH /home/cartertran/go
set -gx EDITOR nvim
set -gx PATH $PATH /usr/local/bin/go $GOPATH/bin

thefuck --alias | source
eval (starship init fish)

# Setting PATH for Python 3.11
# The original version is saved in /Users/cartertran/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

pyenv init - | source
