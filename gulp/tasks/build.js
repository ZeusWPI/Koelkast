/**
 * Run all build tasks
*/

var gulp = require('gulp');

gulp.task('build', [
    'coffee',
    'scss',
    'jade',
    'browserify'
]);
