router = require('koa-router')()
db = require('../lib')


router.get '/home',(ctx)->
  info = await db.model('Basic').find()
  posts = await db.model('Post').find({home:true},{html:0,__v:0})
  console.log('------>homeData:'+JSON.stringify(posts,null,2))
  ctx.body = {basic:info[0],posts:posts}


router.get '/post/type',(ctx)->
  posts = await db.model('Post').find({},{html:0,__v:0}).sort({date:-1})
  data = []
  for post in posts
    create = true
    p = {
      title:post.title,
      sort:post.sort,
      date:post.date
    }
    for k in data when k.sort is post.sort
      create = false
      k.posts.push(p)
      k.count++
    data.push({sort:post.sort,posts:[p],count:1}) if create
  ctx.body = {data:data,total:posts.length}

router.get '/post/relation',(ctx)->
  console.log('reala')
  posts = await db.model('Post').find({sort:ctx.query.sort},{html:0,__v:0}).limit(3)
  ctx.body = posts

router.get '/post/',(ctx)->
  console.log('req-body'+JSON.stringify(ctx.query,null,2))
  params = {
    '$or':[
      {title:{$regex:new RegExp(ctx.query.keyword)}},
      {subtitle:{$regex:new RegExp(ctx.query.keyword)}}
      {html:{$regex:new RegExp(ctx.query.keyword)}}
      ],

  }
  params.sort = ctx.query.sort if ctx.query.sort

  params['$or'] =
  ctx.body  = await db.model('Post').find(params,{html:0,__v:0}).sort({date:-1})

router.get '/post/:id',(ctx)->
  basic = await db.model('Post').findById(ctx.params.id)
  posts = await db.model('Post').find({sort:basic.sort},{html:0,__v:0}).limit(5)
  ctx.body = {basic:basic,posts:posts}

router.get '*',(ctx)->
  ctx.body = 'please check your url is correct'

module.exports = router
