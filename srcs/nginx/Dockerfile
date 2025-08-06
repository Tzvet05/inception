FROM	scratch

ADD	alpine-minirootfs-3.22.0-x86_64.tar.gz /

# add --no-cache & tls 1.2/1.3 | do I need to upgrade/install nginx ?
RUN	apk update \
	&& apk upgrade \
	&& apk add openssl \
	&& apk add nginx \
	&& adduser -D -g 'www' www \
	&& mkdir -p /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

COPY	nginx.conf /etc/nginx/nginx.conf

#VOLUME	[""]

ENTRYPOINT	["nginx"]

EXPOSE	443

CMD	["nginx", "-g", "daemon off"]
