/**
 * Compile Jade templates to html
*/

var gulp = require('gulp');
var jade = require('gulp-jade');

gulp.task('jade', function () {
  var dest = './public';

  return gulp.src('./index.jade')
    .pipe(jade({ pretty: true }))
    .pipe(gulp.dest(dest));
});
