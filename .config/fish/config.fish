alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format

alias gcam="git commit -a -m"
alias gpom="git push origin master"

alias vi="nvim"
alias ecs="cd ~/Projects/C++/ECS"
alias nc="cd ~/.config/nvim"
alias sc="vi ~/.config/starship.toml"

alias dotfiles='/usr/bin/git --git-dir=/home/wojto/.dotfiles/ --work-tree=/home/wojto'

starship init fish | source
