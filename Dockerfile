FROM php:7.4.5-fpm

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
    apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN /usr/bin/composer global require hirak/prestissimo
