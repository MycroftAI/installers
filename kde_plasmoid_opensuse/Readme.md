# Mycroft Core + Plasmoid Installation Instructions
#### Mycroft AI Plasmoid and Skills for KDE Plasma 5 Desktop

Auto Install Instructions:

1. wget https://raw.githubusercontent.com/MycroftAI/installers/master/kde_plasmoid_fedora/install.sh
2. chmod +x install.sh
3. ./install.sh

Manual Install Instructions: 

1. Installation Requirements

    + This plasmoid requires Mycroft Core Installed from http://github.com/MycroftAI/ using the GIT Method:
    + cd /home/$USER/
    + git clone https://github.com/MycroftAI/mycroft-core
    + Run: ./dev_setup.sh

2. Installation Instructions
  + Open Konsole: sudo dnf install kf5-knotifications-devel qt5-qtbase-devel qt5-qtdeclarative-devel qt5-qtquickcontrols qt5-qtquickcontrols2 qt5-qtwebsockets qt5-qtwebsockets-devel cmake extra-cmake-modules kf5-plasma-devel kf5-ki18n-devel qt5-qtwebkit qt5-qtwebkit-devel qt5-qtgraphicaleffects dbus-devel dbus-glib-devel -y
  + git clone https://anongit.kde.org/plasma-mycroft.git/
  + cd plasma-mycroft
  + mkdir build
  + cd build
  + cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release   -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  + make
  + sudo make install
  + sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/startservice.sh
  + sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/stopservice.sh
  + sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/pkgstartservice.sh
  + sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/pkgstopservice.sh
  + Logout / Login or Restart Plasma Shell

3. Visual Display Skills Installation

Install Skills With HTML Displays:
 + skill-weather: Replace /opt/mycroft/skills/skill-weather with https://github.com/AIIX/skill-weather
    + cd /opt/mycroft/skills
    + git clone https://github.com/AIIX/skill-weather
 
 + skill-stocks: Replace /opt/mycroft/skills/skill-stock with https://github.com/AIIX/skill-stock
    + cd /opt/mycroft/skills
    + git clone https://github.com/AIIX/skill-stock

Install Skills with Dynamic QML Displays:
 + skill-wiki: Replace /opt/mycroft/skills/skill-wiki with https://github.com/AIIX/skill-wiki
    + cd /opt/mycroft/skills
    + git clone https://github.com/AIIX/skill-wiki

