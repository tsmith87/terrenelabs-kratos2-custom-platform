#!/bin/bash

instanceHost=$( cat /etc/hostname )
[[ $(tail -n 1 /etc/hosts) != 127.0.1.1* ]] && echo "127.0.1.1 $instanceHost"| sudo tee -a /etc/hosts
sudo rm -rf /tmp/kratos2.conf
sudo rm -rf /tmp/var.txt
sed -n '/^environment=/q;p' /etc/supervisor/conf.d/kratos2.conf > /tmp/kratos2.conf
echo "environment=" >> /tmp/kratos2.conf
sudo /opt/elasticbeanstalk/bin/get-config environment --output yaml | sed -n '1!p' | sed -e 's/^\(.*\): /\1=/g' > /tmp/var.txt
sed '$!s/$/,/' /tmp/var.txt > var_tmp.txt
sudo mv /tmp/var_tmp.txt /tmp/var.txt
cat /tmp/var.txt | while read LINE; do echo $'\t'$LINE >> /tmp/kratos2.conf; done;
sudo cp -f /tmp/kratos2.conf /etc/supervisor/conf.d/kratos2.conf
sudo supervisorctl reread
sudo service supervisor stop
sudo service supervisor start
