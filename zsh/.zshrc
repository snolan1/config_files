# .zshrc
# Steve Nolan
#
# To use this file, you can just source it from a .zshrc in your home directory.
# For example:
#
    # source /path/to/git/repo/config_files/zsh/.zshrc

# Shell aliases
alias ls='ls -G'
alias ll='ls -alF'
alias grep='grep --color=auto'

# VI-mode enabled
bindkey -v

# Ctrl-P and Ctrl-N history navigation
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Ctrl-R incremental search backward
bindkey "^R" history-incremental-pattern-search-backward

# Enable completion
autoload -Uz compinit && compinit -i

# Confirm message
echo "Steve zsh preferences loaded."
