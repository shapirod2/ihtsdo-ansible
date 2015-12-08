# This Script will install and deploy the IHTSDO Terminology server.

## Points to note

(1) If not running with 16 GB of ram the terminology server will fail to start as the JVM will not be able to gain sufficient memory

go to /opt/termserver/bin/dmk.sh
Change:
-Xms5g \
-Xmx10g \

to suit the machinery you are running on. Generally for basic development :
-Xms1g \
-Xmx2g \

Will do.





