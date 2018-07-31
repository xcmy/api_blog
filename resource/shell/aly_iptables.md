## 安装

```
yum install -y iptables-services
```

#### 查看所有配置
```
iptables -L -n
```

#### 添加开放端口

```
iptables -A INPUT -p tcp --dport 23 -j ACCEPT
```
#### 保存
```
service iptables save
```

#### 重启iptables 
```
systemctl restart iptables
```


#### 防火墙启动\重启\停止 
```
systemctl [start restart stop] firewalld.service
```

>如果遇到`Failed to start firewalld.service: Unit is masked`错误先执行`systemctl unmask firewalld.service`在执行`systemctl restart firewalld.service`

#### 防火墙设置开机重启 
```
systemctl enable firewalld.service
```
