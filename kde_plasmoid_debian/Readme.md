# Mycroft Core + Plasmoid Installation Instructions
#### Mycroft AI Plasmoid and Skills for KDE Plasma 5 Desktop

Auto Install Instructions:

1. wget https://raw.githubusercontent.com/MycroftAI/installers/master/kde_plasmoid_debian/install.sh
2. chmod +x install.sh
3. ./install.sh

Manual Install Instructions: 

1. Installation Requirements

    + This plasmoid requires Mycroft Core Installed from http://github.com/MycroftAI/ using the GIT Method:
    + cd /home/$USER/
    + git clone https://github.com/MycroftAI/mycroft-core
    + Run: ./dev_setup.sh

2. Installation Instructions
  + Konsole: sudo apt-get install libkf5notifications-data libkf5notifications-dev qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-controls qml-module-qtwebsockets qml-module-qt-websockets qtdeclarative5-qtquick2-plugin qtdeclarative5-models-plugin cmake cmake-extras cmake-data qml-module-qtquick-layouts libkf5plasma-dev extra-cmake-modules qtdeclarative5-dev build-essential g++ gettext libqt5webkit5 libqt5webkit5-dev libkf5i18n-data libkf5i18n-dev libkf5i18n5 qml-module-qtgraphicaleffects -y
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

3. 3. KDE Platform Skills Installation

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

 To Install Plasma Desktop Skills(Manually) (Skills Dependency Install is Very Important):
    + git clone https://github.com/AIIX/krunner-search-skill  
    + git clone https://github.com/AIIX/plasma-activities-skill  
    + git clone https://github.com/AIIX/plasma-user-control-skill
    + git clone https://github.com/AIIX/unsplash-wallpaper-plasma-skill  
    + git clone https://github.com/AIIX/clarifai-image-recognition-skill  
    
4. Skills Dependency Requirements

 + For Skills (KDE Neon): sudo apt install python-dbus, python-pyqt5 pyqt5-dev, python-sip, python-sip-dev
 + From Konsole: cp -R /usr/lib/python2.7/dist-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
 + From Konsole: cp /usr/lib/python2.7/dist-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
 + From Konsole: cp -R /usr/lib/python2.7/dist-packages/PyQt5* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/    
 + From Konsole: cp /usr/lib/python2.7/dist-packages/sip* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
