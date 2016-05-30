/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MessageBox){
ColdFusion.MessageBox={};
}
var $MB=ColdFusion.MessageBox;
var $XB=Ext.MessageBox;
var DEFAULT_OK=$XB.buttonText.ok;
var DEFAULT_NO=$XB.buttonText.no;
var DEFAULT_CANCEL=$XB.buttonText.cancel;
var DEFAULT_YES=$XB.buttonText.yes;
var DEFAULT_ALERT_BUTTON_TYPE=$XB.OK;
var DEFAULT_CONFIRM_BUTTON_TYPE=$XB.YESNO;
var DEFAULT_PROMPT_BUTTON_TYPE=$XB.OKCANCEL;
var CF_BEFORE_SHOW_HANDLER_ADDED=false;
var CURRENT_MESSAGEBOX_ID;
ColdFusion.MessageBox.init=function(_3ae,type,_3b0,_3b1,_3b2,_3b3,_3b4,_3b5,_3b6,_3b7,_3b8,icon,_3ba,x,y,_3bd,_3be){
var _3bf={messageBoxId:_3ae,type:type,callBack_Fn:_3b8,multiline:_3b6,modal:_3b7,width:_3ba,bodyStyle:_3be};
if(_3b0==null||typeof (_3b0)=="undefined"){
_3b0="";
}
_3b0=ColdFusion.Util.replaceAll(_3b0,"\n","<br>");
_3bf.messageText=_3b0;
if(_3b2!=null&&typeof (_3b2)!="undefined"){
_3bf.label_OK=_3b2;
}
if(_3b3!=null&&typeof (_3b3)!="undefined"){
_3bf.label_NO=_3b3;
}
if(_3b5!=null&&typeof (_3b5)!="undefined"){
_3bf.label_YES=_3b5;
}
if(_3b4!=null&&typeof (_3b4)!="undefined"){
_3bf.label_CANCEL=_3b4;
}
if(_3b1==null||typeof (_3b1)=="undefined"){
type=type.toLowerCase();
if(type=="alert"){
_3b1="Alert";
}else{
if(type=="confirm"){
_3b1="Confirm";
}else{
if(type=="prompt"){
_3b1="Prompt";
}
}
}
}
_3bf.title=_3b1;
if(_3bd&&typeof (_3bd)=="string"){
_3bf.buttonType=_3bd;
}
if(icon&&typeof (icon)=="string"){
_3bf.icon=icon;
}
if(typeof x=="number"&&x>=0){
_3bf.x=x;
}
if(typeof y=="number"&&y>=0){
_3bf.y=y;
}
ColdFusion.objectCache[_3ae]=_3bf;
};
$MB.show=function(_3c0){
var _3c1=$MB.getMessageBoxObject(_3c0);
var type=_3c1.type;
type=(new String(type)).toLowerCase();
if(!CF_BEFORE_SHOW_HANDLER_ADDED){
var _3c3=Ext.MessageBox;
_3c3.addListener("show",$MB.beforeShowHandler,_3c1);
CF_BEFORE_SHOW_HANDLER_ADDED=true;
}
CURRENT_MESSAGEBOX_ID=_3c0;
var _3c4=_3c1.buttonType;
var _3c5={ok:DEFAULT_OK,no:DEFAULT_NO,cancel:DEFAULT_CANCEL,yes:DEFAULT_YES};
if(_3c1.label_OK){
_3c5.ok=_3c1.label_OK;
}
if(_3c1.label_YES){
_3c5.yes=_3c1.label_YES;
}
if(_3c1.label_NO){
_3c5.no=_3c1.label_NO;
}
if(_3c1.label_CANCEL){
_3c5.cancel=_3c1.label_CANCEL;
}
Ext.MessageBox.buttonText=_3c5;
if(typeof _3c4!="undefined"){
_3c4=_3c4.toUpperCase();
if(_3c4&&_3c4!=="OKCANCEL"&&_3c4!=="OK"&&_3c4!=="YESNOCANCEL"&&_3c4!=="YESNO"){
ColdFusion.handleError(null,"messagebox.show.invalidbuttontype","widget",[messagebox,_3c4],null,null,true);
}
switch(_3c4){
case "OK":
_3c4=$XB.OK;
break;
case "OKCANCEL":
_3c4=$XB.OKCANCEL;
break;
case "YESNOCANCEL":
_3c4=$XB.YESNOCANCEL;
break;
case "YESNO":
_3c4=$XB.YESNO;
break;
}
}
var icon=_3c1.icon;
var _3c7="";
if(icon&&typeof (icon)==="string"){
icon=icon.toUpperCase();
switch(icon){
case "ERROR":
_3c7=$XB.ERROR;
break;
case "INFO":
_3c7=$XB.INFO;
break;
case "QUESTION":
_3c7=$XB.QUESTION;
break;
case "WARNING":
_3c7=$XB.WARNING;
break;
}
}
var _3c8={title:_3c1.title,msg:_3c1.messageText,fn:_3c1.callBack_Fn,modal:_3c1.modal,icon:_3c7,scope:null};
if(_3c1.width){
_3c8.width=_3c1.width;
if(_3c8.width>600){
_3c8.maxWidth=_3c8.width;
}
if(_3c8.width<100){
_3c8.minWidth=_3c8.width;
}
}
if(type==="alert"){
if(!_3c4){
_3c4=DEFAULT_ALERT_BUTTON_TYPE;
}
_3c8.buttons=_3c4;
$XB.show(_3c8);
}
if(type==="confirm"){
if(!_3c4){
_3c4=DEFAULT_CONFIRM_BUTTON_TYPE;
}
_3c8.buttons=_3c4;
$XB.show(_3c8);
}
if(type==="prompt"){
if(!_3c4){
_3c4=DEFAULT_PROMPT_BUTTON_TYPE;
}
_3c8.buttons=_3c4;
_3c8.prompt=true;
_3c8.multiline=_3c1.multiline;
_3c8.value="",$XB.show(_3c8);
}
ColdFusion.Log.info("messagebox.show.shown","widget",[_3c0]);
};
$MB.create=function(_3c9,type,_3cb,_3cc,_3cd,_3ce){
if(_3c9&&typeof _3c9!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
if(!_3c9||ColdFusion.trim(_3c9)==""){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
var _3cf=ColdFusion.objectCache[_3c9];
if(_3cf!=null||typeof _3cf!="undefined"){
ColdFusion.handleError(null,"messagebox.create.duplicatename","widget",[_3c9],null,null,true);
return;
}
if(_3cc&&typeof _3cc!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_3c9],null,null,true);
return;
}
if(!_3cc||ColdFusion.trim(_3cc)==""){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_3c9],null,null,true);
return;
}
if(_3cb&&typeof _3cb!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtitle","widget",[_3c9],null,null,true);
return;
}
if(type&&typeof type!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtype","widget",[_3c9],null,null,true);
return;
}
if(!type||ColdFusion.trim(type)==""){
ColdFusion.handleError(null,"messagebox.create.emptytype","widget",[_3c9],null,null,true);
return;
}
if(_3cd&&typeof _3cd!=="function"){
ColdFusion.handleError(null,"messagebox.create.invalidcallback","widget",[_3c9],null,null,true);
return;
}
var _3d0=DEFAULT_CANCEL;
var _3d1=DEFAULT_NO;
var _3d2=DEFAULT_OK;
var _3d3=DEFAULT_YES;
var _3d4=true;
var _3d5=null;
var _3d6=false;
var icon;
var _3d8;
var x;
var y;
var _3db;
if(_3ce&&_3ce.labelok){
_3d2=_3ce.labelok;
}
if(_3ce&&_3ce.labelno){
_3d1=_3ce.labelno;
}
if(_3ce&&_3ce.labelyes){
_3d3=_3ce.labelyes;
}
if(_3ce&&_3ce.labelcancel){
_3d0=_3ce.labelcancel;
}
if(_3ce&&typeof _3ce.multiline==="boolean"){
_3d6=_3ce.multiline;
}
if(_3ce&&typeof _3ce.modal==="boolean"){
_3d4=_3ce.modal;
}
if(_3ce&&_3ce.buttontype){
_3d5=_3ce.buttontype;
if(type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.create.invalidtypeandbuttontypecombination","widget",[_3c9],null,null,true);
}else{
if(_3d5.toUpperCase()!="YESNO"&&_3d5.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.create.invalidbuttontype","widget",[_3c9,_3d5],null,null,true);
}
}
}
if(_3ce&&_3ce.width){
_3d8=_3ce.width;
if(_3d8&&typeof _3d8!="number"){
ColdFusion.handleError(null,"messagebox.create.widthnotnumeric","widget",[_3c9,_3d8],null,null,true);
}
}
if(_3ce&&typeof _3ce.x!="undefined "){
if(_3ce.x&&typeof _3ce.x!="number"){
ColdFusion.handleError(null,"messagebox.create.xnotnumeric","widget",[_3c9,_3ce.x],null,null,true);
return;
}
x=_3ce.x;
}
if(_3ce&&typeof _3ce.y!="undefined"){
if(_3ce.y&&typeof _3ce.y!="number"){
ColdFusion.handleError(null,"messagebox.create.ynotnumeric","widget",[_3c9,_3ce.y],null,null,true);
return;
}
y=_3ce.y;
}
if(_3ce&&_3ce.icon){
icon=_3ce.icon;
if(icon){
icon=icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.create.invalidicon","widget",[_3c9,icon],null,null,true);
}
}
}
if(_3ce&&_3ce.bodystyle){
_3db=_3ce.bodystyle;
}
$MB.init(_3c9,type,_3cc,_3cb,_3d2,_3d1,_3d0,_3d3,_3d6,_3d4,_3cd,icon,_3d8,x,y,_3d5,_3db);
ColdFusion.Log.info("messagebox.create.created","widget",[_3c9,type]);
};
$MB.updateMessage=function(_3dc,_3dd){
var _3de=$MB.getMessageBoxObject(_3dc);
_3de.messageText=_3dd;
ColdFusion.Log.info("messagebox.updatemessage.updated","widget",[_3dc]);
};
$MB.updateTitle=function(_3df,_3e0){
var _3e1=$MB.getMessageBoxObject(_3df);
_3e1.title=_3e0;
ColdFusion.Log.info("messagebox.updatetitle.updated","widget",[_3df]);
};
$MB.update=function(_3e2,_3e3){
var _3e4=$MB.getMessageBoxObject(_3e2);
var _3e5={};
if(!_3e3||typeof _3e3!="object"){
ColdFusion.handleError(null,"messagebox.update.invalidconfigobject","widget",[_3e2],null,null,true);
return;
}
if(_3e3.name&&typeof _3e3.name=="string"){
ColdFusion.handleError(null,"messagebox.update.nameupdatenotallowed","widget",[_3e2],null,null,true);
return;
}
if(_3e3.type&&typeof _3e3.type=="string"){
ColdFusion.handleError(null,"messagebox.update.typeupdatenotallowed","widget",[_3e2],null,null,true);
return;
}
if(_3e3.message){
if(typeof _3e3.message==="string"||typeof _3e3.message=="object"){
_3e5.messageText=_3e3.message;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidmessage","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.title){
if(typeof _3e3.title==="string"||typeof _3e3.title=="object"){
_3e5.title=_3e3.title;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidtitle","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.labelok!=null||typeof _3e3.labelok!="undefined"){
if(typeof _3e3.labelok==="string"||typeof _3e3.labelok=="object"){
_3e5.label_OK=_3e3.labelok;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelok","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.labelno!=null||typeof _3e3.labelno!="undefined"){
if(typeof _3e3.labelno==="string"||typeof _3e3.labelno=="object"){
_3e5.label_NO=_3e3.labelno;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelno","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.labelyes!=null||typeof _3e3.labelyes!="undefined"){
if(typeof _3e3.labelyes==="string"||typeof _3e3.labelyes=="object"){
_3e5.label_YES=_3e3.labelyes;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelyes","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.labelcancel!=null||typeof _3e3.labelcancel!="undefined"){
if(typeof _3e3.labelcancel==="string"||typeof _3e3.labelcancel=="object"){
_3e5.label_CANCEL=_3e3.labelcancel;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelcancel","widget",[_3e2],null,null,true);
return;
}
}
if(typeof _3e3.modal=="boolean"){
_3e5.modal=_3e3.modal;
}
if(typeof _3e3.multiline==="boolean"){
if(_3e4.type.toLowerCase()!="prompt"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeformultiline","widget",[_3e2],null,null,true);
return;
}
_3e5.multiline=_3e3.multiline;
}
if(_3e3&&_3e3.width){
if(typeof _3e3.width==="number"||typeof _3e3.width=="object"){
_3e5.width=_3e3.width;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidwidth","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.icon!=null||typeof _3e3.icon!="undefined"){
if(typeof _3e3.icon==="string"){
icon=_3e3.icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_3e2],null,null,true);
return;
}
_3e5.icon=_3e3.icon;
}else{
if(typeof _3e3.icon=="object"&&_3e3.icon==null){
_3e5.icon=null;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_3e2],null,null,true);
return;
}
}
}
if(_3e3.callbackhandler!=null||typeof _3e3.callbackhandler!="undefined"){
if(typeof _3e3.callbackhandler==="function"||typeof _3e3.callbackhandler==="object"){
_3e5.callBack_Fn=_3e3.callbackhandler;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidcallbackhandler","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.x!=null||typeof _3e3.x!="undefined"){
if(typeof _3e3.x==="number"||typeof _3e3.x=="object"){
_3e5.x=_3e3.x;
}else{
ColdFusion.handleError(null,"messagebox.update.xnotnumeric","widget",[_3e2,_3e3.x],null,null,true);
return;
}
}
if(_3e3.y!=null||typeof _3e3.y!="undefined"){
if(typeof _3e3.y==="number"||typeof _3e3.y=="object"){
_3e5.y=_3e3.y;
}else{
ColdFusion.handleError(null,"messagebox.update.ynotnumeric","widget",[_3e2,_3e3.y],null,null,true);
return;
}
}
if(_3e3.bodystyle!=null||typeof _3e3.bodystyle!="undefined"){
if(typeof _3e3.bodystyle==="string"||typeof _3e3.bodystyle=="object"){
_3e5.bodyStyle=_3e3.bodystyle;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbodystyle","widget",[_3e2],null,null,true);
return;
}
}
if(_3e3.buttontype!=null||typeof _3e3.buttontype!="undefined"){
if(typeof _3e3.buttontype==="string"||typeof _3e3.buttontype==="object"){
buttonType=_3e3.buttontype;
if(_3e4.type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeandbuttontypecombination","widget",[_3e2],null,null,true);
return;
}else{
if(buttonType.toUpperCase()!="YESNO"&&buttonType.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_3e2],null,null,true);
return;
}
}
_3e5.buttonType=_3e3.buttontype;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_3e2],null,null,true);
return;
}
}
for(key in _3e5){
_3e4[key]=_3e5[key];
}
ColdFusion.Log.info("messagebox.update.updated","messagebox",[_3e2]);
};
$MB.getMessageBoxObject=function(_3e6){
var _3e7=ColdFusion.objectCache[_3e6];
if(_3e7==null||typeof (_3e7)=="undefined"){
ColdFusion.handleError(null,"messagebox.getmessageboxobject.missingmessageboxid","widget",[_3e6],null,null,true);
}
return _3e7;
};
$MB.isMessageBoxDefined=function(_3e8){
var _3e9=ColdFusion.objectCache[_3e8];
if(_3e9==null||typeof (_3e9)=="undefined"){
return false;
}else{
return true;
}
};
$MB.beforeShowHandler=function(_3ea){
var _3eb=$MB.getMessageBoxObject(CURRENT_MESSAGEBOX_ID);
var _3ec=_3eb.x;
var _3ed=_3eb.y;
var _3ee=_3eb.bodyStyle;
var _3ef=_3ea.body.parent();
var id=_3ef.id;
var ele=document.getElementById(id);
if(null!=_3ee){
ele.style.cssText=_3ee;
}
if(_3ec&&_3ed&&typeof _3ec=="number"&&typeof _3ed=="number"&&_3ec>=0&&_3ed>=0){
_3ea.setPosition(_3ec,_3ed);
}else{
_3ea.center();
}
};
