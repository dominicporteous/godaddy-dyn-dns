# godaddy-dyn-dns
Simple set up of Dynamic DNS record updating - allow access to your home computer from the internet, even with a dynamic IP

# Quick Start

## Linux
You will need the following already installed - unzip, python, python pip. Can be done as non root user, with sudo.

```

cd /tmp
sudo wget https://github.com/dominicporteous/godaddy-dyn-dns/archive/master.zip
sudo unzip master.zip -d godaddy-dyn-dns

sudo cd godaddy-dyn-dns/linux

sudo chmod 755 autosetup.sh
sudo ./autosetup.sh 

```