/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Button){
ColdFusion.Button={};
}
var $BT=ColdFusion.Button;
ColdFusion.Button.init=function(_745,_746,icon,tips,_749,_74a,_74b,_74c,_74d){
var _74e={renderTo:_745,enableToggle:_74d,text:_746,onClick:_749,onToggle:_74a,onMouseOver:_74b,onMouseout:_74c,tooltip:tips,icon:icon};
var _74f={renderTo:_745,enableToggle:_74d,text:_746};
if(tips!=null&&typeof tips!="undefined"){
_74f.tooltip=tips;
Ext.QuickTips.init();
}
if(icon!=null&&typeof icon!="undefined"){
_74f.icon=icon;
}
if(icon&&_746){
_74f.iconCls="x-btn-text-icon";
}else{
if(icon&&!_746){
_74f.iconCls="x-btn-icon";
}
}
var _750=new Ext.Button(_74f);
if(_749!=null&&typeof _749=="function"){
_750.on("click",_749,_74e);
}
if(_74a!=null&&typeof _74a=="function"){
_750.on("toggle",_74a,_74e);
}
if(_74b!=null&&typeof _74b=="function"){
_750.on("mouseover",_74b,_74e);
}
if(_74c!=null&&typeof _74c=="function"){
_750.on("mouseout",_74c,_74e);
}
_74e.buttonComp=_750;
ColdFusion.objectCache[_745]=_74e;
ColdFusion.Log.info("button.initialized","widget",[_745]);
};
$BT.show=function(_751){
var _752=$BT.getButtonObject(_751);
if(_752!=null){
_752.show();
}
ColdFusion.Log.info("button.show.shown","widget",[_751]);
};
$BT.hide=function(_753){
var _754=$BT.getButtonObject(_753);
if(_754!=null){
_754.hide();
}
ColdFusion.Log.info("button.hide.hidden","widget",[_753]);
};
$BT.disable=function(_755){
var _756=$BT.getButtonObject(_755);
if(_756!=null){
_756.disable();
}
ColdFusion.Log.info("button.disable.disabled","widget",[_755]);
};
$BT.enable=function(_757){
var _758=$BT.getButtonObject(_757);
if(_758!=null){
_758.enable();
}
ColdFusion.Log.info("button.enable.enabled","widget",[_757]);
};
$BT.getButtonObject=function(_759){
var _75a=$BT.getButtonConfigObj(_759);
if(_75a!=null){
return _75a.buttonComp;
}else{
ColdFusion.handleError(null,"button.component.notFound","widget",[_759],null,null,true);
}
};
$BT.setLabel=function(_75b,_75c){
var _75d=$BT.getButtonObject(_75b);
if(_75d!=null){
_75d.text=_75c;
}
};
$BT.getButtonConfigObj=function(_75e){
var _75f=ColdFusion.objectCache[_75e];
if(_75f==null||typeof (_75f)=="undefined"){
ColdFusion.handleError(null,"button.component.notFound","widget",[_75e],null,null,true);
}
return _75f;
};
$BT.toggle=function(_760){
var _761=$BT.getButtonObject(_760);
if(_761!=null){
_761.toggle();
}
};
