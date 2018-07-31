### 创建用户
```
$sudo useradd -d /home/test1/ -g huahuan -m -s /bin/bash test1
```

创建密码
```
$passwd test1
```
添加管理权限
```
$sudo usermod -a -G adm test1

$sudo usermod -a -G sudo test1
```
将
```
sudo chmod -R g+w huahuan/ 
```

查看所有用户和用户组:
```
cat /etc/passwd
```
```
cat /etc/group
```




adduser 不好指定组等信息,所以采用useradd来创建,指定bash和组,创建用户目录的作用是,在查看文件属性时,可以带颜色,方便操作

**useradd**

1.作用
useradd命令用来建立用户帐号和创建用户的起始目录,使用权限是超级用户。

2.格式
```
useradd [-d home] [-s shell] [-c comment] [-m [-k template]] [-f inactive] [-e expire ] [-p passwd] [-r] name
```

3.主要参数
- -c:加上备注文字,备注文字保存在passwd的备注栏中。 
- -d:指定用户登入时的启始目录。
- -D:变更预设值。
- -e:指定账号的有效期限,缺省表示永久有效。
- -f:指定在密码过期后多少天即关闭该账号。
- -g:指定用户所属的群组。
- -G:指定用户所属的附加群组。
- -m:自动建立用户的登入目录。
- -M:不要自动建立用户的登入目录。
- -n:取消建立以用户名称为名的群组。
- -r:建立系统账号。
- -s:指定用户登入后所使用的shell。
- -u:指定用户ID号。


**chmod**

Linux/Ubuntu 系统中文件调用的权限分为三级:文件拥有者(u)、群组(g)、其他(o)。用chmod就可以更改文件的权限。chmod是一个相当灵活的命令,对同一个文件的权限的修改可以用多种风格的命令格式来实现。

方式一:

语法格式: 
```
chmod [-vR] mode 文件名
```

参数说明:

mode 权限设置字串,格式为
```
[ugoa] [+-=] [rwx]
```

- u 表示文件的拥有者

- g 表示与此文件拥有者属于一个组群的人

- o 表示其他人

- a 表示包含以上三者即文件拥有者(u)、群组(g)、其他(o)

- `+` 表示增加权限

- `-` 表示取消权限

- = 表示唯一设置权限

- r 表示有读取的权限

- w 表示有写入的权限

- x 表示有执行的权限

- -v 显示权限改变的详细资料

- -R 表示对当前目录下的所有文件和子目录进行相同的权限更改
