#!/bin/sh
#start php-fpm
php-fpm7 -D
#start caddy
caddy -conf /etc/caddy/host.conf