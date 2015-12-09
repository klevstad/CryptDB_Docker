#! /bin/sh
# /etc/init.d/cryptdb

export EDBDIR=/opt/cryptdb

case "$1" in
  start)
    echo "Starting cryptdb"
    "$EDBDIR"/bins/proxy-bin/bin/mysql-proxy --plugins=proxy --event-threads=4 --max-open-files=1024 --proxy-lua-script=$EDBDIR/mysqlproxy/wrapper.lua --proxy-address=0.0.0.0:3307 --proxy-backend-addresses=127.0.0.1:3306
    ;;
  stop)
    echo "Stopping cryptdb"
    kill $(ps aux | grep 'mysql-proxy' | awk '{print $2}')
    ;;
  *)
    echo "Usage: cryptdb.sh {start|stop}"
    exit 1
    ;;
esac

exit 0
