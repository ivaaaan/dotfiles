source ~/.config/fish/git.fish
source ~/.config/fish/aliases.fish

set fish_greeting

fish_vi_key_bindings
fish_add_path ~/go/bin
fish_add_path ~/.cargo/bin
fish_add_path /usr/local/go/bin

set PATH $RUSTPATH $GOPATH $PATH $PATHTOGO $BIN
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
set -lx KUBECONFIG (string join ':' ~/.kube/config-*)
kubectl completion fish | source
