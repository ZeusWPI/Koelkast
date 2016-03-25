/**
  Run clean build directory.
*/

var gulp = require('gulp');
var clean = require('gulp-rimraf');

gulp.task('clean', function () {
  gulp.src('build/**/*', {read: false})
    .pipe(clean())
    .pipe(gulp.dest('build/'));
});
