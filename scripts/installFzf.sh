if  cat /etc/os-release | grep -iq centos; then
    echo "Installing for centos"
    INSTALL_CMD=yum
elif  cat /etc/os-release | grep -iq ubuntu; then
    echo "Installing for ubuntu"
    INSTALL_CMD=apt-get
else
    echo "not ubuntu or cenots, exiting"
    exit 1
fi

USER_SHELL=$(basename $0)

echo "Installing dependencies..."

echo "Installing packages..."
sudo $INSTALL_CMD install -y tmux git

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "Installing z"
sudo curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o /usr/local/bin/z.sh
#echo $(pwd)'|1|1552869262' >> ~/.z
touch ~/.z
echo ". /usr/local/bin/z.sh" >> ~/.${USER_SHELL}rc
if [ -f ~/.${USER_SHELL}rc.preFzf ] ; then
    echo "It looks like this has been run before, reloading"
    env ${USER_SHELL} -l
    exit
fi

echo "Backing up ~/.${USER_SHELL}rc to ~/.${USER_SHELL}rc.preFzf"
cp ~/.${USER_SHELL}rc ~/.${USER_SHELL}rc.preFzf

echo "Adding helper functions. Hack as you wish"
cat >> ~/.${USER_SHELL}rc << EOF

# FZF
jump() {
  [ \$# -gt 0 ] && _z "\$*" && return
  cd "\$(_z -l 2>&1 | fzf --height 20% --nth 2.. --reverse --inline-info +s --tac --query "\${*##-* }" | sed 's/^[0-9,.]* *//')"
}

edit() {
    local files
    IFS=\$'\n' files=(\$(fzf-tmux --query="\$1" --multi --select-1 --exit-0))
    [[ -n "\$files" ]] && \${EDITOR:-vim} "\${files[@]}"
}

killp() {
    local pid
    pid=\$(ps -ef | sed 1d | fzf -m | awk '{print \$2}')

    if [ "x\$pid" != "x" ]
    then
        echo \$pid | xargs kill -\${1:-9}
    fi
}

dstop() {
    local cid
    cid=\$(docker ps | sed 1d | fzf -q "\$1" | awk '{print \$1}')
    [ -n "\$cid" ] && docker stop "\$cid"
}

dstart() {
    local cid
    cid=\$(docker ps -a | sed 1d | fzf -1 -q "\$1" | awk '{print \$1}')
    [ -n "\$cid" ] && docker start "\$cid" && docker attach "\$cid"
}

loce() {
    if [ \$# -ne 1 ]; then
        echo "Need one arg, got \$#"
        return 1
    fi
    echo "looking for \$1"
    local filepath=\$(locate \$1 | fzf)
    [[ -n "\$filepath" ]] && \${EDITOR:-vim} "\${filepath}"
}

EOF

case $USER_SHELL in
zsh)
cat >> ~/.${USER_SHELL}rc << EOF
redo() {
    print -z \$( ([ -n "\$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[^ ]* *//')
}

alist() {
    print -z \$(alias | sed 's/=/?/' | column -t -s '?' | fzf -q "\$1" | cut -d ' ' -f1)
}

loc() {
    if [ \$# -ne 1 ]; then
        echo "Need one arg, got \$#"
        return 1
    fi
    echo "looking for \$1"
    local filepath=\$(locate \$1 | fzf)
    echo \$filepath
    print -z "cd \$(dirname \$filepath)"
}

EOF
;;
bash)
cat >> ~/.${USER_SHELL}rc << EOF

writecmd () {
    perl -e 'ioctl STDOUT, 0x5412, \$_ for split //, do{ chomp(\$_ = <>); \$_ }' ;
}

redo() {
    ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[^\s]*\s*//' | writecmd
}

alist() {
    alias | sed 's/=/?/' | column -t -s '?' | fzf -q "\$1" | cut -d ' ' -f1 | writecmd
}

loc() {
    if [ \$# -ne 1 ]; then
        echo "Need one arg, got \$#"
        return 1
    fi
    echo "looking for \$1"
    local filepath=\$(locate \$1 | fzf)
    echo \$filepath
    echo "cd \$(dirname \$filepath)" | writecmd
}

EOF
;;
esac




env ${USER_SHELL} -l
