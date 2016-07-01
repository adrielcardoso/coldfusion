var WContacts=function(){if(typeof Contact!="undefined"){__$cf._log("Initializing Contacs..");var self=this;this.successObject=new DnfiStatus("contacts",dnfi.SUCCESS.code,dnfi.SUCCESS.message);this.callBackStack=new Array;this.retVal="";this.contactFields=["id","displayName","name","nickname","phoneNumbers","emails","addresses","ims","organizations","borthday","note","photos","categories","urls"];var createPGName=function(first,last,middle,formatted,prefix,suffix){var name=new ContactName;name.givenName=
first;name.familyName=last;name.middleName=middle;name.formatted=formatted;name.honorificPrefix=prefix;name.honorificSuffix=suffix;return name};var createPGPhoneNumber=function(value,type,pref){var t="mobile",p=false;if(type)t=type;if(pref)p=pref;return new ContactField(t,value,p)};var getPGPropertyName=function(props){var retProp={};if(typeof props.name!="undefined"){if(props.name instanceof ContactName)syncNameProperties(props.name);retProp.name=props.name}if(typeof props.addresses!="undefined"){var address=
null;for(var i=0;i<props.addresses.length;i++)address=props.addresses[i];retProp.addresses=props.addresses}if(typeof props.phonenumbers!="undefined")retProp.phoneNumbers=props.phonenumbers;if(typeof props.displayname!="undefined")retProp.displayName=props.displayname;if(typeof props.id!="undefined")retProp.id=props.id;if(typeof props.nickname!="undefined")retProp.nickname=props.nickname;if(typeof props.emails!="undefined")retProp.emails=props.emails;if(typeof props.ims!="undefined")retProp.ims=props.ims;
if(typeof props.organizations!="undefined")retProp.organizations=props.organizations;if(typeof props.birthday!="undefined")retProp.birthday=props.birthday;if(typeof props.note!="undefined")retProp.note=props.note;if(typeof props.photos!="undefined")retProp.photos=props.photos;if(typeof props.categories!="undefined")retProp.categories=props.categories;if(typeof props.urls!="undefined")retProp.urls=props.urls;return retProp};var saveMultiple=function(context,contacts){var saveFail=function(e){if(typeof e==
"undefined"||(e==null||e.code==0)){__$cf._log("contact saved successfully "+contacts);runCallBacks(context.cb,self.successObject,contacts);return}__$cf._log("returning from save - fail: "+e.code);runCallBacks(context.cb,new DnfiStatus("WContacts",wContactsError.SAVE_ERROR.code,wContactsError.SAVE_ERROR.message),null)};var saveCallBack=function(d){__$cf._log("contact saved successfully");runCallBacks(context.cb,self.successObject,d)};if(contacts.id!=null)contacts.rawId=contacts.id;contacts.save(saveCallBack,
saveFail)};var syncNameProperties=function(name){name.givenName=name.givenname;name.familyName=name.familyname;name.middleName=name.middlename;name.honorificPrefix=name.honorificprefix;name.honorificSuffix=name.honorificsuffix};this.createName=function(context,first,last,middle,formatted,prefix,suffix){if(_validateDeviceAPI(context,arguments.length-1,1,"createName")){var name=new ContactName;name.givenname=first;name.familyname=last;name.middlename=middle;name.formatted=formatted;name.honorificprefix=
prefix;name.honorificsuffix=suffix;syncNameProperties(name);runCallBacks(context.cb,self.successObject,name);return}};this.createOrganization=function(context,name,department,title,type,pref){if(_validateDeviceAPI(context,arguments.length-1,1,"createOrganization")){var organization=new ContactOrganization;organization.name=name;organization.department=department;organization.title=title;organization.type=type;organization.pref=pref;runCallBacks(context.cb,self.successObject,organization);return}};
this.createAddress=function(context,street,city,state,country,postalCode,formatted,type,pref){if(_validateDeviceAPI(context,arguments.length-1,1,"createAddress")){var address=new ContactAddress;address.streetaddress=street;address.locality=city;address.region=state;address.country=country;address.postalcode=postalCode;address.formatted=formatted;address.type=type;address.pref=pref;runCallBacks(context.cb,self.successObject,address);return}};this.create=function(context,name,phoneNumber,email,save){if(_validateDeviceAPI(context,
arguments.length-1,2,"create")){var contact=null;var saveContact=true;if(typeof save!="undefined")saveContact=save;var tempProp=new Object;var nameObj=new ContactName;nameObj.givenName=name;tempProp.name=nameObj;tempProp.displayName=name;tempProp.nickname=name;var pNumber=null;if(typeof phoneNumber!="undefined"){pNumber=new ContactField("mobile",phoneNumber,false);tempProp.phoneNumbers=[pNumber]}var emailObj=null;if(typeof email!="undefined"){emailObj=new ContactField(null,email,false);tempProp.emails=
[emailObj]}contact=navigator.contacts.create(tempProp);__$cf._log("contacts - contact created");if(saveContact){saveMultiple(context,contact);return}else runCallBacks(context.cb,self.successObject,contact)}};this.find=function(context,options,fields){if(_validateDeviceAPI(context,arguments.length-1,1,"find"))if(typeof options!="undefined"){var flds=[];if(typeof fields!="undefined"&&fields!=null)flds=fields;else flds=self.contactFields;var opts=new Object;if(typeof options!="undefined"&&options!=null)opts.filter=
options;else opts.filter="";opts.multiple=true;navigator.contacts.find(flds,function(c){__$cf._log("Contacts search successfull");runCallBacks(context.cb,self.successObject,c)},function(e){__$cf._log("Error while searching contacts "+e.code);runCallBacks(context.cb,e,null)},opts)}else runCallBacks(context.cb,self.successObject,null)};this.getAllContacts=function(context,fields){return self.find(context,null,fields)};this.remove=function(context,contact){if(_validateDeviceAPI(context,arguments.length-
1,1,"remove"))if(contact!=null){function onSuccess(){runCallBacks(context.cb,self.successObject,null)}function onError(contactError){__$cf._log("Error removing conatct - "+contactError.code);runCallBacks(context.cb,new DnfiStatus("WContacts",wContactsError.REMOVE_ERROR.code,wContactsError.REMOVE_ERROR.message),null)}contact.remove(onSuccess,onError)}else runCallBacks(context.cb,self.successObject,null)};this.save=function(context,contact){if(_validateDeviceAPI(context,arguments.length-1,1,"save"))if(contact!=
null)saveMultiple(context,contact);else runCallBacks(context.cb,self.successObject,null)}}};
