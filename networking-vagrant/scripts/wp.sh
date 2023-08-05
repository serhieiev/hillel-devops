#!/bin/bash

#update vm
sudo apt update -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip perl mysql-server apache2 libapache2-mod-php php-mysql -y
#download wordpress
curl -O https://wordpress.org/latest.tar.gz

#unzip wordpress and ajust wp-config.php
tar zxvf latest.tar.gz
cd wordpress
curl -O https://raw.githubusercontent.com/ACloudGuru-Resources/course-aws-certified-solutions-architect-associate/main/lab/5/000-default.conf
cp wp-config-sample.php wp-config.php
perl -pi -e "s/database_name_here/wordpress/g" wp-config.php
perl -pi -e "s/username_here/user/g" wp-config.php
perl -pi -e "s/password_here/password1/g" wp-config.php
perl -pi -e "s/localhost/192.168.56.10/g" wp-config.php
perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php

#create uploads folder and set permissions
mkdir wp-content/uploads
chmod 775 wp-content/uploads

#copy conf file
mv 000-default.conf /etc/apache2/sites-enabled/

#move back to parent dir
cd ..

#move wordpress dir
mv wordpress /var/www/
systemctl restart apache2