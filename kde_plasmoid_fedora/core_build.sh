#!/bin/bash
# Make sure we are in user's home directory
cd ~

echo "*****************************************************"
echo "Installing git for pulling down source code"
echo "*****************************************************"
sudo dnf install git -y

############################################################################
# Retrieve and build Mycroft
############################################################################

# Pull down mycroft-core 
#git clone https://github.com/MycroftAI/mycroft-core.git

# Build and install Mycroft: 
cd mycroft-core

echo "*****************************************************"
echo "Getting Requirements."
echo "*****************************************************"
./build_host_setup_fedora.sh 
echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
