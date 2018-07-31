#### 打包空白问题

如果是路径问题则：

修改`config/index.js`中的build下的

```
assetsPublicPath: '/',
```
为
```
assetsPublicPath: './',
```


#### 项目打包优化


在根目录index.html中加入

>一定注意导入库的版本和package.json中的版本一样

```
  <!--优化导入的库-->
    <script src="http://cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
    <script src="http://cdn.bootcss.com/vue-router/3.0.1/vue-router.min.js"></script>
    <script src="http://cdn.bootcss.com/vuex/3.0.1/vuex.min.js"></script>
    <script src="http://cdn.bootcss.com/axios/0.18.0/axios.min.js"></script>
    <script src="https://cdn.bootcss.com/highlight.js/9.12.0/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-material/1.0.0-beta-10.2/vue-material.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>

```


这些库可以在这两个网站找

[https://www.bootcdn.cn/](https://www.bootcdn.cn/)

[https://cdnjs.com](https://cdnjs.com)


然后在webpack配置中配置externals，这样打包的时候就会忽略这些库。

```
externals: {
    'vue': 'Vue',
    'vue-router': 'VueRouter',
    'vuex': 'Vuex',
    'axios': 'axios',
    'moment':'moment',
    'vue-material':'VueMaterial',
    'highlight.js':'hljs',
  },
```

然后运行`npm run build`就可以看到打包后的文件很小了。
```
ash: e45340957ea246d2996a
Version: webpack 3.12.0
Time: 6588ms
                                                  Asset       Size  Chunks             Chunk Names
               static/js/vendor.10108bd30a0233841b6e.js    26.4 kB       0  [emitted]  vendor
                  static/js/app.0d781aa52b3445a86fa9.js    26.9 kB       1  [emitted]  app
             static/js/manifest.3ad1d5771e9b13dbdad2.js  858 bytes       2  [emitted]  manifest
    static/css/app.e5431a266933892f99c0a6725452261a.css     153 kB       1  [emitted]  app
static/css/app.e5431a266933892f99c0a6725452261a.css.map     208 kB          [emitted]
           static/js/vendor.10108bd30a0233841b6e.js.map     129 kB       0  [emitted]  vendor
              static/js/app.0d781aa52b3445a86fa9.js.map     112 kB       1  [emitted]  app
         static/js/manifest.3ad1d5771e9b13dbdad2.js.map    4.97 kB       2  [emitted]  manifest
                                             index.html     1.2 kB          [emitted]

  Build complete.

  Tip: built files are meant to be served over an HTTP server.
  Opening index.html over file:// won't work.
```
