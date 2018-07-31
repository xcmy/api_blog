
## 在CentOs 7 上安装Node.js


在官网找到下载地址,然后执行
```
wget https://nodejs.org/dist/v10.1.0/node-v10.1.0-linux-x64.tar.xz
```

解压缩包

```
xz -d node-v10.1.0-linux-x64.tar.xz
tar -xf node-v10.1.0-linux-x64.tar
```


部署bin文件，建立软链接(必须都是全路径)
```
ln -s ~/node-v10.1.0-linux-x64/bin/node /usr/bin/node
ln -s ~/node-v10.1.0-linux-x64/bin/npm /usr/bin/npm
```


测试
```
node -v
```


## coffeescript安装


```
npm install --global coffeescript
```


使其全局生效

```
ln -s /pub/node-v10.1.0-linux-x64/bin/coffee /usr/local/bin/coffee
```


查看其版本

```
coffee -v
```


## 在linux下安装mongodb4.0


使用yum安装
```
vim /etc/yum.repos.d/mongodb-org-4.0.repo 
```

然后写入
```
[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc
```

安装
```
sudo yum install -y mongodb-org
```


安装完成后会提示
>已安装:   
  mongodb-org.x86_64 0:4.0.0-1.el7   
作为依赖被安装:   
mongodb-org-mongos.x86_64 0:4.0.0-1.el7      
mongodb-org-server.x86_64 0:4.0.0-1.el7      
mongodb-org-shell.x86_64 0:4.0.0-1.el7   
mongodb-org-tools.x86_64 0:4.0.0-1.el7   
完毕！




启动

```
sudo service mongod start
```



## pm2安装


全局安装
```
npm install pm2 -g
```

建立软连接
```
ln -s /pub/node-v10.1.0-linux-x64/bin/pm2 /usr/local/bin
```

查看安装信息
```
pm2 -v 
```

使其支持coffeeScript

```
pm2 install coffeescript
```


项目启动

```
pm2 start app.coffee
```




