function current_branch
	git branch --show-current
end

alias gs='git status'
alias gd ='git diff --staged'
alias gpull='git pull origin (current_branch)'
alias gpush='git push origin (current_branch)'
alias gcurr='git rev-parse --short=8 HEAD'
alias gb='git branch --sort=-committerdate'
