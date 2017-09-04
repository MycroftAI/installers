#!/bin/bash
# Make sure we are in user's home directory
cd ~

############################################################################
# Retrieve and build the Plasmoid
############################################################################

# Pull down the Plasmoid code from KDE repos
git clone https://anongit.kde.org/plasma-mycroft.git

# Install all necessary supporting libraries and tools

sudo dnf install kf5-knotifications-devel qt5-qtbase-devel qt5-qtdeclarative-devel qt5-qtquick1-devel qt5-qtquickcontrols qt5-qtquickcontrols2 qt5-qtwebsockets qt5-qtwebsockets-devel cmake extra-cmake-modules kf5-plasma-devel kf5-i18n-devel qt5-qtwebkit qt5-qtwebkit-devel -y

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
sudo dnf install dbus-python PyQt-devel sip sip-devel

Arch=$(uname -m)

if [ $Arch == 'i386' ]; then
cp -R /usr/lib/python2.7/site-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp /usr/lib/python2.7/site-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp -R /usr/lib/python2.7/site-packages/PyQt5* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/    
cp /usr/lib/python2.7/site-packages/sip* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
fi

if [ $Arch == 'x86_64' ]; then
cp -R /usr/lib64/python2.7/site-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp /usr/lib64/python2.7/site-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp -R /usr/lib64/python2.7/site-packages/PyQt5* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/    
cp /usr/lib64/python2.7/site-packages/sip* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
fi

# Get those awesome plasma skills
git clone https://github.com/AIIX/krunner-search-skill  
cp -R krunner-search-skill/* /opt/mycroft/skills/krunner-search-skill/
git clone https://github.com/AIIX/plasma-activities-skill  
cp -R plasma-activities-skill/* /opt/mycroft/skills/plasma-activities-skill/
git clone https://github.com/AIIX/plasma-user-control-skill  
cp -R plasma-user-control-skill/* /opt/mycroft/skills/plasma-user-control-skill/
git clone https://github.com/AIIX/unsplash-wallpaper-plasma-skill  
cp -R unsplash-wallpaper-plasma-skill/* /opt/mycroft/skills/unsplash-wallpaper-plasma-skill/
git clone https://github.com/AIIX/clarifai-image-recognition-skill  
cp -R clarifai-image-recognition-skill/* /opt/mycroft/skills/clarifai-image-recognition-skill/

#Get those display skills for the desktop
git clone https://github.com/AIIX/skill-weather
cp -R skill-weather/* /opt/mycroft/skills/skill-weather/
git clone https://github.com/AIIX/skill-stock
cp -R skill-stock/* /opt/mycroft/skills/skill-stock/
git clone https://github.com/AIIX/skill-wiki
cp -R skill-wiki/* /opt/mycroft/skills/skill-wiki/

# Restart the machine!
echo "Everything is built and ready to go!"
