module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    bower:
      vendor: 
        dest: '.tmp/vendor.js'
        exclude: ['zepto']
        dependencies:
          'backbone': 'underscore'
    uglify:
      options:
        mangle: false
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */'
      vendor:
        files: 
          'build/vendor.min.js': ['build/vendor.js']
    concat:
      vendor:
        src: ['.tmp/vendor.js', 'external/thorax.js', 'external/bootstrap-datepicker.js', 'external/bootstrap-modalmanager.js', 'external/bootstrap-modal.js', 'external/underscore.string.js']
        dest: 'build/vendor.js'

  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask 'default', ['bower', 'concat', 'uglify']