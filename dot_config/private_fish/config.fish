source ~/.config/fish/git.fish
source ~/.config/fish/aliases.fish

export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40%
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file .git/'
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'

fzf --fish | source

set fish_greeting

fish_vi_key_bindings

fish_add_path /opt/homebrew/bin /Users/ivan/.local/bin /Users/ivan/.foundry/bin


set EDITOR nvim
set HISTCONTROL ignorespace

function pman
  man -t $argv[1] 2>/dev/null | open -f -a Preview
end

if status is-interactive
and not set -q TMUX
  exec tmux -u
end

kubectl completion fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

source $HOME/.asdf/plugins/golang/set-env.fish

eval "$(/opt/homebrew/bin/brew shellenv)"

function venv --description "Create and activate a new virtual environment"
    echo "Creating virtual environment in "(pwd)"/.venv"
    python3 -m venv .venv --upgrade-deps
    source .venv/bin/activate.fish

    # Append .venv to the Git exclude file, but only if it's not
    # already there.
    if test -e .git
        set line_to_append ".venv"
        set target_file ".git/info/exclude"

        if not grep --quiet --fixed-strings --line-regexp "$line_to_append" "$target_file" 2>/dev/null
            echo "$line_to_append" >> "$target_file"
        end
    end

    # Tell Time Machine that it doesn't need to both backing up the
    # virtualenv directory. (macOS-only)
    # See https://ss64.com/mac/tmutil.html
    tmutil addexclusion .venv
end

source "$HOME/.cargo/env.fish"
