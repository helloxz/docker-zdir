#!/bin/sh
##########		name:Zdir容器运行入口			##########
##########		update:2020/06/21				##########
##########		author:xiaoz<xiaoz93@outlook.com>	######

zdir_path='/data/wwwroot/default'
zdir_url='http://soft.xiaoz.top/source/zdir/zdir-master.zip'
#安装Zdir
function install_zdir(){
	#如果zdir/index.php不存在，则下载Zdir
	if [ ! -f "${zdir_path}/zdir/index.php" ]
	then
		echo '-------------------------------------------'
		#创建目录
		mkdir -p $zdir_path
		#下载源码
		#wget -O ${zdir_path}/zdir.zip ${zdir_url}
		#进入目录
		#cd $zdir_path
		#unzip -o zdir.zip
		cd /tmp && unzip -o zdir.zip
		mv zdir-master ${zdir_path}/zdir
		
		#重命名配置文件
		cp ${zdir_path}/zdir/config.simple.php ${zdir_path}/zdir/config.php
		#设置读取的路径
		sed -i "s%\"thedir.*%\"thedir\"=>'/data/wwwroot/default',%g" ${zdir_path}/zdir/config.php
		echo '-------------------------------------------'
		
		#设置用户组权限
		chown -R www:www $zdir_path
		#rm -rf zdir.zip
	fi
	
}
#install Zdir
install_zdir
#set permission
chown -R www:www /data/wwwroot/default
#start php-fpm
php-fpm7 -D
#start nginx
/usr/sbin/nginx
tail -f /var/log/nginx/error.log