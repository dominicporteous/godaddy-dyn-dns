# godaddy-dyn-dns
Simple set up of Dynamic DNS record updating - allow access to your home computer from the internet, even with a dynamic IP

## Credits
Big thanks to the guys who put together `pygodaddy` - https://github.com/observerss/pygodaddy
Docs can be found here: https://pygodaddy.readthedocs.org/

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

```	
Depending on the architecture of your windows PC, run either the 32 or 64 version of the autosetup batch file.
	`win\autosetup-32.bat` OR `win\autosetup-64.bat`


This will set up the windows service, allowing the script to run until you tell it to stop. 
The service will also start automatically on startup, with a delayed start.


# Advanced Usage

You can also update more than one DNS record at a time, using any variable you choose if you edit the `godaddy.py` file.

```

	from pygodaddy import GoDaddyClient
	import requests
	import time 

	while True:
		client = GoDaddyClient()

		ip = requests.get('http://canihazip.com/s').text
		secip = ip = requests.get('http://yourwebservice/api/ip').text

		with open( 'last_ip.dat', 'w+' ) as last_ip:
			if( last_ip != ip ):
				f = open( 'last_ip.dat', 'w' )
				f.write( ip )
				f.close()

				username='godaddy-username'
				password='godaddy-password'

				if client.login( username, password ):
					client.update_dns_record( 'your.dns.record', ip )
					client.update_dns_record( 'another.dns.record', sec_ip )
		
		time.sleep(300)

```