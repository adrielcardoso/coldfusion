/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
ColdFusion.WebSocket={NS:"coldfusion.websocket.channels",WELCOME:"welcome",AUTHENTICATE:"authenticate",SUBSCRIBE:"subscribe",UNSUBSCRIBE:"unsubscribe",PUBLISH:"publish",INVOKE_AND_PUBLISH:"invokeAndPublish",GET_CHANNELS:"getChannels",GET_SUBSCRIBER_COUNT:"getSubscriberCount",GET_SUBSCRIPTIONS:"getSubscriptions",SEND_MESSAGE:"sendMessage",INVOKE_AND_MESSAGE:"invokeAndSend",INVOKE:"invoke",STOP:"stop",init:function(id,_43d,_43e,_43f,_440,_441,_442,_443,_444,_445,_446){
if(cf_ws.isWebSocketSupported()){
lWSC=new cf_ws.CFWebSocketWrapper();
ColdFusion.WebSocket[id]=lWSC;
lWSC.options={OnWelcome:this.cfonOpencallBk,OnMessage:this.cfMessageHandlerCallBk,OnClose:_443,onError:_444,appName:_43d,cfauth:_43f,subscribeTo:_440,referrer:_445};
var _447=self.location.hostname;
if(!(self.WebSocket||self.MozWebSocket)&&_43e==true){
var _448={ns:ColdFusion.WebSocket.NS,reqType:ColdFusion.WebSocket.WELCOME,code:-1,msg:"WebSocket over SSL will not work as your browser does not have native WebSockets support."};
var _449=_444!=null?_444:_441;
_449(_448);
return;
}
if(_43e==false&&_447&&_447=="localhost"){
_447="127.0.0.1";
}
var _44a;
var port;
if(_446){
if(self.location.port!=""){
port=self.location.port;
}else{
if(self.location.protocol!=""&&self.location.protocol=="https:"){
port=443;
}else{
port=80;
}
}
if(self.location.protocol!=""&&self.location.protocol=="https:"){
protocol="wss://";
}else{
protocol="ws://";
}
_44a="/cfws";
}else{
port=_43e?_cf_websocket_ssl_port:_cf_websocket_port;
_44a="/cfusion"+"/cfusion";
protocol=_43e?"wss://":"ws://";
}
var lURL=protocol+(_447)+":"+port+_44a;
lWSC.options.url=lURL;
var lRes=lWSC.open(lURL,lWSC.options);
lWSC.isOpen=true;
lWSC.processConnected=function(_44e){
};
lWSC.processDisconnected=function(_44f){
};
lWSC.defaultMessageHandler=_441;
if(_442){
lWSC.appOnOpenHandler=_442;
}
lWSC.channelSpecificResHandlers={};
lWSC.subscribercount_callbackHandlers={};
return lWSC;
}else{
var _448={ns:ColdFusion.WebSocket.NS,reqType:ColdFusion.WebSocket.WELCOME,code:-1,msg:"Browser neither have native WebSocket support nor a flash player for the fallback."};
var _449=_444!=null?_444:_441;
_449(_448);
}
},welcome:function(_450,_451,_452){
var lRes=this.isConnected();
if(lRes==true){
this.sendToken({ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.WELCOME,authKey:_450,subscribeTo:_451,appName:_452});
}
return lRes;
},authenticate:function(_454,_455){
var lRes=this.isConnected();
if(lRes==true){
this.sendToken({ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.AUTHENTICATE,username:_454,password:_455,appName:this.options.appName});
}
return lRes;
},subscribe:function(_457,_458,_459){
var lRes=this.isConnected();
if(lRes==true){
var _45b={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.SUBSCRIBE,channel:_457,appName:this.options.appName};
if(_458!=null&&(typeof _458=="object")){
_45b.customOptions=_458;
}
this.sendToken(_45b);
if(_459){
this.channelSpecificResHandlers[_457]=_459;
this.channelName_subscriptionInProcess=_457;
}
}
return lRes;
},unsubscribe:function(_45c){
var lRes=this.isConnected();
if(lRes==true){
var _45e={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.UNSUBSCRIBE,channel:_45c,appName:this.options.appName};
this.sendToken(_45e);
delete this.channelSpecificResHandlers[_45c];
}
return lRes;
},publish:function(_45f,_460,_461){
var lRes=this.isConnected();
if(lRes==true){
var _463={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.PUBLISH,channel:_45f,data:_460,appName:this.options.appName};
if(_461!=null&&(typeof _461=="object")){
_463.customOptions=_461;
}
this.sendToken(_463);
}
return lRes;
},invokeAndPublish:function(_464,_465,_466,_467,_468){
var lRes=this.isConnected();
if(lRes==true){
var _46a={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE_AND_PUBLISH,channel:_464,cfcName:_465,cfcMethod:_466,methodArguments:_467,appName:this.options.appName,referrer:this.options.referrer};
if(_468!=null&&(typeof _468=="object")){
_46a.customOptions=_468;
}
this.sendToken(_46a);
}
return lRes;
},getSubscriberCount:function(_46b,_46c){
var lRes=this.isConnected();
if(lRes==true){
var _46e={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.GET_SUBSCRIBER_COUNT,channel:_46b,appName:this.options.appName};
this.sendToken(_46e);
}
if(_46c){
if(!this.subscribercount_callbackHandlers){
this.subscribercount_callbackHandlers={};
}
this.subscribercount_callbackHandlers[_46b]=_46c;
}
return lRes;
},getSubscriptions:function(_46f){
var lRes=this.isConnected();
if(lRes==true){
var _471={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.GET_SUBSCRIPTIONS,appName:this.options.appName};
this.sendToken(_471);
}
if(_46f){
this.subscriptions_callbackHanlder=_46f;
}
return lRes;
},sendMessage:function(_472,_473,_474){
var lRes=this.isConnected();
if(lRes==true){
var _476={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.SEND_MESSAGE,targetId:_472,data:_473,appName:this.options.appName};
if(_474!=null&&(typeof _474=="object")){
_476.customOptions=_474;
}
this.sendToken(_476);
}
return lRes;
},invokeAndSend:function(_477,_478,_479,_47a,_47b){
var lRes=this.isConnected();
if(lRes==true){
var _47d={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE_AND_MESSAGE,target:_477,cfcName:_478,cfcMethod:_479,methodArguments:_47a,appName:this.options.appName};
if(_47b!=null&&(typeof _47b=="object")){
_47d.customOptions=_47b;
}
this.sendToken(_47d);
}
return lRes;
},invoke:function(_47e,_47f,_480,_481){
var lRes=this.isConnected();
if(lRes==true){
var _483={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE,cfcName:_47e,cfcMethod:_47f,methodArguments:_480,appName:this.options.appName,referrer:this.options.referrer};
if(_481!=null&&(typeof _481=="object")){
_483.customOptions=_481;
}
this.sendToken(_483);
}
return lRes;
},openConnection:function(){
var lURL=lWSC.options.url;
this.open(lURL,this.options);
},isConnectionOpen:function(){
var _485=this.isConnected();
return _485;
},closeConnection:function(){
this.close({fireClose:true});
},cfonOpencallBk:function(_486){
if(this.cfauth!=null||this.susbcribeTo!=null){
_486.welcome(this.cfauth,this.subscribeTo,this.appName);
}
if(_486.appOnOpenHandler){
_486.appOnOpenHandler(_486);
}
},cfMessageHandlerCallBk:function(_487,_488){
var _489=_488.defaultMessageHandler;
if((_487.type=="event")&&(_487.name=="connect"||_487.name=="disconnect")){
return;
}
if((_487.reqType=="subscribe")&&_488.channelName_subscriptionInProcess!=null){
if(_487.code==-1){
delete _488.channelSpecificResHandlers[_488.channelName_subscriptionInProcess];
}
delete _488.channelName_subscriptionInProcess;
}
if((_487.reqType=="getSubscriberCount")&&_488.subscribercount_callbackHandlers[_487.channel]!=null){
_488.subscribercount_callbackHandlers[_487.channel].call(this,_487);
delete _488.subscribercount_callbackHandlers[_487.channelname];
return;
}
if((_487.reqType=="getSubscriptions")&&_488.subscriptions_callbackHanlder!=null){
_488.subscriptions_callbackHanlder(_487);
delete _488.subscriptions_callbackHanlder;
return;
}
if(_487.type=="data"&&_487.channelname){
var _48a=_487.channelname;
var _48b=_488.channelSpecificResHandlers[_48a];
while(_48b==null){
var lPos=_48a.lastIndexOf(".");
if(lPos>0){
_48a=_48a.substr(0,lPos);
_48b=_488.channelSpecificResHandlers[_48a];
}else{
break;
}
}
if(_48b){
_489=_48b;
}
}
_489.call(this,_487);
}};
function cfwebsocketinit(){
var _48d=ColdFusion.WebSocket;
ns=cf_ws;
for(var _48e in _48d){
ns["CFWebSocketWrapper"].prototype[_48e]=_48d[_48e];
}
}
cfwebsocketinit();
