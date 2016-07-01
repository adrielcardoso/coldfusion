/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Slider){
ColdFusion.Slider={};
}
var $SL=ColdFusion.Slider;
ColdFusion.Slider.init=function(_40d,name,_40f,_410,_411,_412,_413,_414,_415,_416,tip,_418,_419){
var _41a={renderTo:_40d,id:name};
if(_415!=null&&typeof (_415)!="undefined"){
_41a.ClicktoChange=_415;
}else{
_41a.ClicktoChange=false;
}
if(_416!=null&&typeof (_416)!="undefined"){
_41a.increment=_416;
}else{
_41a.increment=1;
}
if(_413!=null&&typeof (_413)!=undefined){
_41a.minValue=_413;
}else{
_41a.minValue=0;
}
if(_412!=null&&typeof (_412)!=undefined){
_41a.value=_412;
}else{
_41a.value=_41a.minValue;
}
if(_410!=null&&typeof (_410)!=undefined){
_41a.width=_410;
}else{
_41a.width=200;
}
if(_411!=null&&typeof (_411)!="undefined"){
_41a.height=_411;
}else{
_41a.height=100;
}
if(_414!=null&&typeof (_414)!=undefined){
_41a.maxValue=_414;
}else{
_41a.maxValue=100;
}
if(_40f!=null&&typeof (_40f)!=undefined){
_41a.vertical=_40f;
}else{
_41a.vertical=false;
}
if(_418!=null&&typeof (_418)=="function"){
_41a.onChange=_418;
}
if(_419!=null&&typeof (_419)!="undefined"){
_41a.onDrg=_419;
}
Ext.define("Ext.ux.ST",{extend:"Ext.slider.Tip",minWidth:10,offsets:[0,-10],init:function(_41b){
_41b.on("dragstart",this.onSlide,this);
_41b.on("drag",this.onSlide,this);
_41b.on("dragend",this.hide,this);
_41b.on("destroy",this.destroy,this);
},onSlide:function(_41c,e,_41e){
this.show();
this.body.update(this.getText(_41c));
this.el.alignTo(_41e.el,"b-t?",this.offsets);
this.doAutoRender();
},getText:function(_41f){
return _41f.getValue()==0?"0":_41f.getValue();
}});
if(tip!=null&&typeof (tip)!="undefined"){
if(tip){
_41a.plugins=new Ext.ux.ST();
}else{
_41a.useTips=false;
}
}
var _420=Ext.create("Ext.slider.Single",_41a);
_420.on("drag",$SL.onDragHandler,_41a);
_420.on("changecomplete",$SL.onChangeHandler,_41a);
_41a.sliderComp=_420;
ColdFusion.objectCache[name]=_41a;
ColdFusion.Log.info("slider.initialized","widget",[name]);
};
$SL.onDragHandler=function(_421,_422){
var _423=this.onDrg;
if(_423!=null&&typeof (_423)=="function"){
_423.call(this,_421,_422);
}
};
$SL.onChangeHandler=function(_424,_425){
var _426=this.onChange;
if(_426!=null&&typeof (_426)=="function"){
_426.call(this,_424,_425);
}
};
$SL.getValue=function(_427){
var _428=ColdFusion.objectCache[_427];
if(_428!=null||typeof (_428)!="undefined"){
var _429=_428.sliderComp;
if(_429){
return _429.getValue();
}
}else{
ColdFusion.handleError(null,"slider.getvalue.notfound","widget",[_427],null,null,true);
}
};
$SL.getSliderObject=function(_42a){
var _42b=ColdFusion.objectCache[_42a];
if(_42b!=null||typeof (_42b)!="undefined"){
return _42b.sliderComp;
}else{
return null;
}
};
$SL.setValue=function(_42c,_42d){
var _42e=ColdFusion.objectCache[_42c];
if(_42e!=null||typeof (_42e)!="undefined"){
var _42f=_42e.sliderComp;
if(_42f){
return _42f.setValue(_42d,true);
}
}else{
ColdFusion.handleError(null,"slider.setvalue.notfound","widget",[_42c],null,null,true);
}
};
$SL.show=function(_430){
var _431=ColdFusion.objectCache[_430];
if(_431!=null||typeof (_431)!="undefined"){
var _432=_431.sliderComp;
if(_432){
return _432.show();
}
}else{
ColdFusion.handleError(null,"slider.show.notfound","widget",[_430],null,null,true);
}
ColdFusion.Log.info("slider.show.shown","widget",[_430]);
};
$SL.hide=function(_433){
var _434=ColdFusion.objectCache[_433];
if(_434!=null||typeof (_434)!="undefined"){
var _435=_434.sliderComp;
if(_435){
return _435.hide();
}
}else{
ColdFusion.handleError(null,"slider.hide.notfound","widget",[_433],null,null,true);
}
ColdFusion.Log.info("slider.hide.hidden","widget",[_433]);
};
$SL.enable=function(_436){
var _437=ColdFusion.objectCache[_436];
if(_437!=null||typeof (_437)!="undefined"){
var _438=_437.sliderComp;
if(_438){
return _438.enable();
}
}else{
ColdFusion.handleError(null,"slider.enable.notfound","widget",[_436],null,null,true);
}
ColdFusion.Log.info("slider.enable.enabled","widget",[_436]);
};
$SL.disable=function(_439){
var _43a=ColdFusion.objectCache[_439];
if(_43a!=null||typeof (_43a)!="undefined"){
var _43b=_43a.sliderComp;
if(_43b){
return _43b.disable();
}
}else{
ColdFusion.handleError(null,"slider.disable.notfound","widget",[_439],null,null,true);
}
ColdFusion.Log.info("slider.disable.disabled","widget",[_439]);
};
