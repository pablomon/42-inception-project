all: start

start:
	@echo "adding hosts..."
	sudo echo '127.0.0.1 pmontese.42.fr' >> /etc/hosts 
	sudo echo '127.0.0.1 www.pmontese.42.fr' >> /etc/hosts
	@echo "creating volume dirs..."
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	@echo "building..."
	cd ./srcs/ && docker-compose up --build

build:
	cd ./srcs/ &&  docker-compose up --build

up:
	cd ./srcs/ && docker-compose up

down:
	cd ./srcs/ && docker-compose down

clean: down
	cd ./srcs/ && docker system prune
	@echo "removing persistent data..."
	sudo rm -R ~/data/wordpress
	sudo rm -R ~/data/mariadb

re: clean start

.PHONY: start build up down clean re