#!/bin/bash
sudo -i
sudo yum update -y
sudo yum install -y httpd
sudo yum install -y git
cd /var/www/html
git clone https://github.com/obinnaaliogor/techmax.git
cp -r techmax/* /var/www/html/
rm -rf techmax
sudo systemctl enable httpd 
sudo systemctl start httpd
