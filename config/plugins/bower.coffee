fs = require('fs')
path = require('path')

module.exports = (lineman) ->
  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat("grunt-bower-task")

    prependTasks:
      common: ["bower"].concat(lineman.config.application.prependTasks.common)

    clean:
      bower:
        src: bowerDirectory(lineman.grunt)

    bower:
      install:
        options:
          copy: false

bowerDirectory = (grunt) ->
  bowerrc = path.join(process.cwd(), ".bowerrc")
  bowerConfig = grunt.file.readJSON(bowerrc) unless !fs.existsSync(bowerrc)
  bowerConfig?.directory || "vendor/bower"
