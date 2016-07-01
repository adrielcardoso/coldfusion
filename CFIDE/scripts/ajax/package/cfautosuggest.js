/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Autosuggest){
ColdFusion.Autosuggest={};
}
var staticgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/static.gif";
var dynamicgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/loading.gif";
ColdFusion.Autosuggest.loadAutoSuggest=function(_3f2,_3f3){
var _3f4=ColdFusion.objectCache[_3f3.autosuggestid];
if(typeof (_3f2)=="string"){
_3f2=_3f2.split(",");
}else{
var _3f5=false;
if(_3f2&&ColdFusion.Util.isArray(_3f2)){
_3f5=true;
if(_3f2.length>0&&(typeof (_3f2[0])!="string"&&typeof (_3f2[0])!="number")){
_3f5=false;
}
}
if(!_3f5){
ColdFusion.handleError(_3f4.onbinderror,"autosuggest.loadautosuggest.invalidvalue","widget",[_3f3.autosuggestid]);
return;
}
}
var _3f6=document.getElementById(_3f3.autosuggestid).value;
if(_3f6.length==1&&_3f2.length==0){
var _3f7=new Array();
_3f4.dataSource.flushCache();
_3f4.dataSource=new YAHOO.widget.DS_JSArray(_3f7);
_3f4.autosuggestitems=_3f7;
}
if(_3f2.length>0){
var i=0;
var _3f9=false;
var _3f7=new Array();
for(i=0;i<_3f2.length;i++){
if(_3f2[i]){
if(typeof (_3f2[i])=="string"){
_3f7[i]=_3f2[i];
}else{
if(typeof (_3f2[i])=="number"){
_3f7[i]=_3f2[i]+"";
}else{
_3f7[i]=new String(_3f2[i]);
}
}
if(_3f7[i].indexOf(_3f6)==0){
_3f9=true;
}
}
}
if(_3f9==false&&_3f4.showloadingicon==true){
document.getElementById(_3f3.autosuggestid+"_cf_button").src=staticgifpath;
}
_3f4.dataSource.flushCache();
_3f4.dataSource=new YAHOO.widget.DS_JSArray(_3f7);
_3f4.autosuggestitems=_3f7;
if(_3f4.queryMatchContains){
_3f4.dataSource.queryMatchContains=_3f4.queryMatchContains;
}
_3f4._sendQuery(_3f6);
}else{
if(_3f4.showloadingicon==true){
document.getElementById(_3f3.autosuggestid+"_cf_button").src=staticgifpath;
_3f4.showloadingicon==false;
}
}
};
ColdFusion.Autosuggest.checkToMakeBindCall=function(arg,_3fb,_3fc,_3fd,_3fe){
var _3fd=document.getElementById(_3fb).value;
if(!_3fc.isContainerOpen()&&_3fd.length>0&&arg.keyCode!=39&&(arg.keyCode>31||(arg.keyCode==8&&_3fc.valuePresent==true))){
_3fc.valuePresent=false;
if(_3fc.showloadingicon==true){
document.getElementById(_3fb+"_cf_button").src=dynamicgifpath;
}
ColdFusion.Log.info("autosuggest.checktomakebindcall.fetching","widget",[_3fb,_3fd]);
if(_3fc.cfqueryDelay>0){
var _3ff=setTimeout(_3fe,_3fc.cfqueryDelay*1000,this);
if(_3fc._nDelayID!=-1){
clearTimeout(_3fc._cf_nDelayID);
}
_3fc._cf_nDelayID=_3ff;
}else{
_3fe.call(this);
}
}
};
ColdFusion.Autosuggest.checkValueNotInAutosuggest=function(_400,_401){
if(_400.autosuggestitems){
for(var i=0;i<_400.autosuggestitems.length;i++){
if(_401==_400.autosuggestitems[i]){
return false;
}
}
}
return true;
};
ColdFusion.Autosuggest.triggerOnChange=function(type,args){
var _405=args[0];
var _406=document.getElementById(_405.id);
ColdFusion.Event.callBindHandlers(_405.id,null,"change");
};
ColdFusion.Autosuggest.init=function(_407,_408,_409){
return new YAHOO.widget.AutoComplete(_407,_408,_409);
};
ColdFusion.Autosuggest.getAutosuggestObject=function(_40a){
var _40b=ColdFusion.objectCache[_40a];
if(_40b==null||typeof (_40b)=="undefined"){
ColdFusion.handleError(null,"autosuggest.getAutosuggestObject.notfound","widget",[_40a],null,null,true);
}
return _40b;
};
ColdFusion.Autosuggest.initJS_ARRAY=function(_40c){
return new YAHOO.widget.DS_JSArray(_40c);
};
