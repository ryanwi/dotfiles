if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY          # write the history file in the ":start:elapsed;command" format.
setopt HIST_REDUCE_BLANKS        # remove superfluous blanks before recording entry.
setopt SHARE_HISTORY             # share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS      # delete old recorded entry if new entry is a duplicate.

alias tmux="TERM=screen-256color-bce tmux"
alias be="bundle exec"
alias ll="ls -lhA"
alias h=history

export EDITOR='nvim'
alias vim='nvim'
alias vi='nvim'

export PATH="$HOME/.bin:$HOME/bin:$PATH"

# Docker
export DOCKER_ENABLED=true
export DOCKER_BUILDKIT=1

# Git
alias 'gs=git status'
alias 'gd=git diff'
alias 'gl=git log --oneline'

# Generic gcloud Aliases
alias gcels="gcloud compute instances list"
alias gccl="gcloud config configurations list"
alias gcca="gcloud config configurations activate $1"
alias gcil="gcloud compute instances list"
alias gcid="gcloud compute instances describe $1"
alias gsil="gcloud sql instances list"
alias gkl="gcloud container clusters list"
alias gkc="gcloud container clusters get-credentials $1"

# Kubernetes
#source <(kubectl completion zsh)
#alias k="kubectl"
#complete -F __start_kubectl k
#source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
#PROMPT='$(kube_ps1)'$PROMPT
 
# prompt
source ~/dev/zsh-git-prompt/zshrc.sh
PROMPT='%B%~%b$(git_super_status)%# '

# SSH to a specific Google Cloud Instance
gssh () {
  gcloud compute ssh --internal-ip --zone "$(gcloud compute instances list --format="value(ZONE)" --filter="name=$1")" $1
}
# SSH to the first server that matches the name
tssh () {
  compute_instance_info=$(gcloud compute instances list --format="value(NAME,ZONE)" --filter="name:$1" | head -n 1)
  compute_instance_name="$(echo -n $compute_instance_info | awk '{print $1}')"
  compute_instance_zone="$(echo -n $compute_instance_info | awk '{print $2}')"
  gcloud compute ssh --internal-ip --zone "$compute_instance_zone" "$compute_instance_name"
}
 
# GitHub CLI
if [ -f ~/.github ]; then
  source ~/.github
fi

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ryan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ryan/google-cloud-sdk/completion.zsh.inc'; fi

# pick older homebrew versions
#export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
#export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

# point python to python3
export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
