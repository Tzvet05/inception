#!/bin/sh

# Download WordPress files
wp core download --allow-root

# Create config file
if [ ! -f wp-config.php ]; then
	wp config create --dbname=wordpress --dbuser=$MYSQL_USERNAME \
		--dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
fi

# Install WordPress
wp core install --url=$DOMAIN_NAME --title=$TITLE \
	--admin_user=$WORDPRESS_USERNAME_OP --admin_password=$WORDPRESS_PASSWORD_OP \
	--admin_email=$WORDPRESS_EMAIL_OP --allow-root

wp user create $WORDPRESS_USERNAME $WORDPRESS_EMAIL --role=author \
	--user-pass=$WORDPRESS_PASSWORD --allow-root

# Start PHP
exec "$@"
