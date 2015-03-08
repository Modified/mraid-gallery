### device-mockup.html.coffee
Device mockup teacup template.
###
{renderable,normalizeArgs,comment,doctype,html,head,title,link,meta,script,body,section,div,span,em,strong,i,b,p,q,nav,header,footer,h1,h2,h3,a,img,form,input,label,button,select,option,fieldset,ol,ul,li,table,tr,th,td,text,raw,tag,iframe,br,coffeescript}=require 'teacup'

# Helpers, mixins, partials???
labeled=(selector,lbl,inp)->
	#??? {attrs}=normalizeArgs arguments
	if not is_selector selector then inp=lbl;lbl=selector;selector=null #??? Ugly! Unshift arguments?
	label selector,->
		span lbl #???
		inp()

module.exports=renderable (params)->
	doctype 5
	html ->
		head -> #??? (Some practice dropping head and body since browsers tolerate it.)
			meta charset:'utf-8'
			meta name:'viewport',content:'width=device-width,initial-scale=1,maximum-scale=1' #??? Which?
			title 'Device mockup frame'
			link rel:'stylesheet',href:'lib/iosdevices.min.css'
	body ->
		h1 'Device Mockups'
		ul ->
			li ->label -> #??? Use helper!?
				input name:'device',type:'radio',value:'iphone',checked:'checked'
				text 'iPhone'
			li ->label ->
				input name:'device',type:'radio',value:'tablet'
				text 'tablet'
		div '.device.ios-device.ios-device--large.iphone-4s.ios-device--has-shadow',->
			div '.screen.ios-device__screen',->
				iframe src:'app-mockup.html',border:'0',frameborder:'0',scrolling:'0',marginwidth:'0',marginheight:'0' #??? Defaults?
		#??? script src:'//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js' #??? Fallback to local? Sizzle?
