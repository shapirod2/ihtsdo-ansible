#!/bin/sh
### BEGIN INIT INFO
# Provides:          sonarqube
# Required-Start:    $local_fs $remote_fs $network $time $named mysql
# Required-Stop:     $local_fs $remote_fs $network $time $named mysql
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: SonarQube
# Description:       Open platform to manage code quality
### END INIT INFO

NAME=sonarqube
SCRIPTNAME=/etc/init.d/$NAME

if [ `id -u` -ne 0 ]; then
  echo "The $NAME init script can only be run as root"
  exit 1
fi

MACHINE_TYPE=`getconf LONG_BIT`
if [ "${MACHINE_TYPE}" = "64" ]; then
  JSW=/opt/sonarqube/bin/linux-x86-64/sonar.sh
else
  JSW=/opt/sonarqube/bin/linux-x86-32/sonar.sh
fi

do_start()
{
  su sonar -c "$JSW start"
}

do_stop()
{
  su sonar -c "$JSW stop"
}

do_status()
{
  su sonar -c "$JSW status"
}

do_restart()
{
  su sonar -c "$JSW restart"
}

case "$1" in
  start)
    do_start
    ;;
  stop)
    do_stop
    ;;
  status)
    do_status
    ;;
  restart|force-reload)
    do_restart
    ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
    exit 3
    ;;
esac

exit 0