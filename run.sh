#!/bin/sh
#set permission
chown -R www:www /data/wwwroot/default
#start php-fpm
php-fpm7 -D
#start caddy
caddy -conf /etc/caddy/host.conf