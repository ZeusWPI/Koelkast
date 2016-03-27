/**
 * Run all build tasks
*/

var gulp = require('gulp');

gulp.task('build', [
    'coffee',
    'scss',
    'copy-css',
    'concat-css',
    'copy-font',
    'jade',
    'browserify'
]);
