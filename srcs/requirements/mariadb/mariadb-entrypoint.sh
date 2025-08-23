# Subsitute all environment variables in initialization file
if [ -f /entrypoint-initdb.d/init.sql.template ]; then
	envsubst < /entrypoint-initdb.d/init.sql.template > /etc/mysql/init.sql
	rm /entrypoint-initdb.d/init.sql.template
fi

# Start MariaDB
exec "$@"
