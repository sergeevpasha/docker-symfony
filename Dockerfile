FROM php:8.2-fpm

COPY ./php.ini /usr/local/etc/php/

ARG UNAME=admin
ARG UGROUP=admin
ARG UID=1000
ARG GID=1000

RUN useradd -ms /bin/bash $UNAME
RUN usermod -aG sudo $UNAME
RUN usermod  --uid $UID $UNAME
RUN groupmod --gid $GID $UGROUP

RUN apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    cron \
    apt-utils \
    build-essential \
    wget \
    locales \
    locales-all \
    libc-client-dev \
    libxml2-dev \
    libkrb5-dev \
    libssl-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev\
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev \
    zip \
    unzip \
    zlib1g-dev \
    libfreetype6-dev \
    jpegoptim optipng pngquant gifsicle \
    libpq-dev \
    libicu-dev g++ \
    gnupg2 \
    curl \
    git \
    && pecl install xdebug \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install pdo_pgsql zip exif pcntl gd bcmath soap gettext imap intl opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd \
    && docker-php-ext-enable xdebug

EXPOSE 9000 9003

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER $UNAME

RUN echo $HOME && echo $PATH

RUN curl -sS https://get.symfony.com/cli/installer | bash

ENV PATH="/home/$UNAME/.symfony5/bin:$PATH"

WORKDIR /var/www
