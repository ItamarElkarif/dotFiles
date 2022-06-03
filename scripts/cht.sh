#!/usr/bin/env bash
selected=`cat ~/.dotfiles/scripts/tmux-cht-languages ~/.dotfiles/scripts/tmux-cht-command | fzf`
read -p "Enter Query: " query

query=`echo $query | tr ' ' '+'`
tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
