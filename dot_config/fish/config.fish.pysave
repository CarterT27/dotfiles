
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
fish_add_path -m ~/.local/bin
fish_add_path /opt/homebrew/bin

set -gx GOPATH /home/cartertran/go
set -gx EDITOR lvim
set -gx PATH $PATH /usr/local/bin/go $GOPATH/bin

thefuck --alias | source
eval (starship init fish)

fish_add_path /Users/cartertran/.spicetify
