# Use the downloaded Alpine file to avoid numerous requests
FROM	scratch
ADD	alpine-minirootfs-3.21.4-x86_64.tar.gz /

# Install MariaDB, gettext for envsubst and zsh for convenience
RUN	apk update && apk upgrade \
	&& apk add --no-cache mariadb mariadb-client zsh gettext

# Copy config file
COPY	mariadb.cnf /etc/my.cnf.d/mariadb-server.cnf

# Copy initialization file
RUN	mkdir -p /entrypoint-initdb.d \
	&& mkdir -p /etc/mysql/
COPY	init.sql.template /entrypoint-initdb.d

# Create directory for socket & pid files
RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copy entrypoint script
COPY	mariadb_entrypoint.sh /
RUN	chmod +x /mariadb_entrypoint.sh

VOLUME	/var/lib/mysql

EXPOSE	3306

ENTRYPOINT	["/mariadb_entrypoint.sh"]

CMD	["mariadbd", "--user=mysql", "--skip-networking=0"]
