/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tooltip){
ColdFusion.Tooltip={};
}
ColdFusion.Tooltip.setToolTipOut=function(_57c,_57d){
var _57e=_57d.tooltip;
_57e.tooltipout=true;
};
ColdFusion.Tooltip.getToolTip=function(_57f,_580){
var _581=ColdFusion.objectCache[_580.context];
if(!_581){
if(_580.style){
_580.styleObj=ColdFusion.Tooltip.parseStyle(_580.style);
}
_581=new YAHOO.widget.Tooltip(_580.context+"_cf_tooltip",_580);
ColdFusion.objectCache[_580.context]=_581;
_581.doShow(_57f,_580.context);
if(_580._cf_url){
var _582=function(req,_584){
_584.tooltip.cfg.setProperty("text",req.responseText);
if(_584.tooltip.tooltipout==false){
_584.tooltip.doShow(_584.event,_584.id);
}
};
YAHOO.util.Event.addListener(_580.context,"mouseout",ColdFusion.Tooltip.setToolTipOut,{"tooltip":_581});
_581.cfg.setProperty("text",_cf_loadingtexthtml);
_581.doShow(_57f,_580.context);
try{
ColdFusion.Log.info("tooltip.gettooltip.fetch","widget",[_580.context]);
ColdFusion.Ajax.sendMessage(_580._cf_url,"GET",_580._cf_query,true,_582,{tooltip:_581,event:_57f,id:_580.context});
}
catch(e){
tooltipdiv=ColdFusion.DOM.getElement(_580.context);
tooltipdiv.innerHTML="";
ColdFusion.globalErrorHandler(null,e,tooltipdiv);
}
}
}
_581.tooltipout=false;
};
ColdFusion.Tooltip.parseStyle=function(_585){
var _586={};
if(_585&&typeof _585==="string"){
var _587=_585.split(";");
for(var i=0;i<_587.length;i++){
var temp=_587[i];
tempArray=temp.split(":");
if(tempArray.length===2){
var key=tempArray[0];
key=key.toLowerCase();
var _58b=tempArray[1];
switch(key){
case "width":
_586.width=_58b;
break;
case "color":
_586.color=_58b;
break;
case "background-color":
_586[key]=_58b;
break;
case "padding":
_586.padding=_58b;
break;
default:
_586[key]=_58b;
}
}
}
}
return _586;
};
