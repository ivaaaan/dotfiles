source ~/.config/fish/git.fish
source ~/.config/fish/aliases.fish

set -U FZF_TMUX 1

set fish_greeting

fish_vi_key_bindings

fish_add_path $RUSTPATH $GOPATH $PATH $PATHTOGO $BIN ~/bin

set EDITOR nvim
set HISTCONTROL ignorespace
set FZF_DEFAULT_COMMAND 'rg --hidden --files --ignore-file .git/'

function pman
  man -t $argv[1] 2>/dev/null | open -f -a Preview
end

if status is-interactive
and not set -q TMUX
  exec tmux -u
end

set -gx PATH $PATH $HOME/.krew/bin
kubectl completion fish | source
