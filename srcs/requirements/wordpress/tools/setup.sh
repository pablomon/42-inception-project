#!bin/bash
sleep 10					#Give mysql time to run
FILE=/var/www/wordpress/wp-config.php 
if [ ! -f "$FILE" ]; then	#Test whether wordpress is already installed
   wp core download --allow-root --path='/var/www/wordpress'
	wp core config \
		--allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_LOGIN \
		--dbpass=$DB_PASS \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	wp core install \
		--allow-root \
		--url=$DOMAIN \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMINPASS \
		--admin_email="fake1@email.com" \
		--skip-email \
		--path='/var/www/wordpress'

	wp user create \
		--allow-root \
		$WP_USER \
		irrelevant@email.com \
		--user_pass=$WP_USERPASS \
		--role=author
fi

php-fpm7.3 --nodaemonize
