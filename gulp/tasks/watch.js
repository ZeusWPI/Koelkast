/**
 * Watch for changes in input files
*/

var gulp = require('gulp');

gulp.task('watch', function(){
  gulp.watch('./src/js/**/*.coffee', ['coffee']);
  gulp.watch('./src/scss/*.scss', ['scss']);
  gulp.watch('./src/index.jade', ['jade']);
  gulp.watch('./build/js/*.js', ['browserify']);
  gulp.watch('./build/css/*.css', ['concat-css']);
  gulp.watch('./src/vendor/css/*.css', ['copy-css']);
});
