# Use the downloaded Alpine file to avoid the numerous requests to DockerHub
FROM	scratch
ADD	alpine-minirootfs-3.22.0-x86_64.tar.gz /

# Install MariaDB, gettext-base for envsubst and zsh for convenience
RUN	apk update && apk upgrade \
	&& apk add --no-cache mariadb-server mariadb-client zsh gettext-base

# Copy config file
COPY	mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy initialization file
RUN	mkdir /entrypoint-initdb.d
COPY	init.sql.template /entrypoint-initdb.d

# Create directory for socket & pid files
RUN	mkdir -p /run/mysqld

# Copy entrypoint script
COPY	mariadb_entrypoint.sh .
RUN	chmod +x mariadb_entrypoint.sh

EXPOSE	3306

ENTRYPOINT	["mariadb_entrypoint.sh"]

CMD	["mariadb"]
