var gulp = require('gulp'),
  bower = require('main-bower-files'),
  serve = require('gulp-serve'),
  coffee = require('gulp-coffee'),
  gutil = require('gulp-util');

var paths = {
  build: './build/js',
  src: ['./src/js/**/**/*.js'],
  coffee: ['./src/**/**/*.coffee'],
  bower: bower
};

gulp.task('serve', serve('build'));

gulp.task('libs', function() {
  // Move bower main files into `build/js`
  return gulp
    .src(paths.bower())
    .pipe(gulp.dest(paths.build));
});

gulp.task('src', function() {
  // Move `src/js/**/*.js` into `build/js`.
  // That's all it does.
  gulp.src(paths.src)
    .pipe(gulp.dest(paths.build));
});

gulp.task('coffee', function() {
  gulp.src(paths.coffee)
    .pipe(coffee().on('error', gutil.log))
    .pipe(gulp.dest(paths.build))
});

gulp.task('watch', function() {
  gulp.watch(paths.src, ['src']);
  gulp.watch(paths.coffee, ['coffee']);
});

gulp.task('default', ['libs', 'src', 'watch', 'serve', 'coffee']);
