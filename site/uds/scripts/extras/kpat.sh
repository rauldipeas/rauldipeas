#!/bin/bash
set -e
BASENAME="kpat"
LN='org.kde.kpat'
SWMC='kpat'
#TARGET="$()"
EXEC_OLD='kpat'
EXEC_NEW='env QT_QPA_PLATFORM=xcb kpat'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='--no-install-recommends kpat'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
fix_launcher
install_deb
#kded5 kdegames-card-data-kf5 kio kpackagetool5 kpat libdbusmenu-qt5-2 libfreecell-solver0 libgpgmepp6t64 libkf5archive-data libkf5archive5 libkf5attica5 libkf5auth-data libkf5authcore5 libkf5codecs-data libkf5codecs5 libkf5completion-data libkf5completion5 libkf5config-data libkf5configcore5 libkf5configgui5 libkf5configwidgets-data libkf5configwidgets5 libkf5coreaddons-data libkf5coreaddons5 libkf5crash5 libkf5dbusaddons-data libkf5dbusaddons5 libkf5doctools5 libkf5globalaccel-bin libkf5globalaccel-data libkf5globalaccel5 libkf5globalaccelprivate5 libkf5guiaddons-bin libkf5guiaddons-data libkf5guiaddons5 libkf5i18n-data libkf5i18n5 libkf5iconthemes-data libkf5iconthemes5 libkf5itemviews-data libkf5itemviews5 libkf5jobwidgets-data libkf5jobwidgets5 libkf5kdegames-data libkf5kdegames7 libkf5kiocore5 libkf5kiogui5 libkf5kiontlm5 libkf5kiowidgets5 libkf5newstuff-data libkf5newstuff5 libkf5newstuffcore5 libkf5newstuffwidgets5 libkf5notifications-data libkf5notifications5 libkf5package-data libkf5package5 libkf5service-bin libkf5service-data libkf5service5 libkf5solid5 libkf5solid5-data libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5 libkf5syndication5abi1 libkf5textwidgets-data libkf5textwidgets5 libkf5wallet-bin libkf5wallet-data libkf5wallet5 libkf5widgetsaddons-data libkf5widgetsaddons5 libkf5windowsystem-data libkf5windowsystem5 libkf5xmlgui-data libkf5xmlgui5 libkwalletbackend5-5 libpolkit-qt5-1-1 libqca-qt5-2 libqt5texttospeech5 libxcb-record0