from pygodaddy import GoDaddyClient
import requests
import time 

while True:
	client = GoDaddyClient()

	ip = requests.get('http://canihazip.com/s').text

	with open( 'last_ip.dat', 'w+' ) as last_ip:
		if( last_ip != ip ):
			f = open( 'last_ip.dat', 'w' )
			f.write( ip )
			f.close()

			username='godaddy-username'
			password='godaddy-password'

			if client.login( username, password ):
				client.update_dns_record( 'your.dns.record', ip )
	
	time.sleep(300)