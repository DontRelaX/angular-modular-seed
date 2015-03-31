exports.config =
  # See http://brunch.readthedocs.org/en/latest/config.html for documentation.
  plugins:
    uglify:
      mangle: true
      compress:
        global_defs:
          DEBUG: false
    sass:
      mode: 'ruby'
    assetsmanager:
      copyTo: {}
    javascript:
      validate: true
    jshint:
      pattern: /^app\/.*\.js$/
      options:
        bitwise: false
        curly: false
      globals:
        jQuery: true
      warnOnly: true
  modules:
    definition: false
    wrapper: (path, data) ->
      if /^app[\\/].*/.test(path)
        """(function(){'use strict'\n#{data}})();\n\n"""
      else data
  paths:
    public: 'assets'
  files:
    javascripts:
      joinTo:
        'javascript/app.js': /^app[\\/]/
        'javascript/vendor.js': /^bower_components[\\/]/
      order:
        before: [
          /[\\/]module\.js/
        ]
        after: []
    stylesheets:
      joinTo:
        'css/app.css': /^(app[\\/]|bower_components[\\/])/
      order:
        before: []

  conventions:
    ignored: []
    assets: (path) ->
      if /[\\/]$/.test path
        return true
      if /^app\/.*(html|jpg|png|svg)$/.test path
        return true
      return false
