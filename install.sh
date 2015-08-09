LOC=`pwd`
hf="/home/$SUDO_USER/"
echo $LOC

installSoftware() {
    install="sudo dnf install -y "
    while read -r line
    do
        which $line &>/dev/null
        if [ $? -eq 1 ] ; then install="$install $line "; fi
    done < "$LOC/software"

    read -r -p "going to run \"$install\", that ok?[y/n]" response
    response=${response,,}
    if [[ $response =~ ^(yes|y)$ ]]
    then
        echo "attempting dnf install command..."
        $install
    else
        echo -e "install line for reference:\n$install"
        echo "install attempt canceled..."
    fi
}

vymlinks(){
    mkdir -p $hf.vim
    cd $hf.vim
    if [ ! -d $hf.vim/ftplugin ]
    then
        ln -s $LOC/ftplugin
    fi

    if [ ! -d $hf.vim/colors ] 
    then
        if [ ! -d $(dirname $LOC)/vim-hybrid ]
        then
            git clone https://github.com/w0ng/vim-hybrid.git $(dirname $LOC)/vim-hybrid
        fi
        ln -s $(dirname $LOC)/vim-hybrid/colors
    fi
}

vimstall(){
    cd $(dirname $LOC)
    hg clone https://vim.googlecode.com/hg/ vim
    cd vim
    hg pull
    hg update
    ./configure --with-features=huge --enable-multibyte
    make install
}
dotlinks(){
    cd $hf
    ln -s $LOC/.custombash 
    ln -s $LOC/.gitconfig 
    ln -s $LOC/.tmux.conf 
    ln -s $LOC/.vimrc 
    echo "if [ -f ~/.custombash ]; then . ~/.custombash; fi" >> $hf.bash_profile

}

embeddedInstall(){
    #msp430 udev rule
    if [ ! -f /etc/udev/rules.d/99-ti-launchpad.rules ]
    then
        echo "ATTRS{idVendor}==\"0451\", ATTRS{idProduct}==\"f432\", MODE=\"0660\", GROUP=\"dialout\"" | tee /etc/udev/rules.d/99-ti-launchpad.rules >/dev/null
        usermod -a -G dialout $SUDO_USER
    fi
    dnf install -y arduino arduino-core ino arduino-doc
    echo "Don't forget to download the energia IDE from energia.nu and to reboot for udev update"

}




read -r -p "Do you want to create symlinks from the dotfiles?[y/n]" response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]
then
    dotlinks
    vymlinks
fi

read -r -p "Do you want to check for software in need of installation?[y/n]" response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]
then
    installSoftware
fi

read -r -p "Do you want to install vim from mercurial clone?[y/n]" response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]
then
    vimstall
fi

read -r -p "Do you want to install embedded tooling for msp430 & arduino?[y/n]" response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]
then
    embeddedInstall
fi