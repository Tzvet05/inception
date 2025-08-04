FROM	scratch

ADD	alpine-minirootfs-3.22.1-x86_64.tar.gz

RUN	adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

COPY	./nginx.conf /
