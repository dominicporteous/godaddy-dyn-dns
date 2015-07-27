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

Then, edit the `username`, `password` and `dns-name` parameters in `/etc/gd-dyn-dns/godaddy.py` to your own, 
then and start the service with `service gd-dyn-dns start` or `sudo systemctl start gd-dyn-dns`


## Windows
You will need the following already installed - python, python pip.

First download the master zip (https://github.com/dominicporteous/godaddy-dyn-dns/archive/master.zip), and extract (e.g. Documents\godaddy-dyn-dns)
Next, go to Start > Run > cmd.exe (make sure you are an Administrator on the PC you are installing on) and follow the steps below.

```

cd Documents\godaddy-dyn-dns
autosetup.bat

```

This will set up the windows service, allowing the script to run until you tell it to stop. 
The service will also start automatically on startup, with a delayed start.