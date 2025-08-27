# Use the downloaded Alpine file to avoid numerous requests
FROM	scratch
ADD	alpine-minirootfs-3.21.4-x86_64.tar.gz /

# Install PHP, curl, fcgi and zsh
RUN	apk update && apk upgrade \
	&& apk add --no-cache php84-fpm php84-cli php84-mysqli php84-mbstring php84-phar zsh curl fcgi

# Copy config file
COPY	wordpress.cnf /etc/php/php-fpm.d/www.conf

# Create www-data user
RUN	adduser -S -G www-data www-data

# Create directory for the socket file
RUN	mkdir -p /run/php && chown -R www-data:www-data /run/php

# Copy entrypoint script
COPY	wordpress_entrypoint.sh /
RUN	chmod +x /wordpress_entrypoint.sh

# Create and work from /var/www/html
WORKDIR	/var/www/html

# Download WP-CLI
RUN	curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp

VOLUME	/var/www/html

EXPOSE	9000

ENTRYPOINT	["/wordpress_entrypoint.sh"]

CMD	["php-fpm84", "-F"]
