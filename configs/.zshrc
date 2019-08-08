# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
case $(uname -s) in
    Linux)
        SED_INLINE="sed -i"
        alias udb="sudo updatedb"
        alias ls='ls --color=auto'
        export ZSH=/home/will/.oh-my-zsh
        case $(cat /etc/*-release | ack PRETTY_NAME | cut -d '"' -f2) in
            Fedora)
                alias in="sudo dnf install -y"
                alias vi="vimx"
                alias nt="tmux split-window vimx"
                ;;
            Ubuntu)
                alias ack="ack-grep"
                alias in="sudo apt-get install -y"
                alias nt="tmux split-window vim"
                alias vi="/usr/bin/vim.gtk"
                ;;
            "Arch Linux"|"Antergos Linux"|"Manjaro Linux")
                alias vi="vim"
                alias in="sudo pacman -Syu"
                alias yay="yay -S"
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

export KEYTIMEOUT=
export PATH="/opt/gcc-linaro-arm-none-eabi-4.8-2014.04_linux/bin:/home/will/Rail/rail-buildtools32/CodeSourcery/Sourcery_G++_Lite/bin/:$HOME/.dotfiles/scripts:$HOME/.local/bin:$PATH"
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

# jenkins
alias jen01="ssh wpatterson@jen01"
alias jen02="ssh wpatterson@jen02"
alias jen03="ssh wpatterson@jen03"
alias work="ssh will@192.168.0.164"

# directory jumps
alias rail='cd ~/Rail/rail'
alias linux='cd ~/Rail/rail/linux'
alias sbin='cd ~/Rail/rail/linux/target/fs/common/usr/sbin'
alias ath='cd ~/Rail/rail/rail-ux/athena/athena'
alias scr='cd ~/Rail/rail/rail-ux/common/scripts'
alias pro='cd ~/Rail/rail/rail-ux/provision/provision'
alias com='cd ~/Rail/rail/rail-ux/common'
alias dev='cd ~/devprojects'
alias tc='cd ~/devprojects/timber/timber-client/src/app/'

# minicom
alias mc="sudo minicom -C /tmp/minilog0 -D /dev/ttyUSB0 -t screen-256color -c on"
alias mc2="sudo minicom -C /tmp/minilog1 -D /dev/ttyUSB1 -t screen-256color -c on"

alias scrn="sudo screen /dev/ttyUSB0 115200 -ixon -ixoff"
alias scrn2="sudo screen /dev/ttyUSB1 115200 -ixon -ixoff"

# commands
alias c="clear"
alias sig="cd ~/Rail/rail-buildtools32/signature_tools"
alias n="nvim"

 #git commands
alias gc="git commit"
alias gco="git checkout"
alias gcm="git commit -m"
alias gca="git commit --amend --no-edit"
alias gs="git status"
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

alias du="du -h --max-depth=1"

alias aloha="rdesktop -g 1440x900 -P -z -x l -u 1234 -p ViableW@re 192.168.15.244:3389"

alias pdsl="cd ~/devprojects/phoenix-data-service/src && nodemon server.js -c ~/devprojects/phoenix-data-service/src/config.yaml"
alias pdsq="cd ~/devprojects/phoenix-data-service/src && nodemon server.js -c ~/devprojects/config_qa.yaml"
alias pdss="cd ~/devprojects/phoenix-data-service/src && nodemon server.js -c ~/devprojects/config_stg.yaml"
alias pho="cd ~/devprojects/phoenix/src && npm start"

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

allTheThings() {
    for dir in /home/will/Rail/rail-stage2 /home/will/Rail/rail-stage2-ext /home/will/Rail/rail-uboot-env/ /home/will/Rail/rail-uboot_2015/ /home/will/Rail/rail/ /home/will/Rail/rail/rail-ux; do
        echo -n "`basename $dir`: "
        pushd $dir > /dev/null
        $@
        popd > /dev/null
    done
}
alias att=allTheThings

rn() {
    for f in `fd $1`; do
        NEW=$(echo $f | sed "s/$1/$2/g")
        echo "$f -> $NEW"
        mv $f $NEW
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

j() {
  [ $# -gt 0 ] && _z "$*" && return
  tmux bind -n C-j run "tmux send-keys C-j"
  tmux bind -n C-k run "tmux send-keys C-k"
  cd "$(_z -l 2>&1 | fzf --height 20% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
  tmux source ~/.tmux.conf
}

e() {
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    local files
    IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
    tmux source ~/.tmux.conf
}

r() {
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | cut -d ' ' -f3-)
    tmux source ~/.tmux.conf
}

k() {
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
    tmux source ~/.tmux.conf
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
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    print -z $(alias | sed 's/=/?/' | column -t -s '?' | fzf -q "$1" | cut -d ' ' -f1)
    tmux source ~/.tmux.conf
}

loc() {
    if [ $# -ne 1 ]; then
        echo "Need one arg, got $#"
        return 1
    fi
    echo "looking for $1"
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    local filepath=$(locate $1 | fzf)
    echo $filepath
    print -z "cd $(dirname $filepath)"
    tmux source ~/.tmux.conf
}

loce() {
    if [ $# -ne 1 ]; then
        echo "Need one arg, got $#"
        return 1
    fi
    echo "looking for $1"
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    local filepath=$(locate $1 | fzf)
    [[ -n "$filepath" ]] && ${EDITOR:-vim} "${filepath}"
    tmux source ~/.tmux.conf
}

killL() {
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    local pid
    sudo whoami > /dev/null
    pid=$(sudo netstat -ltnp  | grep tcp | awk '{print $4, $7}' | sed 's|.*:\(.*\) \(.*\)/\(.*\)|\3 \1 \2|' | column -t | fzf | awk '{print $3}')
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
    tmux source ~/.tmux.conf
}

lines() {
    if [ $# -ne 1 ]; then
        echo "Need one arg, got $#"
        return 1
    fi
    echo "looking for $1"
    tmux bind -n C-j run "tmux send-keys C-j"
    tmux bind -n C-k run "tmux send-keys C-k"
    local res=$(ag $1 | fzf)
    local filepath=$(echo $res | cut -d ':' -f1)
    local lineNumber=$(echo $res | cut -d ':' -f2)
    [[ -n "$filepath" ]] && ${EDITOR:-vim} +${lineNumber} ${filepath}
    tmux source ~/.tmux.conf
}

railTerm() {
    set -x
    sshpass -p 'T@ble$@fe' ssh root@192.168.$1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

cf() {
    cd /home/will/dev-projects/sonosite-x-porte-app
    for f in `gs --porcelain | ag "^(M|A).*(cpp|h)$" | awk '{print $2}'`; do
        echo $f
        clang-format $f > tmp && mv tmp $f
    done
}
