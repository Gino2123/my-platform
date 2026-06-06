FROM php:8.3-fpm-alpine

# Dépendances système
RUN apk add --no-cache \
    bash \
    curl \
    git \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    oniguruma-dev \
    libxml2-dev \
    icu-dev \
    linux-headers \
    $PHPIZE_DEPS

# Extensions PHP
RUN docker-php-ext-configure gd --with-jpeg --with-webp \
 && docker-php-ext-install \
    pdo_mysql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd \
    xml \
    intl \
    opcache

# Redis extension
RUN pecl install redis && docker-php-ext-enable redis

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Config PHP
COPY docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

# Répertoire applicatif
WORKDIR /var/www/html

# IMPORTANT
# Copie du projet Laravel
COPY app/ .

# Installation des dépendances PHP
RUN composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction

# Permissions Laravel
RUN mkdir -p storage/logs bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache && \
    chmod -R 775 storage bootstrap/cache

RUN chown -R www-data:www-data \
    storage \
    bootstrap/cache

# Exécution en utilisateur non privilégié
USER www-data

# Droits
#RUN addgroup -g 1000 www && adduser -u 1000 -G www -s /bin/sh -D www
#USER www

EXPOSE 9000
CMD ["php-fpm"]