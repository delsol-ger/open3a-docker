FROM php:7.2-apache

COPY open3A-3.3.zip /var/www/html/
RUN apt-get update && apt-get install unzip
RUN unzip open3A-3.3.zip
RUN rm open3A-3.3.zip
COPY docker-php-entrypoint /usr/local/bin/
RUN mv /var/www/html/system/ /var/www/html/systemdefault/

RUN sed -i -e 's|;extension=mysqli|extension=mysqli|g' /usr/local/etc/php/php.ini-development \
	&& docker-php-ext-install mysqli \
	&& mkdir /var/www/html/system \
	&& chmod +x /usr/local/bin/docker-php-entrypoint

VOLUME ["/var/www/html/system","/var/www/html/specifics"]
