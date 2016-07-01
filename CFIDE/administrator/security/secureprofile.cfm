����  -< 
SourceFile //CFIDE/administrator/security/secureprofile.cfm cfsecureprofile2ecfm700918267  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   	IDCOUNTER Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   SECUREPROFILE_DRIVERDEFAULTS   	    SECUREPROFILE_ITEM_CURRENT_VALUE   	    SETTINGS " " 	  $ SECUREPROFILE_QUEUE_TIMEOUT & & 	  ( SECUREPROFILE_FLASHFALLBACK * * 	  , SETTINGSDESC . . 	  0 OLDSECUREPROFILEENABLED 2 2 	  4 SECUREPROFILE_UUIDTOKEN 6 6 	  8 /SECUREPROFILE_RDS_SECURITY_USESINGLERDSPASSWORD : : 	  < "SECUREPROFILE_SESSIONCOOKIETIMEOUT > > 	  @ CHECKCSRFTOKEN B B 	  D "SECUREPROFILE_RDS_SECURITY_ENABLED F F 	  H AERRORMESSAGES J J 	  L RESULT N N 	  P BERRORSEXIST R R 	  T CFCATCH V V 	  X SECUREPROFILE_ROBUST_ENABLED Z Z 	  \ $SECUREPROFILE_ADMIN_SECURITY_ENABLED ^ ^ 	  ` SECUREPROFILE_MISSING_TEMPLATE b b 	  d  SECUREPROFILE_ALLOWEDADMINIPLIST f f 	  h SECUREPROFILE_RDS_ENABLED j j 	  l SECUREPROFILE_ITEM_NAME n n 	  p ERROR_ENABLE_SECURE_PROFILE r r 	  t #SECUREPROFILE_STARTWEBSOCKETSERVICE v v 	  x SECUREPROFILE_SITE_WIDE z z 	  | SECUREPROFILEENABLED ~ ~ 	  � GETCSRFTOKEN � � 	  � TOKEN � � 	  � #SECUREPROFILE_DISABLESERVICEFACTORY � � 	  � ON_OFF � � 	  � SECUREPROFILE_POSTSIZELIMIT � � 	  � SETTING � � 	  � #SECUREPROFILE_ITEM_CURRENT_VALUE_SP � � 	  � "SECUREPROFILE_SBS_SECURITY_ENABLED � � 	  � REQUEST � � 	  � *SECUREPROFILE_INTERNALCOOKIESDISABLEUPDATE � � 	  �  SECUREPROFILE_ITEM_DEFAULT_VALUE � � 	  � #SECUREPROFILE_ADMIN_USERID_REQUIRED � � 	  � SECUREPROFILE_CFSTAT � � 	  � FORM � � 	  � 'SECUREPROFILE_ALLOWCONCURRENTADMINLOGIN � � 	  � SECUREPROFILE_SCRIPTPROTECT � � 	  � ___IMPLICITARRYSTRUCTVAR0 � createImplicitVariable S(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;)Lcoldfusion/runtime/Variable; � �
  � � 	  � com.macromedia.SourceModTime  BF��� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � com.adobe.coldfusion.* � bindImportPath (Ljava/lang/String;)V � �
  � 

 � _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V � �
  � %class$coldfusion$tagext$net$CookieTag Ljava/lang/Class; coldfusion.tagext.net.CookieTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � coldfusion/tagext/net/CookieTag � _setCurrentLineNo (I)V � �
  � cfcookie � expires � 30 _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
  
setExpires (Ljava/lang/Object;)V
 �	 value CGI java/lang/String SCRIPT_NAME _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;
  _String &(Ljava/lang/Object;)Ljava/lang/String; coldfusion/runtime/Cast
 \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  setValue  �
 �! httponly# true% _boolean (Ljava/lang/String;)Z'(
) :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z+
 , setHttpOnly (Z)V./
 �0 name2 cfadmin_lastpage_4 GetAuthUser ()Ljava/lang/String;67
 8 concat &(Ljava/lang/String;)Ljava/lang/String;:;
< setName> �
 �? 	hasEndTagA/ coldfusion/tagext/GenericTagC
DB _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)ZFG
 H 


J 
L 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTagON �	 Q !coldfusion/tagext/lang/IncludeTagS 	cfincludeU templateW ../auditlog.cfmY setTemplate[ �
T\ SECURITY^ _resolve`
 a isAdminSecurityEnabledc java/lang/Objecte _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;gh
 i (Ljava/lang/Object;)Z'k
l isAdminUserIdRequiredn 
	p isRootAdminUserr 
		t NOTROOTADMINv _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)Vxy
 z GetContextRoot|7
 } "/CFIDE/administrator/forbidden.cfm %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTag�� �	 � coldfusion/tagext/lang/AbortTag� (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag�� �	 � "coldfusion/tagext/lang/ImportedTag� l10n� 
../cftags/� admin� :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V>�
�� &coldfusion/runtime/AttributeCollection� id� secureprofilepagename� var� pagename� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
�� 
doStartTag ()I��
�� 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � Secure Profile Settings� write� � java/io/Writer�
�� doAfterBody��
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�� #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
�� 	doFinally� 
�� secureprofile_item_name� Setting Name�  secureprofile_item_current_value� Current Value� #secureprofile_item_current_value_sp� Secure Default Value�  secureprofile_item_default_value� $Snapshot when secure profile enabled� secureprofile_uuidtoken� Use UUID for cftoken� #secureprofile_startWebSocketService� Enable WebSocket Server� secureprofile_flashFallBack� Start Flash Policy Server� secureprofile_robust_enabled� #Enable Robust Exception Information� secureprofile_cfstat� Enable CFSTAT� secureprofile_postSizeLimit� Maxium size of post data (MB)� "secureprofile_sessionCookieTimeout�  Session Cookie Timeout (Minutes)� *secureprofile_internalCookiesDisableUpdate� /Disable updating of ColdFusion internal cookies� #secureprofile_disableServiceFactory� 5Disable access to internal ColdFusion Java components� secureprofile_site_wide Site Error Handler secureprofile_queue_timeout Request Queue Timeout Page secureprofile_missing_template	 Missing Template Error Handler secureprofile_scriptprotect Enable Global Script Protection  secureprofile_allowedAdminIPList Allowed IP Addresses "secureprofile_sbs_security_enabled Enable Sandbox Security secureprofile_rds_enabled 
Enable RDS "secureprofile_rds_security_enabled RDS Authentication Enabled /secureprofile_rds_security_usesinglerdspassword! RDS seperate UserID Disabled# $secureprofile_admin_security_enabled% Admin Authentication Enabled' #secureprofile_admin_userid_required) Admin separate UserID Required+ 'secureprofile_allowconcurrentadminlogin- :Allow concurrent login sessions for Administrator Console./ secureprofile_driverdefaults1 FDisable create, drop, alter, grant, revoke, stored procedures for DSNs3 false5 checkSimpleParameter 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V78
 9 	StructNew !()Lcoldfusion/util/FastHashtable;;<
 = set? coldfusion/runtime/VariableA
B@ _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;DE
 F 	UUIDTOKENH E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)VxJ
 K FLASHFALLBACKM STARTWEBSOCKETSERVICEO ROBUST_ENABLEDQ CFSTATS POSTSIZELIMITU SESSIONCOOKIETIMEOUTW INTERNALCOOKIESDISABLEUPDATEY DISABLESERVICEFACTORY[ 	SITE_WIDE] QUEUE_TIMEOUT_ MISSING_TEMPLATEa SCRIPTPROTECTc ALLOWEDADMINIPLISTe SBS_SECURITY_ENABLEDg RDS_ENABLEDi RDS_SECURITY_ENABLEDk !RDS_SECURITY_USESINGLERDSPASSWORDm ADMIN_SECURITY_ENABLEDo ADMIN_USERID_REQUIREDq ALLOWCONCURRENTADMINLOGINs DRIVERDEFAULTSu 



w LOCALEy REQUEST.LOCALE{ en} V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V7
 � 
LOCALEFILE� java/lang/StringBuffer� resources/security_�  �
�� append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;��
�� .cfm� toString�7
f� ArrayNew (I)Ljava/util/List;��
 � _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array;��
� setArray (Lcoldfusion/runtime/Array;)V��
B� ADMINSUBMIT� FORM.ADMINSUBMIT�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � _Object (Z)Ljava/lang/Object;��
� SECURITYAPI� REQUEST.SECURITYAPI�  � 	CSRFTOKEN� FORM.CSRFTOKEN� _get�E
 � checkCSRFToken� SECTABKEYNAME� 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;��
 � 

	� *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� isSecureProfile� isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � 	IsBoolean�k
 � enableSecureProfile� disableSecureProfile� unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t44 [Ljava/lang/String; Any���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
�� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� �	 � coldfusion/tagext/io/OutputTag�
�� 
			� error_enable_secure_profile� ~
				There was an error while enabling secure profile and its settings.<br/>
				Please check logs for more details.</br>
				� MESSAGE� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;�
 � EncodeForHTML�;
 � 
<br/>
				� DETAIL 
�� coldfusion/tagext/QueryLoop
�
�
�� _List $(Ljava/lang/Object;)Ljava/util/List;	

 ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z
  unbind 
� _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;
  
			
	   
		  FORM.ON_OFF 
			  #class$coldfusion$tagext$lang$LogTag coldfusion.tagext.lang.LogTag  �	 " coldfusion/tagext/lang/LogTag$ cflog& file( audit* setFile, �
%- application/ no1 setApplication3/
%4 text6 User 8 % has enabled Secure Profile settings.: setText< �
%= & has disabled Secure Profile settings.? ../header.cfmA )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTagDC �	 F #coldfusion/tagext/html/form/FormTagH cfformJ secureprofileL
I? actionO 	setActionQ �
IR methodT POSTV 	setMethodX �
IY
I� ../include/buttonbar.cfm\ ../include/margintop.cfm^ ../include/errors.cfm` /

<input type="hidden" name="csrftoken" value="b getCSRFTokend ">

<h2 class="pageHeader">f pageHeader_secureprofileh  Security &gt; Secure Profilej </h2>
<br>

l I
	<input type="checkbox" name="on_off" value="true" checked id="enable">
n A
	<input type="checkbox" name="on_off" value="true" id="enable">
p 
<label for="enable">
<b>r enable_switch_secureprofilet Enable Secure Profilev _factor1x
 y </b></label>
<br>
<br>
{ welcome_secureprofile} �
Secure Profile settings are only a recommendation. You should further configure the server as per the requirement. The settings affected with this are listed in below table.

I�
I�
I�
I� _factor3�
 � 

<br />
<br />
<br />

� "getAllSecureProfileSettingsInArray� �
	<table name="securetablename" id="securetableid" border="0" cellpadding="5" cellspacing="0" style="width:100%;">
		<tr>
			<td scope=row colspan="4" bgcolor="#� 	GRAYLIGHT�  " class="cellBlueTopAndBottom">
� �
	<table name="securetablename" id="securetableid" border="0" cellpadding="5" cellspacing="0" style="width:80%;">
		<tr>
			<td scope=row colspan="3" bgcolor="#� 
		<b class="form-title">� secureprofile_serverinfo� Secure Profile Settings Summary� �</b>
			</td>
		</tr>
<tr>
	<th name="itemname" scope=row class="cell4BlueSides fixedWidthColumnInSecureProfile" style="background-color: #fafafa">� ]</th>
	<th name="itemvalue" scope=row class="cell4BlueSides fixedWidthColumnInSecureProfile">� c</th>
	<th name="itemsecurevalue" scope=row class="cell4BlueSides fixedWidthColumnInSecureProfile">� </th>
	� g
		<th name="itemdefaultvalue" scope=row nowrap class="cell4BlueSides fixedWidthColumnInSecureProfile">� 
</tr>
� 0� java/util/List� size���� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � get (I)Ljava/lang/Object;���� _double (Ljava/lang/Object;)D��
� (D)Ljava/lang/Object;��
� 
	<tr name="rowname� " id="rowid� v">
		<td scope=row scope=row class="cell3BlueSides fixedWidthColumnInSecureProfile" style="background-color: #fafafa">� NAME� _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � </td>				
		� driverdefaults� _compare '(Ljava/lang/Object;Ljava/lang/String;)D��
 � U
			<td scope=row class="cellRightAndBottomBlueSide fixedWidthColumnInSecureProfile">� COMBINEDNAME�  : � CURRENTDEFAULT� Z</td>
			<td scope=row class="cellRightAndBottomBlueSide fixedWidthColumnInSecureProfile">� SECUREDEFAULT� 	</td>
			� 
				� DEFAULT� SETTING.DEFAULT� Len (Ljava/lang/Object;)I��
 ���
� (Ljava/lang/Object;D)D��
 � W
					<td scope=row class="cellRightAndBottomBlueSide fixedWidthColumnInSecureProfile">� 
</td>
				� g
					<td scope=row class="cellRightAndBottomBlueSide fixedWidthColumnInSecureProfile">&nbsp;</td>
				� SETTING.CURRENTDEFAULT� V
				<td scope=row class="cellRightAndBottomBlueSide fixedWidthColumnInSecureProfile">� e
				<td scope=row class="cellRightAndBottomBlueSide fixedWidthColumnInSecureProfile">&nbsp;</td>
			� 			
			� SETTING.SECUREDEFAULT� _factor2�
 � 
	</tr>
� 
</table>
<br/> <br/>	
 _factor4
  ../include/marginbottom.cfm ../footer.cfm metaData Ljava/lang/Object;
	  this Lcfsecureprofile2ecfm700918267; LocalVariableTable Code <clinit> __factorParent out Ljavax/servlet/jsp/JspWriter; t4 ,Lcoldfusion/runtime/TransientVariableHolder; t5 #Lcoldfusion/runtime/AbortException; t6 Ljava/lang/Exception; __cfcatchThrowable0 Ljava/lang/Throwable; output35  Lcoldfusion/tagext/io/OutputTag; mode35 I module34 $Lcoldfusion/tagext/lang/ImportedTag; mode34 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 LineNumberTable java/lang/Throwable2 !coldfusion/runtime/AbortException4 java/lang/Exception6 	include39 #Lcoldfusion/tagext/lang/IncludeTag; 	include40 	include41 module42 mode42 t9 t10 t11 module43 mode43 cookie0 !Lcoldfusion/tagext/net/CookieTag; include1 include2 abort3 !Lcoldfusion/tagext/lang/AbortTag; module4 mode4 module5 mode5 module6 mode6 t26 t27 t28 t29 t30 t31 module7 mode7 t34 t35 t36 t37 t38 t39 module8 mode8 t42 t43 t45 t46 t47 module9 mode9 t50 t51 t52 t53 t54 t55 module10 mode10 t58 t59 t60 t61 t62 t63 module11 mode11 t66 t67 t68 t69 t70 t71 module12 mode12 t74 t75 t76 t77 t78 t79 module13 mode13 t82 t83 t84 t85 t86 t87 module14 mode14 t90 t91 t92 t93 t94 t95 module15 mode15 t98 t99 t100 t101 t102 t103 module16 mode16 t106 t107 t108 t109 t110 t111 module17 mode17 t114 t115 t116 t117 t118 t119 module18 mode18 t122 t123 t124 t125 t126 t127 module19 mode19 t130 t131 t132 t133 t134 t135 module20 mode20 t138 t139 t140 t141 t142 t143 module21 mode21 t146 t147 t148 t149 t150 t151 module22 mode22 t154 t155 t156 t157 t158 t159 module23 mode23 t162 t163 t164 t165 t166 t167 module24 mode24 t170 t171 t172 t173 t174 t175 module25 mode25 t178 t179 t180 t181 t182 t183 module26 mode26 t186 t187 t188 t189 t190 t191 module27 mode27 t194 t195 t196 t197 t198 t199 module28 mode28 t202 t203 t204 t205 t206 t207 module29 mode29 t210 t211 t212 t213 t214 t215 module30 mode30 t218 t219 t220 t221 t222 t223 log36 Lcoldfusion/tagext/lang/LogTag; log37 	include38 output47 mode47 t229 module46 mode46 t232 t233 t234 t235 t236 t237 t238 Ljava/util/List; t239 t240 t241 t242 t243 t244 t245 t246 t247 varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; getMetadata ()Ljava/lang/Object; form45 %Lcoldfusion/tagext/html/form/FormTag; mode45 module44 mode44 runPage 	include48 	include49 1     5                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     � �   N �   � �   � �   ��   � �    �   C �   
   
       #     *� 
�                  x     Z� � �P� �R�� ���� ���Y�S��� ��!� �#E� �G��Y�f����          Z      �    �*,q� �*� ���C**� ������ *� �*��Y�S��C*o� �**� E���*�fY**� ��GSY*��Y�S�S��W*,�� ��Y*� з�:*,u� �*� 5*t� �**��Y�S�b��f�j�C**� ��̸�Y�m� W*v� �**� ��G�ϸ�Y�m� W**� ��G�m� 8**� 5�G�m�� %*z� �**��Y�S�b��f�jW� 3**� 5�G�m� %*}� �**��Y�S�b��f�jW*,q� �<�B:�:��:�߸�               W��*,u� �*� U&�C*,u� �*��#+� ���:* �� ��E��Y6	�@*,� �*��"� ���:
* �� �
�����
��Y�fY�SY�SY�SY�S����
�E
��Y6� �*
,��M,���,* �� �**� Y�Y�S�������,���,* �� �**� Y�YS�������*,� �
������ � :� �:*,��M�
��� :� )� q� ��� � #:
�ɨ � :� �:
�̩*,u� ������� :� &� w�� � #:�� � :� �:��*,u� �*� Q* �� �**� M�G�**� u�G����C*,q� � �� � :� �:��*� A��3���36��3���36��3���3���3���3��23�&23,/23��A3�&A3,/A32>A3AFA3 �dg5 �dl7 �d�3g��3�&�3,��3���3    �   �    � �   �   �   �   �   �   �   �   � ! 	  �"# 
  �$!   �%   �&   �'   �(   �)   �*   �+   �,   �-   �.   �/   �0 1  " H  j  j  j  k  k  k  k  k ' m ' m # m  k @ o R o ] o @ o @ o  h � t � t � t � v � v � v � v � v � v � v � v � v � v � v � v � x � x � x
 z
 z � x) |= }= }) |) | � v � s� �� �� �� � �& �Z �Z �Z �Z �R �� �� �� �� �| �� �� �e �e �p �e �e �Z �Z � z r x   u    �*,M� �*�R'+� ��T:* �� �VX]��]�E�I� �*,M� �*�R(+� ��T:* �� �VX_��]�E�I� �*,M� �*�R)+� ��T:* �� �VXa��]�E�I� �,c��,* �� �**� ���e*�fY*��Y�S�S�����,g��*��*+� ���:* �� ��������Y�fY�SYiS�����E��Y6� 6*,��M,k�������� � :	� 	�:
*,��M�
��� :� #�� � #:�ɨ � :� �:�̩,m��**� ��G�m� ,o��� 
,q��,s��*��++� ���:* �� ��������Y�fY�SYuS�����E��Y6� 6*,��M,w�������� � :� �:*,��M���� :� #�� � #:�ɨ � :� �:�̩*� Tps3sxs3I��3���3I��3���3���3���3>Z]3]b]33}�3���33}�3���3���3���3    �   �    � �   �   �   �89   �:9   �;9   �<#   �=!   �> 	  �? 
  �@   �%   �&   �'   �A#   �B!   �*   �+   �,   �-   �.   �/ 1   J  & �  � f � H � � � � � � � � � � � � � � �9 � �� �� �� �# �� �    6� 
 �   �*,� �*� �+� �� �:*� �� ��
�*�YS����"�$&�*�-�1�35*� �*�9�=��@�E�I� �*,K� �*,M� �*�R+� ��T:*� �VXZ��]�E�I� �*,K� �*� �**��Y_S�bd�f�jY�m� %W*� �**��Y_S�bo�f�j�m� �*,q� �*� �**��Y_S�bs�f�j�m�� �*,u� �*��YwS&�{*,u� �*�R+� ��T:*� �VX*� �*�~��=��]�E�I� �*,u� �*��+� ���:* � ��E�I� �*,q� �*,M� �*,� �*��+� ���:*$� ��������Y�fY�SY�SY�SY�S�����E��Y6	� 6*	,��M,��������� � :
� 
�:*	,��M���� :� #�� � #:�ɨ � :� �:�̩*,M� �*��+� ���:*%� ��������Y�fY�SY�SY�SY�S�����E��Y6� 6*,��M,ж������� � :� �:*,��M���� :� #�� � #:�ɨ � :� �:�̩*,M� �*��+� ���:*&� ��������Y�fY�SY�SY�SY�S�����E��Y6� 6*,��M,Զ������� � :� �:*,��M���� :� #�� � #:�ɨ � :� �:�̩*,M� �*��+� ���: *'� � ����� ��Y�fY�SY�SY�SY�S���� �E ��Y6!� 6* !,��M,ض� ������ � :"� "�:#*!,��M�# ��� :$� #$�� � #:% %�ɨ � :&� &�:' �̩'*,M� �*��+� ���:(*(� �(�����(��Y�fY�SY�SY�SY�S����(�E(��Y6)� 6*(),��M,ܶ�(������ � :*� *�:+*),��M�+(��� :,� #,�� � #:-(-�ɨ � :.� .�:/(�̩/*,K� �*��	+� ���:0*+� �0�����0��Y�fY�SY�SY�SY�S����0�E0��Y61� 6*01,��M,��0������ � :2� 2�:3*1,��M�30��� :4� #4�� � #:505�ɨ � :6� 6�:70�̩7*,M� �*��
+� ���:8*,� �8�����8��Y�fY�SY�SY�SY�S����8�E8��Y69� 6*89,��M,��8������ � ::� :�:;*9,��M�;8��� :<� #<�� � #:=8=�ɨ � :>� >�:?8�̩?*,M� �*��+� ���:@*-� �@�����@��Y�fY�SY�SY�SY�S����@�E@��Y6A� 6*@A,��M,��@������ � :B� B�:C*A,��M�C@��� :D� #D�� � #:E@E�ɨ � :F� F�:G@�̩G*,M� �*��+� ���:H*.� �H�����H��Y�fY�SY�SY�SY�S����H�EH��Y6I� 6*HI,��M,��H������ � :J� J�:K*I,��M�KH��� :L� #L�� � #:MHM�ɨ � :N� N�:OH�̩O*,M� �*��+� ���:P*/� �P�����P��Y�fY�SY�SY�SY�S����P�EP��Y6Q� 6*PQ,��M,��P������ � :R� R�:S*Q,��M�SP��� :T� #T�� � #:UPU�ɨ � :V� V�:WP�̩W*,M� �*��+� ���:X*0� �X�����X��Y�fY�SY�SY�SY�S����X�EX��Y6Y� 6*XY,��M,���X������ � :Z� Z�:[*Y,��M�[X��� :\� #\�� � #:]X]�ɨ � :^� ^�:_X�̩_*,M� �*��+� ���:`*1� �`�����`��Y�fY�SY�SY�SY�S����`�E`��Y6a� 6*`a,��M,���`������ � :b� b�:c*a,��M�c`��� :d� #d�� � #:e`e�ɨ � :f� f�:g`�̩g*,M� �*��+� ���:h*2� �h�����h��Y�fY�SY�SY�SY�S����h�Eh��Y6i� 6*hi,��M,���h������ � :j� j�:k*i,��M�kh��� :l� #l�� � #:mhm�ɨ � :n� n�:oh�̩o*,M� �*��+� ���:p*3� �p�����p��Y�fY�SY�SY�SY�S����p�Ep��Y6q� 6*pq,��M, ��p������ � :r� r�:s*q,��M�sp��� :t� #t�� � #:upu�ɨ � :v� v�:wp�̩w*,M� �*��+� ���:x*4� �x�����x��Y�fY�SYSY�SYS����x�Ex��Y6y� 6*xy,��M,��x������ � :z� z�:{*y,��M�{x��� :|� #|�� � #:}x}�ɨ � :~� ~�:x�̩*,M� �*��+� ���:�*5� ����������Y�fY�SYSY�SYS������E���Y6�� 6*��,��M,��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*6� ����������Y�fY�SY
SY�SY
S������E���Y6�� 6*��,��M,��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*7� ����������Y�fY�SYSY�SYS������E���Y6�� 6*��,��M,��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*8� ����������Y�fY�SYSY�SYS������E���Y6�� 6*��,��M,��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*9� ����������Y�fY�SYSY�SYS������E���Y6�� 6*��,��M,��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*:� ����������Y�fY�SYSY�SYS������E���Y6�� 6*��,��M,��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*;� ����������Y�fY�SYSY�SYS������E���Y6�� 6*��,��M, ��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*<� ����������Y�fY�SY"SY�SY"S������E���Y6�� 6*��,��M,$��������� � :�� ��:�*�,��M������ :�� #��� � #:����ɨ � :�� ��:���̩�*,M� �*��+� ���:�*=� ����������Y�fY�SY&SY�SY&S������E���Y6�� 6*��,��M,(��������� � :¨ ¿:�*�,��M������ :Ĩ #İ� � #:��Ŷɨ � :ƨ ƿ:���̩�*,M� �*��+� ���:�*>� �������Ȼ�Y�fY�SY*SY�SY*S������Eȶ�Y6ə 6*��,��M,,��ȶ����� � :ʨ ʿ:�*�,��M��ȶ�� :̨ #̰� � #:��Ͷɨ � :Ψ ο:�ȶ̩�*,M� �*��+� ���:�*?� �������л�Y�fY�SY.SY�SY.S������Eж�Y6љ 6*��,��M,0��ж����� � :Ҩ ҿ:�*�,��M��ж�� :Ԩ #԰� � #:��նɨ � :֨ ֿ:�ж̩�*,M� �*��+� ���:�*@� �������ػ�Y�fY�SY2SY�SY2S������Eض�Y6ٙ 6*��,��M,4��ض����� � :ڨ ڿ:�*�,��M��ض�� :ܨ #ܰ� � #:��ݶɨ � :ި ޿:�ض̩�*,K� �**� �6�:*,M� �*� ɸ>�C*� 1**� ɶG�C*,M� �**� 1�YIS**� 9�G�L*,M� �**� 1�YNS**� -�G�L*,M� �**� 1�YPS**� y�G�L*,M� �**� 1�YRS**� ]�G�L*,M� �**� 1�YTS**� ��G�L*,M� �**� 1�YVS**� ��G�L*,M� �**� 1�YXS**� A�G�L*,M� �**� 1�YZS**� ��G�L*,M� �**� 1�Y\S**� ��G�L*,M� �**� 1�Y^S**� }�G�L*,M� �**� 1�Y`S**� )�G�L*,M� �**� 1�YbS**� e�G�L*,M� �**� 1�YdS**� ��G�L*,M� �**� 1�YfS**� i�G�L*,M� �**� 1�YhS**� ��G�L*,M� �**� 1�YjS**� m�G�L*,M� �**� 1�YlS**� I�G�L*,M� �**� 1�YnS**� =�G�L*,M� �**� 1�YpS**� a�G�L*,M� �**� 1�YrS**� ��G�L*,M� �**� 1�YtS**� ��G�L*,M� �**� 1�YvS**� �G�L*,x� �**� �z|~��*,M� �*��Y�S��Y���*��YzS����������{*,K� �**� U6�:*,M� �*� M*e� �*������*,� �**� �������Y�m� W**� ��������m��*+,�� �*,� �**� U�G�m��]*,� �**� ������Y�m� W*��Y�S��m� �*,� �*�#$+� ��%:�* �� ��')+��.�'02�*�-�5�'7��Y9��* �� �*�9��;������>��E�I� �*,u� � �*,� �*�#%+� ��%:�* �� ��')+��.�'02�*�-�5�'7��Y9��* �� �*�9��@������>��E�I� �*,u� �*,q� �*,M� �*,K� �*�R&+� ��T:�* �� ��VXB��]��E�I� �*,� �*� �* �� �**��Y�S�b��f�j�C*,� �*��/+� ���:�* �� ���E��Y6�s*�,��� :���,���*� %* �� �**��Y�S�b��f�j�C*,� �**� ��G�m� +,���,*��Y�S����,���� (,���,*��Y�S����,���,���*��.� ���:�* Ķ ���������Y�fY�SY�S������E��Y6� 6*��,��M,��������� � :� �:�*�,��M����� :� &�]갨 � #:���ɨ � :� �:��̩�,���,**� q�G���,���,**� !�G���,���,**� ��G���,���**� ��G�m�  ,���,**� ��G���,���,���*� ��C*,M� �**� %�G�:�6�6��� 6�*���:� :��� N�-�C-� *�,��� :� Y�, ����`6�����,�������� :�� #��� � #:����� � :�� ��:����*� �d��3���3Y��3���3Y��3���3���3���33OR3RWR3(r~3x{~3(r�3x{�3~��3���3"3"'"3�BN3HKN3�B]3HK]3NZ]3]b]3���3���3�33�-3-3*-3-2-3���3���3���3���3���3���3���3��3s��3���3h��3���3h��3���3���3���3C_b3bgb38��3���38��3���3���3���3/232723R^3X[^3Rm3X[m3^jm3mrm3��	3			3�	"	.3	(	+	.3�	"	=3	(	+	=3	.	:	=3	=	B	=3	�	�	�3	�	�	�3	�	�	�3	�	�	�3	�	�
3	�	�
3	�


3


3
�
�
�3
�
�
�3
x
�
�3
�
�
�3
x
�
�3
�
�
�3
�
�
�3
�
�
�3Sor3rwr3H��3���3H��3���3���3���3#?B3BGB3bn3hkn3b}3hk}3nz}3}�}3�33�2>38;>3�2M38;M3>JM3MRM3���3���3�33�333"3���3���3���3���3���3���3���3���3c�3���3X��3���3X��3���3���3���33OR3RWR3(r~3x{~3(r�3x{�3~��3���3"3"'"3�BN3HKN3�B]3HK]3NZ]3]b]3���3���3�33�-3-3*-3-2-3���3���3���3���3���3���3���3��3s��3���3h��3���3h��3���3���3���3C_b3bgb38��3���38��3���3���3���3/232723R^3X[^3Rm3X[m3^jm3mrm3��33�".3(+.3�"=3(+=3.:=3=B=3���3���3���3���3��3��3�
33���3���3x��3���3x��3���3���3���3�33�5A3;>A3�5P3;>P3AMP3PUP3� {35 {3; 9 {3 ? o {3 u x {3� �35 �3; 9 �3 ? o �3 u x �3 { � �3 � � �3   	� �   �     � �    �    �    �CD    �E9    �F9    �GH    �I#    �J! 	   �? 
   �@    �%    �&    �'    �(    �K#    �L!    �+    �,    �-    �.    �/    �0    �M#    �N!    �O    �P    �Q    �R    �S    �T    �U#     �V! !   �W "   �X #   �Y $   �Z %   �[ &   �\ '   �]# (   �^! )   �_ *   �` +   �� ,   �a -   �b .   �c /   �d# 0   �e! 1   �f 2   �g 3   �h 4   �i 5   �j 6   �k 7   �l# 8   �m! 9   �n :   �o ;   �p <   �q =   �r >   �s ?   �t# @   �u! A   �v B   �w C   �x D   �y E   �z F   �{ G   �|# H   �}! I   �~ J   � K   �� L   �� M   �� N   �� O   ��# P   ��! Q   �� R   �� S   �� T   �� U   �� V   �� W   ��# X   ��! Y   �� Z   �� [   �� \   �� ]   �� ^   �� _   ��# `   ��! a   �� b   �� c   �� d   �� e   �� f   �� g   ��# h   ��! i   �� j   �� k   �� l   �� m   �� n   �� o   ��# p   ��! q   �� r   �� s   �� t   �� u   �� v   �� w   ��# x   ��! y   �� z   �� {   �� |   �� }   �� ~   ��    ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �� �   �� �   �� �   �� �   ��# �   ��! �   �� �   �� �   �  �   � �   � �   � �   �# �   �! �   � �   � �   � �   �	 �   �
 �   � �   �# �   �! �   � �   � �   � �   � �   � �   � �   � �   � �   �9 �   � �   �! �   � �   �# �   �! �   � �   � �   � �   �  �   �! �   �" �   �#$ �   �%! �   �&! �   �'! �   �(  �   �) �   �* �   �+ �   �, �   �- �1  �7 "  3  3  U  i  r  r  i    �  �  �  �  �    � < < < t t g g � � � � � �  <  � = $I $ $ % %� %� &� &� &� '� 'v '| (� (F (L +X + + ,( ,� ,� -� -� -� .� .� .	� /	� /	V /
\ 0
h 0
& 0, 18 1
� 1� 2 2� 2� 3� 3� 3� 4� 4f 4l 5x 56 5< 6H 6 6 7 7� 7� 8� 8� 8� 9� 9v 9| :� :F :L ;X ; ; <( <� <� =� =� =� >� >� >� ?� ?V ?\ @h @& @� C D D	 D	 D D	 D9 E9 E* E* E[ F[ FL FL F} G} Gn Gn G� H� H� H� H� I� I� I� I� J� J� J� J K K� K� K' L' L L LI MI M: M: Mk Nk N\ N\ N� O� O~ O~ O� P� P� P� P� Q� Q� Q� Q� R� R� R� R S S S S7 T7 T( T( TY UY UJ UJ U{ V{ Vl Vl V� W� W� W� W� X� X� X� X� Y� Y� Y� Y Z Z� Z� Z! ^@ `F `F `\ `< `< `/ `/ _u d� e� e� e� e� e� g� g� g� g� g� g� g� g� g� g� g� g� g� �� �� �� �� �  � �� �� � � �� �N �` �y �� �� �� �u �0 �� �� �	 � � � � �� �� �� �� �� g{ �] �� �� �� �� � � � � �> �T �T �S �| �| �{ �t �> �� �� �i �i �h � � �~ �� �� �� �� �� �� �� �� �� �� �� �� �� � Q �� �� � �   � 	   �*,q� �*� **� �G��c���C,���,**� �G���,���,**� �G���,���,**� 1**� ��Y�S���Ƹ��,ȶ�**� ��Y�S��ʸ���O,ж�,**� ��Y�S�����,Զ�,**� ��Y�S�����,ض�,**� ��Y�S�����,Զ�,**� ��Y�S�����,ܶ�**� ��G�m� �*,޶ �**� ������Y�m� 0W* ض �**� ��Y�S��������t|���m� M,���,**� ��Y�S�����,Զ�,**� ��Y�S�����,��� 
,��*,� �*,u� ��*,� �**� ������Y�m� 0W* ߶ �**� ��Y�S��������t|���m� -,���,**� ��Y�S�����,ܶ�� 
,���*,�� �**� �������Y�m� 0W* � �**� ��Y�S��������t|���m� -,���,**� ��Y�S�����,ܶ�� 
,���*,�� �**� ��G�m� �*,޶ �**� ������Y�m� 0W* � �**� ��Y�S��������t|���m� -,���,**� ��Y�S�����,��� 
,��*,� �*,u� �*�      *   �    � �   �   � 1  � l  �  �  �  �  �  �  � ' � ' � & � = � = � < � X � S � S � R � z � � � � � � � � � � � � � � � � � � � � � � � � � � � �5 �5 �9 �< �4 �4 �T �T �l �T �T �4 �� �� �� �� �� �� �� �4 � �� �� �� �� �� �� � � �# � � �� �> �> �= �` �� �p �p �t �w �o �o �� �� �� �� �� �o �� �� �� �� �o �� �
 �
 � � �	 �	 �) �) �A �) �) �	 �\ �\ �[ �~ �	 �� �� � z �      H    *+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+� ǵ ɱ              ./   01  23    "     ��             �   � 	   �*,M� �*�G-+� ��I:* �� �K3M��NKP*�YS����SKUW��Z�E�[Y6�*,��M*,�z� :� �*�,|��*��,� ���:* �� ��������Y�fY�SY~S�����E��Y6� 6*,��M,��������� � :	� 	�:
*,��M�
��� :� )� M� ��� � #:�ɨ � :� �:�̩*,M� ������ � :� �:*,��M���� :� #�� � #:��� � :� �:���*�  �33 �6B3<?B3 �6Q3<?Q3BNQ3QVQ3 v �x3 �6x3<ux3x}x3 k ��3 �6�3<��3���3 k ��3 �6�3<��3���3���3���3    �   �    � �   �   �   �45   �6!   �   �7#   �8!   �> 	  �? 
  �@   �%   �&   �'   �(   �)   �*   �+   �,   �- 1     & � 8 � 8 � [ � � � � �  � 93        �*� ж �L*� �N*ܶ �*-+�� �*+M� �*�R0-� ��T:* �� �VX��]�E�I� �*+M� �*�R1-� ��T:* �� �VX	��]�E�I� ��      >    �     �    �    � � �    �:9    �;9 1     E � ' � � � g �          �    �