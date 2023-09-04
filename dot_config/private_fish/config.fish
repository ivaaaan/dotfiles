source ~/.config/fish/git.fish
eval "$(/opt/homebrew/bin/brew shellenv)"

set fish_greeting
export HISTCONTROL=ignorespace
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file .git/'

fish_vi_key_bindings
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path ~/go/bin
fish_add_path ~/.cargo/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/.composer/vendor/bin

set PATH $RUSTPATH $GOPATH $PATH $PATHTOGO $BIN $COMPOSERBIN 

function pman
  man -t $argv[1] 2>/dev/null | open -f -a Preview
end

export EDITOR=nvim

alias vi nvim

if status is-interactive
and not set -q TMUX
  exec tmux
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ivan/google-cloud-sdk/path.fish.inc' ]; . '/Users/ivan/google-cloud-sdk/path.fish.inc'; end
