#!/bin/bash
#add fix to exercise5-server1 here

#desable host key checking
sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config

#generate ssh key for vagrant
ssh-keygen -t rsa -b 4096 -N ""  -C "server1 ssh key" -f  /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa 
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub

# move key to sheared mount
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/


#generate ssh key for root
ssh-keygen -t rsa -b 4096 -N ""  -C "server1 root ssh key" -f  ~/.ssh/id_rsa
cp ~/.ssh/id_rsa.pub /vagrant/id_rsa.pub_s1_root

# get key for vagrant user from server 2
cat /vagrant/id_rsa_s2.pub >> /home/vagrant/.ssh/authorized_keys

# get key for vagrant user from server 2
cat /vagrant/id_rsa.pub_s2_root >> ~/.ssh/authorized_keys
