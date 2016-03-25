/**
 * Run all build tasks
*/

var gulp = require('gulp');

gulp.task('build', [
    'coffee',
    'scss',
    'copy-css',
    'concat-css',
    'jade',
    'browserify'
]);
