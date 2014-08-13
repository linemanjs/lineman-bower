fs = require('fs')
path = require('path')
findsRoot = require('find-root-package')

module.exports =
  initialize: (dir = process.cwd()) ->
    topDir = findsRoot.findTopPackageJson(dir)
    return unless isInstalledAsDependency(dir, topDir)
    return if fs.existsSync(dest = path.join(topDir, '.bowerrc'))
    console.log("Writing a default '.bowerrc' file into '#{topDir}'")
    fs.writeFileSync dest, """
                           {
                             "directory": "/vendor/bower"
                           }

                           """

isInstalledAsDependency = (dir, topDir) ->
  topDir? && topDir != dir


