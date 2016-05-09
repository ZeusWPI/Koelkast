/**
 * Compile Sass to css
*/

var gulp = require('gulp');
var sass = require('gulp-sass');
var gutil  = require('gulp-util');

gulp.task('scss', function () {
  var dest = './build/css';

  return gulp.src('./app/scss/*.scss')
    .pipe(sass({ outputStyle: 'compressed' }).on('error', gutil.log))
    .pipe(gulp.dest(dest));
});

