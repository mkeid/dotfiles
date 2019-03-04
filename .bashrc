export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="~/bin:$PATH"

export PS1="\u@\h:\W \\$ \[$(tput sgr0)\]"
export PS1="\e[0;32m$PS1\e[m"

export CLICOLOR=1
export TERM="xterm-256color"

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
