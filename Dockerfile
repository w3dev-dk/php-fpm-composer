FROM composer:1.6 AS composer
FROM php:7.2-fpm

MAINTAINER Lasse Enoe Barslund <lasse_enoe@hotmail.com>

# Install composer reguirements and configure the setup
ENV COMPOSER_REQUIREMENTS openssh-client git unzip
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt-get update \
    && apt-get install -y --no-install-recommends $COMPOSER_REQUIREMENTS \
    && rm -r /var/lib/apt/lists/*

# Copy custom configuration
COPY custom.ini /usr/local/etc/php/conf.d/custom.ini

WORKDIR /var/www