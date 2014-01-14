fs = require('fs')
path = require('path')

module.exports =
  initialize: (dir = process.cwd()) ->
    return unless (topDir = findTopPackageJson(dir)) && (topDir != dir)
    return if fs.existsSync(dest = path.join(topDir, '.bowerrc'))
    console.log("Writing a default '.bowerrc' file into '#{topDir}'")
    fs.writeFileSync dest, """
                           {
                             "directory": "/vendor/bower"
                           }

                           """

findTopPackageJson = (dir) ->
  current = path.resolve(dir)
  grandparent = path.resolve(dir, "..", "..")
  if current == grandparent || !hasPackageJson(grandparent)
    if hasPackageJson(current)
      current
    else
      null
  else
    findTopPackageJson(grandparent)

hasPackageJson = (dir) ->
  fs.existsSync(path.join(dir, "package.json"))
