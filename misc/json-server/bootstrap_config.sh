echo "Installing Node JS"
curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
yum -y install nodejs

echo "Installing json-server"
sudo npm install -g json-server@0.16.3

echo "Installing maildev"
sudo npm install -g maildev

echo "Init rc.local"	
cp /vagrant/misc/json-server/rc.local /etc/rc.d/rc.local
sudo chmod +x /etc/rc.d/rc.local

sudo systemctl enable rc-local.service

#json-server --host 192.168.101.10 --watch /vagrant/mock-server/mock-route.js
#echo  '{ "person": [{ "id" : 1, "name": "personname" }] }' > /opt/testserver/example.json
#mkdir /opt/testserver
#sudo chown -R vagrant:vagrant /opt/testserver


