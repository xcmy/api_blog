
## SSH 免密登陆
###  生成秘钥
本地主机运行命令生成RSA非对称加密的密钥

```
//输入命令，有提示后按回车
ssh-keygen
```

生成的秘钥位于
```
/Users/用户名/.ssh
```

公钥为id_rsa.pub文件


### 创建.ssh文件

在云服务器下：
>==注意一定要切换到当前用户下==

在用户目录下创建.ssh文件，并将其权限改为700

```
mkdir -m 700 ~/.ssh
```


### 公钥复制到云服务器
从本地服务器将公钥copy到远程服务器上

```
scp -P 端口号 ~/.ssh/id_rsa.pub aliyunzixun@xxx.com:/home/用户名/.ssh
```

### 将公钥加入云主机识别文件中

登陆云服务器

进入.ssh文件夹下

```
cd ~/.ssh/
```

将客户端公钥放入云主机识别keys文件夹中
```
cat id_rsa.pub >> authorized_keys
```

```
chmod 600 ~/.ssh/authorized_keys
```
> 最重要的是保证.ssh文件夹是权限700,authorized_keys文件权限是600



销毁公钥
```
rm -rf ~/.ssh/id_rsa.pub
```





 
