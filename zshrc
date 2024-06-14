# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# source ~/.bashrc
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

ZSH_THEME_RANDOM_CANDIDATES=("sonicradish" "agnoster" "tjkirch" "geoffgarside" "intheloop" "fox" "kafeitu" "fwalch" "tjkirch_mod" "nicoulaj" "jaischeema" "sorin" "steeef" "dpoggi" "jnrowe" "miloshadzic" "nanotech" "candy-kingdom" "wezm" "dieter" "trapd00r" "tonotdo" "sporty_256")

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/meshulam/.zshrc'

autoload -Uz compinit
compinit

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract web-search battery chucknorris)

source $ZSH/oh-my-zsh.sh

# User configuration

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
# alias ls='ls -A'

export VISUAL=nvim
export EDITOR="$VISUAL"
alias vim='nvim'

# seems to fix aliases not applying to vim terminal
setopt aliases

# Bind vim-like movement:
bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search
bindkey '^L' forward-char
bindkey '^H' backward-char

#disable pause key 
bindkey -s '^Z' ''

# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol
