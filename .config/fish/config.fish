###############################################################################
#  
#   ▖  ▖      ▘  ▗      ▐       ▗▄▄                  ▗▘     ▐    ▝
#   ▌▐ ▌ ▄▖  ▄▖ ▗▟▄  ▄▖ ▐ ▗     ▐  ▌▗ ▗  ▖▄ ▗▄▄ ▗ ▗ ▗▗▖  ▄▖ ▐ ▗ ▗▄
#   ▘▛▌▌▐▘▜   ▌  ▐  ▐▘▐ ▐▗▘     ▐▄▄▘▐ ▐  ▛ ▘  ▞ ▝▖▞ ▐▘▐ ▐ ▝ ▐▗▘  ▐
#   ▐▌█▘▐ ▐   ▌  ▐  ▐▀▀ ▐▜      ▐  ▌▐ ▐  ▌   ▞   ▙▌ ▐ ▐  ▀▚ ▐▜   ▐
#   ▐ ▐ ▝▙▛   ▌  ▝▄ ▝▙▞ ▐ ▚     ▐▄▄▘▝▄▜  ▌  ▐▄▄  ▜  ▐ ▐ ▝▄▞ ▐ ▚ ▗▟▄
#             ▌                                  ▞
#            ▀                                  ▝▘
#   
###############################################################################
# cd aiases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

###############################################################################
#ls aliases
alias ls="exa -al --color=always --group-directories-first"
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"

###############################################################################
# git aliases

#commit with messaage
alias gcam="git commit -a -m" 

#push to origin master branch
alias gpom="git push origin master"

###############################################################################
# other aliases

# neovim
alias vi="nvim"
# thesis project
alias ecs="cd ~/Projects/C++/ECS"

###############################################################################
# config files

# qtile config
alias qtc="cd ~/.config/qtile" 
# fish shell
alias fc="cd  ~/.config/fish"
# neovim
alias nc="cd ~/.config/nvim"
# starship prompt
alias sc="vi ~/.config/starship.toml"

# dotfiles repository
alias dotfiles="/usr/bin/git --git-dir=/home/wojto/.dotfiles/ --work-tree=/home/wojto"

###############################################################################
# run starship prompt
starship init fish | source
