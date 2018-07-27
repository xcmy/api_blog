Router = require('koa-router');
cors = require('koa-cors');
Koa = require('koa');
bodyparser = require('koa-bodyparser')
Config = require('./config')
app = new Koa();

app.use(cors());
app.use(bodyparser())


router = new Router();

api = require('./router')
router.use api.routes()
app
  .use(router.routes())
  .use(router.allowedMethods());

require('./lib')
app.listen(Config.port)
