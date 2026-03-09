NAME = inception
COMPOSE_FILE = srcs/compose.yaml
DATA_PATH = /home/yroard/data
SECRETS_PATH = ./secrets
DOMAIN_NAME=yroard.42.fr

dirs_management:
	@if [ ! -d $(DATA_PATH) ]; then \
    		echo "Creating $(DATA_PATH) with admin rights"; \
    		sudo mkdir -p $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb; \
    		sudo chown -R $(USER):$(USER) $(DATA_PATH); \
    	else \
    		echo "$(DATA_PATH) already exists."; \
    	fi

# Update 'all' to ensure secrets are generated before building
all: dirs_management secrets build

build:
		@mkdir -p $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb
		docker compose -p $(NAME) -f $(COMPOSE_FILE) up -d --build

up: dirs_management secrets
		docker compose -p $(NAME) -f $(COMPOSE_FILE) up -d

down:
		docker compose -p $(NAME) -f $(COMPOSE_FILE) down

stop:
		docker compose -p $(NAME) -f $(COMPOSE_FILE) stop

restart:
		docker compose -p $(NAME) -f $(COMPOSE_FILE) restart

logs:
		docker compose -p $(NAME) -f $(COMPOSE_FILE) logs -f

#Clean and reset
clean: down
	@echo "Cleaning Docker system and data directories..."
	docker system prune -af
	docker volume prune -f
	sudo rm -rf $(DATA_PATH)

fclean: clean
	@echo "Full cleanup: removing containers, networks, volumes, and images..."
	docker rm -f $$(docker ps -aq) 2>/dev/null || true
	docker network prune -f
	docker system prune -af --volumes
	@sudo rm -rf $(SECRETS_PATH)

re: fclean all

#Hard reset
reset:
	@echo "Performing full reset: stopping, removing, pruning..."
	-docker compose -p $(NAME) -f $(COMPOSE_FILE) down --volumes --remove-orphans
	docker system prune -af --volumes
	sudo rm -rf $(DATA_PATH)

fullreset: reset all
	@echo "Full reset complete. Your project is now clean and rebuilt."

# Add a target to generate the SSL certificate
secrets:
	@mkdir -p $(SECRETS_PATH)
	@if [ ! -f $(SECRETS_PATH)/inception.key ]; then \
		echo "Generating SSL certificates..."; \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout $(SECRETS_PATH)/inception.key \
			-out $(SECRETS_PATH)/inception.crt \
			-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42/CN=$(DOMAIN_NAME)/UID=yroard"; \
		echo "Generating secret files..."; \
		#touch $(SECRETS_PATH)/mariadb_password.txt; \
		#touch $(SECRETS_PATH)/mariadb_root_password.txt; \
		#touch $(SECRETS_PATH)/wordpress_password.txt; \
		#touch $(SECRETS_PATH)/wordpress_root_password.txt; \
		head -c 16 /dev/urandom | base64 > $(SECRETS_PATH)/mariadb_password.txt; \
		head -c 16 /dev/urandom | base64 > $(SECRETS_PATH)/mariadb_root_password.txt; \
		head -c 16 /dev/urandom | base64 > $(SECRETS_PATH)/wordpress_password.txt; \
		head -c 16 /dev/urandom | base64 > $(SECRETS_PATH)/wordpress_root_password.txt; \
	fi

.PHONY: all build up down stop restart logs clean fclean re reset fullreset dirs_management secrets