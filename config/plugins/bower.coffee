module.exports = (lineman) ->
  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat("grunt-bower-task")

    prependTasks:
      common: ["bower"].concat(lineman.config.application.prependTasks.common)

    clean:
      bower:
        src: "vendor/bower"

    bower:
      install:
        options:
          copy: false
