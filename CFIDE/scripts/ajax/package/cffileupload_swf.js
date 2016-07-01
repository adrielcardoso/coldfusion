/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.FileUpload){
ColdFusion.FileUpload={};
}
var $FS=ColdFusion.FileUpload;
$FS.defaultSWFLocation=_cf_ajaxscriptsrc+"/resources/cf/assets/MultiFileUpload.swf";
var isIE=(navigator.appVersion.indexOf("MSIE")!=-1)?true:false;
var isWin=(navigator.appVersion.toLowerCase().indexOf("win")!=-1)?true:false;
var isOpera=(navigator.userAgent.indexOf("Opera")!=-1)?true:false;
var defaultAddButtonLabel="Add Files";
var defaultUploadButtonLabel="Upload";
var defaultClearButtonLabel="Clear All";
var defaultDeleteButtonLabel="Delete";
var defaultAddIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/addfile.png";
var defaultUploadIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/upload.png";
var defaultClearIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/clear.gif";
var defaultDeleteIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/delete.png";
var defaultUploadSize=10*1024*1024;
var fileUploadPrefix="cf_fileUpload_";
ColdFusion.FileUpload.create=function(_8a6,_8a7,_8a8,_8a9,_8aa,_8ab,_8ac,_8ad,_8ae,_8af,_8b0,_8b1,_8b2,_8b3,_8b4,_8b5,_8b6,_8b7,_8b8,_8b9,_8ba,_8bb,_8bc,_8bd,_8be,_8bf,_8c0,_8c1,_8c2,_8c3){
var _8c4={};
_8c4.uploadDivId=_8a6;
_8c4.fileUploadName=fileUploadPrefix+_8a6;
_8c4.url_withoutQuery=_8a7;
_8c4.url_queryString=_8a8;
_8c4.url_CF_cookie=_8a9;
_8c4.url=$FS.constructUrl(_8a7,_8a8,_8a9);
_8c4.onCompleteHandler=_8b1;
_8c4.onUploadCompleteHandler=_8b2;
_8c4.onErrorHandler=_8b3;
_8c4.progressbar=_8be;
if(_8b6==null){
_8b6="";
}
_8c4.bgcolor=_8b6;
if(_8b7==null){
_8b7="";
}
_8c4.selectcolor=_8b7;
if(_8b8==null){
_8b8="";
}
_8c4.rollovercolor=_8b8;
if(_8b9==null){
_8b9="";
}
_8c4.textcolor=_8b9;
if(_8bc==null){
_8bc="left";
}
_8c4.titletextalign=_8bc;
if(_8ba==null){
_8ba="";
}
_8c4.titletextcolor=_8ba;
if(_8bb==null){
_8bb="";
}
_8c4.headercolor=_8bb;
_8c4.bgcolor=_8b6;
_8c4.bgcolor=_8b6;
if(_8bd==null){
_8bd="";
}
_8c4.fileFilter=_8bd;
_8c4.disableUploadButton=_8c0;
if(_8c2==null||typeof _8c2=="undefined"){
_8c2="window";
}
_8c4.wmode=_8c2;
_8c4.stopOnError=_8c1;
if(_8aa==null||typeof _8aa==="undefined"){
_8aa=defaultAddButtonLabel;
}
_8c4.addIcon=defaultAddIcon;
_8c4.addButtonLabel=_8aa;
if(_8ac==null||typeof _8ac==="undefined"){
_8ac=defaultUploadButtonLabel;
}
_8c4.uploadButtonLabel=_8ac;
_8c4.uploadIcon=defaultUploadIcon;
if(_8ae==null||typeof _8ae==="undefined"){
_8ae="File Upload ";
}
_8c4.title=_8ae;
_8c4.swfLocation=$FS.defaultSWFLocation;
if(_8ab==null||typeof _8ab==="undefined"){
_8ab=defaultClearButtonLabel;
}
_8c4.clearButtonLabel=_8ab;
_8c4.clearIcon=defaultClearIcon;
if(_8ad==null||typeof _8ad==="undefined"){
_8ad=defaultDeleteButtonLabel;
}
_8c4.deleteButtonLabel=_8ad;
_8c4.deleteIcon=defaultDeleteIcon;
if(_8af==null||!typeof _8af==="Number"){
_8af=-1;
}
_8c4.maxFileSelect=_8af;
if(_8b0==null||!typeof _8b0==="number"){
_8b0=defaultUploadSize;
}
_8c4.maxUploadSize=_8b0;
if(_8b4==null||typeof _8b4==="undefined"){
_8b4=420;
}
_8c4.widthInPx=_8b4+"px";
_8c4.width=_8b4;
if(_8b5==null||typeof _8b5==="undefined"){
_8b5=300;
}
_8c4.heightInPx=_8b5+"px";
_8c4.height=_8b5;
_8c4.align=_8c3;
ColdFusion.objectCache[_8a6]=_8c4;
ColdFusion.objectCache[_8c4.fileUploadName]=_8c4;
var _8c5=$FS.constructMarkup(_8c4);
var _8c6=document.getElementById(_8a6);
_8c6.innerHTML=_8c5;
ColdFusion.Log.info("fileupload.initialized","widget",[_8a6]);
};
$FS.constructMarkup=function(_8c7){
var str="";
if(isIE&&isWin&&!isOpera){
str+="<object width=\""+_8c7.width+"\" height=\""+_8c7.height+"\"";
str+=" id=\""+_8c7.fileUploadName+"\" name=\""+_8c7.playerName+"\" type=\"application/x-shockwave-flash\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" ";
str+=" data=\""+_8c7.swfLocation+"\">";
str+="<param name=\"movie\" value=\""+_8c7.swfLocation+"\" />";
str+="<param name=\"quality\" value=\""+_8c7.quality+"\" />";
str+="<param name=\"allowFullScreen\" value=\""+_8c7.fullScreen+"\" />";
str+="<param name=\"allowScriptAccess\" value=\"sameDomain\" />";
str+="<param name=\"wmode\" value=\""+_8c7.wmode+"\" />";
str+="<param name=\"flashvars\" value=\"uniqueid="+_8c7.fileUploadName+"&url="+_8c7.url+"&addLabel="+_8c7.addButtonLabel+"&deleteLabel="+_8c7.deleteButtonLabel;
str+="&clearLabel="+_8c7.clearButtonLabel+"&uploadLabel="+_8c7.uploadButtonLabel+"&maxUploadSize="+_8c7.maxUploadSize+"&maxFileSelect="+_8c7.maxFileSelect+"&progress="+_8c7.progressbar;
str+="&stopOnError="+_8c7.stopOnError+"&hideUpload="+_8c7.disableUploadButton+"&bgcolor="+_8c7.bgcolor+"&fileFilter="+_8c7.fileFilter+"&deleteIcon="+_8c7.deleteIcon+"&title="+_8c7.title;
str+="&uploadIcon="+_8c7.uploadIcon+"&textcolor="+_8c7.textcolor+"&titletextcolor="+_8c7.titletextcolor+"&headercolor="+_8c7.headercolor+"&titletextalign="+_8c7.titletextalign+"&rollovercolor="+_8c7.rollovercolor+"&selectcolor="+_8c7.selectcolor+"\" />";
str+="</object>";
}else{
str="<embed src=\""+_8c7.swfLocation+"\" allowScriptAccess=\"samedomain\" pluginspage=\"http://www.adobe.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\""+_8c7.wmode+"\"";
str+=" name=\""+_8c7.fileUploadName+"\" width=\""+_8c7.width+"\" height=\""+_8c7.height+"\" quality=\" "+_8c7.quality+"\"";
str+=" flashvars=\"uniqueid="+_8c7.fileUploadName+"&url="+_8c7.url+"&addLabel="+_8c7.addButtonLabel+"&deleteLabel="+_8c7.deleteButtonLabel;
str+="&clearLabel="+_8c7.clearButtonLabel+"&uploadLabel="+_8c7.uploadButtonLabel+"&maxUploadSize="+_8c7.maxUploadSize+"&maxFileSelect="+_8c7.maxFileSelect+"&progress="+_8c7.progressbar;
str+="&stopOnError="+_8c7.stopOnError+"&hideUpload="+_8c7.disableUploadButton+"&bgcolor="+_8c7.bgcolor+"&fileFilter="+_8c7.fileFilter+"&deleteIcon="+_8c7.deleteIcon+"&title="+_8c7.title;
str+="&uploadIcon="+_8c7.uploadIcon+"&textcolor="+_8c7.textcolor+"&titletextcolor="+_8c7.titletextcolor+"&headercolor="+_8c7.headercolor+"&titletextalign="+_8c7.titletextalign+"&rollovercolor="+_8c7.rollovercolor+"&selectcolor="+_8c7.selectcolor+"\" />";
}
return str;
};
$FS.constructUrl=function(_8c9,_8ca,_8cb){
var url=_8c9;
if(_8ca!=null){
url+="?"+_8ca;
if(_8cb!=null){
url+="%26"+_8cb;
}
}else{
if(_8cb!=null){
url+="?"+_8cb;
}
}
return url;
};
coldfusion_FileUploadSwf_complete=function(name,_8ce){
var _8cf=$FS.getFileUploadComponent(name);
var _8d0=ColdFusion.objectCache[name];
var _8d1=_8d0.onCompleteHandler;
if(_8d1!=null&&typeof _8d1=="function"){
_8d1.call(this,_8ce);
}
$FS.addResultToArray(_8ce,_8d0);
};
coldfusion_FileUploadSwf_onError=function(name,_8d3){
var _8d4=$FS.getFileUploadComponent(name);
var _8d5=ColdFusion.objectCache[name];
var _8d6=_8d5.onErrorHandler;
if(_8d6!=null&&typeof _8d6=="function"){
_8d6.call(this,_8d3);
}
$FS.addResultToArray(_8d3,_8d5);
};
coldfusion_FileUploadSwf_UploadCompete=function(name){
var _8d8=$FS.getFileUploadComponent(name);
var _8d9=ColdFusion.objectCache[name];
var _8da=_8d9.onUploadCompleteHandler;
var _8db=_8d9.resultArray;
if(_8da!=null&&typeof _8da=="function"){
_8da.call(this,_8db);
}
_8d9.resultArray=new Array();
};
$FS.addResultToArray=function(_8dc,_8dd){
var _8de=_8dd.resultArray;
if(_8de==null||typeof _8de=="undefined"){
_8de=_8dd.resultArray=new Array();
}
_8de.push(_8dc);
};
$FS.cancelUpload=function(name){
var _8e0=fileUploadPrefix+name;
var _8e1=$FS.getFileUploadComponent(_8e0);
if(_8e1!=null){
_8e1.cancelFileUpload();
}else{
ColdFusion.handleError(null,"fileupload.cancelupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.cancelupload.cancelled","widget",[name]);
};
$FS.getSelectedFiles=function(name){
var _8e3=fileUploadPrefix+name;
var _8e4=$FS.getFileUploadComponent(_8e3);
if(_8e4!=null){
return _8e4.getSelectedFileArray();
}else{
ColdFusion.handleError(null,"fileupload.getSelectedFiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.getSelectedFiles.selected","widget",[name]);
};
$FS.clearAllFiles=function(name){
var _8e6=fileUploadPrefix+name;
var _8e7=$FS.getFileUploadComponent(_8e6);
if(_8e7!=null){
_8e7.clearAllUpload();
}else{
ColdFusion.handleError(null,"fileupload.clearallfiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.clearallfiles.cleared","widget",[name]);
};
$FS.setURL=function(name,src){
var _8ea=$FS.getFileUploadComponent(fileUploadPrefix+name);
var _8eb=ColdFusion.objectCache[name];
if(_8eb==null||typeof (_8eb)=="undefined"){
ColdFusion.handleError(null,"fileupload.setURL.notfound","widget",[name],null,null,true);
}
if(!src||src.length==0){
ColdFusion.handleError(null,"fileupload.setURL.invalidurl","widget",[name],null,null,true);
}
var _8ec=null;
if(src.indexOf("?")>0){
_8ec=src.substring(src.indexOf("?")+1);
_8ec=escape(_8ec);
src=src.substring(0,src.indexOf("?"));
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _8ed=_8eb.url_withoutQuery;
_8ed=unescape(_8ed);
var _8ee="";
if(_8ed||_8ed.indexOf("/")>-1){
_8ee=_8ed.substring(0,_8ed.lastIndexOf("/")+1);
}
var _8ef=_8ee+src;
var _8f0=_8ef.split("/");
var _8f1=new Array();
var _8f2=0;
for(var i=0;i<_8f0.length;i++){
if(_8f0[i]==".."){
_8f1[--_8f2]="";
}else{
_8f1[_8f2++]=_8f0[i];
}
}
src=_8f1[0];
for(var i=1;i<_8f2;i++){
src=src+"/"+_8f1[i];
}
}
var _8f4=$FS.constructUrl(src,_8ec,_8eb.url_CF_cookie);
_8eb.url=_8f4;
_8ea.setSrc(_8f4);
ColdFusion.Log.info("fileupload.setURL.urlset","widget",[name,_8f4]);
};
$FS.startUpload=function(name){
var _8f6=fileUploadPrefix+name;
var _8f7=$FS.getFileUploadComponent(_8f6);
if(_8f7!=null){
_8f7.submitUploadForm();
}else{
ColdFusion.handleError(null,"fileupload.startupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.startupload.started","widget",[name]);
};
$FS.getFileUploadComponent=function(name){
if(navigator.appName.indexOf("Microsoft")!=-1){
if(window[name]!=null){
return window[name];
}else{
return document[name];
}
}else{
return document[name];
}
};
