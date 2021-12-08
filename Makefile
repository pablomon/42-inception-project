HOMEDIR = /home/pmontese

all: start

start:
	@echo
	@echo "WARNING: you need to run with sudo"
	@echo
	@sleep 1
	@echo "adding pmontese.42.fr to hosts..."
	sudo echo '127.0.0.1 pmontese.42.fr' >> /etc/hosts;
	sudo echo '127.0.0.1 www.pmontese.42.fr' >> /etc/hosts;	
	@echo "creating volume dirs..."
	sudo mkdir -p $(HOMEDIR)/data/wordpress
	sudo mkdir -p $(HOMEDIR)/data/mariadb
	@echo "building..."
	cd ./srcs/ && docker-compose up --build

build:
	cd ./srcs/ &&  docker-compose up --build

up:
	@echo "starting containers..."
	cd ./srcs/ && docker-compose up

down:
	@echo "stopping containers..."
	cd ./srcs/ && docker-compose down

ps:
	cd ./srcs/ && docker-compose ps

rmvol: down
	docker volume rm $$(docker volume ls -q);
	sudo rm -R $(HOMEDIR)/data/wordpress;\
	sudo rm -R $(HOMEDIR)/data/mariadb;\
	mkdir -p $(HOMEDIR)/data/wordpress;\
	mkdir -p $(HOMEDIR)/data/mariadb;

clean:	
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker network rm $$(docker network ls -q);\
	docker volume rm $$(docker volume ls -q);\
	sudo rm -R $(HOMEDIR)/data/wordpress;\
	sudo rm -R $(HOMEDIR)/data/mariadb;

re: rmvol start

.PHONY: start build up down clean re ps