# If you come from bash you might have to change your $PATH.
#
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
case $(uname -s) in
    Linux)
        SED_INLINE="sed -i"
        alias udb="sudo updatedb"
        alias ls='ls --color=auto'
        export ZSH=~/.oh-my-zsh
        case $(cat /etc/*-release | ag PRETTY_NAME | cut -d '"' -f2) in
            Fedora)
                alias in="sudo dnf install -y"
                alias vi="vimx"
                ;;
            Ubuntu)
                alias ack="ack-grep"
                alias in="sudo apt-get install -y"
                alias vi="/usr/bin/vim.gtk"
                ;;
            "Arch Linux"|"Antergos Linux"|"Manjaro Linux")
                alias vi="vim"
                alias in="sudo pacman -Syu"
                #alias yay="yay -S"
                ;;
        esac
        ;;
    Darwin*)
        SED_INLINE="sed -i -e"
        export ZSH=/Users/will/.oh-my-zsh
        alias vi="nvim"
        alias in="brew install"
        ;;
esac
export QT_AUTO_SCREEN_SCALE_FACTOR=1.5


unalias vi
export VISUAL=nvim
export EDITOR="$VISUAL"
export CSCOPE_EDITOR=vim
export PATH=~/dotfiles/scripts:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
    export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export ARCH=arm
export CROSS_COMPILE=~/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-


export KEYTIMEOUT=
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="willpnw"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    history
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# reload zshrc
alias rerc="source ~/.zshrc"

# helpers
alias df='df -h'

# commands
alias c="clear"
alias x="exit"
alias n="nvim"

alias d="docker"

#git commands
alias gc="git commit"
alias gco="git checkout"
alias gcm="git commit -m"
alias gca="git commit --amend --no-edit"
alias gss="git status -s"
alias gs="git status"
alias gsno="git status --untracked-files=no"
alias gpull="git pull"
alias gpush="git push"
alias gpf="git push -f"
alias grs="git reset"
alias grs1="git reset HEAD~1"
alias gb="git branch"
alias gau="git add -u"
alias gaa="git add --all"
alias gd="clear; git diff -w"
alias gdc="git diff --cached"
alias gdt="git difftool -y"
alias gmt="git mergetool -y"
alias gdtc="git difftool -y --cached"
alias gdth="git difftool -y HEAD^ HEAD"
alias gl="git log"
alias gstash="git stash"
alias gclean="git clean -fd"
alias gshow="git difftool HEAD~1 HEAD"
alias gbdr="git push origin --delete"
alias gdsc="git describe"
alias gdscl="git describe --long"
alias gllr="git log --left-right --graph --cherry-pick --oneline"
alias glro="git log --right-only --no-merges --cherry-pick --oneline"
alias gsp="git show -p"
alias gsu="git submodule update"
alias gsm="git ls-files -m"
alias gsd="git ls-files -d"

mc() {
    LS_USB=$(ls /dev/ttyUSB*) || return 1
    NUM_USB=$(echo $LS_USB | wc -l)
    case $NUM_USB in
        0)
            return 1
            ;;
        1)
            NUM=$(echo $LS_USB | rev | cut -d 'B' -f1)
            ;;
        *)
            ls /dev/ttyUSB*
            read 'NUM?Enter num[default=0]: '
            test -z "$NUM" && NUM=0
            ;;
    esac

    echo "Using ttyUSB${NUM}"
    sudo minicom -C /tmp/minilog${NUM} -D /dev/ttyUSB${NUM} -t screen-256color -c on
}

alias du="du -h --max-depth=1"

# docker aliases
alias dka='docker kill $(docker ps -q)'

setopt rm_star_silent

# typos
alias suod="sudo"


dexec() {
    docker exec -it $1 /bin/bash
}


# vi mode bindings
bindkey -v
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

rn() {
    for f in `fd -s $1`; do
        NEW=$(echo $f | sed "s/$1/$2/g")
        echo "$f -> $NEW"
        mv $f $NEW
    done
}

srn() {
    for f in `fd -s $1`; do
        NEW=$(echo $f | sed "s/$1/$2/g")
        echo "$f -> $NEW"
        sudo mv $f $NEW
    done
}

fr() {
    for f in `ag -sl $1`; do
        echo $f
        eval $SED_INLINE "s/$1/$2/g" $f
    done
}

# FZF
export FZF_DEFAULT_OPTS='--bind tab:down,shift-tab:up'
export FZF_DEFAULT_COMMAND='fd --type f'

#j() {
#    [ $# -gt 0 ] && _z "$*" && return
#    cd "$(_z -l 2>&1 | fzf --height 20% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
#}

e() {
    local files
    IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

r() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | tr -s ' ' | cut -d ' ' -f2-)
    #print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | tr -s ' ' )
}

#m() {
#    cd /home/will/dev-projects/sonosite/yocto/build/workspace/sources/controlio-turbo
#    cmake -DCMAKE_BUILD_TYPE=Release -DCI_BUILD=ON && make -j4
#    -
#}

k() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

dstop() {
    local cid
    cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')
    [ -n "$cid" ] && docker stop "$cid"
}

dstart() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

alist() {
    print -z $(alias | sed 's/=/?/' | column -t -s '?' | fzf -q "$1" | cut -d ' ' -f1)
}

loc() {
    if [ $# -ne 1 ]; then
        echo "Need one arg, got $#"
        return 1
    fi
    echo "looking for $1"
    local filepath=$(locate $1 | fzf)
    echo $filepath
    print -z "cd $(dirname $filepath)"
}

loce() {
    if [ $# -ne 1 ]; then
        echo "Need one arg, got $#"
        return 1
    fi
    echo "looking for $1"
    local filepath=$(locate $1 | fzf)
    [[ -n "$filepath" ]] && ${EDITOR:-vim} "${filepath}"
}

killL() {
    local pid
    sudo whoami > /dev/null
    pid=$(sudo netstat -ltnp  | grep tcp | awk '{print $4, $7}' | sed 's|.*:\(.*\) \(.*\)/\(.*\)|\3 \1 \2|' | column -t | fzf | awk '{print $3}')
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

agl() {
    if [ $# -ne 1 ]; then
        echo "Need one arg, got $#"
        return 1
    fi
    echo "looking for $1"
    local res=$(ag $1 | fzf)
    local filepath=$(echo $res | cut -d ':' -f1)
    local lineNumber=$(echo $res | cut -d ':' -f2)
    [[ -n "$filepath" ]] && ${EDITOR:-vim} +${lineNumber} ${filepath}
}

#source /etc/profile.d/autojump.zsh


[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh


autoload -U compinit && compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# clang format
cf() {
    cd /home/will/dev-projects/sonosite-x-porte-app
    for f in $(fd . iomanager/ui/qt -e cpp -e h); do
        clang-format $f > tmp && mv tmp $f
    done
}

gprune() {
    for branch in $(git branch); do
        read -q "REPLY?Remove $branch ?"
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            git branch -D $branch
            echo "Removed"
        else
            echo "Saved"
        fi
    done
}

# common searches
fs() {
	ag -l "struct $1 {"
}

#gitk() {
#    gitk $@ &
#}

alias dgcc="sudo pacman -U /var/cache/pacman/pkg/{gcc-9.3.0-1-x86_64.pkg.tar.zst,gcc-libs-9.3.0-1-x86_64.pkg.tar.zst}"
alias qt1='fd -e qml -x sed -i "s/^import QtQuick 2.6$/import QtQuick 1.1/"'
alias qt2='fd -e qml -x sed -i "s/^import QtQuick 1.1$/$import QtQuick 2.6/"'


#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

# repo git log right only
rlr() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 ref1 ref2"
        return 1
    fi
    ref1=$1
    ref2=$2
    export GIT_DELTA="git log --format=format:'%h(%an)[%s]' --right-only ${ref1}..${ref2}"
    repo forall -p -c 'test $($GIT_DELTA | wc -l) -gt 0 && $GIT_DELTA' | tee /tmp/$(basename $ref1)..$(basename $ref2)
}

forget() {
    sudo sync; echo 1 | sudo tee /proc/sys/vm/drop_caches
    sudo sync; echo 2 | sudo tee /proc/sys/vm/drop_caches
    sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
}
