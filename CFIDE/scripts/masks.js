/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var KT_focusedEl=null;
KT_validateSingle=function(_94a,_94b){
var _94c=_94a.charCodeAt(0);
switch(_94b){
case "9":
if(_94c<58&&_94c>47){
return true;
}
break;
case "A":
if((_94c<91&&_94c>64)||(_94c<123&&_94c>96)){
return true;
}
break;
case "X":
if((_94c<91&&_94c>64)||(_94c<123&&_94c>96)||(_94c<58&&_94c>47)){
return true;
}
break;
case "?":
return true;
break;
default:
return true;
break;
}
};
KT_maskDefaultValue=function(_94d){
switch(_94d){
case "9":
return "0";
break;
case "A":
return "a";
break;
case "X":
return "0";
break;
case "?":
return "0";
break;
default:
return "0";
break;
}
};
KT_isSpecialChar=function(_94e){
if(_94e=="9"||_94e=="A"||_94e=="X"||_94e=="?"){
return true;
}else{
return false;
}
};
mask_onValueChanged=function(){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
if(KT_focusedEl==null||KT_focusedEl.mask==null||KT_focusedEl.mask==""){
return;
}
var mask=KT_focusedEl.mask;
var val=KT_focusedEl.value;
var i=0;
var _952=false;
if(val==KT_focusedEl.oldText){
return;
}
if(val.length>mask.length){
val=val.substr(0,mask.length);
_952=true;
}
for(;i<mask.length;i++){
if(val.charCodeAt(i).toString()!="NaN"){
if(KT_isSpecialChar(mask.charAt(i))){
if(KT_validateSingle(val.charAt(i),mask.charAt(i))){
continue;
}else{
val=KT_focusedEl.oldText;
i=mask.length;
break;
}
}else{
if(val.charAt(i)!=mask.charAt(i)){
if(i==val.length-1){
var _953=val.substr(val.length-1,val.length);
val=val.substr(0,val.length-1)+mask.charAt(i)+_953;
_952=true;
continue;
}else{
val=KT_focusedEl.oldText;
i=mask.length;
}
break;
}
}
}else{
if(val.length<KT_focusedEl.oldText.length){
break;
}
for(;i<mask.length;i++){
if(!KT_isSpecialChar(mask.charAt(i))){
val+=mask.charAt(i);
_952=true;
}else{
break;
}
}
break;
}
}
if(val.length>mask.length){
val=val.substr(0,mask.length);
_952=true;
}
if(KT_focusedEl.value!=val){
KT_focusedEl.value=val;
}
KT_focusedEl.oldText=val;
if(_952){
}
};
mask_parseFirstTime=function(_954,mask){
var _956="";
var _957="";
cond=1;
imask=0;
ival=0;
cnt=0;
while(cond==1){
cond=1;
if(!KT_isSpecialChar(mask.charAt(imask))){
if(_954.charCodeAt(ival).toString()!="NaN"){
if(mask.charAt(imask)==_954.charAt(ival)){
imask++;
ival++;
}else{
_954=_954.substr(0,ival)+mask.charAt(imask)+_954.substr(ival,_954.length);
imask=0;
ival=0;
cond=1;
}
}else{
_954+=KT_maskDefaultValue(mask.charAt(imask));
}
}else{
imask++;
ival++;
}
if(imask>=mask.length||ival>=_954.length){
cond=0;
}
}
for(i=0;i<mask.length;i++){
if(KT_isSpecialChar(mask.charAt(i))){
_956+=mask.charAt(i);
if(_954.charCodeAt(i).toString()!="NaN"){
_957+=_954.charAt(i);
}else{
_957+=KT_maskDefaultValue(mask.charAt(i));
}
}
}
oldvalue=_954;
_954=_957;
var _958="";
for(i=0;i<_956.length;i++){
if(!KT_validateSingle(_954.charAt(i),_956.charAt(i))){
_958+=KT_maskDefaultValue(_956.charAt(i));
}else{
_958+=_954.charAt(i);
}
}
var _959="";
var j=0;
for(i=0;i<mask.length;i++){
if(KT_isSpecialChar(mask.charAt(i))){
_959+=_958.charAt(j++);
}else{
_959+=mask.charAt(i);
}
}
return _959;
};
mask_onSetFocus=function(obj,mask){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
if(typeof obj.mask=="undefined"){
ret="";
if(obj.value!=""){
ret=mask_parseFirstTime(obj.value,mask);
}
obj.value=ret;
obj.mask=mask;
}
KT_focusedEl=obj;
if(typeof KT_focusedEl.oldText=="undefined"){
KT_focusedEl.oldText=obj.value;
mask_onValueChanged();
}
};
mask_onKillFocus=function(){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
mask_onValueChanged();
KT_focusedEl=null;
};
