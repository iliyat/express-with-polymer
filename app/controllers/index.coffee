fs = require('fs')

loadControllers = (app) ->
  controllers = {}
  fs.readdirSync(__dirname).forEach (file) ->
    stat = fs.statSync __dirname+'/'+file
    if stat && stat.isDirectory()
      controllers[file] = require('./'+file).use?(app)
  return controllers


module.exports = loadControllers
