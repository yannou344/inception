echo "Initializing database: $MYSQL_DATABASE for user: $MYSQL_USER"
# Wait for a few seconds to ensure MariaDB is up (Next step: use a real wait-loop)
#sleep 10
#while ! mariadb -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE -e "SELECT 1" >/dev/null 2>&1; do
#while ! mariadb-admin ping -h mariadb --silent; \
while ! nc -z mariadb 3306; \
do
    echo "Waiting for MariaDB to be ready..."
    sleep 3
done

# Go to the directory where WP should be
cd $WP_PATH

if [ ! -f wp-config.php ]; then
  # Read the secret into a local variable
  WP_USER_PASSWORD=$(cat /run/secrets/wordpress_password.txt)
  WP_ADMIN_PASSWORD=$(cat /run/secrets/wordpress_root_password.txt)
  MYSQL_PASSWORD=$(cat /run/secrets/mariadb_password.txt)

  #Download WordPress
  wp core download --allow-root

  # Create config
  wp config create --allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb:3306

  #Install wordpress
  wp core install --allow-root \
        --url=localhost:4443 \
        --title=$SITE_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL
  wp user create --allow-root $WP_USER $WP_USER_EMAIL \
        --role=author --user_pass=$WP_USER_PASSWORD
fi

# Start PHP-FPM in foreground
php-fpm82 -F