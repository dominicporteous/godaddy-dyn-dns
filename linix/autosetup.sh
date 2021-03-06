#!/bin/bash
sudo mkdir -r /etc/gd-dyn-dns
sudo mkdir -r /var/log/gd-dyn-dns

sudo cp gd-dyn-dns /etc/init.d/gd-dyn-dns
sudo cp ./bin /etc/gd-dyn-dns


pip install requests
pip install tldextract

sudo chkconfig --add gd-dyn-dns
sudo chkconfig gd-dyn-dns on

echo "Done... be sure to change the settings in `/etc/gd-dyn-dns/godaddy.py`"
echo "Then you can start the service using `service gd-dyn-dns start` or `sudo systemctl start gd-dyn-dns`."
echo "Use `service gd-dyn-dns ?` for more info."
