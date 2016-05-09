/**
  Run clean build directory.
*/

var gulp  = require('gulp');
var clean = require('gulp-clean');

gulp.task('clean', function () {
  gulp.src('build/', { read: false })
    .pipe(clean()),
  gulp.src('public/', { read: false })
    .pipe(clean());
});
