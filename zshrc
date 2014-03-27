# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adrian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
eval "`dircolors -b`"
alias ls='ls --color=auto'
alias enw='emacs -nw'

# Mi indicador personalizado
PROMPT="%n@%m(%?):%c%# "
