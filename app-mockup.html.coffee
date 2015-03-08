### app-mockup.html.coffee
MRAID-Gallery: app-mockup.html teacup template.
###
{renderable,normalizeArgs,comment,doctype,html,head,title,link,meta,script,body,section,div,span,em,strong,i,b,p,q,nav,header,footer,h1,h2,h3,a,img,form,input,label,button,select,option,fieldset,ol,ul,li,table,tr,th,td,text,raw,tag,iframe,br,coffeescript}=require 'teacup'
stylus=require 'stylus'

# Helpers, mixins, partials???
###??? Doesn't work! Apparently, render is called asynchronously. Will have to wrap with promise.
inlined_stylesheet=(str)->
	result=undefined # Just declare outside of renderer.
	stylus.render str,filename:'(inlined stylesheet)',(err,css)->
		#??? console.error css
		if err then throw err else result="<style>#{css}</style>"
###

module.exports=renderable (params)->
	doctype 5
	html ->
		head -> #??? (Some practice dropping head and body since browsers tolerate it.)
			meta charset:'utf-8'
			meta name:'viewport',content:'width=device-width,initial-scale=1,maximum-scale=1' #??? Which?
			title 'MRAID enabled app mockup'
			meta name:'adsize',content:'width:320,height:480' #??? Standard?
			link rel:'stylesheet',href:'app-mockup.css'
			###???
			inlined_stylesheet '''
				iframe
				...
				'''
			###
		body ->
			h1 'App With In-App MRAID Ad'
			section '#unit',-> # Ad unit, MRAID container?
				iframe src:'gallery.html',border:'0',frameborder:'0',scrolling:'0',marginwidth:'0',marginheight:'0' #??? Defaults?
			button type:'button','Toggle Ad'
			div '#corporate-ipsum',->
				h2 'Here\'s some corporate ipsum…'
				p '''Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.'''
				p '''Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions.'''
				p '''Completely synergize resource sucking relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service.'''
				p '''Objectively innovate empowered manufactured products whereas parallel platforms. Holisticly predominate extensible testing procedures for reliable supply chains. Dramatically engage top-line web services vis-a-vis cutting-edge deliverables.'''
				p '''Proactively envisioned multimedia based expertise and cross-media growth strategies. Seamlessly visualize quality intellectual capital without superior collaboration and idea-sharing. Holistically pontificate installed base portals after maintainable products.'''
				p '''Phosfluorescently engage worldwide methodologies with web-enabled technology. Interactively coordinate proactive e-commerce via process-centric "outside the box" thinking. Completely pursue scalable customer service through sustainable potentialities.'''
				p '''Collaboratively administrate turnkey channels whereas virtual e-tailers. Objectively seize scalable metrics whereas proactive e-services. Seamlessly empower fully researched growth strategies and interoperable internal or "organic" sources.'''
			#??? Inline scripts for distribution.
			script src:'//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js' #??? Fallback to local? Sizzle?
			script src:'lib/mraid.js'
			coffeescript ->
				$ ->
					$ 'button'
					.click ->
						$ '#unit'
						.toggle()
