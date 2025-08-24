#!/bin/sh

# Subsitute all environment variables in initialization file
if [ -f /entrypoint-initdb.d/init.sql.template ]; then
	mariadb-install-db --user=mysql --ldata=/var/lib/mysql
	envsubst < /entrypoint-initdb.d/init.sql.template > /etc/mysql/init.sql
	rm /entrypoint-initdb.d/init.sql.template
fi

# Start MariaDB
$@
