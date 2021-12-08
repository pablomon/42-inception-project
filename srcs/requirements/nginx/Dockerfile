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



# RUN apt-get update 
# RUN apt-get install -y nginx openssl vim less net-tools procps
# RUN rm /etc/nginx/sites-available/default
# RUN rm /etc/nginx/sites-enabled/default

# COPY tools/nginx.conf /etc/nginx/sites-available/default  
 
# RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/nginx/ssl/www.lusehair.42.fr.crt -keyout /etc/nginx/ssl/www.lusehair.42.fr.key -subj "/C=FR/ST=Paris/CN=lusehair"
# RUN chmod 777 /etc/nginx/ssl/*
# RUN chmod 777 -R /var/www 
# RUN chown -R www-data:www-data /var/www/
# EXPOSE 443 
# ENTRYPOINT ["nginx","-g","daemon off;"]

