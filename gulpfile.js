var gulp       = require('gulp');
var coffee     = require('gulp-coffee');
var gutil      = require('gulp-util');
var sass       = require('gulp-sass');
var jade       = require('gulp-jade');
var browserify = require('gulp-browserify');
var rename     = require('gulp-rename');

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

// Compile Jade
gulp.task('jade', function () {
  gulp.src('./index.jade')
    .pipe(jade())
    .pipe(gulp.dest('.'));
});

// Browserify
gulp.task('browserify', function() {
  gulp.src('./build/js/app.js')
    .pipe(browserify())
    .pipe(rename('bundle.js'))
    .pipe(gulp.dest(buildDir));
});

// Compile all
gulp.task('build', ['coffee', 'scss', 'jade', 'browserify']);

// Watches for file changes
gulp.task('watch', function(){
  gulp.watch('./src/**/*.coffee', ['coffee']);
  gulp.watch('./src/scss/*.scss', ['scss']);
  gulp.watch('./index.jade', ['jade']);
  gulp.watch('./build/js/*.js', ['browserify']);
});

// Develop
gulp.task('develop', ['build', 'watch'])
