FROM debian:buster 

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY tools/setup.sh . 
RUN chmod +x setup.sh 

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d
RUN mysql_install_db

ENTRYPOINT ["bin/bash", "setup.sh"]

