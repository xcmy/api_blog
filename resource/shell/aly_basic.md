### 基础登录

```
ssh root@ + 公网ip
```
输入密码后登录


### 创建用户

```
useradd  -d /home/xcmy -m -s /bin/bash xcmy
```
接着设置密码
```
passwd xcmy 
```
根据提示输入密码


### 重新登录

```
ssh xcmy@ + 公网ip
```
输入用户xcmy的密码



### 用户切换
```
su + 用户名
```


### 修改端口号、禁用root用户远程登录

```
vim /etc/ssh/sshd_config
```
修改端口号
```
# Port 22
//改为
Port 你的端口
```
设置完端口号后，在阿里云服务器安全组\配置规则\快速创建规则\添加新增的端口

把 你的 端口添加到防火墙开放端口中
```
firewall-cmd --permanent --zone=public --add-port=80/tcp
```
重启防火墙
```
systemctl restart firewalld.service
```
检查是否生效
```
firewall-cmd --zone=public --query-port=80/tcp

```

禁用root远程登录
```
//将
PermitRootLogin yes 
//改为 
PermitRootLogin no
```

重启sshd服务
```
/bin/systemctl restart sshd.service
```









