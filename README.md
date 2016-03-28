# dashboard

# Description
The dashboard is a demonstration environment that I am using for API integration and other purposes. It is set up so that I can add APIs and other applications. Currently, there is one application integrated, called EasyCCX. It is used to demonstrate cloud script management for Cisco Contact Center Express.

# Installation

## Environment - Existing Server (Apache + PHP 5.5 or later)
* Requires pico2wave for TTS. I had trouble finding this in repos, so I had to build. I used build instructions <a href='http://pbxinaflash.com/community/threads/svox-pico-tts-for-asterisk.17859/'>here</a><br>
* Requires sox for u-law audio conversion.<br>

## Environment - New Server (Fresh CentOS 7.2.1511 Minimal)
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm<br>
sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm<br>
sudo vi /etc/yum.repos.d/remi.repo<br>
In section [remi-php56], set enabled=1<br>
sudo yum install httpd mariadb-server mariadb git php php-mysql sox wget<br>
sudo wget https://raw.githubusercontent.com/stevenmirabito/asterisk-picotts/master/picotts-install.sh -O - | sh<br>
sudo /sbin/ldconfig -v<br>
<br>
sudo git clone https://github.com/joshand/dashboard /var/www/html<br>
sudo service mariadb start<br>
sudo service httpd start<br>
<br>
cd /var/www/html<br>
echo "create database cloudmanage" | mysql -u root<br>
mysql -u root cloudmanage &lt; cloudmanage.sql<br>
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('mypassword');" | mysql -u root<br>
<br>
cd dashboard<br>
sudo vi config.inc<br>
<br>
Change &lt;PUBLIC_FQDN_OR_IP_ADDRESS&gt; to be the public dns name or IP address of the server. If you are demoing on a private network, you can use an internal IP here as well.<br>
Change &lt;MYSQL_DB_USERNAME&gt; to root<br>
Change &lt;MYSQL_DB_PASSWORD&gt; to mypassword<br>
Change &lt;MYSQL_DB_NAME&gt; to cloudmanage<br>
<br>
Access http://&lt;server_ip&gt;/dashboard<br>
Register<br>
Fill out form, and Register, then Log In.<br>

