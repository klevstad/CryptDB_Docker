#!/bin/sh
### BEGIN INIT INFO
# Provides: cryptdb.sh
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 2 3 4 5
# Short-Description: Cryptdb Shell
# Description: Cryptdb Shell
### END INIT INFO

# PATH should only include /usr/* if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Cryptdb Shell"
NAME=cryptdb
EDBDIR=/opt/cryptdb
DAEMON_ARGS="--plugins=proxy
            --event-threads=4
            --max-open-files=1024
            --proxy-lua-script=$EDBDIR/mysqlproxy/wrapper.lua
            --proxy-address=0.0.0.0:3307
            --proxy-backend-addresses=127.0.0.1:3306"
DAEMON="$EDBDIR/bins/proxy-bin/bin/mysql-proxy"
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME
CHUID=root

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions

#
# Function that starts the daemon/service
#
do_start()
{
  start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
  echo "Successfully started $NAME."
}

#
# Function that stops the daemon/service
#
do_stop()
{
  kill $(ps aux | grep $DAEMON | grep -v 'grep' | awk '{print $2}')
  echo "Successfully stopped $NAME."
}

case "$1" in
  start)
   echo "Starting $DESC" "$NAME"
   do_start
   ;;
  stop)
   echo "Stopping $DESC" "$NAME"
   do_stop
   ;;
  *)
   echo "Usage: $SCRIPTNAME {start|stop}" >&2
   exit 3
   ;;
esac
