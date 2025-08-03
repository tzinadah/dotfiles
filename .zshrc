# install zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Auto-completions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color -a $realpath"

# Auto-suggestions
zinit light zsh-users/zsh-autosuggestions

# fzf
eval "$(fzf --zsh)"
zinit light Aloxaf/fzf-tab

# Keybindings
bindkey "^y" autosuggest-accept
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias performance='asusctl profile -P Performance'
alias quiet='asusctl profile -P Quiet'
alias vi="nvim"
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

# SSH Credentials
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add -l 2>/dev/null | grep -q "id_uni" || ssh-add ~/.ssh/id_uni >/dev/null 2>&1

# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# Append PATH

# Cargo binaries (tailwind formatter)
# Cuda binaries
export PATH="$HOME/.local/bin/:$HOME/.cargo/bin:/opt/cuda/bin:$PATH"
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# Helper functions

# Git staging and commiting
commit() {
    git add -A
    git commit -m "$1"
}

# Git creating new branch
branch() {
    git checkout -b "$1"
}

# Git creating issue
issue() {
    gh issue create --title "$1" --body ""
}

# Git listing issues
issues() {
    gh issue list
}

# Git pull request
pr() {
    # Usage: pr "PR title" "PR body"
    local title="$1"
    local body="$2"

    # Get current branch name
    local branch
    branch=$(git symbolic-ref --short HEAD)

    # Push current branch
    git push -u origin "$branch"

    # Create PR and get URL
    gh pr create --base dev --head "$branch" --title "$title" --body "$body"

}

# Git pull request to main
prmain() {
    # Usage: pr "PR title" "PR body"
    local title="$1"
    local body="$2"

    # Get current branch name
    local branch
    branch=$(git symbolic-ref --short HEAD)

    # Push current branch
    git push -u origin "$branch"

    # Create PR and get URL
    gh pr create --base main --head "$branch" --title "$title" --body "$body"

}

docker_cleanup() {
    docker stop "$(docker ps -aq)"
    docker rm --force "$(docker ps -aq)"
    docker rmi "$(docker images -aq)"
    docker volume rm "$(docker volume ls -q)"
    docker network rm "$(docker network ls -q | grep -v '^bridge$\|^host$\|^none$')"
    docker system prune -af --volumes
    docker builder prune -af
}

# Prompt
eval "$(oh-my-posh init zsh)"
