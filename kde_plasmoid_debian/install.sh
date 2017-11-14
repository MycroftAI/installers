#!/bin/bash

echo "**********************************************************************"
echo "                 Mycroft Plasmoid installation script                 "
echo "                                                                      "
echo "This script will download, build and install the Mycroft core and the "
echo "Mycroft KDE Plasmoid.  Special thanks to AIX for making all of this   "
echo "possible!                                                             "
echo "**********************************************************************"
echo ""
echo ""

# Make sure we are in user's home directory
cd ~

echo "*****************************************************"
echo "Installing git for pulling down source code"
echo "*****************************************************"
sudo apt-get install git -y

############################################################################
# Retrieve and build Mycroft
############################################################################

# Pull down mycroft-core
git clone https://github.com/MycroftAI/mycroft-core.git

# Build and install Mycroft:
cd mycroft-core

echo "*****************************************************"
echo "The compiling can take a long time."
echo "Go enjoy a movie, we'll finish the install.       "
echo "*****************************************************"

./dev_setup.sh
echo "-----------------------------------------------------"
echo "Whew, finally finished that!  Now on to the Plasmoid "
echo "-----------------------------------------------------"


############################################################################
# Retrieve and build the Plasmoid
############################################################################

cd ..
# Pull down the Plasmoid code from KDE repos
git clone https://anongit.kde.org/plasma-mycroft.git

# Install all necessary supporting libraries and tools
sudo apt-get install libkf5notifications-data libkf5notifications-dev qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-controls qml-module-qtwebsockets qml-module-qt-websockets qtdeclarative5-qtquick2-plugin qtdeclarative5-models-plugin cmake cmake-extras cmake-data qml-module-qtquick-layouts libkf5plasma-dev extra-cmake-modules qtdeclarative5-dev build-essential g++ gettext libqt5webkit5 libqt5webkit5-dev libkf5i18n-data libkf5i18n-dev libkf5i18n5 qml-module-qtgraphicaleffects -y

# Build the Plasmoid
cd plasma-mycroft
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
make

# Install the Plasmoid
sudo make install

# Set permissions on new files to allow execution
sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/startservice.sh
sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/stopservice.sh
sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/pkgstartservice.sh
sudo chmod +x /usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/pkgstopservice.sh

############################################################################
# Installing Skills Dependencies
############################################################################

# Install all necessary supporting libraries
sudo apt-get install python-dbus python-pyqt5 pyqt5-dev python-sip python-sip-dev

cp -R /usr/lib/python2.7/dist-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp /usr/lib/python2.7/dist-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp -R /usr/lib/python2.7/dist-packages/PyQt5* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/    
cp /usr/lib/python2.7/dist-packages/sip* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/

# Test mycroft service and install default skills
cd ~
secs=$((60 * 4))
cd mycroft-core
./start-mycroft.sh all
while [ $secs -gt 0 ]; do
   echo -ne "Please Wait.. $secs (secs)\033[0K\r"
   sleep 1
   : $((secs--))
done
./stop-mycroft.sh
echo "-----------------------------------"
echo "Getting those awesome plasma skills"
echo "-----------------------------------"

# Get those awesome plasma skills
cd /opt/mycroft/skills/
git clone https://github.com/AIIX/krunner-search-skill  
git clone https://github.com/AIIX/plasma-activities-skill  
git clone https://github.com/AIIX/plasma-user-control-skill  
git clone https://github.com/AIIX/unsplash-wallpaper-plasma-skill  
git clone https://github.com/AIIX/clarifai-image-recognition-skill  

#Get those display skills for the desktop
git clone https://github.com/AIIX/skill-weather
git clone https://github.com/AIIX/skill-stock
git clone https://github.com/AIIX/skill-wiki

# Restart the machine!
echo "Everything is built and ready to go!"
echo "After the machine reboots, you will need to activate it by:"
echo "1) Right-clicking on the desktop and picking 'Add Widget...'"
echo "2) Locating 'Mycroft' and dragging that to the desktop"
echo "3) Click on the Plasmoid and press the 'Play' button"
echo "4) Register your devices at https://home.mycroft.ai with the pairing code"
echo "5) Say 'Hey Mycroft, what time is it?'"

read -p "Press the [Enter] key to reboot..."
sudo reboot now
