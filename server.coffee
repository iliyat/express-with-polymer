server = require('./app')

#server.use(require('serve-static')(__dirname + '/static', redirect: false))
server.listen server.get('port'), '127.0.0.1', ->
  console.log "Server start on 127.0.0.1:"+server.get('port')