FROM php:7.2.6-fpm-alpine

ARG PHP_USER_ID=1000
ARG PHP_GROUP_ID=1000

RUN addgroup -g $PHP_GROUP_ID -S php && \
    adduser -u $PHP_USER_ID -D -S -G php php

ADD docker/php-extra-libs.sh  /usr/sbin/php-extra-libs.sh
ADD docker/fpm.conf           /usr/local/etc/php-fpm.d/www.conf
ADD docker/php.ini            /usr/local/etc/php/conf.d/service.ini

ADD ./api /app

RUN /usr/sbin/php-extra-libs.sh

WORKDIR /app

RUN composer install --no-dev --optimize-autoloader --no-progress

EXPOSE 9000
