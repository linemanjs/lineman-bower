fs = require('fs')
path = require('path')

module.exports = (lineman) ->
  app = lineman.config.application
  
  config:
    loadNpmTasks: app.loadNpmTasks.concat("grunt-bower-task")

    prependTasks:
      common: ["bower"].concat(app.prependTasks.common)

    clean:
      bower:
        src: bowerDirectory()

    bower:
      install:
        options:
          copy: false

bowerDirectory = () ->
  bowerrc = path.join(process.cwd(), ".bowerrc")
  bowerConfig = JSON.parse(fs.readFileSync(bowerrc, "utf8")) unless !fs.existsSync(bowerrc)
  bowerConfig?.directory || "bower_components"
