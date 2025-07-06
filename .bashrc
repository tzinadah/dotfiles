#!/bin/bash
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# --- User Defined ---

# Helper for terminal propmt
parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null | sed -e 's/^/(/' -e 's/$/)/'
}

# Terminal prompt
PS1='\[\e[38;2;180;160;255m\]\w\[\e[0m\]\[\e[38;2;80;60;200m\] $(parse_git_branch)\[\e[0m\]> '

# Fan profiles
alias performance='asusctl profile -P Performance'
alias quiet='asusctl profile -P Quiet'

# Git Credentials
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add -l 2>/dev/null | grep -q "id_uni" || ssh-add ~/.ssh/id_uni >/dev/null 2>&1
ssh-add -l 2>/dev/null | grep -q "id_personal" || ssh-add ~/.ssh/id_personal >/dev/null 2>&1

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

    # Merge PR
    gh pr merge "$branch" --merge --delete-branch

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

    # Merge PR
    gh pr merge "$branch" --merge

}

docker_cleanup() {
    docker stop "$(docker ps -aq)"
    docker rm "$(docker ps -aq)"
    docker rmi "$(docker images -aq)"
    docker volume rm "$(docker volume ls -q)"
    docker network rm "$(docker network ls -q | grep -v '^bridge$\|^host$\|^none$')"
    docker system prune -af --volumes
    docker builder prune -af
}

# Git autocomplete
source /usr/share/git/completion/git-completion.bash

alias vi="nvim"
# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# Tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
