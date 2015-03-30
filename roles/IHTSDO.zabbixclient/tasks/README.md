# default template role  - edit to suit
In this directory:
             
tasks:       This directory contains all of the tasks that would normally be in 
             a playbook. 
             These can reference files and templates contained in their 
             respective directories without using a path.
             
             
su tun -c 'autossh -M 0 -q -f -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -N -R 2222:localhost:22 tun@www.softfab.co.uk'
printf "Bringing up tunnel to www"




On WWW:

ssh localhost -p 2222     

To make this simple, we will use the machines root user to make the connections for us. First we need to create a SSH keypair (on the agent-machine) for the connections. Each of the agent-machines will have their own keypair.


#sudo mkdir -p /root/.ssh
#sudo ssh-keygen -t rsa -C "zabbixagent@example.com" -f /root/.ssh/zabbixagent_id_rsa -N ''
#sudo cat /root/.ssh/zabbixagent_id_rsa.pub

Once done, the public key (that is displayed on the screen) should be added to /home/zabbixagent/.ssh/authorized_keys on zabbix-srv.example.com

#scp /root/.ssh/zabbixagent_id_rsa.pub zabbix-srv.example.com:/home/zabbixagent/.ssh/authorized_keys

On zabbix-srv.example.com


# chown -R zabbixagent:zabbixagent /home/zabbixagent
# chmod 440 /home/zabbixagent/.ssh/authorized_keys
We should now be able to make a couple of tunnels to and from zabbix-srv.example.com:
To test it and to add zabbix-srv.example.com to the trusted list of machines, we can try to log in:

#sudo ssh -i /root/.ssh/zabbixagent_id_rsa zabbixagent@zabbix-srv.example.com

This should give us a welcome text, something like this:
Linux zabbix-srv.example.com 3.10.3-x86_64 Wed Oct 23 15:24:17 EDT 2013

All should be ready to go. To set up the tunnel from srv1 we need to run these two commands:

#sudo autossh -i /root/.ssh/zabbixagent_id_rsa -Nf -M 20550 -R 10150:localhost:10050 -L 10051:localhost:10051 zabbixagent@zabbix-srv.example.com

for srv2 it's:
#sudo autossh -i /root/.ssh/zabbixagent_id_rsa -Nf -M 20550 -R 10250:localhost:10050 -L 10051:localhost:10051 zabbixagent@zabbix-srv.example.com

and for srv3 it's:
#sudo autossh -i /root/.ssh/zabbixagent_id_rsa -Nf -M 20550 -R 10350:localhost:10050 -L 10051:localhost:10051 zabbixagent@zabbix-srv.example.com        
