/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Window){
ColdFusion.Window={};
}
ColdFusion.Window.windowIdCounter=1;
ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE="WINDOW_DIV_ID .x-window-tc , WINDOW_DIV_ID .x-window-tl, WINDOW_DIV_ID .x-window-tr, WINDOW_DIV_ID .x-window-bc, WINDOW_DIV_ID .x-window-br, WINDOW_DIV_ID"+" .x-window-bl, WINDOW_DIV_ID  .x-window-ml, WINDOW_DIV_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
ColdFusion.Window.create=function(_78f,_790,url,_792){
if(_78f==null){
ColdFusion.handleError(null,"window.create.nullname","widget",null,null,null,true);
return;
}
if(_78f==""){
ColdFusion.handleError(null,"window.create.emptyname","widget",null,null,null,true);
return;
}
var _793=ColdFusion.objectCache[_78f];
var _794=false;
if(typeof (_793)!="undefined"&&_793!=null){
if(_793.callfromtag){
ColdFusion.handleError(null,"window.create.duplicatename","widget",[_78f]);
}
if(typeof (_793.isConfObj)!="undefined"&&_793.isConfObj==true){
_794=true;
if(_792!=null&&typeof (_792.initshow)!="undefined"){
if(_792.initshow==false){
return;
}
}
}else{
if(!_792||(_792&&_792.initshow!==false)){
ColdFusion.Window.show(_78f);
}
return;
}
}
if(!_793){
ColdFusion.Log.info("window.create.creating","widget",[_78f]);
}
var _795=ColdFusion.Window.createHTML(_78f,_790,url,_792,_794);
var _796=ColdFusion.objectCache[_78f];
if(_796!=null&&typeof (_796.isConfObj)!="undefined"&&_796.isConfObj==true){
return;
}
return ColdFusion.Window.createJSObj(_78f,url,_795);
};
ColdFusion.Window.createHTML=function(_797,_798,url,_79a,_79b){
var _79c=null;
var _79d=null;
if(_79a&&_79a.divid){
_79c=document.getElementById(_79a.divid);
}
if(_79c==null){
_79c=document.createElement("div");
_79d="cf_window"+ColdFusion.Window.windowIdCounter;
ColdFusion.Window.windowIdCounter++;
_79c.id=_79d;
_79c.className="x-hidden";
}
var _79e=false;
var _79f=null;
if(_79a!=null&&typeof (_79a.headerstyle)!="undefined"&&_79a.headerstyle!=null){
var _7a0=new String(_79a.headerstyle);
_7a0=_7a0.toLowerCase();
var _7a1=_7a0.indexOf("background-color");
if(_7a1>=0){
_79e=true;
var _7a2=_7a0.indexOf(";",_7a1+17);
if(_7a2<0){
_7a2=_7a0.length;
}
_79f=_7a0.substring(_7a1+17,_7a2);
}
}
var _7a3=document.getElementById(_797+"_title-html");
if(_79e==true&&_79f){
var _7a4="#"+_79a.divid;
var _7a5="NAME_ID .x-window-tc , NAME_ID .x-window-tl, NAME_ID .x-window-tr, NAME_ID .x-window-bc, NAME_ID .x-window-br, NAME_ID .x-window-bl,NAME_ID .x-window-ml, NAME_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
var _7a6=ColdFusion.Util.replaceAll(ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE,"WINDOW_DIV_ID",_7a4);
var _7a6=ColdFusion.Util.replaceAll(_7a6,"COLOR_ID",_79f);
Ext.util.CSS.createStyleSheet(_7a6);
}
if(_7a3==null){
_7a3=document.createElement("div");
_7a3.id=_797+"_title-html";
var _7a7="x-window-header";
_7a3.className=_7a7;
if(_798){
_7a3.innerHTML=_798;
}else{
_7a3.innerHTML="&nbsp;";
}
}
var _7a8=document.getElementById(_797+"-body");
if(_7a8==null){
_7a8=document.createElement("div");
_7a8.id=_797+"-body";
_79c.appendChild(_7a8);
}
var _7a9;
_7a9=ColdFusion.Window.getUpdatedConfigObj(_79a,_797);
if(_79a){
_7a9.header={style:_79a.headerstyle};
}
if(typeof (_7a9)=="undefined"){
_79c.innerHTML="";
return;
}
if(_79d){
_7a9.divid=_79d;
}
_7a9.title=_798;
if(typeof (_7a9.initshow)!="undefined"&&_7a9.initshow===false){
_7a9.url=url;
ColdFusion.objectCache[_797]=_7a9;
ColdFusion.objectCache[_797+"-body"]=_7a9;
}
_7a9.items=[{html:_79c.innerHTML}];
return _7a9;
};
ColdFusion.Window.createJSObj=function(_7aa,url,_7ac){
var _7ad;
var _7ae=false;
if(typeof (_7ac.childlayoutid)&&_7ac.childlayoutid!=null){
_7ae=true;
_7ac.layout="border";
_7ac.items=ColdFusion.objectCache[_7ac.childlayoutid];
}else{
var elem=document.getElementById(_7aa+"-body");
if(elem){
elem.parentNode.removeChild(elem);
}
_7ac.layout="fit";
}
if(typeof (_7ac.autoScroll)=="undefined"){
_7ac.autoScroll=true;
}
if(_7ac.onShow){
_7ac._cf_onShow=_7ac.onShow;
_7ac.onShow=null;
}
if(_7ac.onHide){
_7ac._cf_onHide=_7ac.onHide;
_7ac.onHide=null;
}
_7ad=new Ext.Window(_7ac);
_7ad.show();
_7ad.hide();
_7ad.cfwindowname=_7aa;
_7ad.tempx=_7ac.tempx;
_7ad.tempy=_7ac.tempy;
_7ad.divid=_7ac.divid;
if(typeof (_7ac.headerstyle)!="undefined"&&_7ac.headerstyle!=null){
var _7b0=document.getElementById(_7aa+"_title");
if(_7b0!=null){
_7b0.style.cssText="background:none;"+_7ac.headerstyle;
}
}
if(typeof (_7ac.bodystyle)!="undefined"&&_7ac.bodystyle!=null){
var _7b1=document.getElementById(_7aa+"-body");
if(_7b1){
var _7b2=_7b1.parentNode;
}
if(_7b2!=null){
_7b2.style.cssText=_7ac.bodystyle;
}
}
_7ad.isConfObj=false;
_7ad._cf_body=_7aa+"-body";
ColdFusion.objectCache[_7aa]=_7ad;
if(_7ae){
var _7b3=_7ad.getLayout();
var _7b4=ColdFusion.objectCache[_7ac.childlayoutid];
}
_7ad.addListener("beforeclose",ColdFusion.Window.beforeCloseHandler);
var _7b5=null;
if(typeof (url)!="undefined"&&url!=""){
_7b5=url;
}
if(_7b5==null){
if(typeof (_7ac.initshow)=="undefined"||_7ac.initshow==true){
_7ad.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
ColdFusion.Window.showandhide(_7ad,_7ac);
}
return;
}
ColdFusion.objectCache[_7aa+"-body"]=_7ad;
if(typeof (_7ac.callfromtag)=="undefined"){
var _7b6;
var _7b7;
_7ad._cf_visible=false;
_7ad._cf_dirtyview=true;
_7ad.addListener("show",ColdFusion.Window.showHandler);
_7ad.addListener("hide",ColdFusion.Window.hideHandler);
_7ad.url=_7b5;
if(_7ac){
if(typeof (_7ac.initshow)=="undefined"||_7ac.initshow==true){
ColdFusion.Window.showandhide(_7ad,_7ac);
}
_7b6=_7ac.callbackHandler;
_7b7=_7ac.errorHandler;
}
}else{
_7ad.callfromtag=true;
_7ad._cf_visible=false;
_7ad._cf_dirtyview=true;
_7ad.addListener("show",ColdFusion.Window.showHandler);
_7ad.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
_7ad.addListener("hide",ColdFusion.Window.hideHandler);
if(typeof (_7ac.initshow)=="undefined"||_7ac.initshow==true){
ColdFusion.Window.showandhide(_7ad,_7ac);
}
}
};
ColdFusion.Window.showandhide=function(_7b8,_7b9){
if(typeof (_7b9.tempinitshow)!="undefined"&&_7b9.tempinitshow==false){
var _7ba=Ext.Element.get(_7b8.divid);
if(typeof _7ba!="undefined"){
_7ba.show();
}
_7ba.hide();
}else{
_7b8.show();
}
};
ColdFusion.Window.destroy=function(_7bb,_7bc){
if(_7bb){
var _7bd=ColdFusion.Window.getWindowObject(_7bb);
if(_7bd){
if(_7bc===true){
_7bd.destroy(true);
}else{
_7bd.destroy();
}
ColdFusion.objectCache[_7bb]=null;
}
}
};
ColdFusion.Window.resizeHandler=function(_7be,_7bf,_7c0){
if(typeof (_7be.fixedcenter)!="undefined"&&_7be.fixedcenter==true){
_7be.center();
}
};
ColdFusion.Window.beforeShowHandler=function(_7c1){
if(typeof (_7c1.fixedcenter)!="undefined"&&_7c1.fixedcenter==true){
_7c1.center();
}
};
ColdFusion.Window.beforeCloseHandler=function(_7c2){
if(_7c2.destroyonclose!="undefined"&&_7c2.destroyonclose==true){
ColdFusion.objectCache[_7c2.cfwindowname]=null;
return true;
}else{
_7c2.hide();
return false;
}
};
ColdFusion.Window.showHandler=function(_7c3){
_7c3._cf_visible=true;
if(_7c3._cf_dirtyview){
if(typeof (_7c3.callfromtag)=="undefined"){
ColdFusion.Ajax.replaceHTML(_7c3._cf_body,_7c3.url,"GET",null,_7c3.callbackHandler,_7c3.errorHandler);
}else{
var _7c4=ColdFusion.bindHandlerCache[_7c3._cf_body];
if(_7c4){
_7c4();
}
}
_7c3._cf_dirtyview=false;
}
};
ColdFusion.Window.hideHandler=function(_7c5){
_7c5._cf_visible=false;
if(_7c5._cf_refreshOnShow){
_7c5._cf_dirtyview=true;
}
};
ColdFusion.Window.xPosition=50;
ColdFusion.Window.yPosition=50;
ColdFusion.Window.resetHTML=function(_7c6){
var _7c7=document.getElementById(_7c6);
if(_7c7){
_7c7.innerHTML="";
}
};
ColdFusion.Window.getUpdatedConfigObj=function(_7c8,_7c9){
var _7ca={};
if(_7c8!=null){
if(typeof (_7c8)!="object"){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidconfig","widget",[_7c9],null,null,true);
return;
}
for(var key in _7c8){
if(key=="center"&&ColdFusion.Util.isBoolean(_7c8["center"])){
_7ca["fixedcenter"]=_7c8["center"];
}else{
_7ca[key]=_7c8[key];
}
}
}
if(typeof (_7ca.initshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.initshow)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidinitshow","widget",[_7c9],null,null,true);
return;
}else{
_7ca.initshow=ColdFusion.Util.castBoolean(_7ca.initshow);
_7ca._cf_visible=_7ca.initshow;
}
}
_7ca.tempcenter=null;
if(typeof (_7ca.fixedcenter)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.fixedcenter)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidcenter","widget",[_7c9],null,null,true);
return;
}else{
_7ca.fixedcenter=ColdFusion.Util.castBoolean(_7ca.fixedcenter);
}
}
if(typeof (_7ca.resizable)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.resizable)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidresizable","widget",[_7c9],null,null,true);
return;
}else{
_7ca.resizable=ColdFusion.Util.castBoolean(_7ca.resizable);
}
}
if(typeof (_7ca.draggable)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.draggable)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invaliddraggable","widget",[_7c9],null,null,true);
return;
}else{
_7ca.draggable=ColdFusion.Util.castBoolean(_7ca.draggable);
}
}
if(typeof (_7ca.closable)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.closable)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidclosable","widget",[_7c9],null,null,true);
return;
}else{
_7ca.closable=ColdFusion.Util.castBoolean(_7ca.closable);
}
}
if(typeof (_7ca.modal)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.modal)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidmodal","widget",[_7c9],null,null,true);
return;
}else{
_7ca.modal=ColdFusion.Util.castBoolean(_7ca.modal);
}
}
if(typeof (_7ca.refreshonshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_7ca.refreshonshow)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidrefreshonshow","widget",[_7c9],null,null,true);
return;
}else{
_7ca._cf_refreshOnShow=ColdFusion.Util.castBoolean(_7ca.refreshonshow);
}
}
_7ca.shadow=true;
if(!_7ca.height){
_7ca.height=300;
}else{
if(ColdFusion.Util.isInteger(_7ca.height)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheight","widget",[_7c9],null,null,true);
return;
}
}
if(!_7ca.width){
_7ca.width=500;
}else{
if(ColdFusion.Util.isInteger(_7ca.width)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidwidth","widget",[_7c9],null,null,true);
return;
}
}
var _7cc=false;
if(_7ca.minwidth){
if(ColdFusion.Util.isInteger(_7ca.minwidth)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_7c9],null,null,true);
return;
}
var _7cd=_7ca.minwidth;
var _7ce=_7ca.width;
if(typeof (_7cd)!="number"){
_7cd=parseInt(_7cd);
}
if(typeof (_7ce)!="number"){
_7ce=parseInt(_7ce);
}
if(_7cd>_7ce){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_7c9],null,null,true);
return;
}
_7ca.minWidth=_7ca.minwidth;
_7cc=true;
}
if(_7ca.minheight){
if(ColdFusion.Util.isInteger(_7ca.minheight)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminheight","widget",[_7c9],null,null,true);
return;
}
var _7cf=_7ca.minheight;
var _7d0=_7ca.height;
if(typeof (_7cf)!="number"){
_7cf=parseInt(_7cf);
}
if(typeof (_7d0)!="number"){
_7d0=parseInt(_7d0);
}
if(_7cf>_7d0){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheightvalue","widget",[_7c9],null,null,true);
return;
}
_7ca.minHeight=_7ca.minheight;
_7cc=true;
}
if(_7ca.x){
if(ColdFusion.Util.isInteger(_7ca.x)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidx","widget",[_7c9],null,null,true);
return;
}
}
if(_7ca.y){
if(ColdFusion.Util.isInteger(_7ca.y)==false){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidy","widget",[_7c9],null,null,true);
return;
}
}
if(typeof (_7ca.x)=="undefined"&&(typeof (_7ca.fixedcenter)=="undefined"||_7ca.fixedcenter==false)){
_7ca.x=ColdFusion.Window.xPosition;
ColdFusion.Window.xPosition+=15;
}
if(typeof (_7ca.y)=="undefined"&&(typeof (_7ca.fixedcenter)=="undefined"||_7ca.fixedcenter==false)){
_7ca.y=ColdFusion.Window.yPosition;
ColdFusion.Window.yPosition+=15;
}
if(typeof (_7ca.initshow)!="undefined"&&_7ca.initshow===false){
_7ca.tempinitshow=false;
if(typeof (_7ca.fixedcenter)!="undefined"&&_7ca.fixedcenter===true){
_7ca.tempcenter=_7ca.fixedcenter;
_7ca.fixedcenter=null;
}else{
_7ca.tempx=_7ca.x;
_7ca.tempy=_7ca.y;
}
_7ca.x=-10000;
_7ca.y=-10000;
}
_7ca.constraintoviewport=true;
_7ca.initshow=true;
if(_7ca.resizable!=null&&_7ca.resizable==false&&_7cc==true){
ColdFusion.Window.resetHTML(_7c9);
ColdFusion.handleError(null,"window.getupdatedconfigobject.minhwnotallowed","widget",[_7c9],null,null,true);
return;
}
_7ca.collapsible=false;
_7ca.shadow=true;
_7ca.isConfObj=true;
return _7ca;
};
ColdFusion.Window.show=function(_7d1){
var _7d2=ColdFusion.objectCache[_7d1];
if(typeof (_7d2)!="undefined"&&_7d2!=null){
if(typeof (_7d2.isConfObj)!="undefined"&&_7d2.isConfObj==true){
_7d2.initshow=true;
var _7d3=ColdFusion.Window.createHTML(_7d1,null,_7d2.url,_7d2,true);
ColdFusion.Window.createJSObj(_7d1,_7d2.url,_7d3);
}else{
if(_7d2.isVisible()==false){
_7d2.show();
ColdFusion.Log.info("window.show.shown","widget",[_7d1]);
}
if(_7d2.tempcenter!=null){
_7d2.center();
_7d2.tempcenter=null;
}else{
if(_7d2.getEl()&&_7d2.getEl().getX()>0&&_7d2.getEl().getY()>0){
_7d2.tempx=null;
_7d2.tempy=null;
}else{
if(_7d2.tempx!=null&&_7d2.tempy!=null){
_7d2.setPosition(_7d2.tempx,_7d2.tempy);
_7d2.tempx=null;
_7d2.tempy=null;
}else{
var x=_7d2.getEl().getX();
var y=_7d2.getEl().getY();
_7d2.setPosition(x+1,y+1);
_7d2.setPosition(x,y);
}
}
}
}
}else{
ColdFusion.handleError(null,"window.show.notfound","widget",[_7d1],null,null,true);
}
};
ColdFusion.Window.hide=function(_7d6){
var _7d7=ColdFusion.objectCache[_7d6];
if(_7d7){
if(_7d7.isVisible&&_7d7.isVisible()==true){
_7d7.hide();
ColdFusion.Log.info("window.hide.hidden","widget",[_7d6]);
}
}else{
ColdFusion.handleError(null,"window.hide.notfound","widget",[_7d6],null,null,true);
}
};
ColdFusion.Window.onShow=function(_7d8,_7d9){
var _7da=ColdFusion.objectCache[_7d8];
if(typeof (_7da)!="undefined"&&_7da!=null){
_7da._cf_onShow=_7d9;
if(_7da.addListener){
_7da.addListener("show",ColdFusion.Window.onShowWrapper);
}
}else{
ColdFusion.handleError(null,"window.onshow.notfound","widget",[_7d8],null,null,true);
}
};
ColdFusion.Window.onShowWrapper=function(_7db){
_7db._cf_onShow.call(null,_7db.cfwindowname);
};
ColdFusion.Window.onHide=function(_7dc,_7dd){
var _7de=ColdFusion.objectCache[_7dc];
if(typeof (_7de)!="undefined"&&_7de!=null){
_7de._cf_onHide=_7dd;
if(_7de.addListener){
_7de.addListener("hide",ColdFusion.Window.onHideWrapper);
}
}else{
ColdFusion.handleError(null,"window.onhide.notfound","widget",[_7dc],null,null,true);
}
};
ColdFusion.Window.onHideWrapper=function(_7df){
_7df._cf_onHide.call(null,_7df.cfwindowname);
};
ColdFusion.Window.getWindowObject=function(_7e0){
if(!_7e0){
ColdFusion.handleError(null,"window.getwindowobject.emptyname","widget",null,null,null,true);
return;
}
var _7e1=ColdFusion.objectCache[_7e0];
if(_7e1==null||(typeof (_7e1.isConfObj)=="undefined"&&Ext.Window.prototype.isPrototypeOf(_7e1)==false)){
ColdFusion.handleError(null,"window.getwindowobject.notfound","widget",[_7e0],null,null,true);
return;
}
if(typeof (_7e1.isConfObj)!="undefined"&&_7e1.isConfObj==true){
_7e1.initshow=true;
var _7e2=ColdFusion.Window.createHTML(_7e0,null,_7e1.url,_7e1,true);
ColdFusion.Window.createJSObj(_7e0,_7e1.url,_7e2);
ColdFusion.Window.hide(_7e0);
_7e1=ColdFusion.objectCache[_7e0];
}
return _7e1;
};
