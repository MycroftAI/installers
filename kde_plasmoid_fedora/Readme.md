# Mycroft Plasmoid // Release 2.0
#### Mycroft AI Plasmoid and Skills for KDE Plasma 5 Desktop

Auto Install Instructions:

1. wget https://raw.githubusercontent.com/MycroftAI/installers/master/kde_plasmoid_fedora/install.sh
2. chmod +x install.sh
3. ./install.sh

Manual Install Instructions: 

1. Installation Requirements

This plasmoid requires Mycroft Core Installed from http://github.com/MycroftAI/ using the GIT Method:
    + cd /home/$USER/
    + git clone https://github.com/MycroftAI/mycroft-core
    + For Fedora Run: ./build_host_setup_fedora.sh
    + Run: ./dev_setup.sh

2. Installation Instructions
  + Open Konsole: sudo dnf install kf5-knotifications-devel qt5-qtbase-devel qt5-qtdeclarative-devel qt5-qtquick1-devel qt5-qtquickcontrols qt5-qtquickcontrols2 qt5-qtwebsockets cmake extra-cmake-modules kf5-plasma-devel kf5-i18n-devel qt5-qtwebkit qt5-qtwebkit-devel
  + git clone https://anongit.kde.org/plasma-mycroft.git/
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

3. Skills Installation

 Install Skills from Plasmoid:
 + For Krunner Skill: Install from Plasmoid (Follow Dependency Installation Below). Skill Name: Krunner-Search-Skill
 + For Activities Skill: Install from Plasmoid (Follow Dependency Installation Below). Skill Name: Plasma-Activities-Skill
 + For User Control Skill: Install from Plasmoid (Follow Dependency Installation Below). Skill Name: Plasma-User-Control-Skill
 + For Wallpaper Change Skill: Install from Plasmoid (Follow Dependency Installation Below). Skill Name: Unsplash-Wallpaper-Plasma-Skill
 + For Image Recognition Skill: Follow Instructions at: https://github.com/AIIX/clarifai-image-recognition-skill

 To Install Skills With HTML Data:
 + skill-weather: Replace /opt/mycroft/skills/skill-weather with https://github.com/AIIX/skill-weather
    + git clone https://github.com/AIIX/skill-weather
    + cp -R skill-weather/* /opt/mycroft/skills/skill-weather/
 
 + skill-stocks: Replace /opt/mycroft/skills/skill-stock with https://github.com/AIIX/skill-stock
    + git clone https://github.com/AIIX/skill-stock
    + cp -R skill-stock/* /opt/mycroft/skills/skill-stock/
    
 + skill-wiki: Replace /opt/mycroft/skills/skill-wiki with https://github.com/AIIX/skill-wiki
    + git clone https://github.com/AIIX/skill-wiki
    + cp -R skill-wiki/* /opt/mycroft/skills/skill-wiki/

 To Install Plasma Desktop Skills(Manually) (Step 5. Dependency Install is Very Important):
    + git clone https://github.com/AIIX/krunner-search-skill  
    + cp -R krunner-search-skill/* /opt/mycroft/skills/krunner-search-skill/
    + git clone https://github.com/AIIX/plasma-activities-skill  
    + cp -R plasma-activities-skill/* /opt/mycroft/skills/plasma-activities-skill/
    + git clone https://github.com/AIIX/plasma-user-control-skill
    + cp -R plasma-user-control-skill/* /opt/mycroft/skills/plasma-user-control-skill/
    + git clone https://github.com/AIIX/unsplash-wallpaper-plasma-skill  
    + cp -R unsplash-wallpaper-plasma-skill/* /opt/mycroft/skills/unsplash-wallpaper-plasma-skill/
    + git clone https://github.com/AIIX/clarifai-image-recognition-skill  
    + cp -R clarifai-image-recognition-skill/* /opt/mycroft/skills/clarifai-image-recognition-skill/
    
4. Skills Dependency Requirements

 + For Skills (KDE Neon): sudo apt install python-dbus, python-pyqt5 pyqt5-dev, python-sip, python-sip-dev
 + From Konsole: cp -R /usr/lib/python2.7/dist-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
 + From Konsole: cp /usr/lib/python2.7/dist-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
 + From Konsole: cp -R /usr/lib/python2.7/dist-packages/PyQt5* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/    
 + From Konsole: cp /usr/lib/python2.7/dist-packages/sip* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
