If not running with 16 GB of ram the ts will fail to start.

go to /opt/termserver/bin/dmk.sh
Change:
-Xms5g \
-Xmx10g \

to suit


