Router = require('koa-router');
cors = require('koa-cors');
Koa = require('koa');
bodyparser = require('koa-bodyparser')
Config = require('./config')
app = new Koa();

app.use(cors());
app.use(bodyparser())


router = new Router();


app.use (ctx,next)->
  console.log('url:'+ctx.url)
  console.log('query:'+JSON.stringify(ctx.query,null,2))
  console.log('body:'+JSON.stringify(ctx.request.body,null,2))
  next()


api = require('./router')
router.use api.routes()
app
  .use(router.routes())
  .use(router.allowedMethods());

require('./lib')
app.listen(Config.port)
