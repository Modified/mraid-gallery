### index.html.coffee
MRAID-Gallery: index.html teacup template.
###
{renderable,normalizeArgs,comment,doctype,html,head,title,link,meta,script,body,section,div,span,em,strong,i,b,p,q,nav,header,footer,h1,h2,h3,a,img,form,input,label,button,select,option,fieldset,ol,ul,li,table,tr,th,td,text,raw,tag,iframe,br,coffeescript}=require 'teacup'
util=require 'util' #??? Debugging?
fs=require 'fs'

module.exports=renderable (params)->
	doctype 5
	html ->
		head -> #??? (Some practice dropping head and body since browsers tolerate it.)
			meta charset:'utf-8'
			meta name:'viewport',content:'width=device-width,initial-scale=1,maximum-scale=1' #??? Which?
			title 'MRAID-Gallery POC'
			meta name:'adsize',content:'width:300,height:250' #??? Standard?
			#??? Inline stylesheets for distribution.
			link rel:'stylesheet',href:'lib/slick/slick.css'
			link rel:'stylesheet',href:'gallery.css'
	body ->
		section '#gallery',->
			raw list_dresses()
		#??? Inline scripts for distribution.
		script src:'//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js' #??? Fallback to local? Sizzle?
		script src:'lib/slick/slick.min.js' #??? Defer?
		script src:'lib/mraid.js' #??? Emulation; remove when building!
		coffeescript ->
			$ ->
				$ '#gallery'
				.slick
					#??? adaptiveHeight:yes
					autoplay:yes
					dots:yes
					focusOnSelect:yes
					#??? mobileFirst:yes
					swipeToSlide:yes

list_dresses=->
	ff=fs.readdirSync 'dresses'
	("<img src=\"dresses/#{f}\">" for f in ff).join ''
