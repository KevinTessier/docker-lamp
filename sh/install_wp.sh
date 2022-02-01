#!/bin/bash
echo 'cd html/'
cd /var/www/html/

echo 'git clone stack wp twn'
# Git 
git clone git@gitlab.walkingnerds.dev:twn/TWN-WP.git ./ --progress

echo 'composer install'
composer install

echo 'yarn install'
yarn install

# echo 'wp cli update'
# wp cli update

# echo 'active theme twn'
# wp theme enable twn-theme --activate

# echo 'deleted all themes will be deleted except active theme'
# wp theme delete twentytwelve

# echo 'wp plugin activate'
# wp plugin activate --all

cp .env.example .env

yarn serve