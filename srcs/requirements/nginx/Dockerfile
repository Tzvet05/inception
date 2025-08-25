# Use the downloaded Alpine file to avoid numerous requests
FROM	scratch
ADD	alpine-minirootfs-3.21.4-x86_64.tar.gz /

# Install NginX, OpenSSL and zsh
RUN	apk update && apk upgrade \
	&& apk add --no-cache nginx openssl zsh

# Create certificate directory
RUN	mkdir -p /etc/nginx/ssl

# Create self-signed certificate
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-out /etc/nginx/ssl/certificate.crt \
		-keyout /etc/nginx/ssl/certificate.key \
		-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=ttrave.42.fr/UID=ttrave"

# Create directory for the PID file
RUN	mkdir -p /var/run/nginx

# Copy config file
COPY	nginx.cnf /etc/nginx/http.d/nginx.conf

VOLUME	/var/www/html

EXPOSE	443

CMD	["nginx", "-g", "daemon off"]
