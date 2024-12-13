# WordPress Dockerfile: Create container from official WordPress image, basic customizations.
# docker build -t dpoon-wordpress:1.0 .

FROM wordpress:latest

# APT Update/Upgrade, then install packages we need
RUN apt update && \
    apt upgrade -y && \
    apt autoremove && \
    apt install -y \
    gifsicle \
    libjpeg-progs \
    optipng \
    nano \
    vim \
    wget

# Replace php.ini
COPY ./uploads.ini /usr/local/etc/php/conf.d

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info&& \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    # Remove old php.ini files (wihtout creating new image)
    rm /usr/local/etc/php/php.ini-development && \
    rm /usr/local/etc/php/php.ini-production
