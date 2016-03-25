/**
 * Compile Jade templates to html
*/

var gulp = require('gulp');
var jade = require('gulp-jade');

gulp.task('jade', function () {
  gulp.src('./index.jade')
    .pipe(jade())
    .pipe(gulp.dest('.'));
});
