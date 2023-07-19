#!/bin/bash
sudo -i
sudo yum update -y
sudo yum install -y httpd
sudo yum install -y git
cd /var/www/html
git clone https://github.com/obinnaaliogor/techmax.git
rm -rf techmax/how\ to\ ssh\ into\ instance\ in\ the\ private\ subnet\ with\ powershell.txt
rm -rf techmax/Command\ to\ ssh\ into\ an\ instance\ in\ the\ private\ subnet.txt
rm -rf techmax/README.md
cp -r techmax/* /var/www/html/
rm -rf techmax
sudo systemctl enable httpd 
sudo systemctl start httpd
