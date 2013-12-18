production = process.env.ENV is 'production'
testing = process.env.ENV is 'testing'
publicFolder = process.env.PUBLIC_PATH || 'public'

exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  optimize: Boolean production
  
  paths:
    public: publicFolder  
  
  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test[\\/](?!vendor)/
        'test/javascripts/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        before: [
          'vendor/scripts/console-helper.js'
          'vendor/scripts/jquery.js'
          'vendor/scripts/underscore.js'
          'vendor/scripts/backbone.js'
          'vendor/scripts/backbone.marionette.js'
          'vendor/scripts/bootstrap.js'
        ]
        after: [
          'test/vendor/scripts/test-helper.js'
        ]

    stylesheets:
      defaultExtension: 'styl'
      joinTo: 'stylesheets/app.css'
      order:
        before: [
          'vendor/styles/bootstrap.css'
          'vendor/styles/bootstrap-body.css'
          'vendor/styles/bootstrap-responsive.css'
        ]
        after: []

    templates:
      defaultExtension: 'hbs'
      joinTo: 'javascripts/app.js'
      
  plugins:
    uglify:
      mangle: false
      compress:
        global_defs:
          DEBUG: false      
