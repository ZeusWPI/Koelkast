/**
 * Put all css in 1 file
*/

var gulp   = require('gulp');
var concat = require('gulp-concat');

gulp.task('concat-css', ['scss', 'copy-css'], function() {
  var dest = './public';

  return gulp.src('./build/css/*.css')
    .pipe(concat('bundle.css'))
    .pipe(gulp.dest(dest));
});
