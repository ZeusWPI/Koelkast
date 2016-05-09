/**
 * Default task is to build all files, and watch for changes
*/

var gulp = require('gulp');

gulp.task('default', ['build'], function() {
  gulp.start('watch');
});
