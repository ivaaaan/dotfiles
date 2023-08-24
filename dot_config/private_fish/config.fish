source ~/.config/fish/git.fish

set fish_greeting
export HISTCONTROL=ignorespace
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file .git/'

fish_vi_key_bindings

set GOPATH ~/go/bin
set RUSTPATH ~/.cargo/bin
set PATHTOGO = /usr/local/go/bin
set COMPOSERBIN = ~/.composer/vendor/bin

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
