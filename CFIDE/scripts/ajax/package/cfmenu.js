/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Menu){
ColdFusion.Menu={};
}
ColdFusion.Menu.menuItemMouseOver=function(id,_eb){
var _ec=document.getElementById(id);
_ec.tempfontcolor=_ec.firstChild.style.color;
if(_eb){
_ec.firstChild.style.color=_eb;
}
};
ColdFusion.Menu.menuItemMouseOut=function(id){
var _ee=document.getElementById(id);
if(_ee.tempfontcolor){
_ee.firstChild.style.color=_ee.tempfontcolor;
}else{
_ee.firstChild.style.color="black";
}
};
ColdFusion.Menu.initMenu=function(_ef,_f0){
return new YAHOO.widget.Menu(_ef,_f0);
};
ColdFusion.Menu.initMenuBar=function(_f1,_f2){
return new YAHOO.widget.MenuBar(_f1,_f2);
};
