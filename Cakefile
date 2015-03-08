### MRAID-Gallery's Cakefile ###

fs=require 'fs'
{spawn,exec}=require 'child_process'
require 'colors'
#???... jsmin, uglify, packer, newer, watch…

# Tasks.
task 'start','Build and run local web server',->build ->launch 'http-server'
task 'build','Compile/preprocess CS/Stylus, etc',->build ->console.log ':-)'.green
task 'watch','Continuously compile/preprocess CS/Stylus',->watch
task 'run','Just run web server (don\'t rebuild)',->launch 'http-server'

# Build all client side assets: CoffeeScript, Stylus… #??? Add linting for all, and uglify, combine.
build=(next)->
	#??? if typeof watch is 'function' then next=watch;watch=false
	#??? build_styl watch,->build_cs watch,next
	build_styl ->build_teacup next
# Compile CoffeeScript into JavaScript.
build_cs=(next)-> #??? (watch,next)->
	#??? if typeof watch is 'function' then next=watch;watch=false
	options=['--compile'] #??? ,'--map'] Disabled because serves wrong URL! #??? Map only in development?
	options=options.concat []
		#??? 'gallery.coffee' #???... et al! And combine! #??? Globbing doesn't work with spawn.
		#??? ]
	#??? options.unshift '--watch' if watch #???!!! Does not daemonize, doesn't exit!
	launch 'coffee',options,next
# Preprocess Stylus into CSS.
build_styl=(next)->
	#??? if typeof watch is 'function' then next=watch;watch=false
	options=['--compress'] #??? Map only in development? ,'--firebug' produces tons of junk!
	options=options.concat [
		'gallery.styl'
		]
	#??? options.unshift '--watch' if watch #???!!! Does not daemonize, doesn't exit!
	launch 'stylus',options,next
# Generate HTML from Teacup templates.
build_teacup=(next)->
	options=[]
	exec 'coffee -e \'console.log (require "./index.html.coffee")()\'>index.html' # "./" required to include cwd.
# Run process, not in shell. #??? exec instead?
launch=(cmd,options=[],next)->
	console.log 'spawn'.cyan,cmd,options,'...'
	app=spawn cmd,options
	app.stdout.pipe process.stdout
	app.stderr.pipe process.stderr
	app.on 'exit',(status)->
		if status is 0 then next() #??? Must exist?
		else console.log 'Error:'.red.inverse+" exit code #{status} from #{cmd}"
		#??? else process.exit status #???!!! Don't, let caller decide! No, they'll always do the same; DRY.
# Run in a shell???...
run=(cmd,next)-> #??? Use promises instead, so caller decides how to continue?
	console.log 'run'.cyan,cmd,'...'
