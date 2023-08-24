function current_branch
	git branch --show-current
end

alias gst='git status'
alias gpull='git pull origin (current_branch)'
alias gpush='git push origin (current_branch)'

alias ghd='gh workflow run --ref=(current_branch)'
alias ghw='gh run watch'


