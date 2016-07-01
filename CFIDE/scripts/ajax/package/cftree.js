/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tree){
ColdFusion.Tree={};
}
ColdFusion.Tree.AttributesCollection=function(){
this.cache=true;
this.fontname=null;
this.bold=false;
this.italic=false;
this.completepath=false;
this.appendkey=false;
this.delimiter=null;
this.formname=null;
this.fontsize=null;
this.formparamname=null;
this.prevspanid=null;
this.prevspanbackground=null;
this.images={};
this.images.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderClose.gif";
this.images.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.images.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.images.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.images.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.images.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.images.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.images.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.imagesopen={};
this.imagesopen.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderOpen.gif";
this.imagesopen.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.imagesopen.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.imagesopen.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.imagesopen.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.imagesopen.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.imagesopen.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.imagesopen.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.eventcount=0;
this.eventHandlers=new Array();
this.nodeCounter=0;
};
ColdFusion.Tree.refresh=function(_88){
var _89=ColdFusion.objectCache[_88];
var _8a=ColdFusion.objectCache[_88+"collection"];
if(!_89||YAHOO.widget.TreeView.prototype.isPrototypeOf(_89)==false){
ColdFusion.handleError(null,"tree.refresh.notfound","widget",[_88],null,null,true);
return;
}
if(!_8a.dynLoadFunction){
ColdFusion.Log.info("tree.refresh.statictree","widget");
return;
}
_8a.dynLoadFunction.call(null,_89.getRoot());
ColdFusion.Log.info("tree.refresh.success","widget",[_88]);
};
ColdFusion.Tree.getTreeObject=function(_8b){
if(!_8b){
ColdFusion.handleError(null,"tree.gettreeobject.emptyname","widget",null,null,null,true);
return;
}
var _8c=ColdFusion.objectCache[_8b];
if(_8c==null||YAHOO.widget.TreeView.prototype.isPrototypeOf(_8c)==false){
ColdFusion.handleError(null,"tree.gettreeobject.notfound","widget",[_8b],null,null,true);
return;
}
return _8c;
};
ColdFusion.Tree.loadNodes=function(_8d,_8e){
var i=0;
var _90=ColdFusion.objectCache[_8e.treeid+"collection"];
var _91=ColdFusion.objectCache[_8e.treeid];
var _92;
var _93=false;
if(_8d&&typeof (_8d.length)=="number"&&!_8d.toUpperCase){
if(_8d.length>0&&typeof (_8d[0])!="object"){
_93=true;
}
}else{
_93=true;
}
if(_93){
ColdFusion.handleError(_91.onbinderror,"tree.loadnodes.invalidbindvalue","widget",[_8e.treeid]);
return;
}
if(_8e.parent&&!_8e.parent.isRoot()){
_91.removeChildren(_8e.parent);
}else{
if(_8e.parent&&_8e.parent.hasChildren()){
_91.removeChildren(_8e.parent);
_8e.parent=_91.getRoot();
}
}
if(!_8e.parent.leafnode){
for(i=0;i<_8d.length;i++){
var _94=_90.nodeCounter++;
var _95={};
_95.id=_8d[i].VALUE;
if(typeof (_8d[i].DISPLAY)==undefined||_8d[i].DISPLAY==null){
_95.label=_8d[i].VALUE;
}else{
_95.label=_8d[i].DISPLAY;
}
_95.expand=_8d[i].EXPAND;
_95.appendkey=_8d[i].APPENDKEY;
_95.href=_8d[i].HREF;
_95.img=_8d[i].IMG;
_95.imgOpen=_8d[i].IMGOPEN;
_95.imgid="_cf_image"+_94;
_95.spanid="_cf_span"+_94;
_95.target=_8d[i].TARGET;
if(_90.appendkey&&_90.appendkey==true&&_95.href){
var _96=new String(_95.href);
_96=_96.toLowerCase();
if(_96.indexOf("javascript")<0){
if(_96.indexOf("?")>=0){
_95.href=_8d[i].HREF+"&";
}else{
_95.href=_8d[i].HREF+"?";
}
_95.href=_95.href+"CFTREEITEMKEY="+_95.id;
}
}
var _97="";
if(_95.img){
if(_90.images[_95.img]){
_97="<img src='"+_90.images[_95.img]+"' id='"+_95.imgid+"' style='border:0'/>&nbsp;";
}else{
_97="<img src='"+_95.img+"' id='"+_95.imgid+"' style='border:0'/>&nbsp;";
}
}
if(_90.fontname||_90.italic==true||_90.bold==true||_90.fontsize){
_97=_97+"<span id='"+_95.spanid+"' style='";
if(_90.fontname){
_97=_97+"font-family:"+_90.fontname+";";
}
if(_90.italic==true){
_97=_97+"font-style:italic;";
}
if(_90.bold==true){
_97=_97+"font-weight:bold;";
}
if(_90.fontsize){
_97=_97+"font-size:"+_90.fontsize+";";
}
_97=_97+"'>"+_95.label+"</span>";
_95.label=_97;
}else{
_95.label=_97+"<span id='"+_95.spanid+"'  >"+_95.label+"</span>";
}
_95.childrenFetched=false;
var _98=new YAHOO.widget.TextNode(_95,_8e.parent,false);
var _99=false;
if(_8d[i].LEAFNODE&&_8d[i].LEAFNODE==true){
_99=true;
_98.leafnode=true;
_98.iconMode=1;
}
if(_99==true||(_95.expand&&_95.expand==true)){
_98.expand();
}
}
}
if(!_8e.parent.isRoot()){
_8e.parent.data.childrenFetched=true;
}
if(_8e.onCompleteCallBack){
_8e.onCompleteCallBack.call();
}else{
_8e.parent.tree.draw();
}
ColdFusion.Log.info("tree.loadnodes.success","widget",[_8e.treeid]);
};
ColdFusion.Tree.onExpand=function(_9a){
if(_9a.isRoot()){
return;
}
var _9b=ColdFusion.objectCache[_9a.tree.id+"collection"];
if(_9a.data.imgOpen&&typeof (_9a.leafnode)=="undefined"){
var _9c=ColdFusion.DOM.getElement(_9a.data.imgid,_9a.tree.id);
var src;
if(_9b.imagesopen[_9a.data.imgOpen]){
src=_9b.imagesopen[_9a.data.imgOpen];
}else{
src=_9a.data.imgOpen;
}
_9c.src=src;
}
if(_9b.cache==false&&_9a.data.childrenFetched==false&&_9b.dynLoadFunction){
_9a.tree.removeChildren(_9a);
}
};
ColdFusion.Tree.onCollapse=function(_9e){
if(_9e.isRoot()){
return;
}
var _9f=ColdFusion.objectCache[_9e.tree.id+"collection"];
if(_9e.data.img){
var _a0=ColdFusion.DOM.getElement(_9e.data.imgid,_9e.tree.id);
var src;
if(_9f.images[_9e.data.img]){
src=_9f.images[_9e.data.img];
}else{
src=_9e.data.img;
}
_a0.src=src;
}
_9e.data.childrenFetched=false;
};
ColdFusion.Tree.formPath=function(_a2,_a3){
var _a4=ColdFusion.objectCache[_a2.tree.id+"collection"];
if(_a4.completepath==true&&_a2.isRoot()){
return "";
}else{
if(_a4.completepath==false&&_a2.parent.isRoot()){
return "";
}
}
if(!_a3){
_a3=_a2;
}
var _a5=ColdFusion.Tree.formPath(_a2.parent,_a3);
_a5=_a5+_a2.data.id;
if(_a3.data.id!=_a2.data.id){
_a5=_a5+_a4.delimiter;
}
return _a5;
};
ColdFusion.Tree.onLabelClick=function(_a6){
var _a7="";
var _a8=ColdFusion.objectCache[_a6.tree.id+"collection"];
var _a7=ColdFusion.Tree.formPath(_a6);
if(_a8.prevspanid){
var _a9=ColdFusion.DOM.getElement(_a8.prevspanid,_a6.tree.id);
if(_a9.style){
_a9.style.backgroundColor=_a8.prevspanbackground;
}
}
var _aa=ColdFusion.DOM.getElement(_a6.data.spanid,_a6.tree.id);
if(_aa&&_aa.style){
_a8.prevspanbackground=_aa.style.backgroundColor;
}
_aa.style.backgroundColor="lightblue";
_a8.prevspanid=_a6.data.spanid;
_a6.tree._cf_path=_a7;
_a6.tree._cf_node=_a6.data.id;
var val="PATH="+_a7+"; NODE="+_a6.data.id;
updateHiddenValue(val,_a8.formname,_a8.formparamname);
ColdFusion.Tree.fireSelectionChangeEvent(_a6.tree.id,_a8.formname);
};
ColdFusion.Tree.fireSelectionChangeEvent=function(id,_ad){
ColdFusion.Log.info("tree.fireselectionchangeevent.fire","widget",[id]);
ColdFusion.Event.callBindHandlers(id,_ad,"change");
};
ColdFusion.Tree.getObject=function(_ae){
var _af={};
_af.id=_ae.value;
if(_ae.href&&_ae.href!="null"){
_af.href=_ae.href;
}
_af.target=_ae.target;
_af.label=_ae.label;
_af.display=_ae.display;
_af.img=_ae.img;
_af.imgOpen=_ae.imgOpen;
_af.imgid=_ae.imgid;
_af.spanid=_ae.spanid;
_af.childrenfetched=_ae.childrenfetched;
return _af;
};
ColdFusion.Tree.initializeTree=function(_b0,_b1,_b2,_b3,_b4,_b5,_b6,_b7,_b8,_b9,_ba,_bb){
var _bc=new YAHOO.widget.TreeView(_b0);
_bc.subscribe("expand",ColdFusion.Tree.onExpand);
_bc.subscribe("collapse",ColdFusion.Tree.onCollapse);
_bc.subscribe("labelClick",ColdFusion.Tree.onLabelClick);
_bc._cf_getAttribute=function(_bd){
_bd=_bd.toUpperCase();
if(_bd=="PATH"){
return _bc._cf_path;
}else{
if(_bd=="NODE"){
return _bc._cf_node;
}else{
return null;
}
}
};
_bc.onbinderror=_b9;
ColdFusion.objectCache[_b0]=_bc;
var _be=new ColdFusion.Tree.AttributesCollection();
_be.cache=_b1;
_be.italic=_b2;
_be.bold=_b3;
_be.completepath=_b4;
_be.delimiter=_b6;
_be.appendkey=_b5;
_be.formname=_b7;
_be.formparamname=_b8;
_be.fontsize=_ba;
_be.fontname=_bb;
ColdFusion.objectCache[_b0+"collection"]=_be;
ColdFusion.Log.info("tree.initializetree.success","widget",[_b0]);
return _bc;
};
