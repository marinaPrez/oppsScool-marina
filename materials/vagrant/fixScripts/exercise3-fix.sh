#!/bin/bash
#add fix to exercise3 here
sudo sed -i 's/denied/granted/g' /etc/apache2/sites-enabled/000-default.conf
sudo systemctl restart apache2.service
