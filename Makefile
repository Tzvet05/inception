# Rules

all: up

up:
	@ mkdir -p /home/ttrave/data/mariadb
	@ mkdir -p /home/ttrave/data/wordpress
	@ docker compose -f srcs/docker-compose.yml up --build -d

down:
	@ docker compose -f srcs/docker-compose.yml down -v

.PHONY: all up down 
