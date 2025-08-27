# Directories

SRC_DIR =	srcs/
VOL_DIR =	$(HOME)/data/

# Docker-compose

DOCKER_COMPOSE =	$(SRC_DIR)docker-compose.yml

# Colors

COLOR_DEFAULT =	\033[0m
COLOR_GREEN =	\033[1;38;5;2m
COLOR_BLUE =	\033[1;38;5;4m
COLOR_WHITE =	\033[1;38;5m

# Rules

up:
	@ echo "$(COLOR_GREEN)Setting up Docker services.$(COLOR_DEFAULT)"
	@ mkdir -p $(VOL_DIR)mariadb
	@ mkdir -p $(VOL_DIR)wordpress
	@ docker compose -f $(DOCKER_COMPOSE) up -d --build

down:
	@ echo "$(COLOR_BLUE)Shutting down Docker services and deleting volumes.$(COLOR_DEFAULT)"
	@ docker compose -f $(DOCKER_COMPOSE) down -v

start:
	@ echo "$(COLOR_WHITE)Starting Docker services.$(COLOR_DEFAULT)"
	@ docker compose -f $(DOCKER_COMPOSE) start

stop:
	@ echo "$(COLOR_WHITE)Stopping Docker services.$(COLOR_DEFAULT)"
	@ docker compose -f $(DOCKER_COMPOSE) stop

prune: clean
	@ echo "$(COLOR_WHITE)Removing unused containers, networks and images.$(COLOR_DEFAULT)"
	@ docker system prune -af

clean:
	@ echo "$(COLOR_WHITE)Removing volume directories.$(COLOR_DEFAULT)"
	@ sudo rm -rf $(HOME)/data

re: down prune up

all: up

.PHONY: all up down start stop prune clean re
