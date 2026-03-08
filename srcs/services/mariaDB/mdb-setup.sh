echo "Initializing database: $MYSQL_DATABASE for user: $MYSQL_USER"
# Ensure the data directory has the right permissions inside the container
chown -R mysql:mysql DB_PATH

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
  echo "First run: Initializing database..."
  # Initialize system tables
  mariadb-install-db --user=mysql --datadir=DB_PATH

  # Start MariaDB in background
  mariadbd-safe --datadir=DB_PATH --skip-networking &

  # Create the Bootstrap SQL file
  cat << EOF > /tmp/init.sql;
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

  # Run Bootstrap
  mariadbd --user=mysql --datadir=/var/lib/mysql --bootstrap < /tmp/init.sql

  # Clean up
  rm /tmp/init.sql
fi

# Finally: Start the real server in the foreground
echo "Starting MariaDB normally..."
exec mariadbd --user=mysql --datadir=DB_PATH

  # Wait for MariaDB to be ready
  #while ! mariadb-admin ping --silent; do
  #    echo "Waiting for MariaDB to start..."
  #    sleep 2
  #done

  # Setup users (Note the change in password syntax!)
  #echo "Configuring users..."

  #mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
  #mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
  #mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
  #mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
  #mariadb -e "FLUSH PRIVILEGES;"

  # Shutdown the temporary server
  #mariadb-admin -u root -p$MYSQL_ROOT_PASSWORD shutdown
#fi
# Finally: Start the real server in the foreground
#echo "Starting MariaDB normally..."
#exec mariadbd --user=mysql --datadir=DB_PATH