/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Calendar){
ColdFusion.Calendar={};
}
ColdFusion.Calendar.monthNamesShort=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
ColdFusion.Calendar.monthNamesLong=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
ColdFusion.Calendar.dayNamesShort=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
ColdFusion.Calendar.dayNamesLong=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
ColdFusion.Calendar.calTableIdCounter=0;
if(navigator.userAgent.toLowerCase().indexOf("safari")>-1){
var set_month=Date.prototype.setMonth;
Date.prototype.setMonth=function(num){
if(num<=-1){
var n=Math.ceil(-num);
var _764=Math.ceil(n/12);
var _765=(n%12)?12-n%12:0;
this.setFullYear(this.getFullYear()-_764);
return set_month.call(this,_765);
}else{
return set_month.apply(this,arguments);
}
};
}
if(!String.escape){
String.escape=function(_766){
return _766.replace(/('|\\)/g,"\\$1");
};
}
ColdFusion.Calendar.setUpCalendar=function(_767,mask,_769,_76a,_76b,_76c,_76d){
var _76e=ColdFusion.DOM.getElement(_767+_76c+"_cf_button",_76c);
var _76f=ColdFusion.DOM.getElement(_767,_76c);
var _770=null;
var _771=null;
if(_76f.value!=""){
_770=_76f.value;
_771=_770.split("/");
}
var _772=_767+"_cf_calendar"+ColdFusion.Calendar.calTableIdCounter;
ColdFusion.Calendar.calTableIdCounter++;
var _773=ColdFusion.DOM.getElement(_767+_76c+"_cf_container",_76c);
var _774=_76f.offsetLeft;
ColdFusion.DOM.getElement(_767+_76c+"_cf_container",_76c).style.left=_774;
YAHOO.widget.Calendar.IMG_ROOT=_cf_ajaxscriptsrc+"/resources/yui/";
var _775;
if(_771&&_771[0]&&_771[2]){
_775=new YAHOO.widget.Calendar(_772,_767+_76c+"_cf_container",{close:true,pagedate:_771[0]+"/"+_771[2]});
}else{
_775=new YAHOO.widget.Calendar(_772,_767+_76c+"_cf_container",{close:true});
}
_775.calendarinputid=_767;
_775.calendarinput=_76f;
_775.mask=mask;
_775.formname=_76c;
_775.cfg.setProperty("MONTHS_LONG",_76b);
_775.cfg.setProperty("WEEKDAYS_SHORT",_76a);
_775.cfg.setProperty("START_WEEKDAY",_769);
ColdFusion.objectCache[_772+_76c]=_775;
_775.select(_770);
_775.render();
_775.hide();
_775.selectEvent.subscribe(ColdFusion.Calendar.handleDateSelect,_775,true);
YAHOO.util.Event.addListener(_767+_76c+"_cf_button","click",ColdFusion.Calendar.handleCalendarLinkClick,_775,true);
if(_76d!=null){
var year=_76d.year;
var _777=_76d.month;
var day=_76d.day;
var _779=new Date(year,_777.valueOf()-1,day);
_76f.value=ColdFusion.Calendar.createFormattedOutput(_767,mask,year,_777,day,_779);
}
};
ColdFusion.Calendar.openedCalendarInstance=null;
ColdFusion.Calendar.handleCalendarLinkClick=function(type,args){
var _77c=args;
if(ColdFusion.Calendar.openedCalendarInstance){
ColdFusion.Calendar.openedCalendarInstance.hide();
}
if(!_77c.extMask){
var _77d=ColdFusion.Calendar.convertToExtMask(_77c.mask);
_77c.extMask=_77d;
}
var _77e=ColdFusion.DOM.getElement(args.calendarinputid,_77c.formname).value;
var _77f=null;
if(typeof (_77e)!="undefined"&&ColdFusion.trim(_77e)!=""){
_77f=Ext.Date.parse(_77e,_77c.extMask);
}
if(_77f!=null){
_77c.setMonth(_77f.getMonth());
_77c.setYear(_77f.getFullYear());
_77c.select(_77f);
_77c.render();
}
ColdFusion.Calendar.openedCalendarInstance=_77c;
_77c.show();
};
ColdFusion.Calendar.handleDateSelect=function(type,args,_782){
var _783=args[0];
var date=_783[0];
var year=date[0],month=date[1],day=date[2];
var _786=new Date(year,month.valueOf()-1,day);
_782.calendarinput.value=ColdFusion.Calendar.createFormattedOutput(_782.calendarinputid,_782.mask,year,month,day,_786);
ColdFusion.Event.callBindHandlers(_782.calendarinputid,null,"change");
_782.hide();
};
ColdFusion.Calendar.convertToExtMask=function(mask){
mask=mask.toUpperCase();
if(mask.indexOf("DD")!=-1){
mask=mask.replace(/DD/g,"d");
}
if(mask.indexOf("D")!=-1){
mask=mask.replace(/D/g,"d");
}
if(mask.indexOf("MMMM")!=-1){
mask=mask.replace(/MMMM/g,"F");
}else{
if(mask.indexOf("MMM")!=-1){
mask=mask.replace(/MMM/g,"M");
}else{
if(mask.indexOf("MM")!=-1){
mask=mask.replace(/MM/g,"m");
}else{
if(mask.indexOf("M")!=-1){
mask=mask.replace(/M/g,"m");
}
}
}
}
if(mask.indexOf("YYYY")!=-1){
mask=mask.replace(/YYYY/g,"Y");
}
if(mask.indexOf("YY")!=-1){
mask=mask.replace(/YY/g,"y");
}
if(mask.indexOf("EEEE")!=-1){
mask=mask.replace(/EEEE/g,"l");
}
if(mask.indexOf("EEE")!=-1){
mask=mask.replace(/EEE/g,"D");
}
if(mask.indexOf("E")!=-1){
mask=mask.replace(/E/g,"w");
}
return mask;
};
ColdFusion.Calendar.createFormattedOutput=function(_788,mask,year,_78b,day,date){
mask=mask.toUpperCase();
year=new String(year);
_78b=new String(_78b);
day=new String(day);
var _78e=date.getDay();
if(mask.indexOf("DD")!=-1){
if(day.length==1){
day="0"+day;
}
mask=mask.replace(/DD/g,day);
}
if(mask.indexOf("D"!=-1)){
if(day.length!=-1&&day.charAt(0)=="0"){
day=day.charAt(1);
}
mask=mask.replace(/D/g,day);
}
if(mask.indexOf("MMMM")!=-1){
_78b=ColdFusion.Calendar.monthNamesLong[_78b.valueOf()-1];
mask=mask.replace(/MMMM/g,_78b);
}else{
if(mask.indexOf("MMM")!=-1){
_78b=ColdFusion.Calendar.monthNamesShort[_78b.valueOf()-1];
mask=mask.replace(/MMM/g,_78b);
}else{
if(mask.indexOf("MM")!=-1){
if(_78b.length==1){
_78b="0"+_78b;
}
mask=mask.replace(/MM/g,_78b);
}else{
if(mask.indexOf("M")!=-1){
if(_78b.length!=-1&&_78b.charAt(0)=="0"){
_78b=_78b.charAt(1);
}
mask=mask.replace(/M/g,_78b);
}
}
}
}
if(mask.indexOf("YYYY")!=-1){
mask=mask.replace(/YYYY/g,year);
}
if(mask.indexOf("YY")!=-1){
year=year.substring(2);
mask=mask.replace(/YY/g,year);
}
if(mask.indexOf("EEEE")!=-1){
_78e=ColdFusion.Calendar.dayNamesLong[_78e.valueOf()];
mask=mask.replace(/EEEE/g,_78e);
}
if(mask.indexOf("EEE")!=-1){
_78e=ColdFusion.Calendar.dayNamesShort[_78e.valueOf()];
mask=mask.replace(/EEE/g,_78e);
}
if(mask.indexOf("E")!=-1){
_78e=_78e.valueOf();
_78e=new String(_78e);
if(_78e.length!=-1&&_78e.charAt(0)=="0"&&_78e.charAt(1)){
_78e=_78e.charAt(1);
}
mask=mask.replace(/E/g,_78e);
}
return mask;
};
