# git aliases
FUNCTION git_status_short {git status -sb $args}
Set-Alias gst git_status_short -force -Option AllScope

FUNCTION git_push {git push $args}
Set-Alias gp git_push -force -Option AllScope

FUNCTION git_pull {git pull $args}
Set-Alias gl git_pull -force -Option AllScope

FUNCTION git_diff {git diff $args}
Set-Alias gd git_diff

FUNCTION git_add {git add $args}
Set-Alias ga git_add

FUNCTION git_commit_all_message {git commit -am $args}
Set-Alias gcam git_commit_all_message

# misc
Set-Alias vim nvim

FUNCTION last_vim {nvim -c 'norm \`0'}
Set-Alias lvim last_vim

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete
