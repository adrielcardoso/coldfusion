/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
cfinitgrid=function(){
if(!ColdFusion.Grid){
ColdFusion.Grid={};
}
var $G=ColdFusion.Grid;
if(!$G.GridBindelementsMap){
$G.GridBindelementsMap={};
}
var $L=ColdFusion.Log;
$G.init=function(id,name,_12e,_12f,edit,_131,_132,_133,_134,_135,_136,_137,_138,_139,_13a,_13b,_13c,_13d,_13e,_13f,_140,_141,_142,_143,_144,_145,_146,_147,_148){
var grid;
var _14a;
var _14b=false;
if(_13d&&typeof (_13d)!="undefined"){
_14a=_13d;
_14b=true;
}else{
_14a="rowmodel";
}
var _14c=_134;
var _14d={store:_135,columns:_134,selModel:_14a,autoSizeColumns:_132,autoSizeHeaders:_132,stripeRows:_138,autoExpandColumnId:_133};
if(_147!=null&&typeof _147!="undefined"){
_14d.plugins=_147;
}
var _14e=ColdFusion.objectCache[id];
var _14f=document.getElementById(_14e.gridId);
if(_14f!=null){
var _150=_14f.style.cssText;
if(typeof _150=="undefined"){
_150="";
}
_150="width:"+_136+"px;"+_150;
_14f.style.cssText=_150;
}
_14d.width=_136;
if(_132===true){
_14d.viewConfig={forceFit:true};
_14d.forceFit=true;
}else{
if(_13d&&typeof (_13d)!="undefined"){
_14d.autoExpandColumn=_133;
}else{
_14d.autoExpandColumn=_133;
}
}
if(_137){
_14d.height=_137;
}else{
_14d.autoHeight=true;
var _151=".x-grid3-header {position: relative;}";
Ext.util.CSS.createStyleSheet(_151,"_cf_grid"+id);
}
if(_13f&&typeof (_13f)!="undefined"){
_14d.features={ftype:"grouping"};
}
_14d.title=_140;
_14d.collapsible=_13e;
if(_13e&&_140==null){
_14d.title="  ";
}
var _152=ColdFusion.objectCache[id];
_152.bindOnLoad=_131;
_152.dynamic=_12f;
_152.styles=_139;
_152.grouping=_13f;
_152.onLoadFunction=_146;
_152.multiRowSelection=_14b;
_14d.renderTo=_152.gridId;
Ext.onReady(function(){
_14d.dockedItems={xtype:"toolbar",dock:"top"};
_14d.tbar=new Ext.Toolbar({hidden:true});
if(_12f){
_14d.bbar=new Ext.PagingToolbar({pageSize:_13a,store:_135});
if(_144&&(_141||_142)){
var _153=_14d.bbar;
if(_141){
_153.add({xtype:"button",text:_141,handler:$G.insertRow,scope:_152});
_153.add({xtype:"button",text:" save ",handler:$G.saveNewRecord,scope:_152});
_153.add({xtype:"button",text:" cancel ",handler:$G.cancelNewRecord,scope:_152});
}
if(_142){
_153.add({xtype:"button",text:_142,handler:$G.deleteRow,scope:_152});
}
}
}
if(edit&&!_12f){
var bbar=new Ext.Toolbar();
if(_141||_142){
if(_141){
bbar.add({xtype:"button",text:_141,handler:$G.insertRow,scope:_152});
}
if(_142){
bbar.add({xtype:"button",text:_142,handler:$G.deleteRow,scope:_152});
}
}else{
var bbar=new Ext.Toolbar({hidden:true});
}
_14d.bbar=bbar;
}
_135.pageSize=_13a;
grid=Ext.create("Ext.grid.Panel",_14d);
$G.Ext_caseInsensitive_sorting();
_135.addListener("load",$G.Actions.onLoad,_152,{delay:50});
grid.view.addListener("beforeshow",function(menu){
var _156=_14c.getColumnCount();
for(var i=0;i<_156;i++){
if("CFGRIDROWINDEX"==_14c.getDataIndex(i)){
menu.remove(menu.items["items"][i]);
break;
}
}
},this);
_152.grid=grid;
if(!_12f){
_135.addListener("load",$G.Actions.onLoad,_152,{delay:50});
_135.load();
}
if(_12f){
_135._cf_errorHandler=_145;
_135.proxy._cf_actions=_152;
_135.load({params:{start:0,limit:_13a}});
}else{
$G.applyStyles(_152);
}
if(_148){
ColdFusion.Bind.register(_148,{actions:_152},$G.bindHandler,false);
}
$L.info("grid.init.created","widget",[id]);
_152.init(id,name,_12e,_143,_12f,edit,_144,_145,_13c,_13a,_13b,_13f);
});
};
$G.applyStyles=function(_158){
Ext.util.CSS.createStyleSheet(_158.styles);
_158.stylesApplied=true;
};
$G.bindHandler=function(e,_15a){
$G.refresh(_15a.actions.id);
};
$G.bindHandler._cf_bindhandler=true;
$G.refresh=function(_15b,_15c){
var _15d=ColdFusion.objectCache[_15b];
if(_15d&&$G.Actions.prototype.isPrototypeOf(_15d)==true){
var _15e=_15d.grid.getStore();
if(_15d.dynamic){
_15d.editOldValue=null;
_15d.selectedRow=-1;
var bind=$G.GridBindelementsMap[_15b];
if(bind){
var url=_15e.proxy.url;
var _161=bind.split(";");
for(i=0;i<_161.length;i++){
var _162=_161[i].split(",");
indx=url.indexOf(_162[0]);
url1=url.substring(0,indx);
nxtindx=url.indexOf("&",indx);
url2=url.substring(nxtindx);
var eval=ColdFusion.Bind.getBindElementValue(_162[1],_162[2],_162[3]);
url=url1+"&"+_162[0]+"="+eval+url2;
}
_15e.proxy.url=url;
}
if(_15c){
_15e.reload();
}else{
_15e.reload({params:{start:0,limit:_15d.pageSize}});
}
}
}else{
ColdFusion.handleError(null,"grid.refresh.notfound","widget",[_15b],null,null,true);
return;
}
if(_15d.multiRowSelection){
var _164=_15d.grid.getView().getHeaderCell(0);
if(_164!=null){
var _165=Ext.Element.get(_164).first();
if(_165){
_165.replaceClass("x-grid3-hd-checker-on");
}
}
}
$L.info("grid.refresh.success","widget",[_15b]);
};
$G.Ext_caseInsensitive_sorting=function(){
Ext.data.Store.prototype.sortData=function(f,_167){
_167=_167||"ASC";
var st=this.fields.get(f).sortType;
var fn=function(r1,r2){
var v1=st(r1.data[f]),v2=st(r2.data[f]);
if(v1.toLowerCase){
v1=v1.toLowerCase();
v2=v2.toLowerCase();
}
return v1>v2?1:(v1<v2?-1:0);
};
this.data.sort(_167,fn);
if(this.snapshot&&this.snapshot!=this.data){
this.snapshot.sort(_167,fn);
}
};
};
$G.getTopToolbar=function(_16d){
var _16e=ColdFusion.objectCache[_16d];
if(!_16e){
ColdFusion.handleError(null,"grid.getTopToolbar.notfound","widget",[_16d],null,null,true);
return;
}
return _16e.grid.getDockedItems()[1];
};
$G.showTopToolbar=function(_16f){
var _170=ColdFusion.objectCache[_16f];
if(!_170){
ColdFusion.handleError(null,"grid.showTopToolbar.notfound","widget",[_16f],null,null,true);
return;
}
var tbar=_170.grid.getDockedItems()[1];
if(!tbar){
ColdFusion.handleError(null,"grid.showTopToolbar.toolbarNotDefined","widget",[_16f],null,null,true);
return;
}
tbar.show();
};
$G.hideTopToolbar=function(_172){
var _173=ColdFusion.objectCache[_172];
if(!_173){
ColdFusion.handleError(null,"grid.hideTopToolbar.notfound","widget",[_172],null,null,true);
return;
}
var tbar=_173.grid.getDockedItems()[1];
if(!tbar){
ColdFusion.handleError(null,"grid.hideTopToolbar.toolbarNotDefined","widget",[_172],null,null,true);
return;
}
tbar.hide();
};
$G.refreshTopToolbar=function(_175){
var _176=ColdFusion.objectCache[_175];
if(!_176){
ColdFusion.handleError(null,"grid.refreshTopToolbar.notfound","widget",[_175],null,null,true);
return;
}
var tbar=_176.grid.getDockedItems()[1];
if(!tbar){
ColdFusion.handleError(null,"grid.refreshTopToolbar.toolbarNotDefined","widget",[_175],null,null,true);
return;
}
tbar.doLayout();
if(tbar.isVisible()==false){
tbar.show();
}
};
$G.getBottomToolbar=function(_178){
var _179=ColdFusion.objectCache[_178];
if(!_179){
ColdFusion.handleError(null,"grid.getBottomToolbar.notfound","widget",[_178],null,null,true);
return;
}
return _179.grid.getDockedItems()[_179.grid.getDockedItems().length-1];
};
$G.showBottomToolbar=function(_17a){
var _17b=ColdFusion.objectCache[_17a];
if(!_17b){
ColdFusion.handleError(null,"grid.showBottomToolbar.notfound","widget",[_17a],null,null,true);
return;
}
var tbar=_17b.grid.getDockedItems()[_17b.grid.getDockedItems().length-1];
if(!tbar){
ColdFusion.handleError(null,"grid.showBottomToolbar.toolbarNotDefined","widget",[_17a],null,null,true);
return;
}
tbar.show();
};
$G.hideBottomToolbar=function(_17d){
var _17e=ColdFusion.objectCache[_17d];
if(!_17e){
ColdFusion.handleError(null,"grid.hideBottomToolbar.notfound","widget",[_17d],null,null,true);
return;
}
var tbar=_17e.grid.getDockedItems()[_17e.grid.getDockedItems().length-1];
if(!tbar){
ColdFusion.handleError(null,"grid.hideBottomToolbar.toolbarNotDefined","widget",[_17d],null,null,true);
return;
}
tbar.hide();
};
$G.refreshBottomToolbar=function(_180){
var _181=ColdFusion.objectCache[_180];
if(!_181){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.notfound","widget",[_180],null,null,true);
return;
}
var tbar=_181.grid.getDockedItems()[_181.grid.getDockedItems().length-1];
if(!tbar){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.toolbarNotDefined","widget",[_180],null,null,true);
return;
}
tbar.doLayout();
if(tbar.isVisible()==false){
tbar.show();
}
};
$G.sort=function(_183,_184,_185){
var _186=ColdFusion.objectCache[_183];
if(!_186){
ColdFusion.handleError(null,"grid.sort.notfound","widget",[_183],null,null,true);
return;
}
_184=_184.toUpperCase();
var _187=-1;
var _188=_186.grid.columns;
for(var i=0;i<_188.length-1;i++){
if(_184==_188[i].colName){
_187=i;
break;
}
}
if(_187==-1){
ColdFusion.handleError(null,"grid.sort.colnotfound","widget",[_184,_183],null,null,true);
return;
}
if(!_185){
_185="ASC";
}
_185=_185.toUpperCase();
if(_185!="ASC"&&_185!="DESC"){
ColdFusion.handleError(null,"grid.sort.invalidsortdir","widget",[_185,_183],null,null,true);
return;
}
var _18a=_186.grid.getStore();
_18a.sort(_184,_185);
};
$G.getGridObject=function(_18b){
if(!_18b){
ColdFusion.handleError(null,"grid.getgridobject.missinggridname","widget",null,null,null,true);
return;
}
var _18c=ColdFusion.objectCache[_18b];
if(_18c==null||$G.Actions.prototype.isPrototypeOf(_18c)==false){
ColdFusion.handleError(null,"grid.getgridobject.notfound","widget",[_18b],null,null,true);
return;
}
return _18c.grid;
};
$G.getSelectedRows=function(_18d){
if(!_18d){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _18e=ColdFusion.objectCache[_18d];
var _18f=new Array();
var _190=_18e.grid.getSelectionModel();
var _191=_190.selected;
var _192=_18e.grid.columns;
var _193=0;
if(_18e.multiRowSelection===true&&_18e.dynamic===false){
_193++;
}
for(i=0;i<_191.length;i++){
var _194=_191.items[i].data;
var _195={};
for(var _196=_193;_196<_192.length-1;_196++){
var key=_192[_196].dataIndex;
_195[key]=_194[key];
}
_18f[i]=_195;
}
return _18f;
};
$G.clearSelectedRows=function(_198){
if(!_198){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _199=ColdFusion.objectCache[_198];
var _19a=_199.grid.getSelectionModel();
_19a.deselectAll();
if(_199.multiRowSelection){
}
};
$G.Actions=function(_19b){
this.gridId=_19b;
this.init=$G.Actions.init;
this.onChangeHandler=$G.Actions.onChangeHandler;
this.onChangeHandler_MultiRowsDelete=$G.Actions.onChangeHandler_MultiRowsDelete;
this.selectionChangeEvent=new ColdFusion.Event.CustomEvent("cfGridSelectionChange",_19b);
this.fireSelectionChangeEvent=$G.fireSelectionChangeEvent;
this._cf_getAttribute=$G.Actions._cf_getAttribute;
this._cf_register=$G.Actions._cf_register;
this.loaded=false;
};
$G.Actions.init=function(id,_19d,_19e,_19f,_1a0,edit,_1a2,_1a3,_1a4,_1a5,_1a6,_1a7){
this.id=id;
this.gridName=_19d;
this.formId=_19e;
this.form=document.getElementById(_19e);
this.cellClickInfo=_19f;
this.edit=edit;
this.onChangeFunction=_1a2;
this.onErrorFunction=_1a3;
this.preservePageOnSort=_1a4;
this.pageSize=_1a5;
this.selectedRow=-1;
this.selectOnLoad=_1a6;
this.grouping=_1a7;
this.grid.addListener("cellclick",$G.cellClick,this,true);
this.editField=document.createElement("input");
this.editField.setAttribute("name",_19d);
this.editField.setAttribute("type","hidden");
this.form.appendChild(this.editField);
if(edit){
if(!_1a0){
var _1a8=this.grid.columns;
this.editFieldPrefix="__CFGRID__EDIT__=";
var i=0;
var _1aa=_1a8.length-1;
if(this.multiRowSelection===true&&this.dynamic===false){
i++;
_1aa--;
}
this.editFieldPrefix+=_1aa+$G.Actions.fieldSep;
var _1ab=true;
for(i;i<_1a8.length-1;i++){
if(!_1ab){
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldPrefix+=_1a8[i].colName;
this.editFieldPrefix+=$G.Actions.valueSep;
if(_1a8[i].editor){
this.editFieldPrefix+="Y";
}else{
this.editFieldPrefix+="N";
}
_1ab=false;
}
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldState=[];
this.editFieldState.length=this.grid.getStore().getTotalCount();
$G.Actions.computeEditField(this);
this.insertInProgress=false;
this.insertEvent=null;
this.grid.addListener("beforeedit",$G.Actions.beforeEdit,this);
this.grid.addListener("edit",$G.Actions.afterEdit,this,true);
}
if(_1a0){
this.grid.getStore().addListener("beforeload",$G.Actions.beforeLoad,this,true);
}
this.grid.getSelectionModel().addListener("select",$G.rowSelect,this,true);
this.grid.getSelectionModel().addListener("beforerowselect",$G.beforeRowSelect,this,true);
};
$G.Actions.beforeLoad=function(_1ac,_1ad){
var _1ae=_1ac.sortInfo;
var _1af=((typeof this.sortCol!="undefined"&&_1ae.field!=this.sortCol)||(typeof this.direction!="undefined"&&_1ae.direction!=this.sortDir));
if(_1af&&!this.preservePageOnSort){
_1ad.params.start=0;
}
};
$G.Actions.onLoad=function(_1b0){
this.editOldValue=null;
this.selectedRow=-1;
this.insertInProgress=false;
var _1b1=0;
if((this.bindOnLoad||!this.dynamic)&&this.selectOnLoad&&!this.grouping){
this.grid.getSelectionModel().select(_1b1,false);
}
if(!this.gridRendered&&this.onLoadFunction&&typeof this.onLoadFunction=="function"){
this.gridRendered=true;
this.onLoadFunction.call(null,this.grid);
}
$G.applyStyles(_1b0);
try{
var _1b2=Ext.ComponentQuery.query("tabpanel");
if(_1b2&&this.grid&&this.loaded==false){
for(var i=0;i<_1b2.length;i++){
if(_1b2[i].body.dom.innerHTML.indexOf(this.grid.id)>0){
_1b2[i].doComponentLayout();
this.loaded=true;
}
}
}
}
catch(exception){
}
};
$G.Actions._cf_getAttribute=function(_1b4){
_1b4=_1b4.toUpperCase();
var _1b5=this.selectedRow;
var _1b6=null;
if(_1b5!=0&&(!_1b5||_1b5==-1)){
return _1b6;
}
var ds=this.grid.getStore();
var _1b8=(this.dynamic)?ds.getAt(_1b5):ds.getById(_1b5);
_1b6=_1b8.get(_1b4);
return _1b6;
};
$G.Actions._cf_register=function(_1b9,_1ba,_1bb){
this.selectionChangeEvent.subscribe(_1ba,_1bb);
};
$G.rowSelect=function(_1bc,_1bd,row){
var _1bf="";
var _1c0=_1bc.selected.items;
if(_1c0.length==0){
return;
}
var _1c1=_1c0[0].get("CFGRIDROWINDEX")||row;
if(this.selectedRow!=_1c1){
this.selectedRow=_1c1;
var _1c2=true;
for(col in _1c0[0].data){
if(col=="CFGRIDROWINDEX"){
continue;
}
if(typeof col=="undefined"||col=="undefined"){
continue;
}
if(!_1c2){
_1bf+="; ";
}
_1bf+="__CFGRID__COLUMN__="+col+"; ";
_1bf+="__CFGRID__DATA__="+_1c0[0].data[col];
_1c2=false;
}
this.fireSelectionChangeEvent();
this.insertInProgress=false;
}
};
$G.beforeRowSelect=function(_1c3,row){
var ds=this.grid.getStore();
var _1c6=ds.getAt(row);
return !$G.isNullRow(_1c6.data);
};
$G.isNullRow=function(data){
var _1c8=true;
for(col in data){
if(data[col]!=null){
_1c8=false;
break;
}
}
return _1c8;
};
$G.fireSelectionChangeEvent=function(){
$L.info("grid.fireselectionchangeevent.fire","widget",[this.id]);
this.selectionChangeEvent.fire();
};
$G.cellClick=function(grid,td,_1cb,_1cc,tr,_1ce,e,_1d0){
var _1d1=this.cellClickInfo.colInfo[_1cb];
if(_1d1){
var _1d2=grid.getSelectionModel().selected;
url=_1d1.href;
var _1d3=_1d1.hrefKey;
var _1d4=_1d1.target;
var _1d5=this.appendKey;
if(this.cellClickInfo.appendKey){
var _1d6;
if(_1d3||_1d3==0){
var _1d7=grid.getStore().getAt(_1ce);
var _1d8=grid.panel.columns[_1d3].dataIndex;
_1d6=_1d7.get(_1d8);
}else{
var _1d9=this.grid.columns;
_1d6=_1d2.items[0].get(_1d9[0].dataIndex);
for(var i=1;i<_1d9.length-1;i++){
_1d6+=","+_1d2.items[0].get(_1d9[i].dataIndex);
}
}
if(url.indexOf("?")!=-1){
url+="&CFGRIDKEY="+_1d6;
}else{
url+="?CFGRIDKEY="+_1d6;
}
}
if(_1d4){
_1d4=_1d4.toLowerCase();
if(_1d4=="_top"){
_1d4="top";
}else{
if(_1d4=="_parent"){
_1d4="parent";
}else{
if(_1d4=="_self"){
_1d4=window.name;
}else{
if(_1d4=="_blank"){
window.open(encodeURI(url));
return;
}
}
}
}
if(!parent[_1d4]){
ColdFusion.handleError(null,"grid.cellclick.targetnotfound","widget",[_1d4]);
return;
}
parent[_1d4].location=encodeURI(url);
}else{
window.location=encodeURI(url);
}
}
};
$G.insertRow=function(){
if(this.insertInProgress&&this.dynamic){
ColdFusion.handleError(null,"Multiple row insert is not supported","Grid",[this.gridId],null,null,true);
return;
}
var _1db={action:"I",values:[]};
var _1dc=this.grid.columns;
var _1dd=this.grid.getStore();
var _1de={};
var _1df="{[";
for(var i=0;i<_1dc.length-1;i++){
var _1e1="";
_1db.values[i]=[_1e1,_1e1];
_1de[_1dc[i].dataIndex]=_1e1;
_1df=_1df+_1dc[i].colName+":'"+_1e1+"',";
}
_1de["CFGRIDROWINDEX"]=_1dd.getCount()+1;
_1df=_1df+"CFGRIDROWINDEX:'"+(_1dd.getCount()+1)+"']}";
_1dd.add(_1df);
_1dd.getAt(_1dd.getCount()-1).data["CFGRIDROWINDEX"]=_1dd.getCount();
if(this.dynamic==true){
this.selectedRow=_1dd.getCount();
}
this.editFieldState.push(_1db);
this.grid.getSelectionModel().select(_1dd.getCount()-1);
this.insertInProgress=true;
$G.Actions.computeEditField(this);
};
$G.saveNewRecord=function(){
if(!this.insertInProgress){
return;
}
var _1e2=this.selectedRow;
var _1e3=this.insertEvent;
if(_1e2==-1){
return;
}
if(this.onChangeFunction){
this.onChangeHandler("I",_1e2-1,_1e3,$G.insertRowCallback);
}else{
if(this.dynamic==false){
var _1e4=this.grid.getStore();
var _1e5=_1e3.record;
var _1e6=new Array(1);
_1e6[0]=_1e5;
var _1e7=_1e4.getAt(this.selectedRow-1);
_1e4.remove(_1e7);
_1e4.add(_1e6);
}
}
this.insertInProgress=false;
this.insertEvent=null;
};
$G.cancelNewRecord=function(){
if(!this.insertInProgress){
return;
}
this.editFieldState.pop();
var _1e8=this.grid.getStore();
var _1e9=_1e8.getAt(this.selectedRow-1);
_1e8.remove(_1e9);
this.insertInProgress=false;
this.insertEvent=null;
this.selectedRow=this.selectedrow-1;
};
$G.deleteRow=function(){
var _1ea=null;
var _1eb;
if(this.multiRowSelection===true){
var _1ec=this.grid.getSelectionModel();
_1ea=_1ec.selected;
}
if(_1ea==null){
_1eb=this.selectedRow;
}
if(_1eb==-1&&_1ea==null){
return;
}
if(this.onChangeFunction){
if(_1ea!=null){
this.onChangeHandler_MultiRowsDelete("D",_1ea,null,$G.deleteRowCallback);
}else{
this.onChangeHandler("D",_1eb,null,$G.deleteRowCallback);
}
}else{
if(!this.dynamic){
var _1ed=this.grid.getStore();
if(_1ea!=null){
for(i=0;i<_1ea.length;i++){
var _1ee=_1ed.indexOf(_1ea[i]);
var _1ef=this.editFieldState[_1ee];
if(_1ef){
_1ef.action="D";
}else{
_1ef=$G.Actions.initEditState(this,"D",_1ea[i],_1ee+1);
}
}
for(i=0;i<_1ea.length;i++){
_1ed.remove(_1ea[i]);
}
}else{
var _1ef=this.editFieldState[_1eb-1];
if(_1ef){
_1ef.action="D";
}else{
var _1f0=this.grid.getStore().getById(_1eb);
_1ef=$G.Actions.initEditState(this,"D",_1f0,_1eb);
}
_1ed.remove(this.grid.getSelectionModel().getSelection());
}
$G.Actions.computeEditField(this);
this.grid.stopEditing();
this.selectedRow=-1;
}
}
};
$G.deleteRowCallback=function(_1f1,_1f2){
var _1f3=_1f2._cf_grid.getStore();
var _1f4=_1f2._cf_grid_properties;
var _1f2=_1f3.lastOptions;
var key="start";
if(_1f3.getCount()==1){
if(_1f2.start>=_1f2.limit){
_1f2.start=_1f2.start-_1f2.limit;
}
_1f2.page=_1f2.page-1;
_1f3.reload(_1f2);
}else{
_1f3.reload();
}
if(_1f4.multiRowSelection){
var _1f6=_1f4.grid.getView().headerCt(0);
if(_1f6!=null){
var _1f7=Ext.Element.get(_1f6).first();
if(_1f7){
_1f7.replaceClass("x-grid3-hd-checker-on");
}
}
}
};
$G.insertRowCallback=function(_1f8,_1f9){
var _1fa=_1f9._cf_grid.getStore();
var _1fb=_1f9._cf_grid.actions;
_1fa.reload();
};
$G.Actions.beforeEdit=function(_1fc,e,_1fe){
if($G.isNullRow(e.record.data)){
return false;
}
this.editColumn=e.column;
this.editOldValue=e.value;
};
$G.Actions.afterEdit=function(_1ff,_200,_201){
var _202=_200.value;
if(_202==this.editOldValue){
return;
}
if(this.insertInProgress==false&&this.onChangeFunction){
this.onChangeHandler("U",this.selectedRow,_200);
}else{
if(!this.dynamic){
rowidx=_200.rowIdx;
if(!rowidx&&rowidx!=0){
rowidx=_200.row;
}
var _203=$G.computeActualRow_editField(this.editFieldState,rowidx+1);
var _204=this.editFieldState[_203-1];
var _205=_200.colIdx;
if(!_205&&_205!=0){
_205=_200.column;
}
if(_204){
if(this.multiRowSelection===true&&this.insertInProgress==true){
_205=_205-1;
}
_204.values[_205][1]=_202;
}else{
var _206=this.grid.getStore().getById(this.selectedRow);
_204=$G.Actions.initEditState(this,"U",_206,_203);
var _207=this.editOldValue+"";
if(_202.getDayOfYear){
if(_207&&typeof _207=="string"){
_207=new Date(_207);
}
_204.values[_205][1]=_202.format("F, j Y H:i:s");
_204.values[_205][0]=_207?_207.format("F, j Y H:i:s"):_207;
}else{
_204.values[_205][0]=_207;
_204.values[_205][1]=_202;
}
}
$G.Actions.computeEditField(this);
}
}
this.editOldValue=null;
this.fireSelectionChangeEvent();
};
$G.computeActualRow_editField=function(_208,_209){
if(_208.length==_209){
return _209;
}
var _20a=0;
var _20b=0;
for(;_20b<_208.length&&_20a<_209;_20b++){
var _20c=_208[_20b];
if(!_20c||_20c.action!="D"){
_20a++;
}
}
return _20b;
};
$G.Actions.onChangeHandler=function(_20d,_20e,_20f,_210){
var _211={};
var _212={};
var data="";
if(null==_20f){
data=this.grid.getStore().getAt(_20e).data;
}else{
data=_20f?_20f.record.data:this.grid.getStore().getAt(_20e).data;
}
for(col in data){
_211[col]=data[col];
}
if(_20d=="U"){
if((_20f.value==null||_20f.value=="")&&(_20f.originalValue==null||_20f.originalValue=="")){
return;
}
if(_20f.value&&_20f.value.getDayOfYear){
if(typeof _20f.originalValue=="string"){
var _214=new Date(_20f.originalValue);
}
if(_214!=null&&_214.getElapsed(_20f.value)==0){
return;
}else{
_211[_20f.field]=_20f.originalValue;
_212[_20f.field]=_20f.value.format("F, j Y H:i:s");
}
}else{
_211[_20f.field]=_20f.originalValue;
_212[_20f.field]=_20f.value;
}
}
this.onChangeFunction(_20d,_211,_212,_210,this.grid,this.onErrorFunction,this);
};
$G.Actions.onChangeHandler_MultiRowsDelete=function(_215,_216,_217,_218){
var _219=new Array();
var _21a={};
for(i=0;i<_216.length;i++){
_219[i]=_216.items[i].data;
}
this.onChangeFunction(_215,_219,_21a,_218,this.grid,this.onErrorFunction,this);
};
$G.Actions.initEditState=function(_21b,_21c,_21d,_21e){
var _21f={action:_21c,values:[]};
var _220=_21b.grid.columns;
var _221=_220.length-1;
_21f.values.length=_221;
var i=0;
if(_21b.multiRowSelection===true&&_21b.dynamic===false){
i=i++;
}
for(i;i<_221;i++){
var _223=_21d.get(_220[i].colName);
_21f.values[i]=[_223,_223];
}
_21b.editFieldState[_21e-1]=_21f;
return _21f;
};
$G.Actions.fieldSep=eval("'\\u0001'");
$G.Actions.valueSep=eval("'\\u0002'");
$G.Actions.nullValue=eval("'\\u0003'");
$G.Actions.computeEditField=function(_224){
if(_224.dynamic){
return;
}
var _225=_224.editFieldPrefix;
var _226=_224.editFieldState;
var _227=_224.grid.columns;
var _228=0;
var _229="";
for(var i=0;i<_226.length;i++){
var _22b=_226[i];
if(_22b){
_228++;
_229+=$G.Actions.fieldSep;
_229+=_22b.action+$G.Actions.valueSep;
var _22c=_22b.values;
if(_224.multiRowSelection===true&&_224.dynamic===false&&_22b.action!="I"){
_22c=_22c.slice(1,_22c.length);
}
for(var j=0;j<_22c.length;j++){
if(j>0){
_229+=$G.Actions.valueSep;
}
var _22e=($G.Actions.isNull(_22c[j][0]))?$G.Actions.nullValue:_22c[j][0];
var _22f=($G.Actions.isNull(_22c[j][1]))?$G.Actions.nullValue:_22c[j][1];
var _230=j;
if(_224.multiRowSelection===true){
_230++;
}
if(_227[_230].getEditor()&&_22f==$G.Actions.nullValue&&_227[_230].getEditor().xtype=="checkbox"){
_22f="0";
}
if(_22b.action!="I"||(_22b.action=="I"&&_227[_230].getEditor())){
if(_227[_230].type=="date"){
if(_22f!=null&&_22f!=$G.Actions.nullValue){
if(typeof _22f=="string"){
_22f=new Date(_22f);
}
_22f=Ext.Date.format(_22f,"F, j Y H:i:s");
}
if(_22e!=null&&_22e!=$G.Actions.nullValue){
if(typeof _22e=="string"){
_22e=new Date(_22e);
}
_22e=Ext.Date.format(_22e,"F, j Y H:i:s");
}
}
_229+=_22f;
if(_22b.action=="U"&&_227[_230].getEditor()){
_229+=$G.Actions.valueSep+_22e;
}
}
}
}
}
_225+=_228+_229;
_224.editField.setAttribute("value",_225);
};
$G.Actions.isNull=function(val){
var ret=(val==null||typeof (val)=="undefined"||val.length==0);
return ret;
};
$G.loadData=function(data,_234){
_234._cf_gridDataProxy.loadResponse(data,_234);
var _235=ColdFusion.objectCache[_234._cf_gridname];
$G.applyStyles(_235);
$L.info("grid.loaddata.loaded","widget",[_234._cf_gridname]);
if($G.Actions.isNull(data.TOTALROWCOUNT)==false&&data.TOTALROWCOUNT==0){
_235.fireSelectionChangeEvent();
}
};
$G.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
str+=value;
}
return str;
};
$G.formatBoolean=function(v,p,_23a){
return "<div class=\"x-grid3-check-col"+(v?"-on":"")+" x-grid3-cc-"+this.id+"\">&#160;</div>";
};
$G.formatDate=function(_23b,p,_23d){
if(_23b&&!_23b.dateFormat){
_23b=new Date(_23b);
}
var _23e=this.dateFormat?this.dateFormat:"m/d/y";
return _23b?Ext.Date.dateFormat(_23b,_23e):"";
};
$G.convertDate=function(_23f,p,_241){
if(_23f&&!_23f.dateFormat){
_23f=new Date(_23f);
}
var _242=this.dateFormat?this.dateFormat:"m/d/y";
return _23f;
};
$G.ExtProxy=function(_243,_244){
this.api={load:true,create:undefined,save:undefined,destroy:undefined};
$G.ExtProxy.superclass.constructor.call(this);
this.bindHandler=_243;
this.errorHandler=_244;
};
Ext.extend($G.ExtProxy,Ext.data.DataProxy,{_cf_firstLoad:true,load:function(_245,_246,_247,_248,arg){
if(!this._cf_actions.bindOnLoad){
var _24a={"_cf_reader":_246,"_cf_grid_errorhandler":this.errorHandler,"_cf_scope":_248,"_cf_gridDataProxy":this,"_cf_gridname":this._cf_gridName,"_cf_arg":arg,"_cf_callback":_247,"ignoreData":true};
var data=[];
for(i=0;i<_245.limit;i++){
data.push(new Ext.data.Record({}));
}
this.loadResponse(data,_24a);
this._cf_actions.bindOnLoad=true;
}else{
var _24c=(_245.start/_245.limit)+1;
if(!_245.sort){
_245.sort="";
}
if(!_245.dir){
_245.dir="";
}
this.bindHandler(this,_24c,_245.limit,_245.sort,_245.dir,this.errorHandler,_247,_248,arg,_246);
}
},loadResponse:function(data,_24e){
var _24f=null;
if(_24e.ignoreData){
_24f={success:true,records:data,totalRecords:data.length};
}else{
var _250;
if(!data){
_250="grid.extproxy.loadresponse.emptyresponse";
}else{
if(!data.TOTALROWCOUNT&&data.TOTALROWCOUNT!=0){
_250="grid.extproxy.loadresponse.totalrowcountmissing";
}else{
if(!ColdFusion.Util.isInteger(data.TOTALROWCOUNT)){
_250="grid.extproxy.loadresponse.totalrowcountinvalid";
}else{
if(!data.QUERY){
_250="grid.extproxy.loadresponse.querymissing";
}else{
if(!data.QUERY.COLUMNS||!ColdFusion.Util.isArray(data.QUERY.COLUMNS)||!data.QUERY.DATA||!ColdFusion.Util.isArray(data.QUERY.DATA)||(data.QUERY.DATA.length>0&&!ColdFusion.Util.isArray(data.QUERY.DATA[0]))){
_250="grid.extproxy.loadresponse.queryinvalid";
}
}
}
}
}
if(_250){
ColdFusion.handleError(_24e._cf_grid_errorHandler,_250,"widget");
this.fireEvent("loadexception",this,_24e,data,e);
return;
}
_24f=_24e._cf_reader.readRecords(data);
}
this.fireEvent("load",this,_24e,_24e._cf_arg);
_24e._cf_callback.call(_24e._cf_scope,_24f,_24e._cf_arg,true);
},update:function(_251){
},updateResponse:function(_252){
}});
$G.ExtReader=function(_253){
this.recordType=Ext.data.Record.create(_253);
};
Ext.extend($G.ExtReader,Ext.data.DataReader,{readRecords:function(_254){
var _255=[];
var cols=_254.QUERY.COLUMNS;
var data=_254.QUERY.DATA;
for(var i=0;i<data.length;i++){
var _259={};
for(var j=0;j<cols.length;j++){
_259[cols[j]]=data[i][j];
}
_255.push(new Ext.data.Record(_259));
}
return {success:true,records:_255,totalRecords:_254.TOTALROWCOUNT};
}});
$G.CheckColumn=function(_25b){
Ext.apply(this,_25b);
if(!this.id){
this.id=Ext.id();
}
this.renderer=this.renderer.bind(this);
};
$G.findColumnIndex=function(grid,_25d){
var _25e=grid.headerCt.getGridColumns();
for(var i=0;i<_25e.length;i++){
if(_25e[i].dataIndex==_25d){
return i;
}
}
};
$G.CheckColumn.prototype={init:function(grid){
this.grid=grid;
this.count=0;
this.columnIndex=$G.findColumnIndex(this.grid,this.dataIndex);
this.grid.on("render",function(){
var view=this.grid.getView();
if(this.editable==true){
this.grid.addListener("itemmousedown",this.onMouseDown,this);
}
},this);
},onMouseDown:function(thi,_263,item,_265,e,_267){
var t=e.target;
if(t.className&&t.className.indexOf("x-grid-cc-"+this.id)!=-1){
e.stopEvent();
var _269=ColdFusion.clone(_263);
_269.data=ColdFusion.clone(_263.data);
this.grid.getSelectionModel().select(_265);
this.grid.getSelectionModel().fireEvent("rowselect",this.grid.getSelectionModel(),_265);
this.grid.fireEvent("beforeedit",this,{grid:this.grid,row:_265,record:_263,column:this.columnIndex,field:this.dataIndex,value:_263.data[this.dataIndex]});
_263.set(this.dataIndex,this.toggleBooleanValue(_263.data[this.dataIndex]));
this.grid.fireEvent("edit",this,{grid:this.grid,row:_265,record:_269,column:this.columnIndex,field:this.dataIndex,value:_263.data[this.dataIndex],originalValue:_269.data[this.dataIndex]});
}
},toggleBooleanValue:function(v){
v=typeof v=="undefined"?"N":(typeof v=="string"?v.toUpperCase():v);
if(v==="Y"){
return "N";
}
if(v==="N"){
return "Y";
}
if(v===true){
return false;
}
if(v===false){
return true;
}
if(v===0){
return 1;
}
if(v===1){
return 0;
}
if(v==="YES"){
return "NO";
}
if(v==="NO"){
return "YES";
}
if(v==="T"){
return "F";
}
if(v==="F"){
return "T";
}
return "Y";
},renderer:function(v,p,_26d){
p.css+=" x-grid-check-col-td";
var _26e=false;
v=(typeof v=="string")?v.toUpperCase():v;
if(typeof v!="undefined"&&(v==1||v=="1"||v=="Y"||v=="YES"||v=="TRUE"||v===true||v==="T")){
_26e=true;
}
return "<div style=\"background-repeat: no-repeat;background-position:center center;width:auto\" class=\"x-grid-cell-checker"+(_26e!=true?"-off":"")+" x-grid-cc-"+this.id+"\">&#160;</div>";
}};
Ext.define("MyReader",{extend:"Ext.data.reader.Json",alias:"reader.my-json",read:function(_26f){
var _270="";
if(!this.proxy._cf_actions.bindOnLoad){
_270="{  totalrows:0, data :[] }";
this.proxy._cf_actions.bindOnLoad=true;
}else{
_270=$G.queryToJson(_26f.responseText);
}
$G.applyStyles(this.proxy._cf_actions);
return this.callParent([Ext.decode(_270)]);
}});
Ext.define("customcfajax",{extend:"Ext.data.proxy.Ajax",alias:"proxy.customcfajax",getParams:function(_271){
params=this.callParent(arguments);
if(!(this.sortParam&&_271.sorters&&_271.sorters.length>0)){
params[this.sortParam]="";
params[this.directionParam]="ASC";
}
return params;
}});
$G.queryToJson=function(data){
var _273=[];
jsondata=ColdFusion.AjaxProxy.JSON.decode(data);
var cols=jsondata.QUERY.COLUMNS;
var data=jsondata.QUERY.DATA;
var _275="{  totalrows:"+jsondata.TOTALROWCOUNT+", data :[";
for(var i=0;i<data.length;i++){
var _277={};
_275=_275+"{";
for(var j=0;j<cols.length;j++){
if(data[i][j]==null){
data[i][j]="";
}
_277[cols[j]]=data[i][j];
encodedata=ColdFusion.AjaxProxy.JSON.encode(data[i][j]);
_275=_275+cols[j]+":"+encodedata;
if(j!=cols.length-1){
_275=_275+",";
}
}
_275=_275+"}";
if(i!=data.length-1){
_275=_275+",";
}
}
_275=_275+"]}";
return _275;
};
$G.queryToArray=function(data){
var _27a=[];
jsondata=ColdFusion.AjaxProxy.JSON.decode(data);
var cols=jsondata.QUERY.COLUMNS;
var data=jsondata.QUERY.DATA;
var _27c=new Array();
for(var i=0;i<data.length;i++){
var _27e=new Array(1);
for(var j=0;j<cols.length;j++){
_27e[j]=data[i][j];
}
_27c[i]=_27e;
}
return _27c;
};
};
cfinitgrid();
