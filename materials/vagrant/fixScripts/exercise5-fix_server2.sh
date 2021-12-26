#!/bin/bash
#add fix to exercise5-server2 here

#desable host key checking
sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
# get key for vagrant user from server 1
cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys 

# get key for root user from server 1
cat /vagrant/id_rsa.pub_s1_root >> ~/.ssh/authorized_keys

#get my previosly created key - user vargant
#ssh-keygen -t rsa -b 4096 -N ""  -C "server2 ssh key" -f  /home/vagrant/.ssh/id_rsa
cp /vagrant/id_rsa_s2.pub /home/vagrant/.ssh/id_rsa.pub
cp /vagrant/id_rsa_s2 /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub
chmod 644 /home/vagrant/.ssh/id_rsa.pub


#get my previosly created key - user root

cp /vagrant/id_rsa_s2_root ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
cp /vagrant/id_rsa.pub_s2_root ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/id_rsa.pub




