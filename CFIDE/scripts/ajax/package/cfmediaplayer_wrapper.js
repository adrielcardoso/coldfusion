/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MediaPlayer){
ColdFusion.MediaPlayer={};
}
var $MP=ColdFusion.MediaPlayer;
$MP.defaultSWFLocation=_cf_ajaxscriptsrc+"/resources/cf/assets/StrobeMediaPlayback.swf",$MP.defaultOptions={swf:$MP.defaultSWFLocation,width:480,height:275,src:"",javascriptControls:true,playButtonOverlay:true,loop:false,autoPlay:false,controlBarMode:"docked",javascriptCallbackFunction:"triggerHandler"};
$MP.playerMap={};
$MP.playerWrapperMap={};
$MP.playerOptionsMap={};
$MP.jsFunctionMap={};
$MP.titleDataMap={};
$MP.videoMonitorMap={};
$MP.bindInfoMap={};
$MP.bindElements={};
$MP.baseURI;
$MP.fancyBoxLeftBorderOffset=5;
$MP.fancyBoxBottonBorderOffset=6;
$MP.hasHTML5VideoPlaybackSupport=!!document.createElement("video").canPlayType;
String.prototype.trim=function(){
return this.replace(/^\s+|\s+$/g,"");
};
ColdFusion.MediaPlayer.init=function(_280){
var _281=$MP.defaultOptions;
_281.id=_280.id;
var _282={};
var _283={};
var _284={};
var _285=null;
var _286={onStart:null,onComplete:null,onPause:null,onError:null,onLoad:null,onStartCallback:playbackStart,onPauseCallback:playbackPause};
if(_280.width!=null&&typeof (_280.width)!="undefined"){
_281.width=_280.width;
}else{
_281.width=480;
}
if(_280.height!=null&&typeof (_280.height)!="undefined"){
_281.height=_280.height;
}else{
_281.height=275;
}
if(_280.baseURI!=null){
$MP.baseURI=_280.baseURI;
}
if(_280.src!=null&&_280.src!=""){
_281.src=resolveSource(_280.src);
}else{
_281.src="";
}
if(_280.PosterImage!=null&&_280.PosterImage!=""){
_281.poster=resolveSource(_280.PosterImage);
}else{
_281.poster="";
}
if(_280.javascriptControls==null){
_281.javascriptControls=true;
}
if(_280.playButtonOverlay==null){
_281.playButtonOverlay=true;
}
if(_280.repeat!=null){
if(_280.repeat=="true"){
_281.loop=true;
}else{
_281.loop=false;
}
}else{
_281.loop=false;
}
if(_280.autoPlay!=null){
if(_280.autoPlay=="true"){
_281.autoPlay=true;
}else{
_281.autoPlay=false;
}
}else{
_281.autoPlay=false;
}
if(_280.bgcolor!=null){
_281.backgroundColor=_280.bgcolor;
_283.bgColor=_280.bgcolor;
}
if(_280.controlbar!=null){
if(_280.controlbar==false){
_281.controlBarMode="none";
}else{
_281.controlBarMode="docked";
}
}
if(_280.skin!=null){
_281.skin=resolveSource(_280.skin);
}else{
_281.skin="";
}
if(_280.onComplete!=null){
_286.onComplete=_280.onComplete;
}
if(_280.onLoad!=null){
_286.onLoad=_280.onLoad;
}
if(_280.onStart!=null){
_286.onStart=_280.onStart;
}
if(_280.onPause!=null){
_286.onPause=_280.onPause;
}
if(_280.onError!=null){
_286.onError=_280.onError;
}
if(_280.onBind!=null){
_286.onBind=_280.onBind;
}
if(_280.hideTitle!=null){
_282.hideTitle=_280.hideTitle;
}
if(_280.title!=null){
_282.title=_280.title;
}
if(_280.title_text_color!=null){
_282.title_text_color=_280.title_text_color;
}
if(_280.title_bgcolor!=null){
_282.title_bgcolor=_280.title_bgcolor;
}
if(_280.border_left!=null){
_283.border_left=_280.border_left;
}
if(_280.border_right!=null){
_283.border_right=_280.border_right;
}
if(_280.border_top!=null){
_283.border_top=_280.border_top;
}
if(_280.border_bottom!=null){
_283.border_bottom=_280.border_bottom;
}
if(_280.progress_color!=null){
_284.progress_color=_280.progress_color;
}
if(_280.progress_bgcolor!=null){
_284.progress_bgcolor=_280.progress_bgcolor;
}
if(_280.controls_color!=null){
_284.controls_color=_280.controls_color;
}
if(_280.controlbar_bgcolor!=null){
_284.controlbar_bgcolor=_280.controlbar_bgcolor;
}
if(!_281.javascriptControls){
$(".strobeMediaPlaybackControlBar,.smp-error,.playoverlay").show();
}
if(_280.bindData!=null&&_280.bindData!="undefined"){
_285=$.extend(true,{},_281);
handleBindingMediaPlayer(_285,_280.bindData,_280.type,_286);
return;
}
handleWmode(_280,_281);
playerInitialization(_281,_280.type,_286,_282,_283,_284);
};
function handleWmode(_287,_288){
if(navigator.platform.indexOf("Linux")!=-1){
_288.wmode="direct";
return;
}
if(_287.wmode!=null){
_288.wmode=_287.wmode;
}else{
_288.wmode="direct";
}
var _289=document.getElementById(_288.id+"_"+"videoTitle");
if((_289!==null&&(_287.hideTitle==null||_287.hideTitle==false))||(_288.backgroundColor!=null&&_288.backgroundColor.trim()!="")){
_288.wmode="transparent";
}
}
function isValidSourceElementExist(_28a,type){
if(_28a.src!=null&&_28a.src!=""){
if(type=="html"&&$MP.hasHTML5VideoPlaybackSupport&&isHTMLFileFormatSupported(_28a.src)){
return true;
}else{
if(type=="flash"&&isFlashSupported()&&isFlashFileFormatSupported(_28a.src)){
return true;
}
}
}
var _28c=document.getElementById(_28a.id+"_extendData");
if(_28c==null||_28c.childNodes==null||!isFlashSupported()){
return false;
}
var _28d=_28c.getElementsByTagName("source");
for(var k=0;k<_28d.length;k++){
var src=_28d[k].getAttribute("src");
if(type=="html"&&$MP.hasHTML5VideoPlaybackSupport&&isHTMLFileFormatSupported(src)){
return true;
}else{
if(type=="flash"&&isFlashSupported()&&isFlashFileFormatSupported(src)){
return true;
}
}
}
return false;
}
function hideTitle(id){
var _291=document.getElementById(id+"_"+"videoTitle");
if(_291==null){
id=id.substring(0,id.indexOf("_strobemediaplayback-video"));
_291=document.getElementById(id+"_"+"videoTitle");
}
if(_291!=null){
$("#"+id+"_"+"videoTitle").fadeOut(600,null);
}
}
function playbackStart(id){
var _293=getFuncMap(id);
if(_293.onStart!=null){
_293.onStart();
}
var _294=getWrapper(id);
if(_294!=null){
_294.playOverlay.fadeOut(600);
}
hideTitle(id);
}
function showTitle(id){
var _296=document.getElementById(id+"_"+"videoTitle");
if(_296==null){
id=id.substring(0,id.indexOf("_strobemediaplayback-video"));
_296=document.getElementById(id+"_"+"videoTitle");
}
if(_296!=null){
$("#"+id+"_"+"videoTitle").fadeIn(1,null);
}
}
function playbackPause(id){
var _298=getFuncMap(id);
if(_298.onPause!=null){
_298.onPause();
}
var _299=getWrapper(id);
if(_299!=null){
_299.playOverlay.fadeIn(600);
}
showTitle(id);
}
function playbackComplete(id){
var _29b=getFuncMap(id);
if(_29b.onComplete!=null){
_29b.onComplete();
}
var _29c=getWrapper(id);
if(_29c!=null){
_29c.playOverlay.fadeIn(600);
_29c.slider.css("left",0+"px");
_29c.currenttime.html("0:00");
}
showTitle(id);
}
function updateFlashVideoSource(_29d){
if(_29d.src!=null&&_29d.src!=""){
if(isFlashSupported()&&isFlashFileFormatSupported(_29d.src)){
return;
}
}
var _29e=document.getElementById(_29d.id+"_extendData");
if(_29e==null||_29e.childNodes==null||!isFlashSupported()){
return;
}
var _29f=_29e.getElementsByTagName("source");
for(var k=0;k<_29f.length;k++){
var src=_29f[k].getAttribute("src");
if(isFlashSupported()&&isFlashFileFormatSupported(src)){
_29d.src=resolveSource(src);
return;
}
}
return;
}
function playerInitialization(_2a2,type,_2a4,_2a5,_2a6,_2a7){
var _2a8=true;
var _2a9=isValidSourceElementExist(_2a2,"html");
var _2aa=isValidSourceElementExist(_2a2,"flash");
var _2ab=$MP.handleUserDefinedFlashParams(_2a2,type);
if(_2ab){
_2a2.favorFlashOverHtml5Video=true;
}else{
if(isFlashSupported()){
if(type==null||type=="flash"){
if(_2aa){
_2a2.favorFlashOverHtml5Video=true;
}else{
if(_2a9){
_2a2.favorFlashOverHtml5Video=false;
}else{
_2a8=false;
}
}
}else{
if(_2a9){
_2a2.favorFlashOverHtml5Video=false;
}else{
if(_2aa){
_2a2.favorFlashOverHtml5Video=true;
}else{
_2a8=false;
}
}
}
}else{
if($MP.hasHTML5VideoPlaybackSupport){
_2a2.favorFlashOverHtml5Video=false;
}else{
_2a8=false;
}
}
}
if(_2a2.favorFlashOverHtml5Video){
updateFlashVideoSource(_2a2);
}
if(!_2a8){
if($MP.hasHTML5VideoPlaybackSupport){
_2a2.favorFlashOverHtml5Video=false;
}else{
$(".playoverlay").hide();
ColdFusion.MediaPlayer.logError(_2a2.id,"The video could not be loaded");
return;
}
}
var _2ac={"tablet":{"startSize":{"width":+_2a2.width,"height":+_2a2.height},"name":_2a2.id+"_"+"strobemediaplayback-video"},"smartphone":{"startSize":{"width":+_2a2.width,"height":+_2a2.height},"name":_2a2.id+"_"+"strobemediaplayback-video"},"default":{"startSize":{"width":+_2a2.width,"height":+_2a2.height},"name":_2a2.id+"_"+"strobemediaplayback-video"}};
strobeMediaPlayback.draw(_2a2.id+"_"+"strobemediaplayback-video",_2ac,_2a2);
var _2ad=$("#"+_2a2.id+"_"+"strobemediaplayback-video");
var _2ae=$("#"+_2a2.id);
var _2af=_2ae.get(0);
var _2b0;
if(_2af==null){
_2a2.id=_2a2.id+"_strobemediaplayback-video";
$MP.playerOptionsMap[_2a2.id]=_2a2;
$MP.videoMonitorMap[_2a2.id]={paused:true,muted:false};
}else{
_2b0=$("#"+_2a2.id+"_"+"strobemediaplayback-video  .html5player").strobemediaplaybackhtml5(_2a2,_2a4);
$MP.playerMap[_2a2.id]=_2af;
$MP.playerWrapperMap[_2a2.id]=_2b0;
$MP.playerOptionsMap[_2a2.id]=_2a2;
}
$MP.jsFunctionMap[_2a2.id]=_2a4;
$MP.titleDataMap[_2a2.id]=_2a5;
if(_2af!=null&&_2af.nodeName!=null&&_2af.nodeName.toLowerCase()=="video"){
handleVolumeSlider(_2a2.id);
_2af.volume=0.6;
handlePlayoverlay(_2a2.id,_2a2.width,_2a2.height);
handleErrorElement(_2a2.id,_2a2.width,_2a2.height);
var _2b1=$MP.playerWrapperMap[_2a2.id];
_2b1.playOverlay.css("display","block");
_2ad.css("width","100%");
_2ad.css("height","100%");
handlebackgroundColor(_2a2);
handleControlsStyle(_2a2.id,_2a7);
_2b0.useHTML5=true;
var _2b2=document.getElementById(_2a2.id+"_extendData");
if(_2b2!=null){
$MP.handleUserDefinedHTML5Element(_2af,_2a2.id+"_extendData");
}else{
handleTitle(_2a2.id,_2a2.src,_2a5);
var _2b3=getFuncMap(_2a2.id);
var _2b4=document.getElementById(_2a2.id);
var _2b5=_2b4.getElementsByTagName("source");
if(_2b5!=null&&_2b5.length!=0){
_2b5[0].setAttribute("onerror","onError(event)");
}
}
}else{
handleTitle(_2a2.id,_2a2.src,_2a5);
}
handleBorderStyle(_2a2.id,_2a6);
if($MP.bindInfoMap[_2a2.id]==null){
var _2b6=document.getElementById(_2a2.id+"_extendData");
if(_2b6==null){
var id=_2a2.id.substring(0,_2a2.id.indexOf("_"));
_2b6=document.getElementById(id+"_extendData");
}
if(_2b6!=null&&_2b6.parentNode!=null){
_2b6.parentNode.removeChild(_2b6);
}
}
}
function handleVolumeChangeUI(_2b8,_2b9){
var _2ba=getWrapper(_2b8);
if(_2b9<=0){
_2ba.volumeHigh.css("background-position","0px -72px");
}else{
if(_2b9<=0.3){
_2ba.volumeHigh.css("background-position","-24px -72px");
}else{
if(_2b9<=0.7){
_2ba.volumeHigh.css("background-position","-48px -72px");
}else{
_2ba.volumeHigh.css("background-position","-72px -72px");
}
}
}
}
function handleVolumeSlider(_2bb){
var _2bc=getWrapper(_2bb);
var _2bd=_2bc.volumeSlider;
_2bd.slider({orientation:"vertical",range:"min",min:0,max:90,value:60,slide:function(_2be,ui){
var _2c0=ui.value/100;
_2bc.currentVolume=_2c0;
handleChangeVolume(_2bb,_2c0);
}});
_2bc.volumeHigh.mouseover(function(){
var _2c1=getWrapper(_2bb);
var _2c2=_2c1.volumeSlider;
_2c2.css("display","block");
_2c1.volumeContainer.css("display","block");
});
_2bc.volumeHigh.mouseout(function(_2c3){
var _2c4=getWrapper(_2bb);
var _2c5=_2c4.volumeSlider;
var _2c6=_2c4.volumeContainer;
var _2c7=_2c3.relatedTarget;
if(_2c7.className!="controls"){
_2c5.css("display","none");
_2c6.css("display","none");
}
});
_2bc.volumeHigh.click(function(_2c8){
var _2c9=getWrapper(_2bb);
if(_2c9.currentVolume==null){
_2c9.currentVolume=0.6;
}
var pos=_2bc.volumeHigh.css("background-position");
if(pos.indexOf("0px")!=0){
_2bc.volumeHigh.css("background-position","0px -72px");
_2bc.volumeSlider.slider("value",0);
handleChangeVolume(_2bb,0);
}else{
_2bc.volumeSlider.slider("value",_2c9.currentVolume*100);
if(_2c9.currentVolume<=0.1){
_2bc.volumeHigh.css("background-position","0px -72px");
}else{
if(_2c9.currentVolume<=0.3){
_2bc.volumeHigh.css("background-position","-24px -72px");
}else{
if(_2c9.currentVolume<=0.7){
_2bc.volumeHigh.css("background-position","-48px -72px");
}else{
_2bc.volumeHigh.css("background-position","-72px -72px");
}
}
}
handleChangeVolume(_2bb,_2c9.currentVolume);
}
});
_2bc.controlbar.mouseout(function(_2cb){
if(_2cb.relatedTarget==null){
return;
}
var _2cc=_2cb.relatedTarget.className;
if(_2cb.relatedTarget.className!="controls"&&_2cc!="volume-container"&&_2cc.indexOf("ui-slider")==-1){
var _2cd=getWrapper(_2bb);
var _2ce=_2cd.volumeSlider;
var _2cf=_2cd.volumeContainer;
_2ce.css("display","none");
_2cf.css("display","none");
}
});
}
function handleBindingMediaPlayer(_2d0,_2d1,type,_2d3){
var _2d4=document.getElementById(_2d0.id+"_"+"html5MediaPlayback");
if(_2d4==null){
return;
}
var _2d5=_2d4.innerHTML;
if(_2d5==null){
return;
}
var _2d6={};
_2d6.videoContent=_2d5;
_2d6.type=type;
_2d6.player_options=_2d0;
_2d6.jsfunction=_2d3;
$MP.bindInfoMap[_2d0.id]=_2d6;
var _2d7=-1;
var _2d8=0;
var _2d9=_2d1;
do{
var _2da;
_2d7=_2d1.indexOf(",",_2d8);
if(_2d7!=-1){
_2da=_2d1.substring(_2d8,_2d7);
_2d8=_2d7+1;
_2d9=_2d1.substring(_2d7+1);
}else{
_2da=_2d9;
}
var _2db=_2da;
var _2dc;
if(_2da.indexOf("@")!=-1){
_2db=_2da.substring(0,_2da.indexOf("@"));
_2dc=_2da.substring(_2da.indexOf("@")+1);
}else{
_2db=_2da;
_2dc="onClick";
}
var _2dd=document.getElementById(_2db);
if(_2dd==null){
continue;
}
handleTitle(_2d0.id,_2d0.src);
var _2de=getVideoTitle(_2d0.src);
if(_2dc==null||_2dc.toLowerCase()=="onclick"){
bindFancyBox(false,true,_2db,_2dc,_2d0,type,_2d3,_2d5,_2de);
}else{
var _2df=document.getElementById(_2db);
_2dc=_2dc.substring(2);
$("#"+_2db).live(_2dc.toLowerCase(),function(e){
bindFancyBox(true,true,_2db,_2dc,_2d0,type,_2d3,_2d5,_2de);
});
}
}while(_2d7!=-1);
var _2e1=document.getElementById(_2d0.id+"_"+"mediacontainer");
_2e1.parentNode.removeChild(_2e1);
}
function bindFancyBox(fire,_2e3,_2e4,_2e5,_2e6,type,_2e8,_2e9,_2ea){
var _2eb=document.getElementById(_2e6.id+"_"+"videoTitle");
if(_2eb==null){
_2ea="";
}else{
if(_2ea==null||_2ea==""){
_2ea="video";
}
}
if(fire){
$("#"+_2e4).fancybox({content:_2e9,overlayShow:true,overlayOpacity:0.7,width:_2e6.width+$MP.fancyBoxLeftBorderOffset,height:_2e6.height+$MP.fancyBoxBottonBorderOffset,title:_2ea,autoDimensions:false,onComplete:function(){
var _2ec=$.extend(true,{},$MP.bindInfoMap[_2e6.id].player_options);
if(_2e3&&_2e8.onBind!=null){
_2e8.onBind(_2e4,_2e5);
}
var _2ed=$MP.bindInfoMap[_2e6.id].player_options;
playerInitialization(_2ed,type,_2e8);
handleBindEvents(_2ed,$MP.bindInfoMap[_2e6.id]);
$MP.bindInfoMap[_2e6.id].player_options=$.extend(true,{},_2ec);
}}).trigger("click");
}else{
$("#"+_2e4).fancybox({content:_2e9,overlayShow:true,overlayOpacity:0.7,width:_2e6.width+$MP.fancyBoxLeftBorderOffset,height:_2e6.height+$MP.fancyBoxBottonBorderOffset,title:_2ea,autoDimensions:false,onComplete:function(){
var _2ee=$.extend(true,{},$MP.bindInfoMap[_2e6.id].player_options);
if(_2e3&&_2e8.onBind!=null){
_2e8.onBind(_2e4,_2e5);
}
var _2ef=$MP.bindInfoMap[_2e6.id].player_options;
playerInitialization(_2ef,type,_2e8);
handleBindEvents(_2ef,$MP.bindInfoMap[_2e6.id]);
$MP.bindInfoMap[_2e6.id].player_options=$.extend(true,{},_2ee);
}});
}
}
function handleBindEvents(_2f0,_2f1){
var _2f2=$MP.getPlayer(_2f0.id);
if(_2f1.mute!=null){
_2f2.muted=mute;
}
if(_2f1.volume!=null){
handleChangeVolume(_2f0.id,_2f1.volume);
}
if(_2f1.startPlay!=null){
_2f2.start();
}
if(_2f1.stopPlay!=null){
_2f2.pause();
}
}
function updateVideoType(_2f3){
var _2f4=_2f3.childNodes;
if(_2f4==null){
return;
}
var _2f5=_2f3.getElementsByTagName("source");
if(_2f5==null||_2f5.length===0){
return;
}
var _2f6=_2f5[0].getAttribute("src");
if(_2f6==null){
return;
}
var type=_2f5[0].getAttribute("type");
if(type!=null){
return;
}
if(_2f6.lastIndexOf(".")==-1){
return;
}
var _2f8=_2f6.substring(_2f6.lastIndexOf(".")+1);
_2f8=_2f8.toLowerCase();
if(_2f8=="mp4"){
_2f5[0].setAttribute("type","video/mp4");
}else{
if(_2f8=="ogv"){
_2f5[0].setAttribute("type","video/ogg");
}else{
if(_2f8=="webm"){
_2f5[0].setAttribute("type","video/webm");
}
}
}
}
$MP.handleUserDefinedHTML5Element=function(_2f9,_2fa){
var _2fb=document.getElementById(_2fa);
var _2fc=_2fb.childNodes;
var _2fd=false;
updateVideoType(_2f9);
if(_2fc!=null){
var _2fe=null;
for(var k=0;k<_2fc.length;k++){
var _300=_2fc[k];
if(_300.tagName!=null&&_300.tagName.toLowerCase()=="video"){
_2fe=_300;
break;
}
}
if(_2fe==null){
return;
}
_2fc=_2fe.childNodes;
var _301=null;
var _302;
for(var i=0;i<_2fc.length;i++){
var _300=_2fc[i];
if(_300.tagName!=null&&_300.tagName.toLowerCase()=="track"){
_2f9.appendChild(_300);
}else{
if(_300.tagName!=null&&_300.tagName.toLowerCase()=="source"){
if(!_2fd){
var _304=_2f9.getAttribute("src");
if(_304==null){
var _305=_2f9.childNodes;
if(_305!=null){
for(var l=0;l<_305.length;l++){
if(_305[l].tagName.toLowerCase()=="source"){
var src=_305[l].getAttribute("src");
if(src!=null&&src.trim()!=0&&isHTMLFileFormatSupported(src)){
_301=src;
break;
}
}
}
}
}
if(_304!=null&&_304!=""&&_304.lastIndexOf(".")!=-1){
var _308=document.createElement("source");
_308.setAttribute("src",_304);
var _309=_304.substring(_304.lastIndexOf(".")+1);
if(_309=="mp4"){
_308.setAttribute("type","video/mp4");
}else{
if(_309=="ogv"){
_308.setAttribute("type","video/ogg");
}else{
if(_309=="webm"){
_308.setAttribute("type","video/webm");
}
}
}
_2f9.appendChild(_308);
}
if(_301==null&&isHTMLFileFormatSupported(_304)){
_301=_304;
}
_2f9.removeAttribute("src");
}
var src=_300.getAttribute("src");
src=resolveSource(src);
_300.setAttribute("src",src);
_2f9.appendChild(_300);
_2fd=true;
_302=_300;
if(_301==null&&isHTMLFileFormatSupported(src)){
_301=src;
}
}
}
}
if(_301!=null){
handleTitle(_2f9.id,_301);
}
if(_302!=null){
_302.setAttribute("onerror","onError(event)");
}
}
_2f9.load();
};
$MP.handleUserDefinedFlashParams=function(_30a,type){
var _30c=document.getElementById(_30a.id+"_extendData");
if(_30c==null||_30c.childNodes==null||!isFlashSupported()){
return;
}
var _30d=_30c.childNodes;
var _30e=false;
if(_30d!=null){
var _30f=null;
for(var k=0;k<_30d.length;k++){
var _311=_30d[k];
if(_311.tagName!=null&&(_311.tagName.toLowerCase()=="object"||_311.tagName.toLowerCase()=="video")){
_30f=_311;
var _312=_30f.childNodes;
for(var i=0;i<_312.length;i++){
var _311=_312[i];
if(_311.tagName!=null&&_311.tagName.toLowerCase()=="param"){
_30e=true;
var _314=_311.getAttribute("name");
if(_314=="flashvars"){
var _315=_311.getAttribute("value");
var _316=0;
var _317=_315;
do{
var _318=_317.indexOf("&");
var _319;
if(_318>0){
_319=_317.substring(_316,_318);
}else{
_319=_317;
}
if(_319.indexOf("=")>0){
var _31a=_319.substring(0,_319.indexOf("="));
var _31b=_319.substring(_319.indexOf("=")+1);
if(_31a!=""||_31b!=""){
_30a[_31a]=resolveSource(_31b);
}
}
_316=_318+1;
_317=_317.substring(_316);
}while(_318>0);
}
}
}
}
}
return _30e;
}
};
function isFlashSupported(){
return swfobject.hasFlashPlayerVersion("1");
}
function isFlashFileFormatSupported(_31c){
if(_31c.indexOf("rtmp")==0){
return true;
}
var _31d=["flv","f4v","f4m","m3u","mp4","swf","mpeg-4","m4v","f4f","3gpp","mp3","3gpp2","pbg","gif","jpg","jpeg","aac","speex","nellymoser","QuickTime"];
var _31e=_31c.lastIndexOf(".");
var _31f=_31c.substring(_31e+1,_31c.length);
_31f=_31f.toLowerCase();
for(var i=0;i<_31d.length;i++){
if(_31d[i]==_31f){
return true;
}
}
return false;
}
function isHTMLFileFormatSupported(_321){
if(_321==null){
return false;
}
var _322=["webm","mp4","ogv"];
var _323=_321.lastIndexOf(".");
var _324=_321.substring(_323+1,_321.length);
_324=_324.toLowerCase();
var elem=document.createElement("video");
var ogg=elem.canPlayType("video/ogg; codecs=\"theora\"");
var h264="video/mp4; codecs=\"avc1.42E01E";
var mp4=elem.canPlayType(h264+"\"")||elem.canPlayType(h264+", mp4a.40.2\"");
var webm=elem.canPlayType("video/webm; codecs=\"vp8, vorbis\"");
for(var i=0;i<_322.length;i++){
if(_322[i]==_324){
if(_324=="ogv"){
return ogg;
}else{
if(_324=="webm"){
return webm;
}else{
if(_324=="mp4"){
return mp4;
}
}
}
}
}
return false;
}
function getWrapper(name){
var _32c=$MP.playerWrapperMap[name];
if(_32c==null||typeof (_32c)=="undefined"){
return $MP.playerWrapperMap[name+"_strobemediaplayback-video"];
}
return _32c;
}
function getFuncMap(name){
var _32e=$MP.jsFunctionMap[name];
if(_32e==null||typeof (_32e)=="undefined"){
return $MP.jsFunctionMap[name+"_strobemediaplayback-video"];
}
return _32e;
}
ColdFusion.MediaPlayer.setMute=function(name,mute){
if($MP.bindInfoMap[name]!=null){
var _331=getBindInfo(name);
if(_331==null){
return;
}
_331.mute=mute;
return;
}
var _332=$MP.getPlayer(name);
var _333=$MP.getType(name);
var _334=getWrapper(name);
if(_333=="html"){
_332.muted=mute;
if(mute){
_334.volumeHigh.css("background-position","0px -72px");
_334.volumeSlider.slider("value",0);
}else{
handleChangeVolume(name,_332.volume);
}
}else{
if(_333=="flash"){
_332.setMuted(mute);
}
}
};
function resolveSource(src){
if(src==null){
return null;
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _336="";
var _337=document.location.href;
if(_337||_337.indexOf("/")>-1){
_336=_337.substring(0,_337.lastIndexOf("/")+1);
}
var _338=_336+src;
var _339=_338.split("/");
var _33a=new Array();
var _33b=0;
for(var i=0;i<_339.length;i++){
if(_339[i]==".."){
_33a[--_33b]="";
}else{
_33a[_33b++]=_339[i];
}
}
src=_33a[0];
for(var i=1;i<_33b;i++){
src=src+"/"+_33a[i];
}
}
if(src.indexOf("/")==0){
src=$MP.baseURI+src;
}
return src;
}
ColdFusion.MediaPlayer.getPlayer=function(name){
var _33e=$MP.playerMap[name];
if(_33e==null||typeof (_33e)=="undefined"){
_33e=$MP.playerMap[name+"_strobemediaplayback-video"];
if(_33e==null||typeof (_33e)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.getplayer.notfound","widget",[name],null,null,true);
}
}
return _33e;
};
ColdFusion.MediaPlayer.setTitle=function(name,_340){
if(_340==null){
ColdFusion.handleError(null,"mediaplayer.settitle.invalidtitle","widget",[name],null,null,true);
}
var _341=$MP.titleDataMap[name];
if(_341==null){
_341={};
$MP.titleDataMap[name]=_341;
}
var _342=document.getElementById(name+"_videoTitle");
if(_342==null){
var _343="<div id=\""+name+"_videoTitle\">";
$("#"+name+"_videoContainer").prepend(_343);
}
_341.hideTitle=false;
_341.title=_340;
handleTitle(name,_340,_341);
};
ColdFusion.MediaPlayer.setSource=function(name,src){
if(src==null||src=="undefined"){
ColdFusion.handleError(null,"mediaplayer.setsource.invalidsource","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _346=getBindInfo(name);
if(_346==null){
return;
}
_346.player_options.src=resolveSource(src);
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_346.player_options.favorFlashOverHtml5Video=true;
}else{
_346.player_options.favorFlashOverHtml5Video=false;
}
_346.videoTitle=getVideoTitle(src);
return;
}
var _347=$MP.getPlayer(name);
var _348=$MP.getType(name);
src=resolveSource(src);
var _349=getWrapper(name);
var _34a,jsFunctionMap;
if(_349!=null&&_349.errorwindow!=null){
_349.errorwindow.html("");
_349.errorwindow.hide();
_34a=$MP.playerOptionsMap[_349.options.id];
}else{
_34a=$MP.playerOptionsMap[name+"_"+"strobemediaplayback-video"];
jsFunctionMap=$MP.jsFunctionMap[name+"_"+"strobemediaplayback-video"];
}
if(_34a==null){
_34a=$MP.defaultOptions;
}
var _34b={"tablet":{"name":_34a.id+"_"+"strobemediaplayback-video"},"smartphone":{"startSize":{"width":360,"height":200},"name":_34a.id+"_"+"strobemediaplayback-video"},"default":{"startSize":{"width":+_34a.width,"height":+_34a.height},"name":_34a.id+"_"+"strobemediaplayback-video"}};
if(_348=="html"){
if(isHTMLFileFormatSupported(src)){
_347.src=src;
_347.load();
_347.pause();
_349.playOverlay.fadeIn(600);
_349.playtoggle.removeClass("paused");
_349.slider.css({"left":"0%"});
_349.playedbar.css({"width":"0%"});
_349.currenttime.html("0:00");
_349.duration.html("0:00");
var css={"left":"0%","width":"0%"};
_349.bufferbar.removeClass("done");
_349.bufferbar.css(css);
var _34d=$MP.titleDataMap[_34a.id];
handleTitle(name,src,_34d);
}else{
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_34a.isHTML5=false;
_34a.favorFlashOverHtml5Video=true;
_34a.src=src;
var _34d=$MP.titleDataMap[_34a.id];
if(_34d.hideTitle!=null&&!_34d.hideTitle){
_34a.wmode="opaque";
}
strobeMediaPlayback.draw(_34a.id+"_"+"strobemediaplayback-video",_34b,_34a);
var _34e=$("#"+_34a.id+"_"+"strobemediaplayback-video");
var _34f=_34e.find("video");
var _350=_34f.get(0);
var _351=$("#"+_34a.id+"_"+"strobemediaplayback-video  .html5player").strobemediaplaybackhtml5(_34a,_349.jsCallbackFunctions);
$MP.playerMap[_34a.id]=_350;
$MP.playerWrapperMap[_34a.id]=_351;
handleTitle(_34a.id,_34a.src,_34d);
}
}
}else{
if(_348=="flash"){
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_347.setMediaResourceURL(src);
handleTitle(name,src,$MP.titleDataMap[id]);
}else{
if(isHTMLFileFormatSupported(src)){
var id=_34a.id+"_strobemediaplayback-video";
$("#"+id).replaceWith("<div  id=\""+id+"\"></div>");
$("#"+id).css("visibility","visible");
_34a.isHTML5=true;
_34a.favorFlashOverHtml5Video=false;
_34a.src=src;
strobeMediaPlayback.draw(id,_34b,_34a);
var _34e=$("#"+id);
var _34f=_34e.find("video");
var _350=_34f.get(0);
if(_350==null){
return;
}
var _353=getFuncMap(id);
var _351=$("#"+id+"  .html5player").strobemediaplaybackhtml5(_34a,_353);
$MP.playerMap[_34a.id]=_350;
$MP.playerWrapperMap[_34a.id]=_351;
handlePlayoverlay(_34a.id,_34a.width,_34a.height);
handleErrorElement(_34a.id,_34a.width,_34a.height);
_351.playOverlay.css("display","block");
handleTitle(_34a.id,_34a.src,$MP.titleDataMap[id]);
_350.load();
if(_34a.autoPlay==false){
_350.pause();
}
}
}
}
}
};
function getBindInfo(name){
var _355=$MP.bindInfoMap[name];
if(_355!=null){
return _355;
}
return;
}
function handleBindElements(_356){
if(_356!=null){
if(_356.bindEvent==null||_356.bindEvent.toLowerCase()=="onclick"){
bindFancyBox(false,false,_356.bindElement,_356.player_options,_356.type,_356.jsFuncc,_356.videoContent,_356.videoTitle);
}else{
var _357=document.getElementById(_356.bindElement);
var _358=_356.bindEvent.substring(2);
$("#"+_356.bindElement).live(_358.toLowerCase(),function(e){
bindFancyBox(true,false,_356.bindElement,_356.player_options,_356.type,_356.jsFuncc,_356.videoContent,_356.videoTitle);
});
}
}
}
function handleChangeVolume(name,_35b){
var _35c=$MP.getPlayer(name);
var _35d=$MP.getType(name);
if(_35d=="html"){
if(_35c.muted){
_35c.muted=false;
}
_35c.volume=_35b;
var _35e=getWrapper(name);
var _35f=_35e.volumeSlider;
_35f.slider("value",_35b*100);
handleVolumeChangeUI(name,_35b);
}else{
if(_35d=="flash"){
_35c.setVolume(_35b);
}
}
}
ColdFusion.MediaPlayer.setVolume=function(name,_361){
if(_361<=0){
ColdFusion.handleError(null,"mediaplayer.setvolume.invalidvalue","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _362=getBindInfo(name);
if(_362==null){
return;
}
_362.volume=_361;
return;
}
handleChangeVolume(name,_361);
};
ColdFusion.MediaPlayer.resize=function(name,_364,_365){
if(_364<=0||_365<=0){
ColdFusion.handleError(null,"mediaplayer.resize.invalidvalue","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _366=getBindInfo(name);
if(_366==null){
return;
}
_366.player_options.width=_364;
_366.player_options.height=_365;
return;
}
var _367=false;
var _368=$MP.getPlayer(name);
var _369=$MP.getType(name);
var _36a=getWrapper(name);
_368.width=_364;
_368.height=_365;
if(_36a!=null){
_36a.options.width=_364;
_36a.options.height=_365;
_36a.controlbar.css("width",_364-1.5);
if(_36a.options.width>180){
_36a.progressbar.css("width",_364-180);
_36a.trackswidth=_364-180;
}else{
_36a.progressbar.css("width","50%");
_36a.trackswidth="50%";
}
handlePlayoverlay(name,_364,_365);
handleErrorElement(name,_364,_365);
}
$("#"+name+"_"+"videoContainer").css("width",_364);
$("#"+name+"_"+"videoContainer").css("height",_365);
if(_368.paused==false){
_36a.playOverlay.hide();
}
};
ColdFusion.MediaPlayer.getType=function(name){
var elem=document.getElementById(name);
if(elem==null||elem=="undefined"){
elem=document.getElementById(name+"_strobemediaplayback-video");
if(elem==null||typeof (elem)=="undefined"){
return "unknown";
}
}
var type=elem.nodeName;
if(type==null){
return "unknown";
}
type=type.toLowerCase();
if(type=="video"){
return "html";
}else{
if(type=="object"){
return "flash";
}else{
return "unknown";
}
}
};
ColdFusion.MediaPlayer.startPlay=function(name){
if($MP.bindInfoMap[name]!=null){
var _36f=getBindInfo(name);
if(_36f==null){
return;
}
_36f.startPlay=true;
return;
}
var _370=$MP.getPlayer(name);
var _371=$MP.getType(name);
if(_371=="html"){
_370.play();
}else{
if(_371=="flash"){
_370.play2();
}
}
};
ColdFusion.MediaPlayer.stopPlay=function(name){
if($MP.bindInfoMap[name]!=null){
var _373=getBindInfo(name);
if(_373==null){
return;
}
_373.stopPlay=true;
return;
}
var _374=$MP.getPlayer(name);
_374.pause();
};
ColdFusion.MediaPlayer.logError=function(name,_376){
if(name==null||_376==null){
return;
}
var _377=$MP.playerWrapperMap[name];
if(_377==null){
_377=$MP.playerWrapperMap[name+"_strobemediaplayback-video"];
if(_377==null){
return;
}
}
_377.errorwindow.html(_376);
_377.errorwindow.show();
_377.playOverlay.hide();
};
function handlePlayoverlay(name,_379,_37a){
if(!isDesktop){
return;
}
var _37b=getWrapper(name);
_37b.playOverlay.css("left","");
_37b.playOverlay.css("top","");
_37b.playOverlay.css("left",(_379-116)/2+"px");
_37b.playOverlay.css("top",(_37a-107)/2+"px");
}
function handleErrorElement(name,_37d,_37e){
var _37f=getWrapper(name);
_37f.playOverlay.css("display","none");
_37f.errorwindow.css("left","");
_37f.errorwindow.css("top","");
_37f.errorwindow.css("display","none");
var _380=_37f.controlbar;
var _381=0;
if(_380!=null){
_381=_380.css("height");
if(_381!=null&&_381.indexOf("px")!=-1){
_381=_381.substring(0,_381.indexOf("px"));
}else{
_381=0;
}
}
_37f.errorwindow.css("margin-top",_37e/2-_381+"px");
}
function handleTitleResize(id,_383,_384){
$("#"+id+"_videoTitle").css("width","");
$("#"+id+"_videoTitle").css("width",_383+"px");
}
function handleTitle(_385,_386,_387){
var _388=document.getElementById(_385+"_"+"videoTitle");
if(_388==null){
_385=_385.substring(0,_385.indexOf("_strobemediaplayback-video"));
_388=document.getElementById(_385+"_"+"videoTitle");
}
var _389=document.getElementById("fancybox-title-float-main");
if(_388!=null){
if(_387==null){
_387=$MP.titleDataMap[_385];
if(_387==null||_387.hideTitle){
var _38a=_388.parentNode;
_38a.removeChild(_388);
return;
}
}else{
if(_387.hideTitle){
var _38a=_388.parentNode;
_38a.removeChild(_388);
return;
}
}
var _38b=_387.title;
if(_387==null||_387.title==null||_387.title.trim()==""){
_38b=getVideoTitle(_386);
}
if(_38b!=""){
_388.innerHTML=_38b;
}else{
return;
}
$("#"+_385+"_"+"videoTitle").css("position","absolute");
$("#"+_385+"_"+"videoTitle").css("z-index",2);
if(_387==null||_387.title_text_color==null){
$("#"+_385+"_"+"videoTitle").css("color","white");
}else{
$("#"+_385+"_"+"videoTitle").css("color",_387.title_text_color);
}
if(_387!=null&&_387.title_bgcolor!=null){
$("#"+_385+"_"+"videoTitle").css("background-color",_387.title_bgcolor);
}
$("#"+_385+"_"+"videoTitle").css("font-weight","bold");
$("#"+_385+"_"+"videoTitle").css("font-family","Arial,Helvetica,sans-serif");
$("#"+_385+"_"+"videoTitle").css("font-size","13px");
$("#"+_385+"_"+"videoTitle").css("word-wrap","break-word");
if(_388.style.backgroundColor==null||_388.style.backgroundColor==""){
$("#"+_385+"_"+"videoTitle").css("margin-left","5px");
}
$("#"+_385+"_"+"videoTitle").show();
$("#"+_385+"_"+"strobemediaplayback").css("z-index",1);
}else{
if(_389!=null&&_386!=null){
$("#fancybox-title-float-main").text(_386);
}
}
}
function getVideoTitle(_38c){
var _38d=null;
if(_38c!=null&&_38c!=""){
var _38e=_38c.lastIndexOf("/");
if(_38e==-1){
_38e=_38c.lastIndexOf("\\");
}
if(_38e==-1){
_38d=_38c;
}
if(_38d==null){
_38d=_38c.substring(_38e+1,_38c.length);
}
}
if(_38d==null||_38d.indexOf(".")<0){
return _38c;
}else{
return _38d;
}
}
function handlebackgroundColor(_38f){
if(_38f.backgroundColor==null){
return;
}
var _390=document.getElementById(_38f.id);
if(_390==null){
return;
}
_390.setAttribute("style","background-color:"+_38f.backgroundColor+";");
}
function handleBorderStyle(_391,_392){
if(_392.hideBorder){
return;
}
var _393="#fff";
if(_392.bgColor){
_393=_392.bgColor;
}
var _394=document.getElementById(_391+"_"+"videoContainer");
if(_394==null){
_391=_391.substring(0,_391.indexOf("_"));
}
if(_392.border_left!=null){
$("#"+_391+"_"+"videoContainer").css("border-left",_392.border_left+"px"+" solid "+_393);
}
if(_392.border_right!=null){
$("#"+_391+"_"+"videoContainer").css("border-right",_392.border_right+"px"+" solid "+_393);
}
if(_392.border_top!=null){
$("#"+_391+"_"+"videoContainer").css("border-top",_392.border_top+"px"+" solid "+_393);
}
if(_392.border_bottom!=null){
$("#"+_391+"_"+"videoContainer").css("border-bottom",_392.border_bottom+"px"+" solid "+_393);
}
}
function handleControlsStyle(_395,_396){
var _397=getWrapper(_395);
if(_396.controlbar_bgcolor!=null){
_397.controlbar.css("background-color",_396.controlbar_bgcolor);
}
if(_396.controls_color!=null){
_397.playtoggle.css("background-color",_396.controls_color);
_397.slider.css("background-color",_396.controls_color);
_397.fullview.css("background-color",_396.controls_color);
_397.currenttime.css("color",_396.controls_color);
_397.duration.css("color",_396.controls_color);
_397.seekbar.css("background-color",_396.controls_color);
_397.volumeHigh.css("background-color",_396.controls_color);
}
if(_396.progress_bgcolor!=null){
_397.bufferbar.css("background-color",_396.progress_bgcolor);
}
if(_396.progress_color!=null){
_397.playedbar.css("background-color",_396.progress_color);
}
}
function triggerHandler(id,_399,_39a){
if(_399=="onJavaScriptBridgeCreated"){
return;
}else{
if(_399=="play"){
var _39b=getFuncMap(id);
var _39c=$MP.videoMonitorMap[id];
if(_39b.onStartCallback!=null&&_39c.paused){
_39b.onStartCallback(id);
_39c.paused=false;
}
hideTitle(id);
}else{
if(_399=="pause"){
var _39b=getFuncMap(id);
var _39c=$MP.videoMonitorMap[id];
if(_39b.onPauseCallback!=null&&!_39c.paused){
_39b.onPauseCallback(id);
_39c.paused=true;
}
showTitle(id);
}else{
if(_399=="complete"){
var _39b=getFuncMap(id);
if(_39b.onComplete!=null){
_39b.onComplete();
}
var _39c=$MP.videoMonitorMap[id];
_39c.paused=true;
showTitle(id);
}else{
if(_399=="loadedmetadata"){
var _39b=getFuncMap(id);
if(_39b.onLoad!=null){
_39b.onLoad();
}
}else{
if(_399=="error"){
var _39b=getFuncMap(id);
if(_39b.onError!=null){
_39b.onError();
}
}else{
if(_399=="volumechange"){
var _39c=$MP.videoMonitorMap[id];
_39c.muted=_39a.muted;
}
}
}
}
}
}
}
}
function onError(_39d){
var _39e;
var _39f;
var _3a0;
var _3a1;
if(_39d.target!=null&&_39d.target.tagName.toLowerCase()=="video"){
_3a0=getFuncMap(_39d.target.id);
if(_39d.target.error!=null){
_39f=_39d.target.error.code;
}
_3a1=getWrapper(_39d.target.id);
}else{
if(_39d.target!=null&&_39d.target.tagName.toLowerCase()=="source"){
var _3a2=_39d.target.getAttribute("src");
var _3a3=_39d.target.getAttribute("onerror");
if(_3a2!=null&&_3a3!=null){
_39f=4;
}else{
return;
}
}
var _3a4=_39d.target.parentNode;
_3a0=getFuncMap(_3a4.id);
_3a1=getWrapper(_3a4.id);
}
if(_39f==null){
return;
}
if(_3a0.onError!=null){
_3a0.onError(_39f);
return;
}
switch(_39f){
case 1:
_39e="You aborted the video playback.";
break;
case 2:
_39e="A network error caused the video download to fail part-way.";
break;
case 3:
_39e="The video playback was aborted due to a corruption problem or because the video used features your browser did not support.";
break;
case 4:
_39e="The video could not be loaded, either because the server or network failed or because the format is not supported.";
break;
default:
_39e="An unknown error occurred.";
break;
}
_3a1.playOverlay.css("display","none");
_3a1.errorwindow.html(_39e);
_3a1.errorwindow.show();
}
function onFlashEmbedComplete(_3a5){
var _3a6=$("#"+_3a5.id);
var _3a7=_3a6.get(0);
$MP.playerMap[_3a5.id]=_3a7;
}
function removejscssfile(_3a8,_3a9){
var _3aa=(_3a9=="js")?"script":(_3a9=="css")?"link":"none";
var _3ab=(_3a9=="js")?"src":(_3a9=="css")?"href":"none";
var _3ac=document.getElementsByTagName(_3aa);
for(var i=_3ac.length;i>=0;i--){
if(_3ac[i]&&_3ac[i].getAttribute(_3ab)!=null&&_3ac[i].getAttribute(_3ab).indexOf(_3a8)!=-1){
_3ac[i].parentNode.removeChild(_3ac[i]);
}
}
}
