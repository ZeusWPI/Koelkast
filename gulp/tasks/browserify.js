/**
 * Bundle javascript modules
*/

var gulp       = require('gulp');
var browserify = require('gulp-browserify');
var rename     = require('gulp-rename');

gulp.task('browserify', ['coffee'], function() {
  var dest = './public';

  return gulp.src('./build/js/app.js')
    .pipe(browserify())
    .pipe(rename('bundle.js'))
    .pipe(gulp.dest(dest));
});
