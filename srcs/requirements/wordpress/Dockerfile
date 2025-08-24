# Use the downloaded Alpine file to avoid numerous requests
FROM	scratch
ADD	alpine-minirootfs-3.21.4-x86_64.tar.gz /

# Install PHP and zsh for convenience
RUN	apk update && apk upgrade \
	&& apk add php-fpm php-mysqli zsh

# Copy config file
COPY	wordpress.cnf ???

# Copy entrypoint script
COPY	wordpress_entrypoint.sh /
RUN	chmod +x /wordpress_entrypoint.sh

VOLUME	/var/lib/html

EXPOSE	9000

ENTRYPOINT	["/wordpress_entrypoint.sh"]

CMD	["php-fpm8.3"]
