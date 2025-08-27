#!/bin/sh

# Increase PHP memory limit
sed -i 's/^memory_limit\s*=.*/memory_limit = 512M/' /etc/php84/php.ini

# Download WordPress files
if [ ! -f index.php ]; then
	wp core download --allow-root
fi

# Install WordPress, create config file and users
if [ ! -f wp-config.php ]; then
	wp core config --dbname=wordpress --dbuser=$MYSQL_USERNAME \
		--dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME --title=$TITLE \
		--admin_user=$WORDPRESS_USERNAME_OP \
		--admin_password=$WORDPRESS_PASSWORD_OP \
		--admin_email=$WORDPRESS_EMAIL_OP --allow-root
	wp user create $WORDPRESS_USERNAME $WORDPRESS_EMAIL --role=author \
		--user-pass=$WORDPRESS_PASSWORD --allow-root
fi

# Start PHP
exec "$@"
