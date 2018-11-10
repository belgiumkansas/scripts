#git user setup
git config --global user.email "jeve0658@colorado.edu"
git config --global user.user "Jeff Venicx"
git config --global credential.helper 'cache --timeout=900'

#initial  install programs
sudo apt -qq -y install vim
sudo apt -qq -y install terminator
sudo apt -qq -y install synaptic

#sublime install
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#slack install
xdg-open https://slack.com/downloads/instructions/debian

#setup configs
sudo apt install compizconfig-settings-manager

#important extras
sudo apt -qq -y install cmake
sudo apt -qq -y install python-pip

#internet addons
sudo apt -qq -y install nmap
