module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'
    dir:
      src: './app'
      dist: './dist'

    clean:
      dist: ['<%= dir.dist %>']

    connect:
      server:
        options:
          port: 8000
          base: ['<%= dir.dist %>']
          useAvailablePort: true

    copy:
      dist:
        expand: true
        cwd: '<%= dir.src %>/'
        src: '**'
        dest: '<%= dir.dist %>/'

    watch:
      develop:
        files: ['<%= dir.src %>/**/*']
        options:
          spawn: false
          livereload: true
        tasks: ['copy:dist']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'clean:dist'
    'connect:server'
    'watch'
  ]
