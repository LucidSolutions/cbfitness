module.exports = function( grunt ){

	// Default
	grunt.registerTask( "default", [ "watch" ] );

	// Build All
	grunt.registerTask( "all", [ "css", "js" ] );

	// CSS Task
	grunt.registerTask( "css", [
		"clean:revcss", 		//clean old rev css
		"concat:css", 			//concat css 
		"cssmin:css",			//min css
		"clean:combinedcss",	//clean concat css
		"rev:css",				//create cache buster
		"clean:mincss",			//clean min css
		"injector:css"			//inject css
	] );

	// custom js task
	grunt.registerTask( "js", [
		"clean:revjs",			//clean old rev js
		//"jshint", 			//js lint
		"concat:js", 			//concat js 
		"uglify:js",			//min js
		"clean:combinedjs", 	//clean combined js
		"rev:js",				//create cache buster
		"clean:minjs",			//clean min js
		"injector:js"			//inject js
	] );

	// Config
	grunt.initConfig( {
		// read configs
		pkg : grunt.file.readJSON( "package.json" ),

		// Concat Task
		concat : {
			css : {
	        	files : {
	            	"includes/css/theme.css" : [
	            		"includes/css/src/bootstrap.min.css",
	            		"includes/css/src/all.css",
	            		"includes/css/src/animate.css",
	            		"includes/css/src/owl.theme.default.css",
	            		"includes/css/src/owl.carousel.css",
	            		"includes/css/src/style.css"
	            	]
				} 
			},
			js : {
	        	files : {
	            	"includes/js/theme.js" : [
	            		"includes/js/src/jquery-3.5.1.min.js",
	            		"includes/js/src/popper.min.js",
	            		"includes/js/src/bootstrap.min.js",
	            		"includes/js/src/jquery.parallax.js",
	            		"includes/js/src/jquery.nav.js",
	            		"includes/js/src/jquery.backstretch.min.js",
	            		"includes/js/src/owl.carousel.js",
	            		"includes/js/src/smoothscroll.js",
	            		"includes/js/src/wow.min.js",
	            		"includes/js/src/custom.js"
            		]
				}
			}
		}, // end concat

		// CSS Min
		cssmin : {
			css : {
				files : { "includes/css/theme.min.css" : [ "includes/css/theme.css" ] }
			}
		}, // end css min

		// JS Min
		uglify : {
			options : { 
    			banner : "/* <%= pkg.name %> minified @ <%= grunt.template.today() %> */\n",
    			mangle : false
    		},
			js : {
				files : { "includes/js/theme.min.js" : [ "includes/js/theme.js"	] }
			}
		},

		// Cache Busting
		rev : {
			css : {
				files : { src : [ "includes/css/theme.min.css" ] }
			},
			js 	: {
				files : { src : [ "includes/js/theme.min.js" ] }
			}
		}, // end cache busting

		// Cleanup
		clean : {
			// css
			combinedcss : { src : [ "includes/css/theme.css", "includes/css/bower.css" ] },
			mincss 		: { src : [ "includes/css/theme.min.css" ] },
			revcss 		: { src : [ "includes/css/*theme.min.css" ] },
			// js
			combinedjs  	: { src : [ "includes/js/theme.js", "includes/js/bower.js" ] },
			minjs 			: { src : [ "includes/js/theme.min.js" ] },
			revjs 			: { src : [ "includes/js/*theme.min.js" ] }
		},

		// Watch
		watch : {
			css : {
				files : [ "includes/css/src/*.css" ],
				tasks : [ "css" ]
			},
			js : {
				files : [ 
					"includes/js/src/*.js"
				],
				tasks : [ "js" ]
			}
		},

		// Injector
		injector : {
			options : {
				transform : function( filepath, index, length ){
					if( filepath.indexOf( ".js" ) !== -1 ){
						return '<script src="#cb.themeRoot()#' + filepath + '"></script>';
					}
					return '<link rel="stylesheet" href="#cb.themeRoot()#' + filepath + '">';					
				}
			},
			css : {
				files : { 
					"views/_pageIncludes.cfm" 	: [ "includes/css/*theme.min.css" ],
					"views/_blogIncludes.cfm" 	: [ "includes/css/*theme.min.css" ]
				}
			},
			js : {
				files : { 
					"views/_jsIncludes.cfm" 	: [ "includes/js/*theme.min.js" ]
				}
			}
		},

		// JS Hint
		jshint : {
			options : { 
				curly 	: true,
				eqeqeq  : true,
				eqnull 	: true,
				browser : true,
				devel 	: true,
				sub  	: true,
				globals : {
					jQuery 	: true,
					$ 		: true,
					module 	: true,
					angular : true
				},
				ignores : [ "*.ba.min.js" ]
			},
			all : [ "Gruntfile.js", 'includes/js/src/**/*.js' ]			
		},

	} );

	// Load Tasks
	require( 'matchdep' )
		.filterDev( 'grunt-*' )
		.forEach( grunt.loadNpmTasks );
};
