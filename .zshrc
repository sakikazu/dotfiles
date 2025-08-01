### asdf
# asdf をzsh + git環境で使う場合の定義
# トップ部分に置く必要があるとのこと。そうでないと「command not found: compdef」エラーがzsh立ち上げる度に出た
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

###########################################################
# oh-my-zsh
###########################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
## fzf: https://github.com/junegunn/fzf
#       ctrl + r: コマンド履歴からファジー検索
#       ctrl + t: ファイルパスをファジー検索して補完に挿入 (ex. vim <ctrl + t>)
## z: `z foo` でよく使うディレクトリにジャンプできる（まだ便利さがわからない）
## fzf-tabは未導入だが気になるのでメモ
plugins=(git fzf z)

# zshの無名functionみたいなやつを評価する設定はこれか
setopt prompt_subst

source $ZSH/oh-my-zsh.sh

# powerlevel10k の設定を読み込む
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


###########################################################
# via 男のzsh
###########################################################

# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

# git diffなどで日本語が文字化けする問題の対処
export LESSCHARSET=utf-8

# cdとlsの省略
#
# auto change directory
setopt auto_cd
function chpwd() { ls -lhsa}

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -e

# やっぱEmacs式に戻ります。。
# bindkey -v

# bindkey -v にするとC-rの「bck-i-search」が使えなくなるのでその対処
# bindkey '^R' history-incremental-search-backward

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-on
autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^Z' predict-off
zstyle ':predict' verbose true


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias vi="nvim.appimage"
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias ls="ls -h"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -ltr"
alias lla="ls -altr"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias r="rails"
alias s='source'
alias less='less -NR'

alias tmux-rails='/home/sakikazu/dotfiles/tools/tmux_for_rails.sh'
alias cdl='source ~/dotfiles/tools/cdl.sh'

# oh-my-zsh で定義済みのものを上書き
alias gb="git branch-sort"

export EDITOR=vi
export SVN_EDITOR=vi

export LD_LIBRARY_PATH=/usr/local/lib

# 環境依存設定ファイル
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
