# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format

alias gcam="git commit -a -m"
alias gpom="git push origin master"

alias vi="nvim"
alias ecs="cd ~/Projects/C++/ECS"
alias nc="cd ~/.config/nvim"
alias sc="vi ~/.config/starship.toml"
export BROWSER="/usr/bin/vivaldi-stable"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

eval "$(starship init zsh)"
alias dotfiles='/usr/bin/git --git-dir=/home/wojto/.dotfiles/ --work-tree=/home/wojto'
