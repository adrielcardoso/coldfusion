/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
function cfinit(){
if(!window.ColdFusion){
ColdFusion={};
var $C=ColdFusion;
if(!$C.Ajax){
$C.Ajax={};
}
var $A=$C.Ajax;
if(!$C.AjaxProxy){
$C.AjaxProxy={};
}
var $X=$C.AjaxProxy;
if(!$C.Bind){
$C.Bind={};
}
var $B=$C.Bind;
if(!$C.Event){
$C.Event={};
}
var $E=$C.Event;
if(!$C.Log){
$C.Log={};
}
var $L=$C.Log;
if(!$C.Util){
$C.Util={};
}
var $U=$C.Util;
if(!$C.DOM){
$C.DOM={};
}
var $D=$C.DOM;
if(!$C.Spry){
$C.Spry={};
}
var $S=$C.Spry;
if(!$C.Pod){
$C.Pod={};
}
var $P=$C.Pod;
if(!$C.objectCache){
$C.objectCache={};
}
if(!$C.required){
$C.required={};
}
if(!$C.importedTags){
$C.importedTags=[];
}
if(!$C.requestCounter){
$C.requestCounter=0;
}
if(!$C.bindHandlerCache){
$C.bindHandlerCache={};
}
window._cf_loadingtexthtml="<div style=\"text-align: center;\">"+window._cf_loadingtexthtml+"&nbsp;"+CFMessage["loading"]+"</div>";
$C.globalErrorHandler=function(_596,_597){
if($L.isAvailable){
$L.error(_596,_597);
}
if($C.userGlobalErrorHandler){
$C.userGlobalErrorHandler(_596);
}
if(!$L.isAvailable&&!$C.userGlobalErrorHandler){
alert(_596+CFMessage["globalErrorHandler.alert"]);
}
};
$C.handleError=function(_598,_599,_59a,_59b,_59c,_59d,_59e,_59f){
var msg=$L.format(_599,_59b);
if(_598){
$L.error(msg,"http");
if(!_59c){
_59c=-1;
}
if(!_59d){
_59d=msg;
}
_598(_59c,_59d,_59f);
}else{
if(_59e){
$L.error(msg,"http");
throw msg;
}else{
$C.globalErrorHandler(msg,_59a);
}
}
};
$C.setGlobalErrorHandler=function(_5a1){
$C.userGlobalErrorHandler=_5a1;
};
$A.createXMLHttpRequest=function(){
try{
return new XMLHttpRequest();
}
catch(e){
}
var _5a2=["Microsoft.XMLHTTP","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP"];
for(var i=0;i<_5a2.length;i++){
try{
return new ActiveXObject(_5a2[i]);
}
catch(e){
}
}
return false;
};
$A.isRequestError=function(req){
return ((req.status!=0&&req.status!=200)||req.getResponseHeader("server-error"));
};
$A.sendMessage=function(url,_5a6,_5a7,_5a8,_5a9,_5aa,_5ab){
var req=$A.createXMLHttpRequest();
if(!_5a6){
_5a6="GET";
}
if(_5a8&&_5a9){
req.onreadystatechange=function(){
$A.callback(req,_5a9,_5aa);
};
}
if(_5a7){
_5a7+="&_cf_nodebug=true&_cf_nocache=true";
}else{
_5a7="_cf_nodebug=true&_cf_nocache=true";
}
if(window._cf_clientid){
_5a7+="&_cf_clientid="+_cf_clientid;
}
if(_5a6=="GET"){
if(_5a7){
_5a7+="&_cf_rc="+($C.requestCounter++);
if(url.indexOf("?")==-1){
url+="?"+_5a7;
}else{
url+="&"+_5a7;
}
}
$L.info("ajax.sendmessage.get","http",[url]);
req.open(_5a6,url,_5a8);
req.send(null);
}else{
$L.info("ajax.sendmessage.post","http",[url,_5a7]);
req.open(_5a6,url,_5a8);
req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
if(_5a7){
req.send(_5a7);
}else{
req.send(null);
}
}
if(!_5a8){
while(req.readyState!=4){
}
if($A.isRequestError(req)){
$C.handleError(null,"ajax.sendmessage.error","http",[req.status,req.statusText],req.status,req.statusText,_5ab);
}else{
return req;
}
}
};
$A.callback=function(req,_5ae,_5af){
if(req.readyState!=4){
return;
}
req.onreadystatechange=new Function;
_5ae(req,_5af);
};
$A.submitForm=function(_5b0,url,_5b2,_5b3,_5b4,_5b5){
var _5b6=$C.getFormQueryString(_5b0);
if(_5b6==-1){
$C.handleError(_5b3,"ajax.submitform.formnotfound","http",[_5b0],-1,null,true);
return;
}
if(!_5b4){
_5b4="POST";
}
_5b5=!(_5b5===false);
var _5b7=function(req){
$A.submitForm.callback(req,_5b0,_5b2,_5b3);
};
$L.info("ajax.submitform.submitting","http",[_5b0]);
var _5b9=$A.sendMessage(url,_5b4,_5b6,_5b5,_5b7);
if(!_5b5){
$L.info("ajax.submitform.success","http",[_5b0]);
return _5b9.responseText;
}
};
$A.submitForm.callback=function(req,_5bb,_5bc,_5bd){
if($A.isRequestError(req)){
$C.handleError(_5bd,"ajax.submitform.error","http",[req.status,_5bb,req.statusText],req.status,req.statusText);
}else{
$L.info("ajax.submitform.success","http",[_5bb]);
if(_5bc){
_5bc(req.responseText);
}
}
};
$C.empty=function(){
};
$C.setSubmitClicked=function(_5be,_5bf){
var el=$D.getElement(_5bf,_5be);
el.cfinputbutton=true;
$C.setClickedProperty=function(){
el.clicked=true;
};
$E.addListener(el,"click",$C.setClickedProperty);
};
$C.getFormQueryString=function(_5c1,_5c2){
var _5c3;
if(typeof _5c1=="string"){
_5c3=(document.getElementById(_5c1)||document.forms[_5c1]);
}else{
if(typeof _5c1=="object"){
_5c3=_5c1;
}
}
if(!_5c3||null==_5c3.elements){
return -1;
}
var _5c4,elementName,elementValue,elementDisabled;
var _5c5=false;
var _5c6=(_5c2)?{}:"";
for(var i=0;i<_5c3.elements.length;i++){
_5c4=_5c3.elements[i];
elementDisabled=_5c4.disabled;
elementName=_5c4.name;
elementValue=_5c4.value;
if(!elementDisabled&&elementName){
switch(_5c4.type){
case "select-one":
case "select-multiple":
for(var j=0;j<_5c4.options.length;j++){
if(_5c4.options[j].selected){
if(window.ActiveXObject){
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,_5c4.options[j].attributes["value"].specified?_5c4.options[j].value:_5c4.options[j].text);
}else{
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,_5c4.options[j].hasAttribute("value")?_5c4.options[j].value:_5c4.options[j].text);
}
}
}
break;
case "radio":
case "checkbox":
if(_5c4.checked){
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,elementValue);
}
break;
case "file":
case undefined:
case "reset":
break;
case "button":
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,elementValue);
break;
case "submit":
if(_5c4.cfinputbutton){
if(_5c5==false&&_5c4.clicked){
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,elementValue);
_5c5=true;
}
}else{
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,elementValue);
}
break;
case "textarea":
var _5c9;
if(window.FCKeditorAPI&&(_5c9=$C.objectCache[elementName])&&_5c9.richtextid){
var _5ca=FCKeditorAPI.GetInstance(_5c9.richtextid);
if(_5ca){
elementValue=_5ca.GetXHTML();
}
}
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,elementValue);
break;
default:
_5c6=$C.getFormQueryString.processFormData(_5c6,_5c2,elementName,elementValue);
break;
}
}
}
if(!_5c2){
_5c6=_5c6.substr(0,_5c6.length-1);
}
return _5c6;
};
$C.getFormQueryString.processFormData=function(_5cb,_5cc,_5cd,_5ce){
if(_5cc){
if(_5cb[_5cd]){
_5cb[_5cd]+=","+_5ce;
}else{
_5cb[_5cd]=_5ce;
}
}else{
_5cb+=encodeURIComponent(_5cd)+"="+encodeURIComponent(_5ce)+"&";
}
return _5cb;
};
$A.importTag=function(_5cf){
$C.importedTags.push(_5cf);
};
$A.checkImportedTag=function(_5d0){
var _5d1=false;
for(var i=0;i<$C.importedTags.length;i++){
if($C.importedTags[i]==_5d0){
_5d1=true;
break;
}
}
if(!_5d1){
$C.handleError(null,"ajax.checkimportedtag.error","widget",[_5d0]);
}
};
$C.getElementValue=function(_5d3,_5d4,_5d5){
if(!_5d3){
$C.handleError(null,"getelementvalue.noelementname","bind",null,null,null,true);
return;
}
if(!_5d5){
_5d5="value";
}
var _5d6=$B.getBindElementValue(_5d3,_5d4,_5d5);
if(typeof (_5d6)=="undefined"){
_5d6=null;
}
if(_5d6==null){
$C.handleError(null,"getelementvalue.elnotfound","bind",[_5d3,_5d5],null,null,true);
return;
}
return _5d6;
};
$B.getBindElementValue=function(_5d7,_5d8,_5d9,_5da,_5db){
var _5dc="";
if(window[_5d7]){
var _5dd=eval(_5d7);
if(_5dd&&_5dd._cf_getAttribute){
_5dc=_5dd._cf_getAttribute(_5d9);
return _5dc;
}
}
var _5de=$C.objectCache[_5d7];
if(_5de&&_5de._cf_getAttribute){
_5dc=_5de._cf_getAttribute(_5d9);
return _5dc;
}
var el=$D.getElement(_5d7,_5d8);
var _5e0=(el&&((!el.length&&el.length!=0)||(el.length&&el.length>0)||el.tagName=="SELECT"));
if(!_5e0&&!_5db){
$C.handleError(null,"bind.getbindelementvalue.elnotfound","bind",[_5d7]);
return null;
}
if(el.tagName!="SELECT"){
if(el.length>1){
var _5e1=true;
for(var i=0;i<el.length;i++){
var _5e3=(el[i].getAttribute("type")=="radio"||el[i].getAttribute("type")=="checkbox");
if(!_5e3||(_5e3&&el[i].checked)){
if(!_5e1){
_5dc+=",";
}
_5dc+=$B.getBindElementValue.extract(el[i],_5d9);
_5e1=false;
}
}
}else{
_5dc=$B.getBindElementValue.extract(el,_5d9);
}
}else{
var _5e1=true;
for(var i=0;i<el.options.length;i++){
if(el.options[i].selected){
if(!_5e1){
_5dc+=",";
}
_5dc+=$B.getBindElementValue.extract(el.options[i],_5d9);
_5e1=false;
}
}
}
if(typeof (_5dc)=="object"){
$C.handleError(null,"bind.getbindelementvalue.simplevalrequired","bind",[_5d7,_5d9]);
return null;
}
if(_5da&&$C.required[_5d7]&&_5dc.length==0){
return null;
}
return _5dc;
};
$B.getBindElementValue.extract=function(el,_5e5){
var _5e6=el[_5e5];
if((_5e6==null||typeof (_5e6)=="undefined")&&el.getAttribute){
_5e6=el.getAttribute(_5e5);
}
return _5e6;
};
$L.init=function(){
if(window.YAHOO&&YAHOO.widget&&YAHOO.widget.Logger){
YAHOO.widget.Logger.categories=[CFMessage["debug"],CFMessage["info"],CFMessage["error"],CFMessage["window"]];
YAHOO.widget.LogReader.prototype.formatMsg=function(_5e7){
var _5e8=_5e7.category;
return "<p>"+"<span class='"+_5e8+"'>"+_5e8+"</span>:<i>"+_5e7.source+"</i>: "+_5e7.msg+"</p>";
};
var _5e9=new YAHOO.widget.LogReader(null,{width:"30em",fontSize:"100%"});
_5e9.setTitle(CFMessage["log.title"]||"ColdFusion AJAX Logger");
_5e9._btnCollapse.value=CFMessage["log.collapse"]||"Collapse";
_5e9._btnPause.value=CFMessage["log.pause"]||"Pause";
_5e9._btnClear.value=CFMessage["log.clear"]||"Clear";
$L.isAvailable=true;
}
};
$L.log=function(_5ea,_5eb,_5ec,_5ed){
if(!$L.isAvailable){
return;
}
if(!_5ec){
_5ec="global";
}
_5ec=CFMessage[_5ec]||_5ec;
_5eb=CFMessage[_5eb]||_5eb;
_5ea=$L.format(_5ea,_5ed);
YAHOO.log(_5ea,_5eb,_5ec);
};
$L.format=function(code,_5ef){
var msg=CFMessage[code]||code;
if(_5ef){
for(i=0;i<_5ef.length;i++){
if(!_5ef[i].length){
_5ef[i]="";
}
var _5f1="{"+i+"}";
msg=msg.replace(_5f1,_5ef[i]);
}
}
return msg;
};
$L.debug=function(_5f2,_5f3,_5f4){
$L.log(_5f2,"debug",_5f3,_5f4);
};
$L.info=function(_5f5,_5f6,_5f7){
$L.log(_5f5,"info",_5f6,_5f7);
};
$L.error=function(_5f8,_5f9,_5fa){
$L.log(_5f8,"error",_5f9,_5fa);
};
$L.dump=function(_5fb,_5fc){
if($L.isAvailable){
var dump=(/string|number|undefined|boolean/.test(typeof (_5fb))||_5fb==null)?_5fb:recurse(_5fb,typeof _5fb,true);
$L.debug(dump,_5fc);
}
};
$X.invoke=function(_5fe,_5ff,_600,_601,_602){
return $X.invokeInternal(_5fe,_5ff,_600,_601,_602,false,null,null);
};
$X.invokeInternal=function(_603,_604,_605,_606,_607,_608,_609,_60a){
var _60b="method="+_604+"&_cf_ajaxproxytoken="+_605;
if(_608){
_60b+="&_cfclient="+"true";
var _60c=$X.JSON.encodeInternal(_603._variables,_608);
_60b+="&_variables="+encodeURIComponent(_60c);
var _60d=$X.JSON.encodeInternal(_603._metadata,_608);
_60b+="&_metadata="+encodeURIComponent(_60d);
}
var _60e=_603.returnFormat||"json";
_60b+="&returnFormat="+_60e;
if(_603.queryFormat){
_60b+="&queryFormat="+_603.queryFormat;
}
if(_603.formId){
var _60f=$C.getFormQueryString(_603.formId,true);
if(_606!=null){
for(prop in _60f){
_606[prop]=_60f[prop];
}
}else{
_606=_60f;
}
_603.formId=null;
}
var _610="";
if(_606!=null){
_610=$X.JSON.encodeInternal(_606,_608);
_60b+="&argumentCollection="+encodeURIComponent(_610);
}
$L.info("ajaxproxy.invoke.invoking","http",[_603.cfcPath,_604,_610]);
if(_603.callHandler){
_603.callHandler.call(null,_603.callHandlerParams,_603.cfcPath,_60b);
return;
}
var _611;
var _612=_603.async;
if(_609!=null){
_612=true;
_611=function(req){
$X.callbackOp(req,_603,_607,_609,_60a);
};
}else{
if(_603.async){
_611=function(req){
$X.callback(req,_603,_607);
};
}
}
var req=$A.sendMessage(_603.cfcPath,_603.httpMethod,_60b,_612,_611,null,true);
if(!_612){
return $X.processResponse(req,_603);
}
};
$X.callback=function(req,_617,_618){
if($A.isRequestError(req)){
$C.handleError(_617.errorHandler,"ajaxproxy.invoke.error","http",[req.status,_617.cfcPath,req.statusText],req.status,req.statusText,false,_618);
}else{
if(_617.callbackHandler){
var _619=$X.processResponse(req,_617);
_617.callbackHandler(_619,_618);
}
}
};
$X.callbackOp=function(req,_61b,_61c,_61d,_61e){
if($A.isRequestError(req)){
var _61f=_61b.errorHandler;
if(_61e!=null){
_61f=_61e;
}
$C.handleError(_61f,"ajaxproxy.invoke.error","http",[req.status,_61b.cfcPath,req.statusText],req.status,req.statusText,false,_61c);
}else{
if(_61d){
var _620=$X.processResponse(req,_61b);
_61d(_620,_61c);
}
}
};
$X.processResponse=function(req,_622){
var _623=true;
for(var i=0;i<req.responseText.length;i++){
var c=req.responseText.charAt(i);
_623=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_623){
break;
}
}
var _626=(req.responseXML&&req.responseXML.childNodes.length>0);
var _627=_626?"[XML Document]":req.responseText;
$L.info("ajaxproxy.invoke.response","http",[_627]);
var _628;
var _629=_622.returnFormat||"json";
if(_629=="json"){
try{
_628=_623?null:$X.JSON.decode(req.responseText);
}
catch(e){
if(typeof _622._metadata!=="undefined"&&_622._metadata.servercfc&&typeof req.responseText==="string"){
_628=req.responseText;
}else{
throw e;
}
}
}else{
_628=_626?req.responseXML:(_623?null:req.responseText);
}
return _628;
};
$X.init=function(_62a,_62b,_62c){
if(typeof _62c==="undefined"){
_62c=false;
}
var _62d=_62b;
if(!_62c){
var _62e=_62b.split(".");
var ns=self;
for(i=0;i<_62e.length-1;i++){
if(_62e[i].length){
ns[_62e[i]]=ns[_62e[i]]||{};
ns=ns[_62e[i]];
}
}
var _630=_62e[_62e.length-1];
if(ns[_630]){
return ns[_630];
}
ns[_630]=function(){
this.httpMethod="GET";
this.async=false;
this.callbackHandler=null;
this.errorHandler=null;
this.formId=null;
};
_62d=ns[_630].prototype;
}else{
_62d.httpMethod="GET";
_62d.async=false;
_62d.callbackHandler=null;
_62d.errorHandler=null;
_62d.formId=null;
}
_62d.cfcPath=_62a;
_62d.setHTTPMethod=function(_631){
if(_631){
_631=_631.toUpperCase();
}
if(_631!="GET"&&_631!="POST"){
$C.handleError(null,"ajaxproxy.sethttpmethod.invalidmethod","http",[_631],null,null,true);
}
this.httpMethod=_631;
};
_62d.setSyncMode=function(){
this.async=false;
};
_62d.setAsyncMode=function(){
this.async=true;
};
_62d.setCallbackHandler=function(fn){
this.callbackHandler=fn;
this.setAsyncMode();
};
_62d.setErrorHandler=function(fn){
this.errorHandler=fn;
this.setAsyncMode();
};
_62d.setForm=function(fn){
this.formId=fn;
};
_62d.setQueryFormat=function(_635){
if(_635){
_635=_635.toLowerCase();
}
if(!_635||(_635!="column"&&_635!="row"&&_635!="struct")){
$C.handleError(null,"ajaxproxy.setqueryformat.invalidformat","http",[_635],null,null,true);
}
this.queryFormat=_635;
};
_62d.setReturnFormat=function(_636){
if(_636){
_636=_636.toLowerCase();
}
if(!_636||(_636!="plain"&&_636!="json"&&_636!="wddx")){
$C.handleError(null,"ajaxproxy.setreturnformat.invalidformat","http",[_636],null,null,true);
}
this.returnFormat=_636;
};
$L.info("ajaxproxy.init.created","http",[_62a]);
if(_62c){
return _62d;
}else{
return ns[_630];
}
};
$U.isWhitespace=function(s){
var _638=true;
for(var i=0;i<s.length;i++){
var c=s.charAt(i);
_638=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_638){
break;
}
}
return _638;
};
$U.getFirstNonWhitespaceIndex=function(s){
var _63c=true;
for(var i=0;i<s.length;i++){
var c=s.charAt(i);
_63c=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_63c){
break;
}
}
return i;
};
$C.trim=function(_63f){
return _63f.replace(/^\s+|\s+$/g,"");
};
$U.isInteger=function(n){
var _641=true;
if(typeof (n)=="number"){
_641=(n>=0);
}else{
for(i=0;i<n.length;i++){
if($U.isInteger.numberChars.indexOf(n.charAt(i))==-1){
_641=false;
break;
}
}
}
return _641;
};
$U.isInteger.numberChars="0123456789";
$U.isArray=function(a){
return (typeof (a.length)=="number"&&!a.toUpperCase);
};
$U.isBoolean=function(b){
if(b===true||b===false){
return true;
}else{
if(b.toLowerCase){
b=b.toLowerCase();
return (b==$U.isBoolean.trueChars||b==$U.isBoolean.falseChars);
}else{
return false;
}
}
};
$U.isBoolean.trueChars="true";
$U.isBoolean.falseChars="false";
$U.castBoolean=function(b){
if(b===true){
return true;
}else{
if(b===false){
return false;
}else{
if(b.toLowerCase){
b=b.toLowerCase();
if(b==$U.isBoolean.trueChars){
return true;
}else{
if(b==$U.isBoolean.falseChars){
return false;
}else{
return false;
}
}
}else{
return false;
}
}
}
};
$U.checkQuery=function(o){
var _646=null;
if(o&&o.COLUMNS&&$U.isArray(o.COLUMNS)&&o.DATA&&$U.isArray(o.DATA)&&(o.DATA.length==0||(o.DATA.length>0&&$U.isArray(o.DATA[0])))){
_646="row";
}else{
if(o&&o.COLUMNS&&$U.isArray(o.COLUMNS)&&o.ROWCOUNT&&$U.isInteger(o.ROWCOUNT)&&o.DATA){
_646="col";
for(var i=0;i<o.COLUMNS.length;i++){
var _648=o.DATA[o.COLUMNS[i]];
if(!_648||!$U.isArray(_648)){
_646=null;
break;
}
}
}
}
return _646;
};
$X.JSON=new function(){
var _649={}.hasOwnProperty?true:false;
var _64a=/^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?$/;
var pad=function(n){
return n<10?"0"+n:n;
};
var m={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"};
var _64e=function(s){
if(/["\\\x00-\x1f]/.test(s)){
return "\""+s.replace(/([\x00-\x1f\\"])/g,function(a,b){
var c=m[b];
if(c){
return c;
}
c=b.charCodeAt();
return "\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16);
})+"\"";
}
return "\""+s+"\"";
};
var _653=function(o){
var a=["["],b,i,l=o.length,v;
for(i=0;i<l;i+=1){
v=o[i];
switch(typeof v){
case "undefined":
case "function":
case "unknown":
break;
default:
if(b){
a.push(",");
}
a.push(v===null?"null":$X.JSON.encode(v));
b=true;
}
}
a.push("]");
return a.join("");
};
var _656=function(o){
return "\""+o.getFullYear()+"-"+pad(o.getMonth()+1)+"-"+pad(o.getDate())+"T"+pad(o.getHours())+":"+pad(o.getMinutes())+":"+pad(o.getSeconds())+"\"";
};
this.encode=function(o){
return this.encodeInternal(o,false);
};
this.encodeInternal=function(o,cfc){
if(typeof o=="undefined"||o===null){
return "null";
}else{
if(o instanceof Array){
return _653(o);
}else{
if(o instanceof Date){
if(cfc){
return this.encodeInternal({_date_:o.getTime()},cfc);
}
return _656(o);
}else{
if(typeof o=="string"){
return _64e(o);
}else{
if(typeof o=="number"){
return isFinite(o)?String(o):"null";
}else{
if(typeof o=="boolean"){
return String(o);
}else{
if(cfc&&typeof o=="object"&&typeof o._metadata!=="undefined"){
return "{\"_metadata\":"+this.encodeInternal(o._metadata,false)+",\"_variables\":"+this.encodeInternal(o._variables,cfc)+"}";
}else{
var a=["{"],b,i,v;
for(var i in o){
if(!_649||o.hasOwnProperty(i)){
v=o[i];
switch(typeof v){
case "undefined":
case "function":
case "unknown":
break;
default:
if(b){
a.push(",");
}
a.push(this.encodeInternal(i,cfc),":",v===null?"null":this.encodeInternal(v,cfc));
b=true;
}
}
}
a.push("}");
return a.join("");
}
}
}
}
}
}
}
};
this.decode=function(json){
if(typeof json=="object"){
return json;
}
if($U.isWhitespace(json)){
return null;
}
var _65e=$U.getFirstNonWhitespaceIndex(json);
if(_65e>0){
json=json.slice(_65e);
}
if(window._cf_jsonprefix&&json.indexOf(_cf_jsonprefix)==0){
json=json.slice(_cf_jsonprefix.length);
}
try{
if(_64a.test(json)){
return eval("("+json+")");
}
}
catch(e){
}
throw new SyntaxError("parseJSON");
};
}();
if(!$C.JSON){
$C.JSON={};
}
$C.JSON.encode=$X.JSON.encode;
$C.JSON.encodeInternal=$X.JSON.encodeInternal;
$C.JSON.decode=$X.JSON.decode;
$C.navigate=function(url,_660,_661,_662,_663,_664){
if(url==null){
$C.handleError(_662,"navigate.urlrequired","widget");
return;
}
if(_663){
_663=_663.toUpperCase();
if(_663!="GET"&&_663!="POST"){
$C.handleError(null,"navigate.invalidhttpmethod","http",[_663],null,null,true);
}
}else{
_663="GET";
}
var _665;
if(_664){
_665=$C.getFormQueryString(_664);
if(_665==-1){
$C.handleError(null,"navigate.formnotfound","http",[_664],null,null,true);
}
}
if(_660==null){
if(_665){
if(url.indexOf("?")==-1){
url+="?"+_665;
}else{
url+="&"+_665;
}
}
$L.info("navigate.towindow","widget",[url]);
window.location.replace(url);
return;
}
$L.info("navigate.tocontainer","widget",[url,_660]);
var obj=$C.objectCache[_660];
if(obj!=null){
if(typeof (obj._cf_body)!="undefined"&&obj._cf_body!=null){
_660=obj._cf_body;
}
}
$A.replaceHTML(_660,url,_663,_665,_661,_662);
};
$A.checkForm=function(_667,_668,_669,_66a,_66b){
var _66c=_668.call(null,_667);
if(_66c==false){
return false;
}
var _66d=$C.getFormQueryString(_667);
$L.info("ajax.submitform.submitting","http",[_667.name]);
$A.replaceHTML(_669,_667.action,_667.method,_66d,_66a,_66b);
return false;
};
$A.replaceHTML=function(_66e,url,_670,_671,_672,_673){
var _674=document.getElementById(_66e);
if(!_674){
$C.handleError(_673,"ajax.replacehtml.elnotfound","http",[_66e]);
return;
}
var _675="_cf_containerId="+encodeURIComponent(_66e);
_671=(_671)?_671+"&"+_675:_675;
$L.info("ajax.replacehtml.replacing","http",[_66e,url,_671]);
if(_cf_loadingtexthtml){
try{
_674.innerHTML=_cf_loadingtexthtml;
}
catch(e){
}
}
var _676=function(req,_678){
var _679=false;
if($A.isRequestError(req)){
$C.handleError(_673,"ajax.replacehtml.error","http",[req.status,_678.id,req.statusText],req.status,req.statusText);
_679=true;
}
var _67a=new $E.CustomEvent("onReplaceHTML",_678);
var _67b=new $E.CustomEvent("onReplaceHTMLUser",_678);
$E.loadEvents[_678.id]={system:_67a,user:_67b};
if(req.responseText.search(/<script/i)!=-1){
try{
_678.innerHTML="";
}
catch(e){
}
$A.replaceHTML.processResponseText(req.responseText,_678,_673);
}else{
try{
_678.innerHTML=req.responseText;
$A.updateLayouttab(_678);
}
catch(e){
}
}
$E.loadEvents[_678.id]=null;
_67a.fire();
_67a.unsubscribe();
_67b.fire();
_67b.unsubscribe();
$L.info("ajax.replacehtml.success","http",[_678.id]);
if(_672&&!_679){
_672();
}
};
try{
$A.sendMessage(url,_670,_671,true,_676,_674);
}
catch(e){
try{
_674.innerHTML=$L.format(CFMessage["ajax.replacehtml.connectionerrordisplay"],[url,e]);
}
catch(e){
}
$C.handleError(_673,"ajax.replacehtml.connectionerror","http",[_66e,url,e]);
}
};
$A.replaceHTML.processResponseText=function(text,_67d,_67e){
var pos=0;
var _680=0;
var _681=0;
_67d._cf_innerHTML="";
while(pos<text.length){
var _682=text.indexOf("<s",pos);
if(_682==-1){
_682=text.indexOf("<S",pos);
}
if(_682==-1){
break;
}
pos=_682;
var _683=true;
var _684=$A.replaceHTML.processResponseText.scriptTagChars;
for(var i=1;i<_684.length;i++){
var _686=pos+i+1;
if(_686>text.length){
break;
}
var _687=text.charAt(_686);
if(_684[i][0]!=_687&&_684[i][1]!=_687){
pos+=i+1;
_683=false;
break;
}
}
if(!_683){
continue;
}
var _688=text.substring(_680,pos);
if(_688){
_67d._cf_innerHTML+=_688;
}
var _689=text.indexOf(">",pos)+1;
if(_689==0){
pos++;
continue;
}else{
pos+=7;
}
var _68a=_689;
while(_68a<text.length&&_68a!=-1){
_68a=text.indexOf("</s",_68a);
if(_68a==-1){
_68a=text.indexOf("</S",_68a);
}
if(_68a!=-1){
_683=true;
for(var i=1;i<_684.length;i++){
var _686=_68a+2+i;
if(_686>text.length){
break;
}
var _687=text.charAt(_686);
if(_684[i][0]!=_687&&_684[i][1]!=_687){
_68a=_686;
_683=false;
break;
}
}
if(_683){
break;
}
}
}
if(_68a!=-1){
var _68b=text.substring(_689,_68a);
var _68c=_68b.indexOf("<!--");
if(_68c!=-1){
_68b=_68b.substring(_68c+4);
}
var _68d=_68b.lastIndexOf("//-->");
if(_68d!=-1){
_68b=_68b.substring(0,_68d-1);
}
if(_68b.indexOf("document.write")!=-1||_68b.indexOf("CF_RunContent")!=-1){
if(_68b.indexOf("CF_RunContent")!=-1){
_68b=_68b.replace("CF_RunContent","document.write");
}
_68b="var _cfDomNode = document.getElementById('"+_67d.id+"'); var _cfBuffer='';"+"if (!document._cf_write)"+"{document._cf_write = document.write;"+"document.write = function(str){if (_cfBuffer!=null){_cfBuffer+=str;}else{document._cf_write(str);}};};"+_68b+";_cfDomNode._cf_innerHTML += _cfBuffer; _cfBuffer=null;";
}
try{
eval(_68b);
}
catch(ex){
$C.handleError(_67e,"ajax.replacehtml.jserror","http",[_67d.id,ex]);
}
}
_682=text.indexOf(">",_68a)+1;
if(_682==0){
_681=_68a+1;
break;
}
_681=_682;
pos=_682;
_680=_682;
}
if(_681<text.length-1){
var _688=text.substring(_681,text.length);
if(_688){
_67d._cf_innerHTML+=_688;
}
}
try{
_67d.innerHTML=_67d._cf_innerHTML;
$A.updateLayouttab(_67d);
}
catch(e){
}
_67d._cf_innerHTML="";
};
$A.updateLayouttab=function(_68e){
var _68f=_68e.id;
if(_68f.length>13&&_68f.indexOf("cf_layoutarea")==0){
var s=_68f.substr(13,_68f.length);
var cmp=Ext.getCmp(s);
if(cmp){
cmp.update("<div id="+_68e.id+">"+_68e.innerHTML+"</div>");
}
}
};
$A.replaceHTML.processResponseText.scriptTagChars=[["s","S"],["c","C"],["r","R"],["i","I"],["p","P"],["t","T"]];
$D.getElement=function(_692,_693){
var _694=function(_695){
return (_695.name==_692||_695.id==_692);
};
var _696=$D.getElementsBy(_694,null,_693);
if(_696.length==1){
return _696[0];
}else{
return _696;
}
};
$D.getElementsBy=function(_697,tag,root){
tag=tag||"*";
var _69a=[];
if(root){
root=$D.get(root);
if(!root){
return _69a;
}
}else{
root=document;
}
var _69b=root.getElementsByTagName(tag);
if(!_69b.length&&(tag=="*"&&root.all)){
_69b=root.all;
}
for(var i=0,len=_69b.length;i<len;++i){
if(_697(_69b[i])){
_69a[_69a.length]=_69b[i];
}
}
return _69a;
};
$D.get=function(el){
if(!el){
return null;
}
if(typeof el!="string"&&!(el instanceof Array)){
return el;
}
if(typeof el=="string"){
return document.getElementById(el);
}else{
var _69e=[];
for(var i=0,len=el.length;i<len;++i){
_69e[_69e.length]=$D.get(el[i]);
}
return _69e;
}
return null;
};
$E.loadEvents={};
$E.CustomEvent=function(_6a0,_6a1){
return {name:_6a0,domNode:_6a1,subs:[],subscribe:function(func,_6a3){
var dup=false;
for(var i=0;i<this.subs.length;i++){
var sub=this.subs[i];
if(sub.f==func&&sub.p==_6a3){
dup=true;
break;
}
}
if(!dup){
this.subs.push({f:func,p:_6a3});
}
},fire:function(){
for(var i=0;i<this.subs.length;i++){
var sub=this.subs[i];
sub.f.call(null,this,sub.p);
}
},unsubscribe:function(){
this.subscribers=[];
}};
};
$E.windowLoadImpEvent=new $E.CustomEvent("cfWindowLoadImp");
$E.windowLoadEvent=new $E.CustomEvent("cfWindowLoad");
$E.windowLoadUserEvent=new $E.CustomEvent("cfWindowLoadUser");
$E.listeners=[];
$E.addListener=function(el,ev,fn,_6ac){
var l={el:el,ev:ev,fn:fn,params:_6ac};
$E.listeners.push(l);
var _6ae=function(e){
if(!e){
var e=window.event;
}
fn.call(null,e,_6ac);
};
if(el.addEventListener){
el.addEventListener(ev,_6ae,false);
return true;
}else{
if(el.attachEvent){
el.attachEvent("on"+ev,_6ae);
return true;
}else{
return false;
}
}
};
$E.isListener=function(el,ev,fn,_6b3){
var _6b4=false;
var ls=$E.listeners;
for(var i=0;i<ls.length;i++){
if(ls[i].el==el&&ls[i].ev==ev&&ls[i].fn==fn&&ls[i].params==_6b3){
_6b4=true;
break;
}
}
return _6b4;
};
$E.callBindHandlers=function(id,_6b8,ev){
var el=document.getElementById(id);
if(!el){
return;
}
var ls=$E.listeners;
for(var i=0;i<ls.length;i++){
if(ls[i].el==el&&ls[i].ev==ev&&ls[i].fn._cf_bindhandler){
ls[i].fn.call(null,null,ls[i].params);
}
}
};
$E.registerOnLoad=function(func,_6be,_6bf,user){
if($E.registerOnLoad.windowLoaded){
if(_6be&&_6be._cf_containerId&&$E.loadEvents[_6be._cf_containerId]){
if(user){
$E.loadEvents[_6be._cf_containerId].user.subscribe(func,_6be);
}else{
$E.loadEvents[_6be._cf_containerId].system.subscribe(func,_6be);
}
}else{
func.call(null,null,_6be);
}
}else{
if(user){
$E.windowLoadUserEvent.subscribe(func,_6be);
}else{
if(_6bf){
$E.windowLoadImpEvent.subscribe(func,_6be);
}else{
$E.windowLoadEvent.subscribe(func,_6be);
}
}
}
};
$E.registerOnLoad.windowLoaded=false;
$E.onWindowLoad=function(fn){
if(window.addEventListener){
window.addEventListener("load",fn,false);
}else{
if(window.attachEvent){
window.attachEvent("onload",fn);
}else{
if(document.getElementById){
window.onload=fn;
}
}
}
};
$C.addSpanToDom=function(){
var _6c2=document.createElement("span");
document.body.insertBefore(_6c2,document.body.firstChild);
};
$E.windowLoadHandler=function(e){
if(window.Ext){
Ext.BLANK_IMAGE_URL=_cf_contextpath+"/CFIDE/scripts/ajax/resources/ext/images/default/s.gif";
}
$C.addSpanToDom();
$L.init();
$E.registerOnLoad.windowLoaded=true;
$E.windowLoadImpEvent.fire();
$E.windowLoadImpEvent.unsubscribe();
$E.windowLoadEvent.fire();
$E.windowLoadEvent.unsubscribe();
$E.windowLoadUserEvent.fire();
$E.windowLoadUserEvent.unsubscribe();
};
$E.onWindowLoad($E.windowLoadHandler);
$B.register=function(_6c4,_6c5,_6c6,_6c7){
for(var i=0;i<_6c4.length;i++){
var _6c9=_6c4[i][0];
var _6ca=_6c4[i][1];
var _6cb=_6c4[i][2];
if(window[_6c9]){
var _6cc=eval(_6c9);
if(_6cc&&_6cc._cf_register){
_6cc._cf_register(_6cb,_6c6,_6c5);
continue;
}
}
var _6cd=$C.objectCache[_6c9];
if(_6cd&&_6cd._cf_register){
_6cd._cf_register(_6cb,_6c6,_6c5);
continue;
}
var _6ce=$D.getElement(_6c9,_6ca);
var _6cf=(_6ce&&((!_6ce.length&&_6ce.length!=0)||(_6ce.length&&_6ce.length>0)||_6ce.tagName=="SELECT"));
if(!_6cf){
$C.handleError(null,"bind.register.elnotfound","bind",[_6c9]);
}
if(_6ce.length>1&&!_6ce.options){
for(var j=0;j<_6ce.length;j++){
$B.register.addListener(_6ce[j],_6cb,_6c6,_6c5);
}
}else{
$B.register.addListener(_6ce,_6cb,_6c6,_6c5);
}
}
if(!$C.bindHandlerCache[_6c5.bindTo]&&typeof (_6c5.bindTo)=="string"){
$C.bindHandlerCache[_6c5.bindTo]=function(){
_6c6.call(null,null,_6c5);
};
}
if(_6c7){
_6c6.call(null,null,_6c5);
}
};
$B.register.addListener=function(_6d1,_6d2,_6d3,_6d4){
if(!$E.isListener(_6d1,_6d2,_6d3,_6d4)){
$E.addListener(_6d1,_6d2,_6d3,_6d4);
}
};
$B.assignValue=function(_6d5,_6d6,_6d7,_6d8){
if(!_6d5){
return;
}
if(_6d5.call){
_6d5.call(null,_6d7,_6d8);
return;
}
var _6d9=$C.objectCache[_6d5];
if(_6d9&&_6d9._cf_setValue){
_6d9._cf_setValue(_6d7);
return;
}
var _6da=document.getElementById(_6d5);
if(!_6da){
$C.handleError(null,"bind.assignvalue.elnotfound","bind",[_6d5]);
}
if(_6da.tagName=="SELECT"){
var _6db=$U.checkQuery(_6d7);
var _6dc=$C.objectCache[_6d5];
if(_6db){
if(!_6dc||(_6dc&&(!_6dc.valueCol||!_6dc.displayCol))){
$C.handleError(null,"bind.assignvalue.selboxmissingvaldisplay","bind",[_6d5]);
return;
}
}else{
if(typeof (_6d7.length)=="number"&&!_6d7.toUpperCase){
if(_6d7.length>0&&(typeof (_6d7[0].length)!="number"||_6d7[0].toUpperCase)){
$C.handleError(null,"bind.assignvalue.selboxerror","bind",[_6d5]);
return;
}
}else{
$C.handleError(null,"bind.assignvalue.selboxerror","bind",[_6d5]);
return;
}
}
_6da.options.length=0;
var _6dd;
var _6de=false;
if(_6dc){
_6dd=_6dc.selected;
if(_6dd&&_6dd.length>0){
_6de=true;
}
}
if(!_6db){
for(var i=0;i<_6d7.length;i++){
var opt=new Option(_6d7[i][1],_6d7[i][0]);
_6da.options[i]=opt;
if(_6de){
for(var j=0;j<_6dd.length;j++){
if(_6dd[j]==opt.value){
opt.selected=true;
}
}
}
}
}else{
if(_6db=="col"){
var _6e2=_6d7.DATA[_6dc.valueCol];
var _6e3=_6d7.DATA[_6dc.displayCol];
if(!_6e2||!_6e3){
$C.handleError(null,"bind.assignvalue.selboxinvalidvaldisplay","bind",[_6d5]);
return;
}
for(var i=0;i<_6e2.length;i++){
var opt=new Option(_6e3[i],_6e2[i]);
_6da.options[i]=opt;
if(_6de){
for(var j=0;j<_6dd.length;j++){
if(_6dd[j]==opt.value){
opt.selected=true;
}
}
}
}
}else{
if(_6db=="row"){
var _6e4=-1;
var _6e5=-1;
for(var i=0;i<_6d7.COLUMNS.length;i++){
var col=_6d7.COLUMNS[i];
if(col==_6dc.valueCol){
_6e4=i;
}
if(col==_6dc.displayCol){
_6e5=i;
}
if(_6e4!=-1&&_6e5!=-1){
break;
}
}
if(_6e4==-1||_6e5==-1){
$C.handleError(null,"bind.assignvalue.selboxinvalidvaldisplay","bind",[_6d5]);
return;
}
for(var i=0;i<_6d7.DATA.length;i++){
var opt=new Option(_6d7.DATA[i][_6e5],_6d7.DATA[i][_6e4]);
_6da.options[i]=opt;
if(_6de){
for(var j=0;j<_6dd.length;j++){
if(_6dd[j]==opt.value){
opt.selected=true;
}
}
}
}
}
}
}
}else{
_6da[_6d6]=_6d7;
}
$E.callBindHandlers(_6d5,null,"change");
$L.info("bind.assignvalue.success","bind",[_6d7,_6d5,_6d6]);
};
$B.localBindHandler=function(e,_6e8){
var _6e9=document.getElementById(_6e8.bindTo);
var _6ea=$B.evaluateBindTemplate(_6e8,true);
$B.assignValue(_6e8.bindTo,_6e8.bindToAttr,_6ea);
};
$B.localBindHandler._cf_bindhandler=true;
$B.evaluateBindTemplate=function(_6eb,_6ec,_6ed,_6ee,_6ef){
var _6f0=_6eb.bindExpr;
var _6f1="";
if(typeof _6ef=="undefined"){
_6ef=false;
}
for(var i=0;i<_6f0.length;i++){
if(typeof (_6f0[i])=="object"){
var _6f3=null;
if(!_6f0[i].length||typeof _6f0[i][0]=="object"){
_6f3=$X.JSON.encode(_6f0[i]);
}else{
var _6f3=$B.getBindElementValue(_6f0[i][0],_6f0[i][1],_6f0[i][2],_6ec,_6ee);
if(_6f3==null){
if(_6ec){
_6f1="";
break;
}else{
_6f3="";
}
}
}
if(_6ed){
_6f3=encodeURIComponent(_6f3);
}
_6f1+=_6f3;
}else{
var _6f4=_6f0[i];
if(_6ef==true&&i>0){
if(typeof (_6f4)=="string"&&_6f4.indexOf("&")!=0){
_6f4=encodeURIComponent(_6f4);
}
}
_6f1+=_6f4;
}
}
return _6f1;
};
$B.jsBindHandler=function(e,_6f6){
var _6f7=_6f6.bindExpr;
var _6f8=new Array();
var _6f9=_6f6.callFunction+"(";
for(var i=0;i<_6f7.length;i++){
var _6fb;
if(typeof (_6f7[i])=="object"){
if(_6f7[i].length){
if(typeof _6f7[i][0]=="object"){
_6fb=_6f7[i];
}else{
_6fb=$B.getBindElementValue(_6f7[i][0],_6f7[i][1],_6f7[i][2],false);
}
}else{
_6fb=_6f7[i];
}
}else{
_6fb=_6f7[i];
}
if(i!=0){
_6f9+=",";
}
_6f8[i]=_6fb;
_6f9+="'"+_6fb+"'";
}
_6f9+=")";
var _6fc=_6f6.callFunction.apply(null,_6f8);
$B.assignValue(_6f6.bindTo,_6f6.bindToAttr,_6fc,_6f6.bindToParams);
};
$B.jsBindHandler._cf_bindhandler=true;
$B.urlBindHandler=function(e,_6fe){
var _6ff=_6fe.bindTo;
if($C.objectCache[_6ff]&&$C.objectCache[_6ff]._cf_visible===false){
$C.objectCache[_6ff]._cf_dirtyview=true;
return;
}
var url=$B.evaluateBindTemplate(_6fe,false,true,false,true);
var _701=$U.extractReturnFormat(url);
if(_701==null||typeof _701=="undefined"){
_701="JSON";
}
if(_6fe.bindToAttr||typeof _6fe.bindTo=="undefined"||typeof _6fe.bindTo=="function"){
var _6fe={"bindTo":_6fe.bindTo,"bindToAttr":_6fe.bindToAttr,"bindToParams":_6fe.bindToParams,"errorHandler":_6fe.errorHandler,"url":url,returnFormat:_701};
try{
$A.sendMessage(url,"GET",null,true,$B.urlBindHandler.callback,_6fe);
}
catch(e){
$C.handleError(_6fe.errorHandler,"ajax.urlbindhandler.connectionerror","http",[url,e]);
}
}else{
$A.replaceHTML(_6ff,url,null,null,_6fe.callback,_6fe.errorHandler);
}
};
$B.urlBindHandler._cf_bindhandler=true;
$B.urlBindHandler.callback=function(req,_703){
if($A.isRequestError(req)){
$C.handleError(_703.errorHandler,"bind.urlbindhandler.httperror","http",[req.status,_703.url,req.statusText],req.status,req.statusText);
}else{
$L.info("bind.urlbindhandler.response","http",[req.responseText]);
var _704;
try{
if(_703.returnFormat==null||_703.returnFormat==="JSON"){
_704=$X.JSON.decode(req.responseText);
}else{
_704=req.responseText;
}
}
catch(e){
if(req.responseText!=null&&typeof req.responseText=="string"){
_704=req.responseText;
}else{
$C.handleError(_703.errorHandler,"bind.urlbindhandler.jsonerror","http",[req.responseText]);
}
}
$B.assignValue(_703.bindTo,_703.bindToAttr,_704,_703.bindToParams);
}
};
$A.initSelect=function(_705,_706,_707,_708){
$C.objectCache[_705]={"valueCol":_706,"displayCol":_707,selected:_708};
};
$S.setupSpry=function(){
if(typeof (Spry)!="undefined"&&Spry.Data){
Spry.Data.DataSet.prototype._cf_getAttribute=function(_709){
var val;
var row=this.getCurrentRow();
if(row){
val=row[_709];
}
return val;
};
Spry.Data.DataSet.prototype._cf_register=function(_70c,_70d,_70e){
var obs={bindParams:_70e};
obs.onCurrentRowChanged=function(){
_70d.call(null,null,this.bindParams);
};
obs.onDataChanged=function(){
_70d.call(null,null,this.bindParams);
};
this.addObserver(obs);
};
if(Spry.Debug.trace){
var _710=Spry.Debug.trace;
Spry.Debug.trace=function(str){
$L.info(str,"spry");
_710(str);
};
}
if(Spry.Debug.reportError){
var _712=Spry.Debug.reportError;
Spry.Debug.reportError=function(str){
$L.error(str,"spry");
_712(str);
};
}
$L.info("spry.setupcomplete","bind");
}
};
$E.registerOnLoad($S.setupSpry,null,true);
$S.bindHandler=function(_714,_715){
var url;
var _717="_cf_nodebug=true&_cf_nocache=true";
if(window._cf_clientid){
_717+="&_cf_clientid="+_cf_clientid;
}
var _718=window[_715.bindTo];
var _719=(typeof (_718)=="undefined");
if(_715.cfc){
var _71a={};
var _71b=_715.bindExpr;
for(var i=0;i<_71b.length;i++){
var _71d;
if(_71b[i].length==2){
_71d=_71b[i][1];
}else{
_71d=$B.getBindElementValue(_71b[i][1],_71b[i][2],_71b[i][3],false,_719);
}
_71a[_71b[i][0]]=_71d;
}
_71a=$X.JSON.encode(_71a);
_717+="&method="+_715.cfcFunction;
_717+="&argumentCollection="+encodeURIComponent(_71a);
$L.info("spry.bindhandler.loadingcfc","http",[_715.bindTo,_715.cfc,_715.cfcFunction,_71a]);
url=_715.cfc;
}else{
url=$B.evaluateBindTemplate(_715,false,true,_719);
$L.info("spry.bindhandler.loadingurl","http",[_715.bindTo,url]);
}
var _71e=_715.options||{};
if((_718&&_718._cf_type=="json")||_715.dsType=="json"){
_717+="&returnformat=json";
}
if(_718){
if(_718.requestInfo.method=="GET"){
_71e.method="GET";
if(url.indexOf("?")==-1){
url+="?"+_717;
}else{
url+="&"+_717;
}
}else{
_71e.postData=_717;
_71e.method="POST";
_718.setURL("");
}
_718.setURL(url,_71e);
_718.loadData();
}else{
if(!_71e.method||_71e.method=="GET"){
if(url.indexOf("?")==-1){
url+="?"+_717;
}else{
url+="&"+_717;
}
}else{
_71e.postData=_717;
_71e.useCache=false;
}
var ds;
if(_715.dsType=="xml"){
ds=new Spry.Data.XMLDataSet(url,_715.xpath,_71e);
}else{
ds=new Spry.Data.JSONDataSet(url,_71e);
ds.preparseFunc=$S.preparseData;
}
ds._cf_type=_715.dsType;
var _720={onLoadError:function(req){
$C.handleError(_715.errorHandler,"spry.bindhandler.error","http",[_715.bindTo,req.url,req.requestInfo.postData]);
}};
ds.addObserver(_720);
window[_715.bindTo]=ds;
}
};
$S.bindHandler._cf_bindhandler=true;
$S.preparseData=function(ds,_723){
var _724=$U.getFirstNonWhitespaceIndex(_723);
if(_724>0){
_723=_723.slice(_724);
}
if(window._cf_jsonprefix&&_723.indexOf(_cf_jsonprefix)==0){
_723=_723.slice(_cf_jsonprefix.length);
}
return _723;
};
$P.init=function(_725){
$L.info("pod.init.creating","widget",[_725]);
var _726={};
_726._cf_body=_725+"_body";
$C.objectCache[_725]=_726;
};
$B.cfcBindHandler=function(e,_728){
var _729=(_728.httpMethod)?_728.httpMethod:"GET";
var _72a={};
var _72b=_728.bindExpr;
for(var i=0;i<_72b.length;i++){
var _72d;
if(_72b[i].length==2){
_72d=_72b[i][1];
}else{
_72d=$B.getBindElementValue(_72b[i][1],_72b[i][2],_72b[i][3],false);
}
_72a[_72b[i][0]]=_72d;
}
var _72e=function(_72f,_730){
$B.assignValue(_730.bindTo,_730.bindToAttr,_72f,_730.bindToParams);
};
var _731={"bindTo":_728.bindTo,"bindToAttr":_728.bindToAttr,"bindToParams":_728.bindToParams};
var _732={"async":true,"cfcPath":_728.cfc,"httpMethod":_729,"callbackHandler":_72e,"errorHandler":_728.errorHandler};
if(_728.proxyCallHandler){
_732.callHandler=_728.proxyCallHandler;
_732.callHandlerParams=_728;
}
$X.invoke(_732,_728.cfcFunction,_728._cf_ajaxproxytoken,_72a,_731);
};
$B.cfcBindHandler._cf_bindhandler=true;
$U.extractReturnFormat=function(url){
var _734;
var _735=url.toUpperCase();
var _736=_735.indexOf("RETURNFORMAT");
if(_736>0){
var _737=_735.indexOf("&",_736+13);
if(_737<0){
_737=_735.length;
}
_734=_735.substring(_736+13,_737);
}
return _734;
};
$U.replaceAll=function(_738,_739,_73a){
var _73b=_738.indexOf(_739);
while(_73b>-1){
_738=_738.replace(_739,_73a);
_73b=_738.indexOf(_739);
}
return _738;
};
$U.cloneObject=function(obj){
var _73d={};
for(key in obj){
var _73e=obj[key];
if(typeof _73e=="object"){
_73e=$U.cloneObject(_73e);
}
_73d.key=_73e;
}
return _73d;
};
$C.clone=function(obj,_740){
if(typeof (obj)!="object"){
return obj;
}
if(obj==null){
return obj;
}
var _741=new Object();
for(var i in obj){
if(_740===true){
_741[i]=$C.clone(obj[i]);
}else{
_741[i]=obj[i];
}
}
return _741;
};
$C.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)=="object"){
value=$C.printObject(value);
}
str+=value;
}
return str;
};
}
}
cfinit();
