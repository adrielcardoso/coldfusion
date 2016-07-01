/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.ProgressBar){
ColdFusion.ProgressBar={};
}
var $P=ColdFusion.ProgressBar;
ColdFusion.ProgressBar.create=function(_f3,_f4,_f5,_f6,_f7,_f8,_f9,_fa,_fb,_fc){
var _fd={renderTo:_f3,interval:_f6,onComplete:_fa,autodisplay:_f9,onError:_fc};
var _fe={renderTo:_f3};
if(_f8!=null&&typeof (_f8)!=undefined){
_fd.width=_f8;
_fe.width=_f8;
}else{
_fe.width=400;
}
if(_f7!=null&&typeof (_f7)!=undefined){
_fd.height=_f7;
_fe.height=_f7;
}else{
_fd.autoHeight=true;
_fe.autoHeight=true;
}
if(_f4!=null){
_fd.manual=true;
_fd.status_retrieval_fn=_f4;
}else{
_fd.manual=false;
_fd.duration=_f5;
}
_fd.hidden=!_f9;
_fe.hidden=_fd.hidden;
if(_fb!=null&&typeof _fb!="undefined"){
_fd.cls=_fb;
_fe.cls=_fb;
}
var _ff=new Ext.ProgressBar(_fe);
_fd.progressBarComp=_ff;
ColdFusion.objectCache[_f3]=_fd;
ColdFusion.Log.info("progressbar.create.created","widget",[_f3]);
};
$P.start=function(_100){
var _101=$P.getProgressBarObject(_100);
var _102=ColdFusion.objectCache[_100];
if(!_101.isVisible()){
_101=_101.show();
}
_102.started=true;
if(_102.manual==false){
var _103=_102.interval;
var _104=_102.duration;
var _105=_104/_103;
_101.wait({interval:_103,duration:_104,increment:_105,fn:$P.automaticPBCompleteHandler,scope:_102});
}else{
var _106=setInterval(_102.status_retrieval_fn,_102.interval);
_102.processId=_106;
}
ColdFusion.Log.info("progressbar.start.started","widget",[_100]);
};
$P.stop=function(_107,_108){
var pBar=$P.getProgressBarObject(_107);
var _10a=ColdFusion.objectCache[_107];
var _10b=_10a.processId;
if(typeof _10a.started!="undefined"&&_10a.started==true){
_10a.started=false;
}else{
ColdFusion.Log.info("progressbar.stop.nonrunning","widget",[_107]);
return;
}
if(_10b!=null&&typeof (_10b)!="undefined"){
clearInterval(_10b);
}
if(typeof _10a.manual!="undefined"&&_10a.manual==false){
pBar.reset();
}
if(_108&&_108==true){
var _10c=_10a.onComplete;
if(_10c!=null&&_10c.call){
_10c.call();
}
}
ColdFusion.Log.info("progressbar.stop.stopped","widget",[_107]);
};
$P.hide=function(_10d){
var pBar=$P.getProgressBarObject(_10d);
if(pBar.isVisible()){
pBar.hide();
}
ColdFusion.Log.info("progressbar.hide.hidden","widget",[_10d]);
};
$P.show=function(_10f){
var pBar=$P.getProgressBarObject(_10f);
if(!pBar.isVisible()){
pBar.show();
}
ColdFusion.Log.info("progressbar.show.shown","widget",[_10f]);
};
$P.reset=function(_111){
var pBar=$P.getProgressBarObject(_111);
if(typeof pBar!="undefined"){
pBar.reset();
}
ColdFusion.Log.info("progressbar.reset.reset","widget",[_111]);
};
$P.updateStatus=function(_113,_114,_115){
var pBar=$P.getProgressBarObject(_113);
if(typeof (_114)=="undefined"||typeof (_114)!="number"){
ColdFusion.handleError(null,"progressbar.updatestatus.invalidstatus","widget",[_113,_114],null,null,true);
return;
}
if(typeof pBar!="undefined"){
pBar.updateProgress(_114,_115);
}
ColdFusion.Log.info("progressbar.updatestatus.updated","widget",[_113]);
};
$P.update=function(_117,_118){
var _119={};
var _11a=ColdFusion.objectCache[_117];
if(_11a==null||typeof (_11a)=="undefined"){
ColdFusion.handleError(null,"progressbar.update.notfound","widget",[_117],null,null,true);
return;
}
if(_118.duration){
if(typeof _118.duration==="number"||typeof _118.duration=="object"){
_119.duration=_118.duration;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidduration","widget",[_117],null,null,true);
return;
}
}
if(_118.interval){
if(typeof _118.interval==="number"||typeof _118.interval=="object"){
_119.interval=_118.interval;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidinterval","widget",[_117],null,null,true);
return;
}
}
if(_118.oncomplete){
if(typeof _118.oncomplete==="function"||typeof _118.oncomplete=="object"){
_119.onComplete=_118.oncomplete;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidoncomplete","widget",[_117],null,null,true);
return;
}
}
for(key in _119){
_11a[key]=_119[key];
}
ColdFusion.Log.info("progressbar.update.updated","widget",[_117]);
};
$P.loadStatus=function(data,_11c){
var _11d=ColdFusion.AjaxProxy.JSON.decode(data);
var _11e=_11d.MESSAGE;
var _11f=_11d.STATUS;
var pBar=$P.getProgressBarObject(_11c._cf_progressbarid);
pBar.updateProgress(_11f,_11e);
if(_11f&&(_11f===1||_11f==1||_11f>1)){
$P.stop(_11c._cf_progressbarid,true);
}
};
$P.automaticPBCompleteHandler=function(){
var _121=this.progressBarComp;
_121.updateProgress(1);
if(this.onComplete&&typeof this.onComplete=="function"){
this.onComplete.call(_121,_121);
}
};
$P.errorHandler=function(_122,_123,_124){
var pbId=_124.bindToParams._cf_progressbarid;
var _126=ColdFusion.objectCache[pbId];
var _127=_126.onError;
if(_127!=null&&typeof _127==="function"){
_127.call(null,_122,_123);
}
$P.stop(pbId);
};
$P.getProgressBarObject=function(_128){
var _129=ColdFusion.objectCache[_128];
if(_129==null||typeof (_129)=="undefined"){
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarid","widget",[_128],null,null,true);
return;
}
if(_129.progressBarComp&&typeof _129.progressBarComp!="undefined"){
return _129.progressBarComp;
}else{
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarcomponent","widget",[_128],null,null,true);
return;
}
};
