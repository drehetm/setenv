# User defined aliases

# cd to parents
alias ..='cd ..'
alias ...='cd ../..'

# Change working directory to 'setenv' repo
alias cdsetenv="cd ${SETENV_REPO_PATH}"
# Change working directory to `yonc-tools` repo
alias cdyonctools="cd ~/go/src/gitlab.services.yomobile.in/yonc/backend/yonc-tools"

# Show full `git status`
alias gsa="gfa && grbom && echo && gst && echo && glo -7"

# Use colorls instead of ls
alias ls="colorls --git-status --no-group --no-hardlinks --sort-dirs --color=always --dark --time-style='+%y-%m-%d %H:%M:%S'"
# List files in long listing format, `-g` skips owner information
alias ll='ls --long -g'
alias llf='ll --files'
alias lld='ll --dirs'
alias llt='ll --tree'
# Show all files including hidden
alias la='ll --almost-all'
alias laf='la --files'
alias lad='la --dirs'
alias lat='la --tree'
# ls original
alias lso='/bin/ls -F -G'
alias llo='lso -l'
alias lao='llo -A'

