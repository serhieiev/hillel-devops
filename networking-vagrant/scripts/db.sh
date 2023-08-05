#!/bin/bash

echo "Installing and configiring mariadb..."

apt update
apt -y install mariadb-server mariadb-client
systemctl enable mariadb
systemctl start mariadb

root_password=mypass

# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"

# Kill the anonymous users
mysql -e "DROP USER IF EXISTS ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER IF EXISTS ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE IF EXISTS test"

echo "Creating wordpress database..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS wordpress"

echo "Creating user and grant all permissions to wordpress database..." 
mysql -e "CREATE USER IF NOT EXISTS 'user'@'192.168.56.11' IDENTIFIED BY 'password1'" 
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* to 'user'@'192.168.56.11'"

# Make our changes take effect
sudo mysql -e "FLUSH PRIVILEGES"
echo "Finish create database..."

# Settings conf file
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql restart