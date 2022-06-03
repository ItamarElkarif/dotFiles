function vim
    nvim $argv
end
alias lvim='nvim -c "norm `0"'
alias fzfv='fzf | xargs nvim -o'

alias gst='git status -sb'
alias xdg-open='wsl-open'
#alias cargo=cargo.exe

alias rm='rm -i'

bind \ck history-search-backward
bind \cj history-search-forward
bind \ch backward-char
bind \cl forward-char
bind \ce end-of-line
bind \cb beginning-of-line

export VISUAL=nvim
export EDITOR="$VISUAL"

set -gx PATH $PATH /home/meshulam/.cargo/bin

# enabaling ssh for git 
if not pgrep --full ssh-agent | string collect > /dev/null
  eval (ssh-agent -c)
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3
