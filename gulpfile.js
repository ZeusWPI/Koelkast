var gulp   = require('gulp');
var coffee = require('gulp-coffee');
var gutil  = require('gulp-util');
var sass   = require('gulp-sass');

var buildDir = './build/';

// Compile Coffeescript
gulp.task('coffee', function() {
  gulp.src('./src/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest(buildDir))
});

// Compile Sass
gulp.task('scss', function () {
  gulp.src('./src/scss/*.scss')
    .pipe(sass())
    .pipe(gulp.dest(buildDir+'css'));
});

// Watches for file changes
gulp.task('watch', function(){
  gulp.watch('./src/**/*.coffee', ['coffee']);
  gulp.watch('./src/scss/*.scss', ['scss']);
});
