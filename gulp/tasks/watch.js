/**
 * Watch for changes in input files
*/

var gulp = require('gulp');

gulp.task('watch', function(){
  gulp.watch('./app/js/**/*.coffee', ['browserify']);
  gulp.watch('./app/scss/*.scss', ['scss']);
  gulp.watch('./app/index.jade', ['jade']);
  gulp.watch('./build/css/*.css', ['concat-css']);
  gulp.watch('./app/vendor/css/*.css', ['copy-css']);
});
