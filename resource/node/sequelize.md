# Sequelize 使用笔记



## 前言

使用环境

    Node.js v7.10.0

    npm 4.2.0
    
    CoffeeScript version 2.0.0-beta2
    
    PostgreSQL 9.6.4
    
    Sequelize 4.4.3


## 配置

- 使用`npm`在项目下安装



```
$ npm install --save sequelize
$ npm install --save pg pg-hstore
```
- 数据库连接设置
```coffeescript
#简易连接
sequelize = new Sequelize("postgres://:@localhost:5432/xcmy")
```

- 检测是否连接成功

```coffeescript
sequelize.authenticate()
  .then ()->
    console.log("db Connected success")
  .catch (err)->
    console.log("db connected fail with err :"+err)
```

## 数据模型定义

- 一个简单的数据模型文件例子

```coffeescript
Sequelize = require "sequelize"
sequelize = new Sequelize("postgres://:@localhost:5432/xcmy"

Task = sequelize.define 'task', {
  title: Sequelize.STRING,
  description: Sequelize.TEXT,
  deadline: Sequelize.DATE
}
Task.sync()
module.exports = Task
```

- 一个模型的字段可以设置很多属性选项

```coffeescript

User = sequelize.define "user",{
    name:{
        type:Sequelize.STRING #该字段为字符串类型
        allowNull: false #不允许为空
        defaultValue: Sequelize.NOW 
    }
}


```
