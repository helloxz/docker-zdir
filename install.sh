#!/bin/sh

#更新软件
apk update
#安装timezone
apk add -U tzdata
#查看时区列表
ls /usr/share/zoneinfo
#拷贝需要的时区文件到localtime
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#查看当前时间
date
#为了精简镜像，可以将tzdata删除了
apk del tzdata

#安装依赖
apk add unzip wget
#安装PHP
apk add php7 php7-fpm php7-openssl php7-sqlite3 php7-curl php7-fileinfo php7-mbstring php7-iconv php7-zip php7-json php7-session

#更名php-fpm配置文件
mv /etc/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.conf.bak
#更名PHP配置文件
mv /etc/php7/php.ini /etc/php7/php.ini.bak

#启动脚本赋予权限
chmod +x /usr/sbin/run.sh

#下载Zdir
wget -O /data/wwwroot/default/zdir.zip https://github.com/helloxz/zdir/archive/master.zip
cd /data/wwwroot/default/
unzip zdir.zip
mv zdir-master zdir
#创建用户和用户组
addgroup -S www && adduser -S www -G www
chown -R www:www /data/wwwroot/default/