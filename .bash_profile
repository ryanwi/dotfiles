if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
fi

source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PATH="/usr/local/sbin:$PATH"

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
