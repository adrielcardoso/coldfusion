/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var _CF_error_messages=new Array();
var _CF_error_fields=new Object();
var _CF_FirstErrorField=null;
var _CF_submit_status=new Array();
_CF_signalLoad=function(){
_CF_loaded=1;
};
_CF_onError=function(_8f9,_8fa,_8fb,_8fc){
if(_CF_error_fields[_8fa]==null){
if(_CF_FirstErrorField==null){
_CF_FirstErrorField=_8fa;
}
_CF_error_exists=true;
_CF_error_fields[_8fa]=_8fc;
_CF_error_messages[_CF_error_messages.length]=_8fc;
}
};
_CF_onErrorAlert=function(_8fd){
var _8fe="";
for(var i=0;i<_8fd.length;i++){
_8fe+=_8fd[i]+"\n";
}
alert(_8fe);
return false;
};
updateHiddenValue=function(val,form,name){
if(form==null||form==""){
form=0;
}
if(document.forms[form]==null||document.forms[form][name]==null){
return;
}
document.forms[form][name].value=val;
};
_CF_hasValue=function(obj,_904,_905){
if(_904=="TEXT"||_904=="FILE"||_904=="PASSWORD"||_904=="CFTEXTAREA"||_904=="TEXTAREA"||_904=="CFTEXTINPUT"||_904=="DATEFIELD"){
if(obj.value.length==0){
return false;
}else{
if(_905){
str=obj.value.replace(/^\s+/,"").replace(/\s+$/,"");
if(str.length==0){
return false;
}
}
}
return true;
}else{
if(_904=="SELECT"){
for(i=0;i<obj.length;i++){
if(obj.options[i].selected&&obj.options[i].value.length>0){
return true;
}
}
return false;
}else{
if(_904=="SINGLE_VALUE_RADIO"||_904=="SINGLE_VALUE_CHECKBOX"){
if(obj.checked){
return true;
}else{
return false;
}
}else{
if(_904=="RADIO"||_904=="CHECKBOX"){
if(obj.length==undefined&&obj.checked){
return true;
}else{
for(i=0;i<obj.length;i++){
if(obj[i].checked){
return true;
}
}
}
return false;
}else{
if(_904=="CFTREE"){
if(obj["value"].length>0){
return true;
}else{
return false;
}
}else{
if(_904=="RICHTEXT"){
var _906=FCKeditorAPI.GetInstance(obj.id);
var val=_906.GetXHTML();
if(val.length==0){
return false;
}else{
if(_905){
str=val.replace(/^\s+/,"").replace(/\s+$/,"");
if(str.length==0){
return false;
}
}
return true;
}
}else{
return true;
}
}
}
}
}
}
};
_CF_checkdate=function(_908,_909){
_908=_908.replace(/^\s+/,"").replace(/\s+$/,"");
_908=_908=_908.replace(/{d \'/,"").replace(/'}/,"");
if(_909){
if(_908.length==0){
return false;
}
}else{
if(_908.length==0){
return true;
}
}
if(_908.length==0){
return true;
}
isplit=_908.indexOf("/");
splitchr="/";
if(isplit==-1){
isplit=_908.indexOf(".");
splitchr=".";
}
if(isplit==-1){
isplit=_908.indexOf("-");
splitchr="-";
}
if(isplit==-1||isplit==_908.length){
return false;
}
var _90a=_908.substring(0,isplit);
if(_90a.length==4){
sYear=_908.substring(0,isplit);
isplit=_908.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_908.length){
return false;
}
sMonth=_908.substring((sYear.length+1),isplit);
sDay=_908.substring(isplit+1);
}else{
sMonth=_908.substring(0,isplit);
isplit=_908.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_908.length){
return false;
}
sDay=_908.substring((sMonth.length+1),isplit);
sYear=_908.substring(isplit+1);
}
if((sDay.length==0)||(sMonth.length==0)||(sYear.length==0)){
return false;
}
if(!_CF_checkinteger(sMonth)){
return false;
}else{
if(!_CF_checkrange(sMonth,1,12)){
return false;
}else{
if(!_CF_checkinteger(sYear)){
return false;
}else{
if(sYear.length!=1&&sYear.length!=2&&sYear.length!=4){
return false;
}else{
if(!_CF_checkrange(sYear,0,9999)){
return false;
}else{
if(!_CF_checkinteger(sDay)){
return false;
}else{
if(!_CF_checkday(sYear,sMonth,sDay)){
return false;
}else{
return true;
}
}
}
}
}
}
}
};
_CF_checkeurodate=function(_90b,_90c){
_90b=_90b.replace(/^\s+/,"").replace(/\s+$/,"");
_90b=_90b=_90b.replace(/{d \'/,"").replace(/'}/,"");
if(_90c){
if(_90b.length==0){
return false;
}
}else{
if(_90b.length==0){
return true;
}
}
isplit=_90b.indexOf("/");
splitchr="/";
if(isplit==-1){
isplit=_90b.indexOf(".");
splitchr=".";
}
if(isplit==-1){
isplit=_90b.indexOf("-");
splitchr="-";
}
if(isplit==-1||isplit==_90b.length){
return false;
}
var _90d=_90b.substring(0,isplit);
if(_90d.length==4){
sYear=_90b.substring(0,isplit);
isplit=_90b.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_90b.length){
return false;
}
sMonth=_90b.substring((sYear.length+1),isplit);
sDay=_90b.substring(isplit+1);
}else{
sDay=_90b.substring(0,isplit);
isplit=_90b.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_90b.length){
return false;
}
sMonth=_90b.substring((sDay.length+1),isplit);
sYear=_90b.substring(isplit+1);
}
if(!_CF_checkinteger(sMonth)){
return false;
}else{
if(!_CF_checkrange(sMonth,1,12)){
return false;
}else{
if(!_CF_checkinteger(sYear)){
return false;
}else{
if(!_CF_checkrange(sYear,0,null)){
return false;
}else{
if(!_CF_checkinteger(sDay)){
return false;
}else{
if(!_CF_checkday(sYear,sMonth,sDay)){
return false;
}else{
return true;
}
}
}
}
}
}
};
_CF_checkday=function(_90e,_90f,_910){
maxDay=31;
if(_90f==4||_90f==6||_90f==9||_90f==11){
maxDay=30;
}else{
if(_90f==2){
if(_90e%4>0){
maxDay=28;
}else{
if(_90e%100==0&&_90e%400>0){
maxDay=28;
}else{
maxDay=29;
}
}
}
}
return _CF_checkrange(_910,1,maxDay);
};
_CF_checkinteger=function(_911,_912){
_911=_911.replace(/^\s+/,"").replace(/\s+$/,"");
_911=_911.replace(/[$£¥€,~+]?/g,"");
if(_912){
if(_911.length==0){
return false;
}
}else{
if(_911.length==0){
return true;
}
}
var _913=".";
var _914=_911.indexOf(_913);
if(_914==-1){
return _CF_checknumber(_911);
}else{
return false;
}
};
_CF_numberrange=function(_915,_916,_917,_918){
if(_918){
if(_915.length==0){
return false;
}
}else{
if(_915.length==0){
return true;
}
}
if(_916!=null){
if(_915<_916){
return false;
}
}
if(_917!=null){
if(_915>_917){
return false;
}
}
return true;
};
_CF_checknumber=function(_919,_91a){
var _91b=" .+-0123456789";
var _91c=" .0123456789";
var _91d;
var _91e=false;
var _91f=false;
var _920=false;
_919=_919.replace(/^\s+/,"").replace(/\s+$/,"");
_919=_919.replace(/[$£¥€,~+]?/g,"");
if(_91a){
if(_919.length==0){
return false;
}
}else{
if(_919.length==0){
return true;
}
}
_91d=_91b.indexOf(_919.charAt(0));
if(_91d==1){
_91e=true;
}else{
if(_91d<1){
return false;
}
}
for(var i=1;i<_919.length;i++){
_91d=_91c.indexOf(_919.charAt(i));
if(_91d<0){
return false;
}else{
if(_91d==1){
if(_91e){
return false;
}else{
_91e=true;
}
}else{
if(_91d==0){
if(_91e||_920){
_91f=true;
}
}else{
if(_91f){
return false;
}else{
_920=true;
}
}
}
}
}
return true;
};
_CF_checkrange=function(_922,_923,_924,_925){
_922=_922.replace(/^\s+/,"").replace(/\s+$/,"");
if(_925){
if(_922.length==0){
return false;
}
}else{
if(_922.length==0){
return true;
}
}
if(!_CF_checknumber(_922)){
return false;
}else{
return (_CF_numberrange((eval(_922)),_923,_924));
}
return true;
};
_CF_checktime=function(_926,_927){
_926=_926.replace(/^\s+/,"").replace(/\s+$/,"");
_926=_926.replace(/\s+:\s+/,":");
_926=_926=_926.replace(/{t \'/,"").replace(/'}/,"");
if(_927){
if(_926.length==0){
return false;
}
}else{
if(_926.length==0){
return true;
}
}
var _928=_CF_checkregex(_926,/^((([0-1]?\d)|(2[0-3])):[0-5]?\d)?(:[0-5]?\d)? ?([AP]M|[AP]m|[ap]m|[ap]M)?$/,_927);
return _928;
};
_CF_checkphone=function(_929,_92a){
_929=_929.replace(/^\s+/,"").replace(/\s+$/,"");
if(_92a){
if(_929.length==0){
return false;
}
}else{
if(_929.length==0){
return true;
}
}
if(_929.length==0){
return true;
}
return _CF_checkregex(_929,/^(((1))?[ ,\-,\.]?([\\(]?([1-9][0-9]{2})[\\)]?))?[ ,\-,\.]?([^0-1]){1}([0-9]){2}[ ,\-,\.]?([0-9]){4}(( )((x){0,1}([0-9]){1,5}){0,1})?$/,_92a);
};
_CF_checkzip=function(_92b,_92c){
_92b=_92b.replace(/^\s+/,"").replace(/\s+$/,"");
if(_92c){
if(_92b.length==0){
return false;
}
}else{
if(_92b.length==0){
return true;
}
}
return _CF_checkregex(_92b,/^([0-9]){5,5}$|(([0-9]){5,5}(-| ){1}([0-9]){4,4}$)/,_92c);
};
_CF_checkcreditcard=function(_92d,_92e){
_92d=_92d.replace(/^\s+/,"").replace(/\s+$/,"");
if(_92e){
if(_92d.length==0){
return false;
}
}else{
if(_92d.length==0){
return true;
}
}
if(_92d.length==0){
return true;
}
var _92f=" -";
var _930="";
var _931;
for(var i=0;i<_92d.length;i++){
_931=_92f.indexOf(_92d.charAt(i));
if(_931<0){
_930+=_92d.substring(i,(i+1));
}
}
if(_930.length<13||_930.length>19){
return false;
}
if(_930.charAt(0)=="+"){
return false;
}
if(!_CF_checkinteger(_930)){
return false;
}
var _933=_930.length%2==1?false:true;
var _934=0;
var _935;
for(var i=0;i<_930.length;i++){
_935=eval(_930.charAt(i));
if(_933){
_935*=2;
_934+=(_935%10);
if((_935/10)>=1){
_934++;
}
_933=false;
}else{
_934+=_935;
_933=true;
}
}
return (_934%10)==0?true:false;
};
_CF_checkssn=function(_936,_937){
_936=_936.replace(/^\s+/,"").replace(/\s+$/,"");
if(_937){
if(_936.length==0){
return false;
}
}else{
if(_936.length==0){
return true;
}
}
return _CF_checkregex(_936,/^[0-9]{3}(-| )[0-9]{2}(-| )[0-9]{4}$/,_937);
};
_CF_checkEmail=function(_938,_939){
_938=_938.replace(/^\s+/,"").replace(/\s+$/,"");
if(_939){
if(_938.length==0){
return false;
}
}else{
if(_938.length==0){
return true;
}
}
return _CF_checkregex(_938,/^[a-zA-Z_0-9-'\+~]+(\.[a-zA-Z_0-9-'\+~]+)*@([a-zA-Z_0-9-]+\.)+[a-zA-Z]{2,7}$/,_939);
};
_CF_checkURL=function(_93a,_93b){
_93a=_93a.replace(/^\s+/,"").replace(/\s+$/,"");
if(_93b){
if(_93a.length==0){
return false;
}
}else{
if(_93a.length==0){
return true;
}
}
return _CF_checkregex(_93a.toLowerCase(),/^((http|https|ftp|file)\:\/\/([a-zA-Z0-0]*:[a-zA-Z0-0]*(@))?[a-zA-Z0-9-\.]+(\.[a-zA-Z]{2,3})?(:[a-zA-Z0-9]*)?\/?([a-zA-Z0-9-\._\?\,\'\/\+&amp;%\$#\=~])*)|((mailto)\:[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,7})|((news)\:[a-zA-Z0-9\.]*)$/,_93b);
};
_CF_checkUUID=function(_93c,_93d){
_93c=_93c.replace(/^\s+/,"").replace(/\s+$/,"");
if(_93d){
if(_93c.length==0){
return false;
}
}else{
if(_93c.length==0){
return true;
}
}
return _CF_checkregex(_93c,/[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{16,16}/,_93d);
};
_CF_checkGUID=function(_93e,_93f){
_93e=_93e.replace(/^\s+/,"").replace(/\s+$/,"");
if(_93f){
if(_93e.length==0){
return false;
}
}else{
if(_93e.length==0){
return true;
}
}
return _CF_checkregex(_93e,/[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{12,12}/,_93f);
};
_CF_checkBoolean=function(_940,_941){
_940=_940.replace(/^\s+/,"").replace(/\s+$/,"");
if(_941){
if(_940.length==0){
return false;
}
}else{
if(_940.length==0){
return true;
}
}
if(_940.toUpperCase()=="TRUE"||_940.toUpperCase()=="YES"||(_CF_checknumber(_940)&&_940!="0")){
return true;
}else{
if(_940.toUpperCase()=="FALSE"||_940.toUpperCase()=="NO"||_940=="0"){
return true;
}else{
return false;
}
}
};
_CF_setFormParam=function(_942,_943,_944){
var _945="document['"+_942+"']['"+_943+"']";
var obj=eval(_945);
if(obj==undefined){
return false;
}else{
obj.value=_944;
return true;
}
};
_CF_checkregex=function(_947,_948,_949){
if(_949){
if(_947.length==0){
return false;
}
}else{
if(_947.length==0){
return true;
}
}
return _948.test(_947);
};
