#!/bin/bash
# Make sure we are in user's home directory
cd ~

cp -R /usr/lib/python2.7/dist-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp /usr/lib/python2.7/dist-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
cp -R /usr/lib/python2.7/dist-packages/PyQt5* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/    
cp /usr/lib/python2.7/dist-packages/sip* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/

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

# Get those display skills for the desktop
git clone https://github.com/AIIX/skill-weather
cp -R skill-weather/* /opt/mycroft/skills/skill-weather/
git clone https://github.com/AIIX/skill-stock
cp -R skill-stock/* /opt/mycroft/skills/skill-stock/
git clone https://github.com/AIIX/skill-wiki
cp -R skill-wiki/* /opt/mycroft/skills/skill-wiki/
