/*
  Copy css from vendor into build
*/

var gulp = require('gulp');

gulp.task('copy-css', function() {
  var dest = './build/css';

  return gulp.src('app/vendor/css/*.css')
    .pipe(gulp.dest(dest));
});
