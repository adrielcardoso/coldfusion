/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.RichText){
ColdFusion.RichText={};
}
ColdFusion.RichText.editorState={};
ColdFusion.RichText.buffer=null;
ColdFusion.RichText.initialize=function(id,_c0,_c1,_c2,_c3,_c4,_c5,_c6,_c7,_c8,_c9,_ca,_cb,_cc,_cd){
var _ce=new FCKeditor(id);
ColdFusion.RichText.editorState[id]=false;
_ce.Value=_c1;
_ce.richtextid=id;
if(_c2!=null){
_ce.BasePath=_c2;
}
if(_c3!=null){
_ce.Width=_c3;
}
if(_c4!=null){
_ce.Height=_c4;
}
if(_c5!=null){
_ce.Config.FontNames=_c5;
}
if(_c6!=null){
_ce.Config.FontSizes=_c6;
}
if(_c7!=null){
_ce.Config.FontFormats=_c7;
}
_ce.Config.LinkBrowserURL=_ce.BasePath+"editor/filemanager/browser/default/browser.html?Connector=../../connectors/cfm/connector.cfm";
_ce.Config.LinkUploadURL=_ce.BasePath+"editor/filemanager/connectors/cfm/upload.cfm";
_ce.Config.ImageBrowserURL=_ce.BasePath+"editor/filemanager/browser/default/browser.html?Type=Image&Connector=../../connectors/cfm/connector.cfm";
_ce.Config.ImageUploadURL=_ce.BasePath+"editor/filemanager/connectors/cfm/upload.cfm?Type=Image";
_ce.Config.FlashBrowserURL=_ce.BasePath+"editor/filemanager/browser/default/browser.html?Type=Flash&Connector=../../connectors/cfm/connector.cfm";
_ce.Config.FlashUploadURL=_ce.BasePath+"editor/filemanager/connectors/cfm/upload.cfm?Type=Flash";
if(window._cf_clientid){
_ce.Config.LinkBrowserURL=_ce.Config.LinkBrowserURL+"&_cf_clientid="+_cf_clientid;
_ce.Config.LinkUploadURL=_ce.Config.LinkUploadURL+"?_cf_clientid="+_cf_clientid;
_ce.Config.ImageBrowserURL=_ce.Config.ImageBrowserURL+"&_cf_clientid="+_cf_clientid;
_ce.Config.ImageUploadURL=_ce.Config.ImageUploadURL+"&_cf_clientid="+_cf_clientid;
_ce.Config.FlashBrowserURL=_ce.Config.FlashBrowserURL+"&_cf_clientid="+_cf_clientid;
_ce.Config.FlashUploadURL=_ce.Config.FlashUploadURL+"&_cf_clientid="+_cf_clientid;
}
if(_c8!=null){
var _cf=_ce.BasePath+"editor/skins/"+_c8+"/";
_ce.Config.SkinPath=_cf;
}
if(_c9==true){
_ce.Config.ToolbarStartExpanded=false;
_ce.Config.Toolbaronfocus=true;
}
if(_ca!=null){
_ce.ToolbarSet=_ca;
}
if(_cb!=null){
_ce.Config.StylesXmlPath=_cb;
}
if(_cc!=null){
_ce.Config.TemplatesXmlPath=_cc;
}
_ce.Config.AutoDetectLanguage=false;
if(_cd!=null){
_ce.Config.DefaultLanguage=_cd;
}
_ce.ReplaceTextarea();
var _d0=function(_d1){
ColdFusion.RichText.setValue(id,_d1);
};
_ce._cf_setValue=_d0;
var _d2=function(){
if(ColdFusion.RichText.editorState[id]){
var _d3=FCKeditorAPI.GetInstance(id);
return _d3.GetXHTML();
}else{
ColdFusion.Log.error("richtext.initialize.getvalue.notready","widget",[id]);
return null;
}
};
_ce._cf_getAttribute=_d2;
var _d4=function(_d5,_d6,_d7){
var _d8=document.getElementById(id);
if(_d8){
ColdFusion.Event.addListener(_d8,_d5,_d6,_d7);
}
};
_ce._cf_register=_d4;
_ce._cf_name=_c0;
ColdFusion.objectCache[_c0]=_ce;
ColdFusion.objectCache[id]=_ce;
ColdFusion.RichText.registerAfterSet(id);
ColdFusion.Log.info("richtext.initialize.success","widget",[_c0]);
};
ColdFusion.RichText.editor_onfocus=function(_d9){
_d9.ToolbarSet.Expand();
};
ColdFusion.RichText.editor_onblur=function(_da){
_da.ToolbarSet.Collapse();
};
ColdFusion.RichText.setChangeBuffer=function(_db){
ColdFusion.RichText.buffer=FCKeditorAPI.GetInstance(_db.Name).GetXHTML();
};
ColdFusion.RichText.resetChangeBuffer=function(_dc){
if(ColdFusion.RichText.buffer!=FCKeditorAPI.GetInstance(_dc.Name).GetXHTML()){
ColdFusion.RichText.fireChangeEvent(_dc.Name);
}
ColdFusion.RichText.buffer=null;
};
ColdFusion.RichText.registerAfterSet=function(_dd){
if(ColdFusion.RichText.editorState[_dd]){
var _de=function(){
ColdFusion.RichText.fireChangeEvent(_dd);
};
var _df=FCKeditorAPI.GetInstance(_dd);
_df.Events.AttachEvent("OnAfterSetHTML",_de);
}else{
setTimeout("ColdFusion.RichText.registerAfterSet('"+_dd+"')",1000);
}
};
ColdFusion.RichText.getEditorObject=function(_e0){
if(!_e0){
ColdFusion.handleError(null,"richtext.geteditorobject.missingtextareaname","widget",null,null,null,true);
return;
}
var _e1=ColdFusion.objectCache[_e0];
if(_e1==null||FCKeditor.prototype.isPrototypeOf(_e1)==false){
ColdFusion.handleError(null,"richtext.geteditorobject.notfound","widget",[_e0],null,null,true);
return;
}
return FCKeditorAPI.GetInstance(_e1.richtextid);
};
ColdFusion.RichText.setValue=function(_e2,_e3){
if(ColdFusion.RichText.editorState[_e2]){
var _e4=FCKeditorAPI.GetInstance(_e2);
_e4.SetHTML(_e3);
}else{
setTimeout("ColdFusion.RichText.setValue(\""+_e2+"\",\""+_e3+"\")",1000);
}
};
ColdFusion.RichText.fireChangeEvent=function(_e5){
var _e6=ColdFusion.objectCache[_e5];
ColdFusion.Log.info("richtext.firechangeevent.firechange","widget",[_e6._cf_name]);
var _e7=document.getElementById(_e5);
if(_e7){
if(_e7.fireEvent){
_e7.fireEvent("onchange");
}
if(document.createEvent){
var evt=document.createEvent("HTMLEvents");
if(evt.initEvent){
evt.initEvent("change",true,true);
}
if(_e7.dispatchEvent){
_e7.dispatchEvent(evt);
}
}
}
ColdFusion.Event.callBindHandlers(_e5,null,"change");
};
function FCKeditor_OnComplete(_e9){
if(_e9.Config.Toolbaronfocus){
_e9.Events.AttachEvent("OnBlur",ColdFusion.RichText.editor_onblur);
_e9.Events.AttachEvent("OnFocus",ColdFusion.RichText.editor_onfocus);
}
_e9.Events.AttachEvent("OnFocus",ColdFusion.RichText.setChangeBuffer);
_e9.Events.AttachEvent("OnBlur",ColdFusion.RichText.resetChangeBuffer);
ColdFusion.RichText.editorState[_e9.Name]=true;
if(ColdFusion.RichText.OnComplete){
ColdFusion.RichText.OnComplete(_e9);
}
}
