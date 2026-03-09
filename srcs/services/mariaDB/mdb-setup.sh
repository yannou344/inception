echo "Initializing database: $MYSQL_DATABASE for user: $MYSQL_USER"
# Ensure the data directory has the right permissions inside the container
chown -R mysql:mysql $DB_PATH

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
  echo "First run: Initializing database..."
  # Initialize system tables
  mariadb-install-db --user=mysql --datadir=$DB_PATH

  # Read the secret into a local variable
  MYSQL_PASSWORD=$(cat /run/secrets/mariadb_password.txt)
  MYSQL_ROOT_PASSWORD=$(cat /run/secrets/mariadb_root_password.txt)

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
exec mariadbd --user=mysql --datadir=$DB_PATH