NAME = inception
COMPOSE_FILE = srcs/compose.yaml
DATA_PATH = /home/yroard/data

dirs_management:
	@if [ ! -d $(DATA_PATH) ]; then \
    		echo "Creating $(DATA_PATH) with admin rights"; \
    		sudo mkdir -p $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb; \
    		sudo chown -R $(USER):$(USER) $(DATA_PATH); \
    	else \
    		echo "$(DATA_PATH) already exists."; \
    	fi

#Build and run
all: dirs_management build

build:
	@mkdir -p $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb
    	docker-compose -p $(NAME) -f $(COMPOSE_FILE) up -d --build

up: dirs_management
		docker-compose -p $(NAME) -f $(COMPOSE_FILE) up -d

down:
		docker-compose -p $(NAME) -f $(COMPOSE_FILE) down

stop:
		docker-compose -p $(NAME) -f $(COMPOSE_FILE) stop

restart:
		docker-compose -p $(NAME) -f $(COMPOSE_FILE) restart

logs:
		docker-compose -p $(NAME) -f $(COMPOSE_FILE) logs -f

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

re: fclean all

#Hard reset
fullreset:
	@echo "Performing full reset: stopping, removing, pruning, and recreating everything..."
	-docker-compose -p $(NAME) -f $(COMPOSE_FILE) down --volumes --remove-orphans
	docker system prune -af --volumes
	sudo rm -rf $(DATA_PATH)
	sudo mkdir -p $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb
	sudo chown -R $(USER):$(USER) $(DATA_PATH)
	docker-compose -p $(NAME) -f $(COMPOSE_FILE) up -d --build
	@echo "Full reset complete. Your project is now clean and rebuilt."

.PHONY: all build up down stop restart logs clean fclean re fullreset dirs_management