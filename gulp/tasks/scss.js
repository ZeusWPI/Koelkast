/**
 * Compile Sass to css
*/

var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('scss', function () {
  var dest = './build/css';
  gulp.src('./src/scss/*.scss')
    .pipe(sass())
    .pipe(gulp.dest(dest));
});

