FROM php:7.4-fpm

RUN apt-get update \
        && apt-get install libicu-dev libpq-dev libzip-dev git unzip zip libonig-dev libgmp-dev -y; \
    pecl install xdebug; \
    pecl install redis; \
    docker-php-ext-install intl gmp; \
    docker-php-ext-install bcmath ctype json mbstring; \
    docker-php-ext-install openssl tokenizer xml zip; \
    docker-php-ext-install pdo pdo_mysql pdo_pgsql; \
    docker-php-ext-enable xdebug; \
    docker-php-ext-enable redis; \
    docker-ph-ext-enable zip; \
    apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;
        
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
