export PS1="\[$(tput bold)\]\u@\h:\w \\$ \[$(tput sgr0)\]"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export CLICOLOR=1
export TERM=xterm-256color

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
