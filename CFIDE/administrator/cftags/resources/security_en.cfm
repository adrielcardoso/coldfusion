����  - 
SourceFile 5/CFIDE/administrator/cftags/resources/security_en.cfm cfsecurity_en2ecfm176775755  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   CALLER Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   
ATTRIBUTES   	   BSUCCESS   	    com.macromedia.SourceModTime  D��h pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	  1 com.adobe.coldfusion.* 3 bindImportPath (Ljava/lang/String;)V 5 6
  7 3class$coldfusion$tagext$lang$ProcessingDirectiveTag Ljava/lang/Class; -coldfusion.tagext.lang.ProcessingDirectiveTag ; forName %(Ljava/lang/String;)Ljava/lang/Class; = > java/lang/Class @
 A ? 9 :	  C _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; E F
  G -coldfusion/tagext/lang/ProcessingDirectiveTag I _setCurrentLineNo (I)V K L
  M cfprocessingdirective O suppresswhitespace Q yes S _boolean (Ljava/lang/String;)Z U V coldfusion/runtime/Cast X
 Y W _validateTagAttrValue :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z [ \
  ] setSuppresswhitespace (Z)V _ `
 J a 	hasEndTag c ` coldfusion/tagext/GenericTag e
 f d 
doStartTag ()I h i
 J j 
 l _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V n o
  p $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag s r :	  u coldfusion/tagext/io/SilentTag w
 x j 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; z {
  | doAfterBody ~ i
 f  _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � i #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 f � 	doFinally � 
 f � 	__HTSWT_0 Lcoldfusion/util/FastHashtable; � �	  � java/lang/String � ID � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
  � __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I � �
  � $Server has been updated successfully � write � 6 java/io/Writer �
 � � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � Debugging IP Address � "Security &gt; Allowed IP Addresses ��
Specify client IP addresses that should be allowed to invoke exposed services.
This can be individual IP addresses, IP address ranges of the form 10-30, or * wild cards.
Both IPv4 and IPv6 addresses are supported.
To include an IP address in the list, enter the address and click Add.
To delete an IP address from the list, select the address and click Remove Selected.
When no IP addresses are selected, no user can invoke exposed services
 � )Allowed IP Addresses for Exposed Services � 
IP Address � Add � 8View / Remove Selected IP Addresses for Exposed Services � Remove Selected ��
Specify the client IP addresses that can access ColdFusion Administrator and ColdFusion Internal Directories. This can be individual IP addresses, IP address ranges of the
form 10-30, or * wild cards. Both IPv4 and IPv6 addresses are supported. To include an IP address in the list, enter the
address and click Add. To delete an IP address from the list, select the address and click Remove Selected. When no IP
addresses are selected, all users are allowed access.
 � _Allowed IP Addresses for accessing ColdFusion Administrator and ColdFusion Internal Directories � 7View / Remove Selected IP Addresses for accessing admin ��
If you have configured an external web server, you can also restrict access to the ColdFusion Administrator and ColdFusion Internal Directories at the connector-level by modifying the iprestriction.properties file available under the connector folder. For instance, cf_root/config/wsconfig/<number>/iprestriction.properties.
<br>
<br>
<b>Note</b> : You will need to restart the external web server after modifying the iprestriction.properties file.
</br>
 � !Seed must be minimum 8 characters � !ColdFusion Administrator password � 
Security &gt; Administrator � (ColdFusion Administration Authentication ��
You should restrict access to the ColdFusion Administrator to trusted
users. By default the ColdFusion Administrator requires authentication to access
these pages. However, if you configure your web server to restrict access to
these pages, you can disable this authentication and
rely on your web server's security instead. (Consult your web server
documentation for details on securing pages.)
 � 2
Select the type of Administrator authentication:
 � $Use a single password only (default) � FSeparate user name and password authentication (allows multiple users) � *No authentication needed (not recommended) � �
To change the ColdFusion Administrator password for the root administrative user,
enter old password, new password and then confirm
 � Old Password � New Password � Confirm Password � (50-character limit.) � Password Seed � >
To specify a new seed value to encrypt data source passwords
 � New Seed � .(8-character minimum and 500-character limit.) � Concurrent Login Session � @<b>Allow concurrent login sessions for Administrator Console</b> � RDS Password � W

<div id="rdspassworderrorpanel" name="rdspassworderrorpanel"></div>
Security &gt; RDS � <b>Enable RDS Service</b> � �
The ColdFusion RDS service allows you to connect to this server using the RDS password you define below.
This is intended for development use only. If this is a production machine, leave this option unchecked.
 � RDS authentication � �
You should restrict access to RDS to trusted
users. By default RDS requires authentication. However, you may disable this authentication and
rely on your web server's security instead.
 � (
Select the type of RDS authentication:
 � RDS Single Password  V
To change the single RDS password, enter old password, new password and then confirm
 H
To change the single RDS password, enter new password and then confirm
 Sandbox Security Permissions 8
Are you sure you want to delete this security sandbox?
 Security Settings
 Security &gt; Sandbox Security "Enable ColdFusion Sandbox Security�
ColdFusion's sandbox security uses the location of your ColdFusion pages to control access to ColdFusion resources. A sandbox is a designated area (files or directories) of your site to which you apply security restrictions. By default, a subdirectory (or child directory) inherits the sandbox settings of the directory one level above it (the parent directory). If you define sandbox settings for a subdirectory, you override the sandbox settings inherited from the parent directory.
<br />
<br />
<b>Note:</b> You can configure these settings prior to enabling them on the server. Also, you must restart the ColdFusion application server to enable this setting.
0
To use sandbox security in the multiserver and J2EE editions, the application server must be running a security manager (java.lang.SecurityManager) and you must define the JVM arguments, as describe in the Configuring and Administering ColdFusion manual and in the ColdFusion Administrator online Help.
 �
To disable Sandbox Security, see the JRun section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
 �
To enable Sandbox Security, see the JRun section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
 �
To diable Sandbox Security, see the Sun ONE section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
 �
To enable Sandbox Security, see the Sun ONE section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
 �
To disable Sandbox Security, see the Oracle section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
 �
To enable Sandbox Security, see the Oracle section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
 �
To disable Sandbox Security, see the BEA WebLogic section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
  �
To enable Sandbox Security, see the BEA WebLogic section of the <a href="http://www.adobe.com/go/prod_releasenotes" target="Adobe website">release notes</a>.
" Add Security Sandbox$ Browse Server& %New sandbox, or pick one to copy from( Defined Directory Permissions* Actions, 	Directory. Root Security Context0 Edit2 Delete4 %( ColdFusion CFIDE system directory )6 '( ColdFusion WEB-INF system directory )8 No directory permissions exist.: >For these changes to take effect, you must restart ColdFusion.< 	Very Weak> Weak@ MediumB StrongD Very StrongF Unsafe PasswordH 	Too ShortJ Security PermissionsL defaultN Web ApplicationP Secure Profile SettingsR Setting NameT Current ValueV Secure Default ValueX $Snapshot when secure profile enabledZ Use UUID for cftoken\ Enable WebSocket Server^ Start Flash Policy Server` #Enable Robust Exception Informationb Enable CFSTATd Maxium size of post data (MB)f  Session Cookie Timeout (Minutes)h /Disable updating of ColdFusion internal cookiesj 5Disable access to internal ColdFusion Java componentsl Site Error Handlern Request Queue Timeout Pagep Missing Template Error Handlerr Enable Global Script Protectiont Allowed IP Addressesv Enable Sandbox Securityx 
Enable RDSz RDS Authentication Enabled| RDS seperate UserID Disabled~ Admin Authentication Enabled� Admin separate UserID Required� :Allow concurrent login sessions for Administrator Console.� FDisable create, drop, alter, grant, revoke, stored procedures for DSNs�  Security &gt; Secure Profile� Enable Secure Profile� �
Secure Profile settings are only a recommendation. You should further configure the server as per the requirement. The settings affected with this are listed in below table.
� Secure Profile Settings Summary� RDS and Administrator Access� 	Sandboxes� Exposed Services� User Manager� 
User name:� 	Password:� Confirm Password:� Description:� Allow RDS Access� Allow Administrative Access� API Access Only� "Administrator Console & API Access� Allowed Roles:� Prohibited Roles:� Allowed Services:� Prohibited Services:� Allowed Data sources:� Prohibited Data sources:� Data Source Permissions� (Add / Edit Secured Files and Directories� Add User� Update User� Cancel Edit� Cancel� Authentication (Add Mode)� Authentication (Edit Mode)� Action� User� Roles� Access� CF Admin� RDS� 	Admin API� 5Unable to create user: this user name already exists.� ]Unable to create user: You are attempting to create a user with the same ID as the root user.� The selected user doesn't exist� Security &gt; User Manager� *Are you sure you want to delete this user?� 8Password should be greater than or equal to 5 characters� /User name should be between 5 and 20 characters� 2User name can contain only alphanumeric characters� *Password and Confirm Password do not match� (Minimum 5 characters)� User name cannot be empty� Password cannot be empty� NYou need to grant atleast one permission to files/directories added in sandbox� &lt;&lt;ALL DATASOURCES&gt;&gt;� Read� Write� Execute��
To select more than one data source, hold down the Control key and click the name of the data source.
This user cannot use data sources listed in the Disabled Data Sources box. <br />
<br />
<b>Note:</b> The ALL DATASOURCES option includes all data sources not otherwise specified as enabled or disabled
as well as all future data sources created in the Data Sources section of the ColdFusion administrator.� {
&nbsp;&nbsp;Enter files that you would like to <b>grant</b> access for templates operations under this directory.<br><br>
� File / Folder Path:� Permissions� Add Files / Folders� Edit Files / Folders� Secured Files and Directories  	File Path No mappings are active.�
A file permission consists of a pathname and a set of actions valid 
for that pathname. A pathname is the pathname of the file or 
directory granted the specified actions. A pathname that ends in "/*" 
indicates all the files and directories contained in that directory. 
A pathname that ends with "/-" indicates (recursively) all files and 
subdirectories contained in that directory. A pathname consisting of the 
special token &quot;&lt;&lt;ALL FILES&gt;&gt;&quot; matches any file.<br><br>
 Description Administrative Access
 API Only Console & API JAdd and manage users.  Users can be granted access to roles and sandboxes. Yes No Add New User 	 Add User Defined Users 'ColdFusion Administrative User password 
Security &gt; Change Password P
To change ColdFusion user password, enter a new password and confirm it below:
  Data Sources" CF Tags$ CF Functions& 
Files/Dirs( Server/Ports* Others, CF Function Permissions:. Enabled Functions0 Disabled Functions2 Finish4 �
Select ColdFusion functions that you want to disable.
ColdFusion pages in this sandbox cannot use functions that are listed in the Disabled Functions box.
6 CF Tag Permissions:8 Enabled Tags: Disabled Tags< �
Select the ColdFusion tags that you want to disable.
ColdFusion pages in this sandbox cannot use tags that are listed in the Disabled Tags box.
> !
&lt;&lt;ALL DATASOURCES&gt;&gt;
@ Data Source Permissions:B Enabled Data sourcesD Disabled Data sourcesF
Select the data sources that can be used by ColdFusion pages in this directory.
To select more than one data source, hold down the Control key and click the name of the data source.
ColdFusion pages in the directory cannot use data sources listed in the Disabled Data Sources box. <br />
<br />
<b>Please note:</b> The ALL DATASOURCES option includes all data sources not otherwise specified as enabled or disabled
as well as all future data sources created in the Data Sources section of the ColdFusion administrator.H )Add / Edit Secured Files and Directories:J Add Files / PathsL Edit Files / PathsN 5
Are you sure that you want to delete the File Path?
P h
Enter files that you would like to <b>grant</b> access for 
templates operations under this directory.
R�
A file permission consists of a pathname and a set of actions valid 
for that pathname. A pathname is the pathname of the file or 
directory granted the specified actions. A pathname that ends in "/*" 
indicates all the files and directories contained in that directory. 
A pathname that ends with "/-" indicates (recursively) all files and 
subdirectories contained in that directory. A pathname consisting of the 
special token &quot;&lt;&lt;ALL FILES&gt;&gt;&quot; matches any file.
T Server/IP and Port Permissions:V .
Are you sure you want to delete this server?
X Server/IP AddressZ Single port\ This port and higher^ This port and lower` Port range (xxxx-xxxx)b Add IP Addressd Edit IP Addressf Enabled IP/Portsh IP:Portj ;All ip:ports are open. There are currently no restrictions.l �
These settings restrict the IP addresses and ports that ColdFusion can access with the tags that call third-party resources;
for example, the cfmail, cfpop, cfldap, and cfhttp tags.
n (
&lt;&lt;ALL RuntimePermissions&gt;&gt;
p Other Permissions:r Enabled Runtime Permissionst Disabled Runtime Permissionsv�
To disable the Runtime Permissions for a ColdFusion page in this directory, select the Runtime Permission from the Enable Runtime Permissions box and move it to the Disabled Runtime Permissions box.
To disable more than one Runtime Permissions for a ColdFusion page, hold down the Control key and click the name of the Runtime Permissions. ColdFusion pages in the directory cannot use Runtime Permissions that are listed in the Disabled Runtime Permissions box.
 <br />
<br />
<b>Please note:</b> By default, all Runtime Permissions are enabled. However, you can choose to enable or disable the permissions listed in the Enabled Runtime Permissions box. x ColdFusion Administrator Loginz 
ColdFusion| User Name Required~ 	User name� Password Required� Password� 9Please enable Javascript to use ColdFusion Administrator.� %User name required. Please try again.� 0Invalid User name or Password. Please try again.� #Invalid Password. Please try again.� Login� �&copy; 1997 - 2014 Adobe Systems Incorporated and its licensors. All Rights Reserved. Adobe, the Adobe logo, and ColdFusion are either registered trademarks or trademarks of Adobe Systems Incorporated in the United States and/or other countries.� Component Browser Login� Component Browser� &Enter your RDS or Admin password below� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� :	 � coldfusion/tagext/io/OutputTag�
� j 
The IP you attempted to add (� FORM� IPTOBEADDED� 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; ��
 � _String &(Ljava/lang/Object;)Ljava/lang/String;��
 Y� EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;��
 � �) is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format.
�
�  coldfusion/tagext/QueryLoop�
� �
� �
� � �) is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format. <br />
� CFCATCH� MESSAGE�  <br />
� DETAIL� 
� _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � ADMIN_IPTOBEADDED�) for admin access block is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format.
� _factor1��
 � _
An error occurred attempting to remove the requested IP(s).
from the Debugging Service.<br />
� n
An error occurred attempting to retrieve a list of restricted IP addresses
from the Debugging Service.<br />
� <br />
� Old password is incorrect� \Your password could not be changed because the new and confirmation passwords did not match.� ?Password could not be changed as the old password is incorrect.� Password can not be blank.� k
There was an error while updating passwords with new seed.<br />
Please check logs for more details.</br>
� r
There was an error while updating concurrent login sessions flag.<br />
Please check logs for more details.</br>
� :
Unable to set Administrator authentication switch.<br />
� 8
Unable to set Administrator authentication type.<br />
� Root Administrator Password� QPassword could not be changed as the new and confirmation passwords do not match.� Password can not be empty.� Old password is incorrect.� %
Unable to set admin password.<br />
� E
Invalid Directory, please check your directory and try again.<br />
� H
Virtual File System directories are not allowed to be sandboxed.<br />
� )
Unable to apply security updates:<br />
� "
Unable to toggle security.<br />
� s
There was an error while enabling secure profile and its settings.<br />
Please check logs for more details.</br>
� �Administrative Authentication is currently only enabled for the admin user.  To enable access to the Console or Admin API by other users, go to Security > Administrator to enable Separate User name and Password Authentication� �RDS Authentication is currently only enabled for the admin user.  To enable access to RDS by other users, go to Security > RDS to enable Separate User name and Password Authentication� 
Please enter a user name.
� XYour password could not be changed because the new and confirmation passwords are blank.  +
Unable to add selected data source:<br />
 /
Unable to remove selected data sources:<br />
 �
Invalid path or path without permisions error.<br />
Please make sure the file or directory exists and some level of permision is enabled.
This update could not be completed.
 7
Bad Domain/IP/Port format, please try another format.
 false
 set (Ljava/lang/Object;)V coldfusion/runtime/Variable
 coldfusion/runtime/SwitchTable
 	 BUTTON_BROWSE addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;
 
WEBINF_DIR CFFUNCTIONPERMISSIONS STEP_FILES_TIP1 STEP_FILES_TIP! SECUREPROFILE_SITE_WIDE# ALLRUNTIMEPERMISSIONS% ADDFILE_FOLDER' SECUREPROFILE_POSTSIZELIMIT) WELCOME+ RDS_PASSWORD_EXPLANATION- ENABLE_SWITCH_SECURITY/ 	CANCELADD1 L10N_CFILESDIR3 CLICK_NORMAL5 STATMESS7 SECUREPROFILEPAGENAME9 ERRORHEADER; STEP_DS= RDSAUTH_ERROR? MAP_ERROR_UPDATE_DSA ADDIPC ADDUSERE WRITEG L10N_ENDATAI  SECUREPROFILE_ITEM_DEFAULT_VALUEK PASSWORD_EMPTYM ERROR_TOGGLE_SETADMINPASSWORDO CFADMIN_USERNAMESQ ADMIN_ALLOW_IP_ADD_BUTTONS ERROR_SET_SEEDU SECUREPROFILE_RDS_ENABLEDW GRIDHEADERACCESSY SUBMIT_CHANGES[ PASSWORD_WEAK] JRUN_TURN_ON_SECURITY_ USERNAME_EMPTYa L10N_DISDATAc CFRDS_SINGLEPASSWORDe INVALID_PASSWORD_JSg SECUREPROFILE_CFSTATi ERR_SEEDLENGTHk ERR_USERNAMELENGTHm MAP_ERROR_UPDATEo CHARHELPSTRINGq IP_ERROR_REMOVEs #SECUREPROFILE_ITEM_CURRENT_VALUE_SPu ERROR_ENABLE_SECURE_PROFILEw L10N_DISTAGSy ERROR_VIRTUALDIRECTORY{ IP_WELCOMETEXT} ALLOWEDROLESLABEL EXECUTE� EDITFILE_FOLDER� USERNAME� PASSWORD� IPPORTS� 
NO_IPPORTS� SECUREPROFILE_FLASHFALLBACK� PAGEHEADER_USERMANAGER� ERROR_INVALIDFILEPERMISSIONS� RDSN_OLDPASSWORD� DEFAULT� PAGEHEADER_ALLOWIPADDRESS� RDS_SUPERPASSWORD_EXPLANATION� CFCBROWSER_LOGIN� $SECUREPROFILE_ADMIN_SECURITY_ENABLED� CFRDS_USERNAMES� SUNONE_TURN_OFF_SECURITY� 	PAGEDESC1� ALLDATASOURCESLABEL� ENTERRDSORADMINPASSWORDLOGIN� L10N_CFFUNCTIONS� SECUREPROFILE_ITEM_NAME� BUTTON_BROWSE_USER� ADMINUSER_PASSWORD_EXPLANATION� RDSNEWPASSWORD� #SECUREPROFILE_ADMIN_USERID_REQUIRED� 	STEP_DS_1� CONFIRMPASSWORD� EDITUSERBTN� IP_ERROR_GET� CFADMIN_PASSWORDLENGTH� DEFINED_DIRS� LOGICAL_FILEPATH_FOLDER� 	STEP_TAGS� ADDEDITUSERFILEDIR� PASSWORD_VERY_WEAK� CFADMINUSER_NEWPASSWORD� CFADMIN_CHANGESEED� PASSWORD_STRONG� NULL_USER_ID� RDSPAGENAME� CFADMINCONSOLEAPIACCESSLABEL� COPYRIGHT_CONT1� BROWSE_BUTTON� /SECUREPROFILE_RDS_SECURITY_USESINGLERDSPASSWORD� 
STEP_FILES� CFADMINUSER_NEWPASSWORDCONFIRM� 	PAGENAME2� 	PAGENAME1� JRUN_TURN_OFF_SECURITY� PASSWORD_BUTTON� DIRPAT� J2EE_ENABLESBS� GRIDHEADERSANDBOXES� PAGEHEADER_SANDBOX� PAGEHEADER_ADMINPASSWORD�  SECUREPROFILE_ALLOWEDADMINIPLIST� COMPONENTBROWSER� IP_ERROR_ADD1� DELETE_SANDBOX_CONFIRMATION� COLDFUSIONVER� CFADMIN_SINGLEPASSWORD� PASSWORD_OLDPASSWORD_ERROR1� ERR_CANTCREATEROOT� ERROR_TOGGLE PROHIBITEDDATASOURCESLABEL PROHIBITEDSERVICESLABEL IMPORTANT_NOTICE IP_ADMIN_CONNECTOR	 ALLOWCONCLOGINLABEL NEWSEED USERMNGRPAGENAME1 ADD_NEW_USER VIEWDELETEIP CFADMIN_PASSWORDLENGTH_1 ALLOWEDSERVICESLABEL 'SECUREPROFILE_ALLOWCONCURRENTADMINLOGIN L10N_DISDATA_RUNTIME #SECUREPROFILE_STARTWEBSOCKETSERVICE 
ADDUSERBTN ENABLERDS_DESC! APIACCESSONLYLABEL# WELCOME_SECUREPROFILE% *SECUREPROFILE_INTERNALCOOKIESDISABLEUPDATE' PASSWORD_TOO_SHORT) LOGICAL_FILEPATH+ ADMINUSERPASSWORDPAGENAME- RDSN_NEWPASSWORDCONFIRM/ DELETE_FILEPATH_CONFIRMATION1 
IP_ADDRESS3 ADDEDITSECUREDFILEDIR5 PASSWORD_UNSAFE7  SECUREPROFILE_ITEM_CURRENT_VALUE9 CANCELEDITBTN; PAGEHEADER_RDSPASSWORD= ADMIN_ALLOW_IP_ADDRESS? FINISHA NEW_SANDBOXC CFADMIN_LOGINE MAP_ERROR_BADIPG REQUIRED_USERIDI FILEK CFADMIN_USERNAME_EXPLANATIONM PASSWORD_CONFIRM_ERRORO 
L10NENTAGSQ ENABLED_IPPORTS L10N_SECDSOURCEU ADMINPASSWORDPAGENAMEW IP_ERROR_INVALIDY CONCURRENTLOGINHEADER[ CFADMIN_CHANGEPASSWORD] DESCRIPTIONLABEL_ RDS_PASSa LABEL_PASSWORDc FILE_ACTIVEe REQUIRED_PASSWORDg MAP_ERROR_REMOVE_DSi 
SEEDHEADERk PASSWORD_EMPTY_ERROR_RDSm VIEWREMOVEIPNEWo USERDATASOURCEPERMISSIONq MAP_ERROR_ADD_DSs CFADMIN_OLDPASSWORDu ERR_USERNAMENONCHARSw GRIDHEADERUSERy L10N_ENDATA_RUNTIME{ L10N_ENFUNC} L10N_SECIP_PORTHEIGH ADMINACCESSLABEL� #SECUREPROFILE_DISABLESERVICEFACTORY� DELETECONFIRMATION� WEBLOGIC_TURN_OFF_SECURITY� SECUREPROFILE_SCRIPTPROTECT� ORACLE_TURN_OFF_SECURITY� EDITFILE� SECUREPROFILE_SERVERINFO� SANDBOX_APPLY� YESLABEL� CFADMIN_SECURITYDISABLED� PERMISSIONS� ERR_USERNAMEALREADYEXISTS� PROHIBITEDROLESLABEL� USERNAME_ERROR� NOLABEL� L10N_DISFUNC� LABEL_USERID� RDSACCESSLABEL� RDS_SUPERPASSWORD_EXPLANATION2� SECUREPROFILE_MISSING_TEMPLATE� SECUREPROFILE_ROBUST_ENABLED� PAGENAME_SECURITYPERMISSIONS� 	CONNECTED� SECUREPROFILE_DRIVERDEFAULTS� ENABLE_SWITCH_SECUREPROFILE� "SECUREPROFILE_SBS_SECURITY_ENABLED� ORACLE_TURN_ON_SECURITY� CFADMIN_PASSWORD_EXPLANATION� DISABLERDSLABEL� ADMIN_ALLOWEDIPS� CFRDS_USERNAME_EXPLANATION� CFADMINAPIACCESSLABEL� OTHERSPERMISSIONS� PASSWORD_CONFIRM_ERROR1� EDIT� CFRDS_SECURITYDISABLED� IPPORT� DELETE�  ERROR_TOGGLE_SINGLEADMINPASSWORD� ALERT� STEP_FUNCTIONS� EDITUSER� 	DIRECTORY� L10N_ADDSANDBOX� PAGEHEADER_SECUREPROFILE� STEP_FILES1� ERR_USERDOESNTEXIST� ALLOWEDDATASOURCESLABEL� ADMINAUTH_ERROR� CFADMIN_PASSWORD� SERVERIPPORTPERMISSIONS� ADMINAPIACCESSLABEL� SECUREPROFILE_QUEUE_TIMEOUT� ERR_PASSWORDMISMATCH� CLICK_RETURN� CFTAGPERMISSIONS� INVALID_PASSWORD� MAP_NOMAPPINGS� EDITIP� IP_PAGENAME� ERR_PASSWORDLENGTH� PASSWORD_EMPTY_ERROR� SELECTIP� DELETE_SERVER_CONFIRMATION ALLDATASOURCES "SECUREPROFILE_SESSIONCOOKIETIMEOUT CFADMIN_NEWPASSWORD "SECUREPROFILE_RDS_SECURITY_ENABLED	 OTHERS CFRDS_PASSWORD ACTIONS !PASSWORD_OLDPASSWORD_ERROR1_SHORT GRIDHEADERROLES IP_ERROR_ADD 	SUBTITLE3 	SUBTITLE2 	SUBTITLE1 L10N_SECIP_PORTLOW NO_DIR_PERM 
ADD_BUTTON! IP_ERROR_INVALID1# SUNONE_TURN_ON_SECURITY% READ' 	CFIDE_DIR) CFADMIN_SEEDLENGTH+ REMOVE_BUTTON- WEBAPP/ GRIDHEADERDESCRIPTION1 CFADMIN_NEWPASSWORDCONFIRM3 CFADMINACCESSLABEL5 L10N_SECIP_SPORT7 PASSWORD_MEDIUM9 STEP_DS_RUNTIME; ERR_NO_SANDBOX_PERMISSION= ALLOWRDSACCESSLABEL? IP_PORT_EXPLANATION1A SECUREPROFILE_UUIDTOKENC ERROR_ALLOWCONCLOGINE USERMANAGERPAGENAMEG ERROR_TOGGLE_SECI DATASOURCEPERMISSIONSK ALLOWADMINACCESSLABELM IPO WEBLOGIC_TURN_ON_SECURITYQ PAGEHEADER_ADMINUSERPASSWORDS PASSWORD_VERY_STRONGU ADDFILEW IP_ADMIN_WELCOMETEXTY ADMINCONSOLEANDAPILABEL[ ROOTSECURITYCNTX] L10N_CFTAGS_ GRIDHEADERACTIONa ERROR_INVALIDDIRECTORYc PASSWORD_OLDPASSWORD_ERRORe PASSWORD_BLANK_ERRORg 
BUTTON_ADDi L10N_SECIP_PORTRANGEk INVALID_USERID_OR_PASSWORDm _factor2o�
 p
 J �
 J � _factor3t�
 u 

w metaData Ljava/lang/Object;yz	 { &coldfusion/runtime/AttributeCollection} java/lang/Object ([Ljava/lang/Object;)V �
~� this Lcfsecurity_en2ecfm176775755; LocalVariableTable Code <clinit> __factorParent out Ljavax/servlet/jsp/JspWriter; value output2  Lcoldfusion/tagext/io/OutputTag; mode2 I t6 t7 Ljava/lang/Throwable; t8 t9 LineNumberTable java/lang/Throwable� output4 mode4 silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t10 t11 output1 mode1 t14 t15 t16 t17 output3 mode3 t20 t21 t22 t23 output5 mode5 t26 t27 t28 t29 output6 mode6 t32 t33 t34 t35 output7 mode7 t38 t39 t40 t41 output8 mode8 t44 t45 t46 t47 output9 mode9 t50 t51 t52 t53 output10 mode10 t56 t57 t58 t59 output11 mode11 t62 t63 t64 t65 output12 mode12 t68 t69 t70 t71 output13 mode13 t74 t75 t76 t77 output14 mode14 t80 t81 t82 t83 output15 mode15 t86 t87 t88 t89 output16 mode16 t92 t93 t94 t95 output17 mode17 t98 t99 t100 t101 varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; getMetadata ()Ljava/lang/Object; processingdirective18 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode18 runPage 1                      9 :    r :    � �   � :   yz   	    �   #     *� 
�   �       ��   �  �  
M    
/<� B� Dt� B� v�� B���Y� �Q� Ӷ  ��" �$m�& ��( ��*i�,=�.-�0<�2 ��4 ж6�8�:_�<�> �@#�B*�D �F ��H ��J ޶Lc�N ��P�R�T�V�Xs�Z ��\�^U�`@�b ��d ߶f/�h�jh�l�n ��p�r ��t�vb�x!�z ڶ|�~�� ��� ��� ��� ��� ��� Ѷ� ���f�� ���(��5��]����3����v��0��A�� ��� ���	�� ϶�`�� ��� ɶ�6��w�� ��� ��� �����!��J�� ��� ۶� ���T�� ʶ�#��W����(�� �����H��u�� �� ˶�:��8��?����L��>�� ���;����q������9�� ������  ��� �� ���
�'�$� �� Ķ� ̶ ��x� ��e�  ��"+�$ ��&|�(k�*Z�, �. Ƕ07�2 �4
�6 �8Y�:a�< ��>)�@�B ֶDI�F ��H)�J ��L ��N�P�R ٶT �V ͶX�Z�\&�^�` ��b2�d �f ��h ��j'�l"�n�p�r ��t&�v�x ��z ��| ��~ Զ� ��� ���l�� ���E��p��C�� ��}��S�� ¶��� ��� ��� ���$�� ö� ն� ��� ���4��o��g��[�� ƶ�y��{��r��D����*����.�� ��� �����N��1�� ��O������ ׶� ���\��G��z�� ��� ��� ���"���� �� ���n�� ����� ض��� ��� ���� ���� 	� � ܶj��
t� Ҷ,�K�� ��� ���~� � R�"�$
�&B�( ��*P�,%�.�0^�2 ��4 �6 ��8 �:V�< ��> ��@ ��B ��Dd�F�H ��J �L ݶN ��P �RF�T ȶVX�X �Z�\ ��^M�` ζb ��d�f�h%�j Ŷl �n�� ��~Y�����|�   �      
/��   �� �  �  
   �*��+� H��:*�� N� g��Y6� �,�� �,*�� N*�� �Y�S������� �,�� �,*�� N**� � �Y�SY�S� ������ �,�� �,*�� N**� � �Y�SY�S� ������ �*,Ķ q����j��� :� #�� � #:��� � :� �:	���	*�   � �� � � ��  � �� � � �� � � �� � � �� �   f 
   ���     �� 0    ���    ��z    ���    ���    ��z    ���    ���    ��z 	�   B  5� 5� 5� 5� -� ^� ^� ^� ^� V� �� �� �� �� ��  � �� �  �  
   �*��+� H��:*¶ N� g��Y6� �,�� �,*ö N*�� �Y�S������� �,�� �,*ƶ N**� � �Y�SY�S� ������ �,�� �,*Ƕ N**� � �Y�SY�S� ������ �*,Ķ q����j��� :� #�� � #:��� � :� �:	���	*�   � �� � � ��  � �� � � �� � � �� � � �� �   f 
   ���     �� 0    ���    ��z    ���    ���    ��z    ���    ���    ��z 	�   B  5� 5� 5� 5� -� ^� ^� ^� ^� V� �� �� �� �� ��  � o� �  *�  f  C*,m� q*� v+� H� x:*� N� g� yY6� /*,� }M� ����� � :� �:*,� �M�� �� :� #�� � #:		� �� � :
� 
�:� ��*,m� q� �**� � �Y�S� �� ��    �      *  �  �  �  �  �  �  �  �          '  0  9  B  K  T  ]  f  o  x  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        #  ,  5  >  G  P  Y  b  k  t  }  �  �  �  �  �  �  �  �  �  �  �  �  �        $  .  8  B  L  V  `  j  t  ~  �  �  �  �  �  �  �  �  �  �  �  �     
      (  2  <  F  P  Z  d  n  x  �  �  �  �  �  �  �  �  �  �  �  �  �  	  	  	  	"  	,  	6  	@  	J  	T  	^  	h  	r  	|  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  
  
  
  
&  
0  
:  
D  
N  
X  
b  
l  
v  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�           *  4  >  H  R  \  f  p  z  �  �  �  �  �  �  �  �  �  �  �  �  �        $  .  8  B  L  V  `  j  s  |  �  �  �  �  �  �  �  �  �  �  �  �  �        %  /  9  C  M  W  a  k  u    �  �  �  �  �  �  �  �  �  �  �  �          )  3  =  G  Q  [  e  o  y  �  �  �  �  �  �  �  �  �  �  �  �  �  (  7    �  �  �  �    �  �  x  J  T  ^  h  r  D  N  X  *  �  �  �  �  �  �  �  �  �  �,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ��{,�� ��r,�� ��i,�� ��`,�� ��W,ö ��N,Ŷ ��E,�� ��<,�� ��3,Ƕ ��*,ɶ ��!,˶ ��,Ͷ ��,϶ ��,Ѷ ���,Ӷ ���,ն ���,׶ ���,ٶ ���,۶ ���,ݶ ���,߶ ���,� ���,� ���,� ���,� ���,� ���,� ���,�� ��,� ��v,� ��m,� ��d,�� ��[,�� ��R,�� ��I,�� ��@,�� ��7,�� ��.,׶ ��%,ٶ ��,۶ ��,� ��	,� ���,� ���,߶ ���,� ���,� ���,� ���,	� ���,� ���,� ���,� ���,� ���,� ���,� ���,� ���,� ��v,� ��l,� ��b,� ��X,!� ��N,#� ��D,%� ��:,'� ��0,)� ��&,+� ��,-� ��,/� ��,1� ���,3� ���,5� ���,7� ���,9� ���,;� ���,=� ���,?� ���,A� ���,C� ���,E� ���,G� ���,I� ���,K� ��|,M� ��r,/� ��h,O� ��^,Q� ��T,S� ��J,U� ��@,W� ��6,Y� ��,,[� ��",]� ��,_� ��,a� ��,c� ���,e� ���,g� ���,i� ���,k� ���,m� ���,o� ���,q� ���,s� ���,u� ���,w� ���,y� ���,{� ���,}� ��x,� ��n,�� ��d,�� ��Z,�� ��P,�� ��F,�� ��<,�� ��2,�� ��(,�� ��,�� ��,�� ��
,�� �� ,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ��~,�� ��t,�� ��j,�� ��`,�� ��V,�� ��L,�� ��B,�� ��8,�� ��.,�� ��$,ö ��,Ŷ ��,Ƕ ��,�� ���,ɶ ���,˶ ���,Ͷ ���,϶ ���,Ѷ ���,Ӷ ���,ն ���,׶ ���,ٶ ���,۶ ���,ݶ ���,߶ ���,� ��z,� ��p,� ��f,� ��\,� ��R,� ��H,�� ��>,� ��4,� ��*,� �� ,�� ��,�� ��,�� ��,'� ���,�� ���,�� ���,�� ���,� ���,� ���,� ���,� ���,�� ���,	� ���,� ���,� ���,� ���,� ��v,� ��l,� ��b,� ��X,� ��N,� ��D,� ��:,� ��0,!� ��&,� ��,� ��,� ��,#� ��,%� ���,'� ���,)� ���,+� ���,-� ���,/� ���,1� ���,3� ���,5� ���,7� ���,9� ���,;� ���,=� ��,?� ��u,A� ��k,C� ��a,E� ��W,G� ��M,I� ��C,K� ��9,� ��/,'� ��%,M� ��,O� ��,Q� ��,S� ���,U� ���,W� ���,Y� ���,[� ���,]� ���,_� ���,a� ���,c� ���,e� ���,g� ���,i� ���,k� ���,m� ��{,o� ��q,q� ��g,s� ��],u� ��S,w� ��I,y� ��?,{� ��5,}� ��+,� ��!,�� ��,�� ��,�� ��,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���*��+� H��:*�� N� g��Y6� ;,�� �,*�� N*�� �Y�S������� �,�� ��������� :� #�� � #:��� � :� �:����*+,��� ��*��+� H��:*�� N� g��Y6� ;,�� �,*�� N*�� �Y�S������� �,̶ ��������� :� #�� � #:��� � :� �:����h*+,��� ��Y*��+� H��:*ʶ N� g��Y6� s,Ѷ �,*Ͷ N**� � �Y�SY�S� ������ �,�� �,*ζ N**� � �Y�SY�S� ������ �*,Ķ q�������� :� #�� � #:��� � :� �:����
�*��+� H��:*Ѷ N� g��Y6� s,Ӷ �,*Զ N**� � �Y�SY�S� ������ �,ն �,*ն N**� � �Y�SY�S� ������ �*,Ķ q�������� : � # �� � #:!!��� � :"� "�:#���#�	�,׶ ��	�,ٶ ��	�,۶ ��	�,ݶ ��	�*��+� H��:$*� N$� g$��Y6%� s,߶ �,*� N**� � �Y�SY�S� ������ �,ն �,*� N**� � �Y�SY�S� ������ �*,Ķ q$�����$��� :&� #&�� � #:'$'��� � :(� (�:)$���)��*��+� H��:**� N*� g*��Y6+� s,� �,*� N**� � �Y�SY�S� ������ �,ն �,*� N**� � �Y�SY�S� ������ �*,Ķ q*�����*��� :,� #,�� � #:-*-��� � :.� .�:/*���/��*��	+� H��:0*� N0� g0��Y61� s,� �,*� N**� � �Y�SY�S� ������ �,ն �,*� N**� � �Y�SY�S� ������ �*,Ķ q0�����0��� :2� #2�� � #:303��� � :4� 4�:50���5�*��
+� H��:6*�� N6� g6��Y67� s,� �,*�� N**� � �Y�SY�S� ������ �,ն �,*�� N**� � �Y�SY�S� ������ �*,Ķ q6�����6��� :8� #8�� � #:969��� � ::� :�:;6���;�F,� ��<,� ��2,� ��(,�� ��*��+� H��:<*� N<� g<��Y6=� s,� �,*� N**� � �Y�SY�S� ������ �,ն �,*� N**� � �Y�SY�S� ������ �*,Ķ q<�����<��� :>� #>�� � #:?<?��� � :@� @�:A<���A�L,� ��B,� ��8*��+� H��:B*� NB� gB��Y6C� s,�� �,*� N**� � �Y�SY�S� ������ �,ն �,*� N**� � �Y�SY�S� ������ �*,Ķ qB�����B��� :D� #D�� � #:EBE��� � :F� F�:GB���G�f*��+� H��:H*� NH� gH��Y6I� s,�� �,*� N**� � �Y�SY�S� ������ �,ն �,*� N**� � �Y�SY�S� ������ �*,Ķ qH�����H��� :J� #J�� � #:KHK��� � :L� L�:MH���M��*��+� H��:N*� NN� gN��Y6O� s,�� �,*� N**� � �Y�SY�S� ������ �,ն �,* � N**� � �Y�SY�S� ������ �*,Ķ qN�����N��� :P� #P�� � #:QNQ��� � :R� R�:SN���S��,�� ���,�� ���,�� ���,� ���*��+� H��:T*-� NT� gT��Y6U� s,� �,*/� N**� � �Y�SY�S� ������ �,ն �,*0� N**� � �Y�SY�S� ������ �*,Ķ qT�����T��� :V� #V�� � #:WTW��� � :X� X�:YT���Y��*��+� H��:Z*3� NZ� gZ��Y6[� s,� �,*5� N**� � �Y�SY�S� ������ �,ն �,*6� N**� � �Y�SY�S� ������ �*,Ķ qZ�����Z��� :\� #\�� � #:]Z]��� � :^� ^�:_Z���_� �,� �� �,	� �� �*��+� H��:`*C� N`� g`��Y6a� s,� �,*E� N**� � �Y�SY�S� ������ �,ն �,*F� N**� � �Y�SY�S� ������ �*,Ķ q`�����`��� :b� #b�� � #:c`c��� � :d� d�:e`���e� *� !�� *,m� q*� b + @ C� C H C�   c o� i l o�   c ~� i l ~� o { ~� ~ � ~���
�
�����
��W�������W����������������������������������������Xd�^ad��Xs�^as�dps�sxs��R^�X[^��Rm�X[m�^jm�mrm��$0�*-0��$?�*-?�0<?�?D?�o�����o�������A�������A���������������;�������;���������������!�������!����������������z�������z���������������LX�RUX��Lg�RUg�Xdg�glg��FR�LOR��Fa�LOa�R^a�afa��$�!$��3�!3�$03�383�w�
�
�w���
�� �  � f  C��    C� 0   C��   C�z   C��   C��   C��   C�z   C�z   C�� 	  C�� 
  C�z   C��   C��   C�z   C��   C��   C�z   C��   C��   C�z   C��   C��   C�z   C��   C��   C�z   C��   C��   C�z   C��   C��   C�z    C�� !  C�� "  C�z #  C�� $  C�� %  C�z &  C�� '  C�� (  C�z )  C�� *  C�� +  C�z ,  C�� -  C�� .  C�z /  C�� 0  C�� 1  C�z 2  C�� 3  C�� 4  C�z 5  C�� 6  C�� 7  C�z 8  C�� 9  C�� :  C�z ;  C�� <  C�� =  C�z >  C�� ?  C�� @  C�z A  C�� B  C�� C  C�z D  C�� E  C�� F  C�z G  C�� H  C�� I  C�z J  C�� K  C�� L  C�z M  C�� N  C�� O  C�z P  C�� Q  C�� R  C�z S  C�� T  C�� U  C�z V  C�� W  C�� X  C�z Y  C�� Z  C�� [  C�z \  C�� ]  C�� ^  C�z _  C�� `  C�� a  C�z b  C�� c  C�� d  C�z e�  >�   �  � h q z � � � � !� #� %� .� 0� 2� 4� 6� 8� ?� A C
 E G O% Q. S7 V@ XI aR e[ gd im kv p r� t� v� x� z� ~� �� �� �� �� �� �� �� �� � � � �! �* �4 �> �H �Q �Z �c �m �w �� �� �� �� �� �� �� �� �� �� �� �� �� � � � �! �+ �5 �? �I �S �]gq{�	������������!	#	%	'	%)	/+	9-	C/	M1	W3	a5	k7	u9	;	�=	�?	�A	�C	�E	�G	�I	�K	�M	�O	�Q	�S
U
W
[
]
)_
3a
=c
Ge
Qg
[i
ek
om
yo
�q
�s
�u
�w
�y
�{
�}
�
��
��
��
��
�����#�-�7�A�K�U�_�i�s�}���������������������������	���'�1�;�E�O�Y�c�m�w���������������������������  	)2<FPZdnx���!�&�(�*�,�1�5�7�9�;�CEGI"K,M6Q@VJ`Tb^fhhrj|l�n�p�r�t�v�x�z��������������&�0�:�D�N�X�b�l�v�������������������-�q�q�q�q�i�<�<��������I�I�I�I�A�����������������������������������������������������������������������������������������������S�S�[�[�[�[�S�����������%�%����� UUUUM����}��;;;;3kkkkc====5�������     ��{#�%�'�+�/�/�/�/�/	0	0	0	00�-�-�5�5�5�5�5�6�6�6�6�6u3u3G9Q?�E�E�E�E�E�F�F�F�F�F[C[C1J1J-J-J-J �     �   ]     +*+,� **+,� � **+,� � **+,� � !�   �        +��     +��    +��  �� �   "     �|�   �       ��   t� �  _     �*� D+� H� J:*� NPRT� Z� ^� b� g� kY6� *,�q� :� =�� ����� �� :� #�� � #:�r� � :	� 	�:
�s�
*�  , E k� K _ k� e h k� , E z� K _ z� e h z� k w z� z  z� �   p    ���     �� 0    ���    ��z    �     ��    ��z    ��z    ���    ��� 	   ��z 
�   
       � �   q     )*� (� .L*� 2N*4� 8*-+�v� �*+x� q�   �   *    )��     )��    )�z    ) / 0 �              "    #