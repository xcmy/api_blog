### 阿里云CentOS安装nginx

#### 安装
切换到root用户
```
yum install nginx
```
会提示安装nginx相关依赖，输入y,点击回车

查看安装位置
```
$ which nginx
/usr/sbin/nginx
```


查看nginx是否安装
```
rpm -qa | grep nginx
```
查看nginx生成的文件
```
rpm -ql nginx
```


nginx启动
```
systemctl start nginx

systemctl enable nginx #设置开机启动
```

查看nginx启动状态
```
systemctl status nginx
```

查看是否监听
```
 ss -tnl | grep 80 
```
查看nginx的配置文件
```
nginx -t
```



在阿里云控制台/安全组/配置规则添加HTTP(80)端口


### 配置

修改其配置文件
```
vim /etc/nginx/nginx.conf
```

```
server {
        listen       80 ;
        server_name  localhost;
        root         /usr/share/nginx/html;
        
        location / {
                index index.html index.htm;
         }
         
        
}
```


设置域名指向端口

在nginx配置中添加

```
    location /api/blog {
        proxy_redirect off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-Ip $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_pass http://localhost:3000;
    }
```
即
```
www.site.com/api/blog 等价于 ip:3000
```

所以在设置router的时候就给router加前缀`/api/blog`
