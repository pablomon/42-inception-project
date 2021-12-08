FROM debian:buster 

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install openssl -y
#Generate certificate for pmontese.42.fr
RUN openssl req -x509 -newkey rsa:2048 -nodes -sha256 \
        -keyout /etc/ssl/private/pmontese.key \
        -out /etc/ssl/certs/pmontese.crt \
        -subj "/CN=localhost"
COPY tools/nginx-conf /etc/nginx/sites-available/default
RUN sed -i.bak 's/aDomain/${DOMAIN}/' /etc/nginx/sites-available/default
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]