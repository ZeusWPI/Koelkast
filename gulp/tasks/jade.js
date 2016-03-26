/**
 * Compile Jade templates to html
*/

var gulp = require('gulp');
var jade = require('gulp-jade');

gulp.task('jade', function () {
  var dest = './public';
  gulp.src('./index.jade')
    .pipe(jade())
    .pipe(gulp.dest(dest));
});
