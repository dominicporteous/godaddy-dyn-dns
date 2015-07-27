#!/bin/bash
sudo mkdir -r /etc/gd-dyn-dns
sudo mkdir -r /var/log/gd-dyn-dns

sudo cp gd-dyn-dns /etc/init.d/gd-dyn-dns
sudo cp ./bin /etc/gd-dyn-dns

sudo chkconfig --add gd-dyn-dns
sudo chkconfig gd-dyn-dns on

echo "Done..."
echo "You can now start the service using `service gd-dyn-dns start` or `sudo systemctl start gd-dyn-dns`."
echo "You can now start the service using `service gd-dyn-dns ?` for more info."