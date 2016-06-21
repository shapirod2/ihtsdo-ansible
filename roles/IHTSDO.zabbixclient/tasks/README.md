# default template role  - edit to suit
In this directory:
             
tasks:       This directory contains all of the tasks that would normally be in 
             a playbook. 
             These can reference files and templates contained in their 
             respective directories without using a path.
             
             
This task installs a zabbix client. 

If zabbix_encryption is set to "ssl" then it will install ssl encryption
If zabbix_encryption is set to "ssh" then it will install auto-ssh encryption

Note ssl encryption requires the use of Zabbix 3.0+

The ssl encryption requires a psk file and should be set up in the Zabbix web UI as follows:

Host:

Host Tab:

Agent Interfaces 
  DNS Name insert "dns name of host being added or changed (e.g. x.y.com)" 
  Connect To: Choose "DNS"
  Port: "10050" (i.e. the default)
  
Encryption Tab:
  Connections to Host: "PSK"
  Connections from host: "PSK"
  PSK identity: Retrieve from PSK file (e.g. "PSK 001")
  PSK: Retrieve from PSK file (e.g. "af8ced32dfe8714e548694e2d29e1a14ba6fa13f216cb35c19d0feb1084b0429" )
  
  
To generate a PSK 
See: https://www.zabbix.com/documentation/3.0/manual/encryption/using_pre_shared_keys

But in general : "openssl rand -hex 32"

Which gives a key much like "af8ced32dfe8714e548694e2d29e1a14ba6fa13f216cb35c19d0feb1084b0429"  

Save that in a file called zabbix_agentd.psk (or whatever you set {{zabbix_psk_file}} to in the defaults main file)
    
  
  
  
  
  
  
  