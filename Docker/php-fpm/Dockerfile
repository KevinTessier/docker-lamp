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
		docker-php-ext-enable imagick && \
        docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y curl && \
		curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    	apt-get update && \
		apt-get install -y nodejs yarn

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

RUN a2enmod rewrite headers