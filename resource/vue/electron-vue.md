## 使用vue建立electron应用程序


### 运行环境

- node v7.10.0
- npm 5.5.1
- electron v1.6.11

### 创建项目

#### 1.全局安装`vue-cli`

```
$ npm install -g vue-cli                     
```
#### 2.使用脚手架生成项目

```
$ vue init simulatedgreg/electron-vue my-project
```


### 安装依赖

#### 进入项目根目录，安装依赖

```
$ cd my-project
$ npm install

```



### 项目启动


```
$ npm run dev
```

### 项目打包

#### 脚手架已配置`electron-builder`，执行命令

```
npm run build
```