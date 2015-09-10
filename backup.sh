#/usr/bin/env bash

set -e

if [[ $# < 1 ]]
then
  echo "usage: `basename $0` wp|db"
  exit 1
fi

case "$1" in
  "wp")
    SRC="/var/www/html"
    ;;
  "db")
    SRC="/var/lib/mysql"
    ;;
  *)
    echo "unknown action '$1', use 'wp' or 'db'"
    exit 2
    ;;
esac

docker run --rm --volumes-from bremmekampcom_$1-data_1 -v `pwd`:/backup ubuntu tar cvfz /backup/${1}data.tgz $SRC
