#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

alias ls='ls --color=auto'

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo " ${BRANCH}${STAT}"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

TIME="\[\e[32m\]\T"
DIR="\[\e[m\]\[\e[1;35m\]\W"
GIT="\[\e[m\]\[\e[34m\]\$(parse_git_branch)"

#export PS1="[$TIME $DIR${GIT}\[\e[m\]] "
export PS1="$ "

set -o vi
bind -m vi-insert '"jk": vi-movement-mode'


alias img='cd ~/Rail/rail/build/images'
alias rail='cd ~/Rail/rail'
alias linux='cd ~/Rail/rail/linux'
alias sbin='cd ~/Rail/rail/linux/target/fs/common/usr/sbin'
alias athena='cd ~/Rail/rail/rail-ux/athena/athena'
alias rootfs='cd ~/Rail/rail/projects/bcm589x/build-output/secuapp/BCM95892/rootfs'

#alias tmux="TERM=screen-256color-bce tmux"

alias cdn="sudo mount -t nfs4 cdn-qa01.lab.tsafe.systems:/var/www/cdn/qa01/rail /mnt/cdn"
alias mc="sudo minicom -C /tmp/minilog0 -D /dev/ttyUSB0 -t screen-256color -c on"
alias mc2="sudo minicom -D /dev/ttyUSB1 -t screen-256color -c on"

alias scrn="sudo screen -L /dev/ttyUSB0 115200 -ixon -ixoff"
alias scrn2="sudo screen -L /dev/ttyUSB1 115200 -ixon -ixoff"

alias ipList="nmap -sP 192.168.15.* | grep -o "192.168.15.[0-9]*"  | sort -t . -k 3,3n -k 4,4n"
alias makeAll="cd ~/Rail/rail && make clean all install fs 2>&1 | tee ~/build.log"

alias vi="vim -n"
alias vim="vim -n"
alias c="clear"
alias sig="cd ~/Rail/rail-buildtools32/signature_tools"

alias gc="git commit"
alias gco="git checkout"
alias gcm="git commit -m"
alias gca="git commit -am"
alias gs="git status"
alias gpull="git pull"
alias gpush="git push"
alias grs="git reset"
alias gb="git branch"
alias ga="git add"
alias gau="git add -u"
alias gaa="git add --all"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdt="git difftool -y"
alias gdtc="git difftool -y --cached"
alias gadd="git add"
alias gl="git log"
alias gstash="git stash"
alias gclean="git clean -fd"
alias gshow="git difftool HEAD~1 HEAD"

alias udb="sudo updatedb"
alias suod="sudo"
alias in="sudo apt-get install -y"


alias jen01="ssh wpatterson@jen01"
alias jen02="ssh wpatterson@jen02"
alias jen03="ssh wpatterson@jen03"

findIt() {
    find . -iname "*$1*"
}
alias f="findIt"

shareIt() {
    cp $1 /var/www/html/
}
alias share="shareIt"
alias gtkterm="sudo gtkterm -p /dev/ttyUSB0 -s 115200 &"
bkIt() {
    cp ${1} ${1}.bk
}
alias bk=bkIt

allTheThings() {
    for dir in /home/will/Rail/rail-stage2 /home/will/Rail/rail-stage2-ext /home/will/Rail/rail-uboot-env/ /home/will/Rail/rail-uboot_2015/ /home/will/Rail/rail/ /home/will/Rail/rail/rail-ux; do
        echo "$dir..."
        pushd $dir
        $@
        popd
    done
}
alias allRepos=allTheThings

findReplace() {
    find . -type f -print0 | xargs -0 sed -i '' -e "s/$1/$2/g"
}
alias fr=findReplace

gdbrail ()
{
    if [ $# -lt 1 ]; then
        AXF_FILE=/home/will/Downloads/s2bl.axf
    else
        AXF_FILE=$1;
    fi;
    echo "target remote localhost:2331" > /tmp/_axf_gdb_startupscript;
    echo "set \$pc=0x189860" >> /tmp/_axf_gdb_startupscript;
    echo "load $AXF_FILE" >> /tmp/_axf_gdb_startupscript;
    echo "set \$pc=0x189860" >> /tmp/_axf_gdb_startupscript;
    echo "c" >> /tmp/_axf_gdb_startupscript;
    envSetup rail;
    xterm -hold -ls -geometry 80x20+0+0 -w 0 -e JLinkGDBServer -device iMX35 & xterm -ls -geometry 80x20+0+340 -e /home/will/Rail/rail-buildtools32/CodeSourcery/arm-2011.03/bin/arm-linux-gdb --command=/tmp/_axf_gdb_startupscript;
    #rm -f /tmp/_axf_gdb_startupscript && kill %1
}

otaMgr () {
    cd /home/will/Downloads/otainstall && LD_LIBRARY_PATH=. ./otainstaller
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
