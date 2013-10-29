module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'lib/fokker.js': ['src/fokker.coffee']
          'lib/docker-api-description.js': ['src/docker-api-description.coffee']
    mochaTest:
      options:
        reporter: 'nyan'
      src: ['test/test.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'default', ['coffee', 'mochaTest']
