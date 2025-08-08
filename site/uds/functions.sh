#!/bin/bash
set -e
enter_tmp(){
    sudo find /tmp -mindepth 1 -maxdepth 1 -writable -not -path "/tmp/.veracrypt*" -not -path "*-unix*" -exec rm -fr {} +
    cd /tmp
}

download(){
    wget -q --show-progress $TARGET
}

fix_launcher() {
    sudo rm -f /usr/local/share/custom-launchers/$BASENAME
    cat <<EOF |sudo tee /usr/local/share/custom-launchers/$BASENAME>/dev/null
if [ -f /usr/share/applications/$LN.desktop ] || [ -f /usr/local/share/applications/$LN.desktop ];then
    if [ -f  /usr/share/applications/$LN.desktop ];then
        sed -i 's|^Exec=$EXEC_OLD|Exec=$EXEC_NEW|g' /usr/share/applications/$LN.desktop
        sed -i 's|Icon=$ICON_OLD|Icon=$ICON_NEW|g' /usr/share/applications/$LN.desktop
        else
        if [ -f  /usr/local/share/applications/$LN.desktop ];then
            sed -i 's|^Exec=$EXEC_OLD|Exec=$EXEC_NEW|g' /usr/local/share/applications/$LN.desktop
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
    sed -i 's|^Exec=$EXEC_OLD2|Exec=$EXEC_NEW2|g' /usr/share/applications/$LN2.desktop
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
        sudo apt install -y --reinstall $DEPS
    fi
    if [ -n "$INSTNAME" ];then
        sudo apt install -y --reinstall $INSTNAME
        else
        sudo apt install -y  --reinstall $(sudo find /tmp -mindepth 1 -maxdepth 1 -writable -not -path "/tmp/.veracrypt*" -not -path "*-unix*" -name '*.deb')
    fi
}