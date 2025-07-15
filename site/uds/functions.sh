#!/bin/bash
set -e
enter_tmp(){
    sudo find /tmp -mindepth 1 -user $USER -exec rm -rf {} +
    cd /tmp
}

download(){
    wget -q --show-progress $TARGET
}

fix_launcher() {
    sudo rm -f /usr/local/share/custom-launchers/$(basename $0|cut -d '.' -f1)
    cat <<EOF |sudo tee /usr/local/share/custom-launchers/$($1|cut -d '.' -f1)>/dev/null
if [ -f /usr/share/applications/$LN.desktop ] || [ -f /usr/local/share/applications/$LN.desktop ];then
    if [ -f  /usr/share/applications/$LN.desktop ];then
        sed -i 's|Exec=$EXEC_OLD|Exec=$EXEC_NEW|g' /usr/share/applications/$LN.desktop
        sed -i 's|Icon=$ICON_OLD|Icon=$ICON_NEW|g' /usr/share/applications/$LN.desktop
        else
        if [ -f  /usr/local/share/applications/$LN.desktop ];then
            sed -i 's|Exec=$EXEC_OLD|Exec=$EXEC_NEW|g' /usr/local/share/applications/$LN.desktop
            sed -i 's|Icon=$ICON_OLD|Icon=$ICON_NEW|g' /usr/local/share/applications/$LN.desktop    
        fi
    fi
fi
if [ -f /usr/share/applications/$LN.desktop ] || [ -f /usr/local/share/applications/$LN.desktop ];then
    if [ -f  /usr/share/applications/$LN.desktop ];then
        if ! grep 'StartupWMClass=$SWMC' /usr/share/applications/$LN.desktop>/dev/null;then
            printf '\nStartupWMClass=$SWMC'|tee -a /usr/share/applications/$LN.desktop>/dev/null
        fi
        else
        if [ -f  /usr/local/share/applications/$LN.desktop ];then
            if ! grep 'StartupWMClass=$SWMC' /usr/local/share/applications/$LN.desktop>/dev/null;then
                printf '\nStartupWMClass=$SWMC'|tee -a /usr/local/share/applications/$LN.desktop>/dev/null
            fi
        fi
    fi
fi
EOF
    if [ -n "$BASENAME2" ];then
        cat <<EOF |sudo tee /usr/local/share/custom-launchers/$BASENAME2 >/dev/null
if [ -f /usr/share/applications/$LN2.desktop ];then
    sed -i 's|Exec=$EXEC_OLD2|Exec=$EXEC_NEW2|g' /usr/share/applications/$LN2.desktop
    sed -i 's|Icon=$ICON_OLD2|Icon=$ICON_NEW2|g' /usr/share/applications/$LN2.desktop
    if ! grep 'StartupWMClass=$SWMC2' /usr/share/applications/$LN2.desktop>/dev/null;then
        printf '\nStartupWMClass=$SWMC2'|tee -a /usr/share/applications/$LN2.desktop>/dev/null
    fi
fi
EOF
    fi
}

add_ppa() {
    sudo add-apt-repository -y ppa:$PPA
}

install_deb() {
    if [ -n "$DEPS" ];then
        sudo apt install -y $DEPS
    fi
    if [ -n "$INSTNAME" ];then
        sudo apt install -y $INSTNAME
        else
        sudo apt install -y $(sudo find /tmp -name '*.deb')
    fi
}

install_appimage() {
    appimage=$(sudo find /tmp -name '*.AppImage')
    basename=$(basename $0|cut -d '.' -f1)
    chmod +x $appimage
    $appimage --appimage-extract>/dev/null
    sudo rm -rf /opt/$basename
    sudo mv squashfs-root /opt/$basename
    sudo ln -fs /opt/$basename/AppRun /usr/local/bin/$basename
    sudo cp -rf /opt/$basename/usr/share/icons /usr/local/share/
    if [ -f /opt/$basename/$ICON_OLD.svg ];then
    	sudo ln -fs /opt/$basename/$ICON_OLD.svg /usr/local/share/icons/hicolor/scalable/apps/$basename.svg
    	else
    	if [ -f /opt/$basename/$ICON_OLD.png ];then
    	sudo ln -fs /opt/$basename/$ICON_OLD.png /usr/local/share/icons/hicolor/$(identify -format "%wx%h\n" /opt/$basename/$ICON_OLD.png)/apps/$basename.png
    	fi
    fi
    if [ ! -L /opt/$basename/$LN.desktop ];then
        sudo ln -fs /opt/$basename/usr/share/applications/$LN.desktop /usr/local/share/applications/$basename.desktop
        else
        sudo ln -fs /opt/$basename/$LN.desktop /usr/local/share/applications/$basename.desktop
    fi
    sudo sed -i "s/Exec=$EXEC_OLD/Exec=$EXEC_NEW/g" /usr/local/share/applications/$basename.desktop
    sudo sed -i "s/Icon=$ICON_OLD/Icon=$ICON_NEW/g" /usr/local/share/applications/$basename.desktop
    if [ -n "$SWMC" ];then
        printf "\nStartupWMClass=$SWMC"|sudo tee -a /usr/local/share/applications/$basename.desktop>/dev/null
    fi
}