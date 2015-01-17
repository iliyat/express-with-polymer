app = require('express')()

app.set('port', 3000)
app.set('views', "#{__dirname}/views")
app.set('view engine', 'jade')

app.use(require('serve-static')('./static', redirect: false))

app.controllers = require('./controllers')(app)




module.exports = app