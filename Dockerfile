FROM alpine:3.12.0

WORKDIR /root
#复制启动文件
COPY ./run.sh /usr/sbin
RUN wget https://raw.githubusercontent.com/helloxz/ccaa/master/docker-ccaa.sh && sh docker-ccaa.sh install
# 复制caddy配置文件
COPY ./host.conf /etc/caddy/
# 复制php.ini
COPY ./php.ini /etc/php7/
# 复制php-fpm配置
COPY ./www.conf /etc/php7/php-fpm.d/
VOLUME /data/wwwroot/default
EXPOSE 80