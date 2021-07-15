#!/bin/bash

echo "#########################################################"
echo "#   AUTO LAMP SCRIPT (AIO) - [ AUTHOR :  HARIES_DEV ]   #"
echo "#########################################################"
echo "#                                                       #"
echo "#                                                       #"
echo "#                       CONTENTS                        #"
echo "#           1. Apache                                   #"
echo "#           2. PHP                                      #"
echo "#           3. PHP Extensions                           #"
echo "#           4. My SQL Server                            #"
echo "#           5. GIT                                      #"
echo "#           6. Redish                                   #"
echo "#           7. Supervisord                              #"
echo "#           8. Composer                                 #"
echo "#           9. Curl & Unzip                             #"
echo "#          10. phpmyadmin                               #"
echo "#                                                       #"
echo "#                                                       #"
echo "#########################################################"
echo " "
echo "Update"
echo " "
sudo apt-get update
echo " "
echo "Install cURL & ZIP/UNZIP"
echo " "
# Install cURL & ZIP/UNZIP
sudo apt-get install curl
sudo apt-get install zip unzip
echo " "
echo " Install Apache "
echo" "
sudo apt-get install apache2
# Y to allow to use disk space
echo "Apache Installed Successfully!"
echo "  "
echo "Check Firewall Configurations"
echo "Your firewall configuration is."
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow in "Apache Full"
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

echo "You can check whether the apache is installed properly by accessing public URL/server IP address."
# If you can see the page then Apache installation is successful.

# To Remove Existing MySQL Server
#sudo apt-get remove --purge mysql-server mysql-client mysql-common
#sudo apt-get remove --purge mysql-*
#sudo apt-get autoremove
#sudo apt-get autoclean
# Other Important Commands
# sudo dpkg --configure mysql-server-5.5
echo " "
echo "Install MySQL Server"
echo " "
sudo apt-get install mysql-server
# Y to allow to use disk space
# Enter password for MySQL Root User, Please remeber the password. (Sample ROOT Password: T1umoN23X8W9tPAlQS9)

sudo mysql_secure_installation
# This asks you if you want to enable secured password for your server.
# Press y|Y, if you want to allow VALIDATE PASSWORD PLUGIN to be used.
# If you select Yes, then it will ask you for password strength
# And to reset password if required (Sample Secure Password : Haksfuh@sfeGa23VhP3)

echo "MySQL Server Installed Successfully!"
echo " "
echo " Install PHP "
echo " "
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
# Y to allow to use disk space

# Inform Apache to prefer php files over html files
# sudo nano /etc/apache2/mods-enabled/dir.conf
# Move the index.php at first place

echo " "
echo "Install PHP Required Extensions "
echo " "
sudo apt-get install php-cli php-mbstring php-gettext php-curl
sudo phpenmod mcrypt
sudo phpenmod mbstring
sudo phpenmod curl
echo "php-cli, curl, mcrypt, mbstring Installed Successfully!"

sudo a2enmod rewrite
sudo a2enmod ssl

echo " Install PHP Dev "
sudo apt install php7.0-dev
echo "php7.0-dev Installed Successfully!"

sudo apt-get install php7.0-intl
echo "php7.0-intl Installed Successfully!"

# Install PHP Zip Extension
# sudo apt-get install php7.0-zip
# echo "PHP Zip Extension Installed Successfully!"


echo  "Restart Apache Server "
sudo systemctl restart apache2
# To See Apache Status
# sudo systemctl status apache2

echo "Your Home Directory is /var/www/html/. You can start using that Home Directory."

# PHPMyAdmin & Other Extensions
echo "Installing PHPMyAdmin for DB Access & Other Extensions."
sudo apt-get install phpmyadmin
# For the server selection, choose apache2.
# Select yes when asked whether to use dbconfig-common to set up the database
# You will be prompted for your database administrator's password
# You will then be asked to choose and confirm a password for the phpMyAdmin application itself

# =================================================
# Installing Laravel Specific and other required things
# such as Git, Composer, Redis for easy PHP Development
# =================================================

echo "Install Redis"
# We will need to compile redis from its source. Thus need to install other two packages
sudo apt-get install build-essential
sudo apt-get install tcl8.5

cd /usr/local/bin
sudo wget http://download.redis.io/releases/redis-3.2.0.tar.gz
sudo tar xzf redis-3.2.0.tar.gz
cd redis-3.2.0
sudo make
sudo make test
sudo make install
cd utils
sudo ./install_server.sh
echo "Redis Server Installed Successfully!"
# To Start/Stop Server
# sudo service redis_6379 start
# sudo service redis_6379 stop
echo "Disable Redis to listen 127.0.0.1 for security purposes."
sudo nano /etc/redis/6379.conf

sudo update-rc.d redis_6379 defaults
echo "Redis Server Set to Start at boot!"

echo "Install GIT"
sudo apt-get install git
echo "Git Installed Successfully!"
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"

echo "Install Composer"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo "Composer Installed Successfully!"

echo "Install Supervisord"
# https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps
sudo apt-get install supervisor
sudo service supervisor restart
# Can add the superviser configs to /etc/supervisor/conf.d
# sudo supervisorctl reread
# sudo supervisorctl update

echo " =================================================="
echo "             Thank U For Using Our Script : )      " 
echo " =================================================="

printf 'Follow me on Github ((y)es, (n)o or quit :'
        read video

        case $video in
            [yY]* ) xdg-open https://github.com/haries-dev/;;
                
            [nN]*) exit;; # for quit, Quit...
esac

