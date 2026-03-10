DEVELOPPER DOCUMENTATION

Prerequisites

Operating System: 
    Debian VM
Domain Mapping: 
    Add 127.0.0.1 yroard.42.fr to /etc/hosts file." thanks  to nano command
Docker Engine: 
    Official Docker Engine (and the compose plugin) is required.

Preparation

Template of environment file (to add to root):
# Domain configuration
DOMAIN_NAME=yroard.42.fr

# MySQL/MariaDB configuration
# These are commented out because they are now handled by secrets
#MYSQL_ROOT_PASSWORD
MYSQL_DATABASE=wordpress_db
MYSQL_USER=sql_user
#MYSQL_PASSWORD

# WordPress configuration
WP_ADMIN_USER=super_user
#WP_ADMIN_PASSWORD
WP_ADMIN_EMAIL=super_user@42.fr
WP_USER=wp_user
WP_USER_EMAIL=user@42.fr
#WP_USER_PASSWORD

# Paths
# Used for volume mapping and script navigation
WP_PATH=/var/www/wordpress
DB_PATH=/var/lib/mysql



Compilation & Execution

make all: create the directories, setup the creation of SSL certificates and secret files,
    builds the images and starts the containers in detached mode.

make stop: Stops the services without removing them.

make clean: Stops containers, networks and removes the Docker network.

make fclean: The "Nuclear" option—removes containers, networks, volumes, and images.

make re: A full rebuild from scratch.


Managing containers and volume
command: "Docker ps"


Testing the project
- Web access: https://yroard.42.fr
- SSL Check: TLS version verification
    "openssl s_client -connect localhost:443 -tls1_2"
- Database Persistence: make down then make up, the data should be kept into Wordpress website.