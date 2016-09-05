## ReadMe for setting up/ tuning the http(s) Dos (denial of Service) protection using Fail2Ban
Based on :
https://www.garron.me/en/go2linux/fail2ban-protect-web-server-http-dos-attack.html

#### Basics:

The Filter (http-get-dos.conf) looks through the access log file (defined via logpath) looking for the word "GET".
Other http command words/verbs could be added if required (e.g. POST or PUT).

The settings are in the default/mail.yml and are a descendant of fail2ban_services:

name: "http(s)"
enabled: "true"
port: "http,https"
filter: "http-get-dos"
logpath: "/var/log/nginx/access.log"
action: "iptables[name=HTTP, port=http, protocol=tcp]"
maxretry: 300
findtime: 300
    
You might wish to change the logpath if using apache rather than nginx else the only 3 settings you may want to play with are:

    maxretry: 300
    findtime: 300
    bantime: 300   
    
##maxretry:

#Defaults to 3

This option is used to set the limit of retries a user have before he gets blocked
Clearly for detecting a DOS while not catching real users this should be a high number and thus should be set. 
At the moment it is set to 300 during the period being looked at.


##findtime:

#Defaults to 10 minutes (600 Seconds) if not set  

The time window (in seconds) where the maxretry times should occur, for the IP to get blocked 
    
##bantime: 

#Defaults to 10 minutes (600 Seconds) if not set    

This option is used to set the time (in seconds) an IP will be banned, maybe a good option could be 5 minutes so, 300 seconds, this will put bots away while also letting legitimate users to try again after the ban time ends

So the standard setting:

    maxretry: 300
    findtime: 300
    bantime: 300
    
Says: "If an ip retries 300 times within 300 seconds then ban that ip for 300 seconds" 

You may want to ban longer or change the maxretry/findtime ratio.

