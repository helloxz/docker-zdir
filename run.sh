#!/bin/sh
#set permission
chown -R www:www /data/wwwroot/default
#start php-fpm
php-fpm7 -D
#start nginx
/usr/sbin/nginx
tail -f /var/log/nginx/error.log