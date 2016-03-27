/*
  Copy fonts into public
*/

var gulp = require('gulp');

gulp.task('copy-font', function() {
  var dest = './public/font/';

  gulp.src('src/vendor/font/*')
    .pipe(gulp.dest(dest));
});
