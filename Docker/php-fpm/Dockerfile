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

# install wp-cli
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

RUN useradd 1000

RUN mkdir /home/1000/ \
    mkdir /home/1000/.ssh

COPY ssh/id_rsa.pub /home/1000/.ssh/id_rsa.pub
COPY ssh/id_rsa /home/1000/.ssh/id_rsa
COPY ssh/auth.json /home/1000/.composer/auth.json

RUN touch /home/1000/.ssh/known_hosts
RUN touch /home/1000/.ssh/config
RUN ssh-keyscan -t rsa gitlab.walkingnerds.dev >> /home/1000/.ssh/known_hosts

RUN chown 1000:www-data -R /home/
RUN chmod 744 /home/1000/.ssh/id_rsa.pub
RUN chmod 700 /home/1000/.ssh/id_rsa

COPY --chown=1000:1000 sh/install_wp.sh /home/1000/
RUN chmod +x /home/1000/install_wp.sh

RUN a2enmod rewrite headers