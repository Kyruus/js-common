module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    bower:
      vendor: 
        dest: 'build/vendor.js'
        exclude: ['zepto', 'bootstrap-modal']
    uglify:
      options:
        mangle: false
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */'
      vendor:
        files: 
          'build/vendor.min.js': ['build/vendor.js']

  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', ['bower', 'uglify']