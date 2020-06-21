# Zdir
Zdir是一款使用PHP开发的目录列表程序，无需数据库，体积小巧，功能完善。

![](https://imgurl.org/upload/1806/349f3b54028d58d6.png)



## 构建方法

```bash
#克隆项目
git clone https://github.com/helloxz/docker-zdir.git
#进入目录
cd docker-zdir
#构建Docker镜像
docker build -t helloz/zdir:latest .
```



## 使用方法

```bash
docker run --name="zdir"  \
    -d -p 1080:80 --restart=always \
    -v /data/wwwroot/default:/data/wwwroot/default \
    helloz/zdir \
    /usr/sbin/run.sh
```

安装完毕后访问http://IP:1080根据页面提示完成操作即可，下面的参数可以自行修改。

* 1080:服务器所监听的端口，即Zdir访问端口
* /data/wwwroot/default:Zdir路径
* 默认用户名为：`zdir`，密码为`admin`

> 更多说明请参考：[使用Docker容器部署Zdir目录列表程序](https://www.xiaoz.me/archives/14809)