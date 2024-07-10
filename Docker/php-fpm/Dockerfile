ARG VERSION_PHP

FROM php:$VERSION_PHP

RUN apt-get update && apt-get install -y \
	vim \
	zip \
	libzip-dev \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	yarn \
	libmagickwand-dev \
	git \
	curl && \
	pecl install imagick && \ 
	docker-php-ext-install mysqli pdo pdo_mysql zip exif opcache && \
	docker-php-ext-configure gd --with-freetype --with-jpeg && \
	docker-php-ext-enable imagick pdo_mysql && \
	docker-php-ext-configure intl && \
	docker-php-ext-install intl && \
	docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y curl && \
		curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    	apt-get update && \
		apt-get install -y nodejs && \
		npm install -g pnpm

## INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

## INSTALL WP-CLI
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp --info

RUN useradd 1000 && \
    mkdir /home/1000/ && \
    chown 1000:www-data -R /home/

RUN a2enmod rewrite headers
