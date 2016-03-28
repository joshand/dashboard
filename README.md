# dashboard

# Description
The dashboard is a demonstration environment that I am using for API integration and other purposes. It is set up so that I can add APIs and other applications. Currently, there is one application integrated, called EasyCCX. It is used to demonstrate cloud script management for Cisco Contact Center Express.

# Installation

## Environment - Existing Server (Apache + PHP 5.5 or later)
* Requires pico2wave for TTS. I had trouble finding this in repos, so I had to build. I used build instructions <a href='http://pbxinaflash.com/community/threads/svox-pico-tts-for-asterisk.17859/'>here</a><br>
* Requires sox for u-law audio conversion.<br>

## Environment - New Server (Fresh CentOS 7.2.1511 Minimal)
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo vi /etc/yum.repos.d/remi.repo
In section [remi-php56], set enabled=1
sudo yum install httpd mariadb-server mariadb git php php-mysql sox wget
sudo wget https://raw.githubusercontent.com/stevenmirabito/asterisk-picotts/master/picotts-install.sh -O - | sh 
sudo /sbin/ldconfig -v

sudo git clone https://github.com/joshand/dashboard /var/www/html
sudo service mariadb start
sudo service httpd start

cd /var/www/html
echo "create database cloudmanage" | mysql -u root
mysql -u root cloudmanage < cloudmanage.sql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('cisco');" | mysql -u root

cd dashboard
sudo vi config.inc

Change <PUBLIC_FQDN_OR_IP_ADDRESS> to be the public dns name or IP address of the server. If you are demoing on a private network, you can use an internal IP here as well.
Change <MYSQL_DB_USERNAME> to root
Change <MYSQL_DB_PASSWORD> to cisco
Change <MYSQL_DB_NAME> to cloudmanage

Access http://<server_ip>/dashboard
Register
Fill out form, and Register, then Log In.

