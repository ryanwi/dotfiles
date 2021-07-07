if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

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
source <(kubectl completion zsh)
alias k="kubectl"
complete -F __start_kubectl k
 
# prompt
source ~/dev/zsh-git-prompt/zshrc.sh
PROMPT='%B%~%b$(git_super_status)%# '

source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ryan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ryan/google-cloud-sdk/completion.zsh.inc'; fi

# pick older homebrew versions
#export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
#export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

