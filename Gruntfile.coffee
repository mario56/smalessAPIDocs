module.exports = (grunt)->
  grunt.initConfig

    watch:
      scripts:
        files: ['src/**/*.jade','src/scss/*.scss']
        tasks: ['default']
      options:
        spawn: false
        debounceDelay: 300

#    concat:
#      dist:
#        src: [
#         'demo/scss/*.scss'
#        ]
#        dest: 'demo/scss/main.scss'
    sass:
      demo:
        files:
          'main.css':'src/scss/main.scss'

    coffee:
      demo:
        files:
          "main.js": "src/coffee/forDoc.coffee"


    jade:
      demo:
        options:
          data:
            debug: true,
            timestamp: "<%= new Date().getTime() %>"
        files:
          "index.html": "src/index.jade"

    shell:
      installSASS:
        command: 'sudo gem install sass'
      installJADE:
        command: 'sudo npm install jade -g'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
#  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask "buildEnv", ["shell:installSASS", "shell:installJADE"]
  grunt.registerTask "build", ["sass:demo", "coffee:demo", "jade:demo"]
  grunt.registerTask "default", ["build"]

