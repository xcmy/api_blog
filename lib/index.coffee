Config = require('../config')
showdown = require('showdown')
require('showdown-twitter')
path = require('path')
fs = require('fs')

mongoose = require('mongoose');
mongoose.connect(Config.dbUrl,{ useNewUrlParser: false });


basicSchema = mongoose.Schema({
  backgroundImage:JSON
  title:String
  subtitle:String
  author:String
  summary:String
  head_img:String
  projects:Array
});


postSchema = mongoose.Schema({
  img:String
  sort:type:String
  title:String
  subtitle:String
  tags:[String]
  date:Date
  author:String
  path:String
  home:Boolean
  html:String
});

BasicSchma = mongoose.model('Basic', basicSchema);
PostSchema = mongoose.model('Post', postSchema);


db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once 'open',()->
  console.log('db connected')
  init() if Config.init


init = ()->
  db.dropDatabase();
  info = require('../config/data/home').home
  basic = new BasicSchma(info)
  basic.save (err)->
    console.log(err) if err
  posts = require('../config/data/post')
  ps = []
  for k in posts
    ps.push(toHtml(k))

  Promise.all(ps).then(
    (result)->
      console.log('初始化成功'+result)
  ).catch(
    (err)->
      console.log('初始化失败'+err)
  )



converter = new showdown.Converter({ tables: true, strikethrough: true,extensions: ['twitter'] })
toHtml = (k)->
  return new Promise (resolve,reject)->
    new_path = path.join(__dirname,'../resource/',k.path)
    fs.readFile new_path,{encoding:"utf-8"},(err,fr)->
      k.html = converter.makeHtml(fr)
      post = new PostSchema(k)
      post.save (err,res)->
        reject(err) if err
        resolve(res._id)


module.exports = db
