/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Layout){
ColdFusion.Layout={};
}
var ACCORDION_TITLE_ICON_CSS_TEMPLATE=".{0} { background-image:url({1}); }";
if(!ColdFusion.MapVsAccordion){
ColdFusion.MapVsAccordion={};
}
ColdFusion.Layout.initializeTabLayout=function(id,_7e4,_7e5,_7e6,_7e7){
Ext.QuickTips.init();
var _7e8;
if(_7e5){
_7e8={renderTo:id,height:_7e5};
}else{
_7e8={renderTo:id,autoHeight:true};
}
if(_7e6&&_7e6!="undefined"){
_7e8.width=_7e6;
}else{
_7e8.autoWidth=true;
}
if(_7e4){
_7e8.tabPosition="bottom";
}else{
_7e8.enableTabScroll=true;
}
_7e8.plain=!_7e7;
var _7e9=new Ext.tab.Panel(_7e8);
ColdFusion.objectCache[id]=_7e9;
return _7e9;
};
ColdFusion.Layout.getTabLayout=function(_7ea){
var _7eb=ColdFusion.objectCache[_7ea];
if(!_7eb||!(_7eb instanceof Ext.TabPanel)){
ColdFusion.handleError(null,"layout.gettablayout.notfound","widget",[_7ea],null,null,true);
}
return _7eb;
};
ColdFusion.Layout.onTabActivate=function(tab){
tab._cf_visible=true;
if(tab._cf_dirtyview){
var _7ed=ColdFusion.bindHandlerCache[tab.contentEl];
if(_7ed){
_7ed();
}
tab._cf_dirtyview=false;
}
};
ColdFusion.Layout.onTabDeactivate=function(tab){
tab._cf_visible=false;
if(tab._cf_refreshOnActivate){
tab._cf_dirtyview=true;
}
};
ColdFusion.Layout.onTabClose=function(tab){
tab._cf_visible=false;
};
ColdFusion.Layout.addTab=function(_7f0,_7f1,name,_7f3,_7f4,_7f5,_7f6,_7f7,_7f8){
if(_7f4!=null&&_7f4.length==0){
_7f4=null;
}
var _7f9=_7f0.initialConfig.autoHeight;
if(typeof _7f9=="undefined"){
_7f9=false;
}
var _7fa=new Ext.Panel({title:_7f3,contentEl:_7f1,_cf_body:_7f1,id:name,closable:_7f5,tabTip:_7f4,autoScroll:_7f8,autoShow:true,autoHeight:_7f9});
var tab=_7f0.add(_7fa);
if(_7f7){
_7fa.setDisabled(true);
}
tab._cf_visible=false;
tab._cf_dirtyview=true;
tab._cf_refreshOnActivate=_7f6;
tab.addListener("activate",ColdFusion.Layout.onTabActivate);
tab.addListener("deactivate",ColdFusion.Layout.onTabDeactivate);
tab.addListener("close",ColdFusion.Layout.onTabClose);
ColdFusion.objectCache[name]=tab;
var _7fc=tab.height;
if(_7fc&&_7fc>1){
var _7fd=document.getElementById(_7f1);
_7fd.style.height=_7fc;
}
};
ColdFusion.Layout.enableTab=function(_7fe,_7ff){
var _800=ColdFusion.objectCache[_7fe];
var _801=ColdFusion.objectCache[_7ff];
if(_800&&(_800 instanceof Ext.TabPanel)&&_801){
_801.setDisabled(false);
ColdFusion.Log.info("layout.enabletab.enabled","widget",[_7ff,_7fe]);
}else{
ColdFusion.handleError(null,"layout.enabletab.notfound","widget",[_7fe],null,null,true);
}
};
ColdFusion.Layout.disableTab=function(_802,_803){
var _804=ColdFusion.objectCache[_802];
var _805=ColdFusion.objectCache[_803];
if(_804&&(_804 instanceof Ext.TabPanel)&&_805){
_805.setDisabled(true);
ColdFusion.Log.info("layout.disabletab.disabled","widget",[_803,_802]);
}else{
ColdFusion.handleError(null,"layout.disabletab.notfound","widget",[_802],null,null,true);
}
};
ColdFusion.Layout.selectTab=function(_806,_807){
var _808=ColdFusion.objectCache[_806];
var tab=ColdFusion.objectCache[_807];
if(_808&&(_808 instanceof Ext.TabPanel)&&tab){
_808.setActiveTab(tab);
ColdFusion.Log.info("layout.selecttab.selected","widget",[_807,_806]);
}else{
ColdFusion.handleError(null,"layout.selecttab.notfound","widget",[_806],null,null,true);
}
};
ColdFusion.Layout.hideTab=function(_80a,_80b){
var _80c=ColdFusion.objectCache[_80a];
if(_80c&&(_80c instanceof Ext.TabPanel)){
var _80d=ColdFusion.objectCache[_80b];
var _80e=false;
if(_80d){
if(_80c.getActiveTab()&&_80c.getActiveTab().getId()==_80b){
var i;
for(i=0;i<_80c.items.length;i++){
var _810=_80c.getComponent(i);
if(_810.hidden==false){
_80e=true;
_810.show();
break;
}
}
if(_80e==false){
document.getElementById(_80b).style.display="none";
}
}
_80d.tab.hide();
ColdFusion.Log.info("layout.hidetab.hide","widget",[_80b,_80a]);
}
}else{
ColdFusion.handleError(null,"layout.hidetab.notfound","widget",[_80a],null,null,true);
}
};
ColdFusion.Layout.showTab=function(_811,_812){
var _813=ColdFusion.objectCache[_811];
var _814=ColdFusion.objectCache[_812];
if(_813&&(_813 instanceof Ext.TabPanel)&&_814){
_814.tab.show();
ColdFusion.Log.info("layout.showtab.show","widget",[_812,_811]);
}else{
ColdFusion.handleError(null,"layout.showtab.notfound","widget",[_811],null,null,true);
}
};
ColdFusion.Layout.disableSourceBind=function(_815){
var _816=ColdFusion.objectCache[_815];
if(_816==null||_816=="undefined"){
ColdFusion.handleError(null,"layout.disableSourceBind.notfound","widget",[_815],null,null,true);
}
_816._cf_dirtyview=false;
};
ColdFusion.Layout.enableSourceBind=function(_817){
var _818=ColdFusion.objectCache[_817];
if(_818==null||_818=="undefined"){
ColdFusion.handleError(null,"layout.enableSourceBind.notfound","widget",[_817],null,null,true);
}
_818._cf_dirtyview=true;
};
ColdFusion.Layout.createTab=function(_819,_81a,_81b,_81c,_81d){
var _81e=ColdFusion.objectCache[_819];
var _81f=_81a;
if(_819&&typeof (_819)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidname","widget",null,null,null,true);
return;
}
if(!_819||ColdFusion.trim(_819)==""){
ColdFusion.handleError(null,"layout.createtab.emptyname","widget",null,null,null,true);
return;
}
if(_81a&&typeof (_81a)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidareaname","widget",null,null,null,true);
return;
}
if(!_81a||ColdFusion.trim(_81a)==""){
ColdFusion.handleError(null,"layout.createtab.emptyareaname","widget",null,null,null,true);
return;
}
if(_81b&&typeof (_81b)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidtitle","widget",null,null,null,true);
return;
}
if(!_81b||ColdFusion.trim(_81b)==""){
ColdFusion.handleError(null,"layout.createtab.emptytitle","widget",null,null,null,true);
return;
}
if(_81c&&typeof (_81c)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidurl","widget",null,null,null,true);
return;
}
if(!_81c||ColdFusion.trim(_81c)==""){
ColdFusion.handleError(null,"layout.createtab.emptyurl","widget",null,null,null,true);
return;
}
_81a="cf_layoutarea"+_81a;
if(_81e&&(_81e instanceof Ext.TabPanel)){
var _820=null;
var ele=document.getElementById(_81a);
if(ele!=null){
ColdFusion.handleError(null,"layout.createtab.duplicateel","widget",[_81a],null,null,true);
return;
}
var _822=false;
var _823=false;
var _824=false;
var _825=false;
var _826=false;
var _827=null;
if((_81e.items.length<=0)){
_824=true;
}
if(_81d!=null){
if(typeof (_81d)!="object"){
ColdFusion.handleError(null,"layout.createtab.invalidconfig","widget",null,null,null,true);
return;
}
if(typeof (_81d.closable)!="undefined"&&_81d.closable==true){
_822=true;
}
if(typeof (_81d.disabled)!="undefined"&&_81d.disabled==true){
_823=true;
}
if(typeof (_81d.selected)!="undefined"&&_81d.selected==true){
_824=true;
}
if(typeof (_81d.inithide)!="undefined"&&_81d.inithide==true){
_825=true;
}
if(typeof (_81d.tabtip)!="undefined"&&_81d.tabtip!=null){
_827=_81d.tabtip;
}
}
var _828=document.getElementById(_819);
if(_828){
var _829=document.getElementById(_819);
var _82a=document.createElement("div");
_82a.id=_81a;
_82a.className="ytab";
if(_81d!=null&&typeof (_81d.align)!="undefined"){
_82a.align=_81d.align;
}
var _82b="";
if(_81e.tabheight){
_82b="height:"+_81e.tabheight+";";
}
if(_81d!=null&&typeof (_81d.style)!="undefined"){
var _82c=new String(_81d.style);
_82c=_82c.toLowerCase();
_82b=_82b+_82c;
}
if(_81d!=null&&typeof (_81d.overflow)!="undefined"){
var _82d=new String(_81d.overflow);
_82d=_82d.toLowerCase();
if(_82d!="visible"&&_82d!="auto"&&_82d!="scroll"&&_82d!="hidden"){
ColdFusion.handleError(null,"layout.createtab.invalidoverflow","widget",null,null,null,true);
return;
}
if(_82d.toLocaleLowerCase()==="hidden"){
_826=false;
}
_82b=_82b+"overflow:"+_82d+";";
}else{
_82b=_82b+"; overflow:auto;";
}
_82a.style.cssText=_82b;
_829.appendChild(_82a);
}
ColdFusion.Layout.addTab(_81e,_81a,_81f,_81b,_827,_822,false,_823,_826);
ColdFusion.Log.info("layout.createtab.success","http",[_81a,_819]);
if(_824==true){
ColdFusion.Layout.selectTab(_819,_81f);
}
if(_825==true){
ColdFusion.Layout.hideTab(_819,_81f);
}
if(_81c!=null&&typeof (_81c)!="undefined"&&_81c!=""){
if(_81c.indexOf("?")!=-1){
_81c=_81c+"&";
}else{
_81c=_81c+"?";
}
var _82e;
var _82f;
if(_81d){
_82e=_81d.callbackHandler;
_82f=_81d.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_81a,_81c,"GET",null,_82e,_82f);
}
}else{
ColdFusion.handleError(null,"layout.createtab.notfound","widget",[_819],null,null,true);
}
};
ColdFusion.Layout.getBorderLayout=function(_830){
var _831=ColdFusion.objectCache[_830];
if(!_831){
ColdFusion.handleError(null,"layout.getborderlayout.notfound","widget",[_830],null,null,true);
}
return _831;
};
ColdFusion.Layout.showArea=function(_832,_833){
var _834=ColdFusion.Layout.convertPositionToDirection(_833);
var _835=ColdFusion.objectCache[_832];
var _836;
if(_835){
var _837=_835.items;
for(var i=0;i<_837.getCount();i++){
var _839=_837.items[i];
if(_839 instanceof Ext.Panel&&_839.region==_834){
_836=_839;
break;
}
}
if(_836){
_836.show();
_836.expand();
ColdFusion.Log.info("layout.showarea.shown","widget",[_833,_832]);
}else{
ColdFusion.handleError(null,"layout.showarea.areanotfound","widget",[_833],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.showarea.notfound","widget",[_832],null,null,true);
}
};
ColdFusion.Layout.hideArea=function(_83a,_83b){
var _83c=ColdFusion.Layout.convertPositionToDirection(_83b);
var _83d=ColdFusion.objectCache[_83a];
var _83e;
if(_83d){
var _83f=_83d.items;
for(var i=0;i<_83f.getCount();i++){
var _841=_83f.items[i];
if(_841 instanceof Ext.Panel&&_841.region==_83c){
_83e=_841;
break;
}
}
if(_83e){
_83e.hide();
ColdFusion.Log.info("layout.hidearea.hidden","widget",[_83b,_83a]);
}else{
ColdFusion.handleError(null,"layout.hidearea.areanotfound","widget",[_83b],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.hidearea.notfound","widget",[_83a],null,null,true);
}
};
ColdFusion.Layout.collapseArea=function(_842,_843){
var _844=ColdFusion.Layout.convertPositionToDirection(_843);
var _845=ColdFusion.objectCache[_842];
var _846;
if(_845){
var _847=_845.items;
for(var i=0;i<_847.getCount();i++){
var _849=_847.items[i];
if(_849 instanceof Ext.Panel&&_849.region==_844){
_846=_849;
break;
}
}
if(_846){
_846.collapse(true);
ColdFusion.Log.info("layout.collpasearea.collapsed","widget",[_843,_842]);
}else{
ColdFusion.handleError(null,"layout.collpasearea.areanotfound","widget",[_843],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.collpasearea.notfound","widget",[_843],null,null,true);
}
};
ColdFusion.Layout.expandArea=function(_84a,_84b){
var _84c=ColdFusion.Layout.convertPositionToDirection(_84b);
var _84d=ColdFusion.objectCache[_84a];
var _84e;
if(_84d){
var _84f=_84d.items;
for(var i=0;i<_84f.getCount();i++){
var _851=_84f.items[i];
if(_851 instanceof Ext.Panel&&_851.region==_84c){
_84e=_851;
break;
}
}
if(_84e){
_84e.expand();
ColdFusion.Log.info("layout.expandarea.expanded","widget",[_84b,_84a]);
}else{
ColdFusion.handleError(null,"layout.expandarea.areanotfound","widget",[_84b],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.expandarea.notfound","widget",[_84b],null,null,true);
}
};
ColdFusion.Layout.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)==Object){
value=$G.printObject(value);
}
str+=value;
}
return str;
};
ColdFusion.Layout.InitAccordion=function(_854,_855,_856,_857,_858,_859,_85a,_85b){
var _85c=false;
if(_856.toUpperCase()=="LEFT"){
_85c=true;
}
if(_859==null||typeof (_859)=="undefined"){
_858=false;
}
var _85d={activeOnTop:_855,collapseFirst:_85c,titleCollapse:_857,fill:_858};
var _85e={renderTo:_854,layoutConfig:_85d,items:_85b,layout:"accordion"};
if(_859==null||typeof (_859)=="undefined"){
_85e.autoHeight=true;
_85e.height=600;
}else{
_85e.height=_859;
}
_85e.flex=1;
if(_85a==null||typeof (_85a)=="undefined"){
_85e.autoWidth=true;
}else{
_85e.width=_85a;
}
_85e.align="stretch";
var _85f=new Ext.Panel(_85e);
ColdFusion.objectCache[_854]=_85f;
ColdFusion.Log.info("layout.accordion.initialized","widget",[_854]);
return _85f;
};
ColdFusion.Layout.InitAccordionChildPanel=function(_860,_861,_862,_863,_864,_865,_866,_867){
if(_862==null||typeof (_862)==undefined||_862.length==0){
_862="  ";
}
var _868={contentEl:_860,id:_861,title:_862,collapsible:_863,closable:_864,autoScroll:_865,_cf_body:_860};
if(_866&&typeof _866=="string"){
_868.iconCls=_866;
}
var _869=new Ext.Panel(_868);
_869._cf_visible=false;
_869._cf_dirtyview=true;
_869._cf_refreshOnActivate=_867;
_869.on("expand",ColdFusion.Layout.onAccordionPanelExpand,this);
_869.on("collapse",ColdFusion.Layout.onAccordionPanelCollapse,this);
_869.on("hide",ColdFusion.Layout.onAccordionPanelHide,this);
_869.on("show",ColdFusion.Layout.onAccordionPanelExpand,this);
ColdFusion.objectCache[_861]=_869;
ColdFusion.Log.info("layout.accordion.childinitialized","widget",[_861]);
return _869;
};
ColdFusion.Layout.getAccordionLayout=function(_86a){
var _86b=ColdFusion.objectCache[_86a];
if(!_86b||!(_86b instanceof Ext.Panel)){
ColdFusion.handleError(null,"layout.getaccordionlayout.notfound","widget",[_86a],null,null,true);
}
return _86b;
};
ColdFusion.Layout.onAccordionPanelExpand=function(_86c){
_86c._cf_visible=true;
if(_86c._cf_dirtyview){
var _86d=ColdFusion.bindHandlerCache[_86c.contentEl];
if(_86d){
_86d();
}
_86c._cf_dirtyview=false;
}
var el=Ext.get(_86c.contentEl);
el.move("left",1);
el.move("right",1);
var _86f=ColdFusion.MapVsAccordion[_86c._cf_body];
if(_86f!=undefined){
var _870=$MAP.getMapPanelObject(_86f);
if(_870!=undefined){
if(_870.initShow===true){
$MAP.show(_86f);
}
}
}
};
ColdFusion.Layout.onAccordionPanelCollapse=function(_871){
_871._cf_visible=false;
if(_871._cf_refreshOnActivate){
_871._cf_dirtyview=true;
}
};
ColdFusion.Layout.onAccordionPanelHide=function(_872){
_872._cf_visible=false;
};
ColdFusion.Layout.hideAccordion=function(_873,_874){
var _875=ColdFusion.objectCache[_873];
var _876=ColdFusion.objectCache[_874];
if(!_875||!_875 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.layoutnotfound","widget",[_873],null,null,true);
}
if(!_876||!_876 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.panelnotfound","widget",[_874],null,null,true);
}
_876.hide();
ColdFusion.Log.info("layout.hideaccordion.hidden","widget",[_874,_873]);
};
ColdFusion.Layout.showAccordion=function(_877,_878){
var _879=ColdFusion.objectCache[_877];
var _87a=ColdFusion.objectCache[_878];
if(!_879||!_879 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.layoutnotfound","widget",[_877],null,null,true);
}
if(!_87a||!_87a instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.panelnotfound","widget",[_878],null,null,true);
}
_87a.show();
ColdFusion.Log.info("layout.showaccordion.shown","widget",[_878,_877]);
};
ColdFusion.Layout.expandAccordion=function(_87b,_87c){
var _87d=ColdFusion.objectCache[_87b];
var _87e=ColdFusion.objectCache[_87c];
if(!_87d||!_87d instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.layoutnotfound","widget",[_87b],null,null,true);
}
if(!_87e||!_87e instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.panelnotfound","widget",[_87c],null,null,true);
}
_87e.expand();
ColdFusion.Log.info("layout.expandaccordion.expanded","widget",[_87c,_87b]);
};
ColdFusion.Layout.selectAccordion=function(_87f,_880){
return ColdFusion.Layout.expandAccordion(_87f,_880);
};
ColdFusion.Layout.collapseAccordion=function(_881,_882){
var _883=ColdFusion.objectCache[_881];
var _884=ColdFusion.objectCache[_882];
if(!_883||!_883 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.layoutnotfound","widget",[_881],null,null,true);
}
if(!_884||!_884 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.panelnotfound","widget",[_882],null,null,true);
}
_884.collapse();
ColdFusion.Log.info("layout.collapseaccordion.collapsed","widget",[_882,_881]);
};
ColdFusion.Layout.createAccordionPanel=function(_885,_886,_887,url,_889){
var _88a=ColdFusion.objectCache[_885];
var _88b=_886;
if(_885&&typeof (_885)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidname","widget",[_885],null,null,true);
return;
}
if(!_885||ColdFusion.trim(_885)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyname","widget",[_885],null,null,true);
return;
}
if(_886&&typeof (_886)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidaccordionpanelname","widget",[_886],null,null,true);
return;
}
if(!_886||ColdFusion.trim(_886)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyaccordionpanelname","widget",[_886],null,null,true);
return;
}
if(_887&&typeof (_887)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_886],null,null,true);
return;
}
if(!_887||ColdFusion.trim(_887)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_886],null,null,true);
return;
}
if(url&&typeof (url)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_886],null,null,true);
return;
}
if(!url||ColdFusion.trim(url)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_886],null,null,true);
return;
}
_886="cf_layoutarea"+_88b;
if(_88a&&(_88a instanceof Ext.Panel)){
var _88c=null;
var ele=document.getElementById(_886);
if(ele!=null){
ColdFusion.handleError(null,"layout.createaccordionpanel.duplicateel","widget",[_886],null,null,true);
return;
}
var _88e=true;
var _88f;
var _890=false;
var _891=null;
if(_889!=null){
if(typeof (_889)!="object"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidconfig","widget",[_886],null,null,true);
return;
}
}
if(_889&&typeof (_889.selected)!="undefined"&&_889.selected==true){
_890=true;
}
if(_889&&_889.titleicon){
if(typeof _889.titleicon!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitleicon","widget",[_886],null,null,true);
return;
}
var _892=Ext.String.format(ACCORDION_TITLE_ICON_CSS_TEMPLATE,_886,_889.titleicon);
Ext.util.CSS.createStyleSheet(_892,_886+"_cf_icon");
_891=_886;
}
var _893=_88a.layoutConfig;
var _894=true;
if(_893&&typeof _893.fill!="undefined"){
_894=_893.fill;
}
if(_889!=null&&typeof (_889.overflow)!="undefined"){
var _88f=new String(_889.overflow);
_88f=_88f.toLowerCase();
if(_88f!="visible"&&_88f!="auto"&&_88f!="scroll"&&_88f!="hidden"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflow","widget",[_886],null,null,true);
return;
}
if(!_894&&(_88f=="auto"||_88f=="scroll")){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflowforfillheight","widget",[_886],null,null,true);
return;
}
if(_88f=="hidden"){
_88e=false;
}
}else{
_88f="auto";
_88e=true;
}
var _895=document.getElementById(_885);
if(_895){
var _896=document.getElementById(_885);
var _897=document.createElement("div");
_897.id=_886;
if(_889!=null&&typeof (_889.align)!="undefined"){
_897.align=_889.align;
}
var _898="";
if(_88a.height){
_898="height:"+_88a.height+";";
}
if(_889!=null&&typeof (_889.style)!="undefined"){
var _899=new String(_889.style);
_899=_899.toLowerCase();
_898=_898+_899;
}
_898=_898+"overflow:"+_88f+";";
_897.style.cssText=_898;
_896.appendChild(_897);
}
var _89a=true;
var _89b=true;
itemobj=ColdFusion.Layout.InitAccordionChildPanel(_886,_88b,_887,_89b,_89a,_88e,_891,false);
_88a.add(itemobj);
if(url!=null&&typeof (url)!="undefined"&&url!=""){
if(url.indexOf("?")!=-1){
url=url+"&";
}else{
url=url+"?";
}
var _89c;
var _89d;
if(_889){
_89c=_889.callbackHandler;
_89d=_889.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_886,url,"GET",null,_89c,_89d);
}
_88a.doLayout();
if(_890){
ColdFusion.Layout.expandAccordion(_885,_88b);
}
ColdFusion.Log.info("layout.createaccordionpanel.created","widget",[_886]);
}else{
ColdFusion.handleError(null,"layout.createaccordionpanel.layoutnotfound","widget",[_885],null,null,true);
}
};
ColdFusion.Layout.initViewport=function(_89e,item){
var _8a0=new Array();
_8a0[0]=item;
var _8a1={items:_8a0,layout:"fit",name:_89e};
var _8a2=new Ext.Viewport(_8a1);
return _8a2;
};
ColdFusion.Layout.convertPositionToDirection=function(_8a3){
if(_8a3.toUpperCase()=="LEFT"){
return "west";
}else{
if(_8a3.toUpperCase()=="RIGHT"){
return "east";
}else{
if(_8a3.toUpperCase()=="CENTER"){
return "center";
}else{
if(_8a3.toUpperCase()=="BOTTOM"){
return "south";
}else{
if(_8a3.toUpperCase()=="TOP"){
return "north";
}
}
}
}
}
};
ColdFusion.Layout.addMapInAccordionMapping=function(_8a4,map){
ColdFusion.MapVsAccordion[_8a4]=map;
};
