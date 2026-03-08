FROM alpine:3.22

#Install packages
RUN apk update && apk add --no-cache \
    curl \
    mariadb-client \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-phar \
    php82-mbstring \
    php82-iconv

#Link PHP binary
RUN    ln -s /usr/bin/php82 /usr/bin/php

#Increase Memory Limit
RUN sed -i "s/memory_limit = 128M/memory_limit = 512M/g" /etc/php82/php.ini

#Change PHP-FPM to listen on the network (Fixes your next error)
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf

#Setup WP-CLI and Script
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p WP_PATH
COPY --chmod=+x wp-setup.sh /
ENTRYPOINT [ "sh", "/wp-setup.sh" ]