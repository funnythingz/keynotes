module.exports = (grunt)->
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    uglify:
      dist:
        files: 'build/js/rackle.min.js': ['build/js/rackle.js']

    concat:
      rackle:
        src: ['src/ts/rackle/**/*.js']
        dest: 'build/js/rackle.js'

      apps:
        src: ['src/ts/apps/**/*.js']
        dest: 'build/js/apps.js'

      options:
        separator: ';'

    copy:
      hbs:
        files: [{
          expand: true
          cwd: 'src/hbs'
          src: ['**/*.hbs']
          dest: 'build/hbs/'
        }]

      html:
        files: [{
          expand: true
          cwd: 'src/html'
          src: ['**/*.html']
          dest: 'build/'
        }]

    typescript:
      base:
        src: ['src/ts/**/*.ts', 'tests/**/*.ts']
        options:
          sourceMap: false

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      typescript:
        files: ['src/ts/**/*.ts', 'tests/**/*.ts', 'src/hbs/**/*.hbs']
        tasks: ['typescript', 'concat', 'uglify', 'clean:typescript', 'copy:hbs']
        options:
          atBegin: true

      css:
        files: ['src/scss/**/*.scss']
        tasks: ['clean:css', 'compass']
        options:
          atBegin: true

      html:
        files: ['src/html/**/*.html']
        tasks: ['clean:html', 'copy:html']
        options:
          atBegin: true

    clean:
      build: ['build/js/**/*.js', 'build/hbs/**/*.hbs']
      typescript: ['src/ts/**/*.js']
      css: ['build/css/**/*.css']
      html: ['build/**/*.html']

    connect:
      server:
        options:
          port: 8000
          base: 'build'
          keepalive: true

  })

  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-typescript')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['clean', 'typescript', 'concat', 'uglify', 'clean:typescript', 'copy', 'compass'])
  grunt.registerTask('preview', ['clean', 'typescript', 'concat', 'uglify', 'clean:typescript', 'copy', 'compass', 'connect'])
