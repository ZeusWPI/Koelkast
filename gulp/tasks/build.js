/**
 * Run all build tasks
*/

var gulp = require('gulp');

gulp.task('build', [
    'concat-css',
    'copy-font',
    'jade',
    'browserify'
]);
