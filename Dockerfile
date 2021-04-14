FROM ubuntu
RUN mkdir -p /tmp/open3aunzip/
RUN apt-get update && apt-get install unzip
COPY open3A-3.3.zip /tmp/open3aunzip/
WORKDIR /tmp/open3aunzip/
RUN unzip open3A-3.3.zip
RUN rm open3A-3.3.zip


FROM php:7.2-apache
COPY --from=0 /tmp/open3aunzip/ /var/www/html/
COPY docker-php-entrypoint /usr/local/bin/
RUN mv /var/www/html/system/ /var/www/html/systemdefault/

RUN sed -i -e 's|;extension=mysqli|extension=mysqli|g' /usr/local/etc/php/php.ini-development \
	&& docker-php-ext-install mysqli \
	&& mkdir /var/www/html/system \
	&& chmod +x /usr/local/bin/docker-php-entrypoint

VOLUME ["/var/www/html/system","/var/www/html/specifics"]
