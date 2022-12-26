FROM php:7.4-apache


USER root

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential
RUN apt-get install -y libxml2-dev

RUN mkdir /home/share
RUN chmod 777 /home/share

# enable modules
# rewrite_module (shared), proxy_module (shared), socache_shmcb_module (shared), ssl_module (shared)

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod socache_shmcb
RUN a2enmod ssl

RUN service apache2 restart

# copy and update the web config /web_config/apache2/ to /etc/apache2/
COPY ./web_config/apache2/sites-enabled/* /etc/apache2/site-enabled/
COPY ./web_config/apache2/conf-enabled/* /etc/apache2/conf-enabled/
