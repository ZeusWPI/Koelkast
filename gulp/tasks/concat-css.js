/**
 * Put all css in 1 file
*/

var gulp   = require('gulp');
var concat = require('gulp-concat');

gulp.task('concat-css', function() {
  var dest = './public';
  gulp.src('./build/css/*.css')
    .pipe(concat('bundle.css'))
    .pipe(gulp.dest(dest));
});
