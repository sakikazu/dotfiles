###########################################################
# oh-my-zsh
###########################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

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
plugins=(git ruby osx bundler brew rails emoji-clock)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...





###########################################################
# via 男のzsh
###########################################################

# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8


## Default shell configuration
#
# set prompt
#

# git branch名表示
[ -f ${HOME}/dotfiles/zsh_tools/git_prompt.sh ] && source ${HOME}/dotfiles/zsh_tools/git_prompt.sh

# autoload colors
# colors
# case ${UID} in
# 0)
#     PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#     PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#     SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#         PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#     ;;
# *)
#     PROMPT="%{${fg[red]}%}%/%{${reset_color}%} "
#     PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#     SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#         #PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#         PROMPT=$'\n'"%{${fg[cyan]}%}${USER}@${HOST%%.*} ${PROMPT}"$'\n'"$ "
#     ;;
# esac



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


## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


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

alias vi="vim"
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


case "${OSTYPE}" in
darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    ;;
freebsd*)
    case ${UID} in
    0)
        updateports() 
        {
            if [ -f /usr/ports/.portsnap.INDEX ]
            then
                portsnap fetch update
            else
                portsnap fetch extract update
            fi
            (cd /usr/ports/; make index)

            portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac


## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac


## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


# fix ssh env
#screenでssh-agentの状態を保持しておくため
#http://blog.s21g.com/articles/97
if [ "$TERM" = "screen" ]; then
  alias fixsshenv='cat ~/.ssh/fix_ssh_env | sh'
  alias ssh='fixsshenv; ssh'
  alias svn='fixsshenv; svn'
# else
  # export | grep '^SSH_' > ~/.ssh/fix_ssh_env
fi


#---------------------------
#------- for screen ---------
#---------------------------

#個別に名前付けた方がわかりやすいので、無効にする
#ステータスラインに各ウィンドウで打ったコマンドを表示
#if [ "$TERM" = "screen" ]; then
#	chpwd () { echo -n "_`dirs`\\" }
#	preexec() {
#		# see [zsh-workers:13180]
#		# http://www.zsh.org/mla/workers/2000/msg03993.html
#		emulate -L zsh
#		local -a cmd; cmd=(${(z)2})
#		case $cmd[1] in
#			fg)
#				if (( $#cmd == 1 )); then
#					cmd=(builtin jobs -l %+)
#				else
#					cmd=(builtin jobs -l $cmd[2])
#				fi
#				;;
#			%*) 
#				cmd=(builtin jobs -l $cmd[1])
#				;;
#			cd)
#				if (( $#cmd == 2)); then
#					cmd[1]=$cmd[2]
#				fi
#				;&
#			*)
#				echo -n "k$cmd[1]:t\\"
#				return
#				;;
#		esac
#
#		local -A jt; jt=(${(kv)jobtexts})
#
#		$cmd >>(read num rest
#			cmd=(${(z)${(e):-\$jt$num}})
#			echo -n "k$cmd[1]:t\\") 2>/dev/null
#	}
#	chpwd
#fi




#============================================================
# 環境依存
#============================================================

#sudo ntpdate 130.69.251.23

#ssh-agent
#eval `ssh-agent`
#ssh-add ~/.ssh/id_rsa

alias cd_www="cd /var/www/html/"
alias ssh_btoc='ssh -p 10022 reference2.drecom.jp -l kazutaka_sakimura'

alias ssh_ad1='ssh -p 10022 192.168.112.11 -l kazutaka_sakimura'
alias ssh_ad2='ssh -p 10022 192.168.112.12 -l kazutaka_sakimura'

alias ssh_sp1='ssh -p 10022 192.168.105.11 -l kazutaka_sakimura'
alias ssh_sp2='ssh -p 10022 192.168.105.12 -l kazutaka_sakimura'

alias ssh_ads_xen='ssh drecom-adfit@192.168.10.198'
alias adserv='ruby ~/ad4u/adfit/script/server'

alias backgroundrb_serv_restart='rake backgroundrb:stop;rake backgroundrb:start'

alias javac="javac -J-Dfile.encoding=UTF8"

export EDITOR=vi
export SVN_EDITOR=vi

export LD_LIBRARY_PATH=/usr/local/lib


### rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


### for CakePHP
#export PATH=/var/www/cakephp/hoge1/app/Console:$PATH
## ★ 見せしめに残しておくか。↑はSM以外のサーバーの設定だったが、SMでこれが効くと、ログインできなくなってしまってた。suになって、su -f sakikazuとすることでログインできた・・
## telnetでもConnection Refusedとかなってたしなぁ

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm


# 環境依存設定ファイル
[ -f ${HOME}/dotfiles/.zshrc.local ] && source ${HOME}/dotfiles/.zshrc.local

