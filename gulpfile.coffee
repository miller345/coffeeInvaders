gulp = require "gulp"
coffeeify = require "gulp-coffeeify"
jade = require "gulp-jade"

gulp.task "coffee", ->
  gulp.src "src/index.coffee"
    .pipe coffeeify
      options:
        debug: false, #source map
        paths: [__dirname + '/node_modules', __dirname + '/src']
    .pipe gulp.dest('./build')

gulp.task "html", ->
  gulp.src "src/index.jade"
    .pipe jade()
    .pipe gulp.dest('./build/')

gulp.task 'default', ["coffee"]
