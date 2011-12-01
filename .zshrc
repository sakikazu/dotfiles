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
autoload colors
colors
case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    PROMPT="%{${fg[red]}%}%/%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        #PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
        PROMPT=$'\n'"%{${fg[cyan]}%}${USER}@${HOST%%.*} ${PROMPT}"$'\n'"$ "
    ;;
esac



# auto change directory
#
setopt auto_cd

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

alias cd_www="cd /var/www/html/"
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

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias r="rails"


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
else
  export | grep '^SSH_' > ~/.ssh/fix_ssh_env
fi


#============================================================
# sakikazu
#============================================================

#sudo ntpdate 130.69.251.23

#ssh-agent
#eval `ssh-agent`
#ssh-add ~/.ssh/id_rsa

alias ssh_btoc='ssh -p 10022 reference2.drecom.jp -l kazutaka_sakimura'

alias ssh_ad1='ssh -p 10022 192.168.112.11 -l kazutaka_sakimura'
alias ssh_ad2='ssh -p 10022 192.168.112.12 -l kazutaka_sakimura'

alias ssh_sp1='ssh -p 10022 192.168.105.11 -l kazutaka_sakimura'
alias ssh_sp2='ssh -p 10022 192.168.105.12 -l kazutaka_sakimura'

alias ssh_ads_xen='ssh drecom-adfit@192.168.10.198'
alias s='source'
alias adserv='ruby ~/ad4u/adfit/script/server'

export JAVA_HOME=/usr/local/jdk1.6.0_11/
export PATH=/home/sakikazu/dev/public_html/php/matabun/cake/console:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/local/flex/bin:$JAVA_HOME/bin

export RUBYLIB=/usr/local/lib/ruby/gems/1.8/lib
export GEM_HOME=/usr/lib/ruby/gems/1.8
# export GEM_HOME=/usr/local/lib/ruby/gems/1.8:/usr/lib/ruby/gems/1.8
export GEM_PATH=/usr/lib/ruby/gems/1.8
# export GEM_PATH=/usr/local/lib/ruby/gems/1.8:/usr/lib/ruby/gems/1.8

export EDITOR=vi
export SVN_EDITOR=vi

export LD_LIBRARY_PATH=/usr/local/lib


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



#=============================================================
alias backgroundrb_serv_restart='rake backgroundrb:stop;rake backgroundrb:start'


### RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
