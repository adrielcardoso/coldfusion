����  -� 
SourceFile E/CFIDE/administrator/archives/wizards/archivewizard_page_settings.cfm ,cfarchivewizard_page_settings2ecfm1681567736  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   	URLENCHAR Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   	ASETTINGS   	   SETTING   	    SETTINGSLIST " " 	  $ DESELECTALLSETTINGS & & 	  ( REQUEST * * 	  , ISSERVERMONITORINGAVAILABLE . . 	  0 
SELECT_ALL 2 2 	  4 FORM 6 6 	  8 DESELECTSERVER : : 	  < GETADMINVARIANT > > 	  @ SELECTSERVER B B 	  D DESELECT_ALL F F 	  H ARCHIVENAME J J 	  L 	ISSAFEURL N N 	  P GETCSRFTOKEN R R 	  T SELECTALLSETTINGS V V 	  X com.macromedia.SourceModTime  D��  pageContext #Lcoldfusion/runtime/NeoPageContext; ] ^	  _ getOut ()Ljavax/servlet/jsp/JspWriter; a b javax/servlet/jsp/JspContext d
 e c parent Ljavax/servlet/jsp/tagext/Tag; g h	  i com.adobe.coldfusion.* k bindImportPath (Ljava/lang/String;)V m n
  o 

 q _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V s t
  u 


 w 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag { forName %(Ljava/lang/String;)Ljava/lang/Class; } ~ java/lang/Class �
 �  y z	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � !coldfusion/tagext/lang/IncludeTag � _setCurrentLineNo (I)V � �
  � 	cfinclude � template � controludfs.cfm � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setTemplate � n
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � LOCALE � REQUEST.LOCALE � en � checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V � �
  � 
 � java/lang/String � 
LOCALEFILE � java/lang/StringBuffer � resources/archives_ �  n
 � � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � .cfm � toString ()Ljava/lang/String; � � java/lang/Object �
 � � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � WHERETO � FORM.WHERETO �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z � �
  � 
		 � CAR � ARCHIVES � _resolve � �
  � URL � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � BASICSETTINGS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
  � clear � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � 
	 � isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z � �
   _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;
  ListToArray $(Ljava/lang/String;)Ljava/util/List;
  _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array;

 � setArray (Lcoldfusion/runtime/Array;)V coldfusion/runtime/Variable
 addAll 

		 _get
  selectAllSettings 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;
  deSelectAllSettings! NEXTSTEP# FORM.NEXTSTEP% _Object (Z)Ljava/lang/Object;'(
 �) _boolean (Ljava/lang/Object;)Z+,
 �- 	isSafeURL/ 
			1 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTag43 z	 6 !coldfusion/tagext/net/LocationTag8 
cflocation: addtoken< No> (Ljava/lang/String;)Z+@
 �A :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z �C
 D setAddtokenF �
9G urlI setUrlK n
9L (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTagON z	 Q "coldfusion/tagext/lang/ImportedTagS l10nU ../../cftags/W adminY setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V[\
T] &coldfusion/runtime/AttributeCollection_ ida archive_arsetc vare titleg ([Ljava/lang/Object;)V i
`j setAttributecollection (Ljava/util/Map;)Vlm  coldfusion/tagext/lang/ModuleTago
pn 
doStartTag ()Irs
pt 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;vw
 x Archive Settingsz write| n java/io/Writer~
} doAfterBody�s
p� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�s #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
p� 	doFinally� 
p� archivewizard_header.cfm� 
select_all� 
Select All� deselect_all� Deselect All� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� z	 � coldfusion/tagext/io/OutputTag�
�t K

<table border="0" cellpadding="1" cellspacing="0" width="100%" bgcolor="#� 
GRAYMEDIUM��"><tr><td>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="white">
<tr valign="top">
	<td height="350">
		<table border="0" cellpadding="0" cellspacing="0" width="20" bgcolor="#888885"><tr><td>
		<table border="0" cellpadding="0" cellspacing="1" width="20">
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#888885"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		</table>
		</td></tr></table>
	</td>

	<td width="20" nowrap>&nbsp;</td>
	<td width="100%"><br />

<table border="0" cellpadding="0" cellspacing="0" width="100%">
� � �
 � _List $(Ljava/lang/Object;)Ljava/util/List;��
 �� ArrayToList $(Ljava/util/List;)Ljava/lang/String;��
 � set (Ljava/lang/Object;)V��
� )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag�� z	 � #coldfusion/tagext/html/form/FormTag� cfform� name� editForm�[ n
�� method� POST� 	setMethod� n
�� action� CGI� SCRIPT_NAME� ?archivename=� URLEncodedFormat 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � 	setAction� n
��
�t �
<tr >
	<td>
	<table border="0" cellpadding="0" cellspacing="1" width="100%">
	<tr>
	<td class="cellBlueTopAndBottom" ><input type=submit value="� >" name="selectserver" class="buttn"><input type=submit value="� h" name="deselectserver" class="buttn"></td>
	</tr>
	</table></td>
</tr>
<tr>
	<td height="20" bgcolor="#� 	GRAYLIGHT� R" class="cellBlueTopAndBottom">
	<font class="label">&nbsp; <b class="form-title">� l10n_archset� General Server Settings� �</b></font></td>
</tr>
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="1" width="100%">
			<tr >
				<td width="20" height="20" nowrap bgcolor="#� 	BLUELIGHT� D" class="cellBlueTopAndBottom">&nbsp;</td>
				<th nowrap bgcolor="#� 7" class="cellBlueTopAndBottom"><p class="label">&nbsp; � Name� 0 &nbsp;</p></th>
				<th width="100%" bgcolor="#� description� Description� � &nbsp;</p></th>
			</tr>
			<tr >
				<td align="center" class="cell3BlueSides">
					<input type="checkbox" name="setting" value="Server_Settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� ')"
							  server_settings ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I
  (D)Z+
 �	 checked � id="server_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="server_settings"> settings Settings _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;
  �</label> &nbsp;</p></td>
				<td class="cellRightAndBottomBlueSide"><table border="0" cellpadding="7" cellspacing="0"><tr><td>
				<p class="label">
				 server_settings_examples �Examples: limit the number of simultaneously processed requests; timeout requests
				after X seconds.  See the Settings section of the ColdFusion Administrator for more
				details. �
				</p></td></tr></table></td>
			</tr>
			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Caching" onclick="setFormValue('archivewizard_page_settings.cfm?archivename= Caching x id="caching">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="caching">! caching# �</label></p></td>
				<td  class="cellRightAndBottomBlueSide"><table border="0" cellpadding="7" cellspacing="0"><tr><td>
				<p class="label">
				% caching_examples' |Examples: set template cache size; limit the maximum number of cached queries. See the Caching section
				for more details.) �
				</p></td></tr></table></td>
			</tr>

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Basic_Security" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=+ Basic_Security- � id="basic_security">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="basic_security">/ basic_security1 Basic Security3 _factor15
 6 basic_security_examples8 �Examples: enable and assign ColdFusion Administrator/Studio passwords; restrict use of certain tags. See the
				Basic Security section for more details.: �
				</p></td></tr></table></td>
			</tr>

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Variables" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=< 	Variables> | id="variables">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="variables">@ 	variablesB variables_examplesD YExamples: enable client and memory variables. See the Variables section for more details.F .
				</p></td></tr></table></td>
			</tr>

			H getAdminVariantJ 
standaloneL _compare '(Ljava/lang/Object;Ljava/lang/String;)DNO
 P jrunR �
			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Java" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=T JavaV r id="java">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="java">X java_jvmZ Java and JVM\ java_examples^ �Examples: specify the JVM location; specify JVM arguments. For more information, see the online Help for the Java &amp; JVM page.` ,<br>
				<br>
				<font color="993300">
				b java_warningd �<b>WARNING:</b> The Java settings contain system-specific paths that are used to start ColdFusion. If you deploy these settings to another machine and the paths are invalid, ColdFusion will fail to start.f 9
				</font>
				</p></td></tr></table></td>
			</tr>
			h _factor2j
 k �
			

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Logging" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=m Loggingo x id="logging">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="logging">q loggings logging_examplesu �Examples: set the server administrator e-mail address; log the names of pages that take over a
				specified length of time to return. See the Logging section for more details.w �
				</p></td></tr></table></td>
			</tr>

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Mail" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=y Mail{ r id="mail">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="mail">} mail mail_examples� zExamples: specify the mail server; log all e-mail messages sent by ColdFusion. See the Mail section
				 for more details.� _factor3�
 � �
				 </p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Debugging" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� 	Debugging� | id="debugging">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="debugging">� 
debugging1� debugging_examples� �Examples: display the names and values of all CGI, URL, form, and cookie variables; display
				detailed processing time; See the Debugging section for more details.� �
				</p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Charting" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� Charting� z id="charting">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="charting">� 	debugging� charting_examples� fExamples: How many charts to cache,  maximum number of charting threads, cache location, type of cache� _factor4�
 � �
				</p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="customtags" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� 
customtags� ~ id="customtags">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� customtagpaths� Custom Tag Paths� customtagpaths_examples� &Examples: The custom tag path settings� �
				</p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="watch" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� watch� y id="watch">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� watcher� Watcher Settings� watcher_examples� jExamples: Causes ColdFusion to watch its configuration files and automatically reload them if they change.� _factor5�
 � -
				</p></td></tr></table></td>
			</tr>
			� IsServerMonitoringAvailable� �
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="monitoring" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� 
monitoring� ~ id="monitoring">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� Server Monitor Settings� monitoring_examples� !Examples: Server monitor Settings� �
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="probe" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� probe� y id="probe">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� System Probes� probe_examples� {Examples: System probes can monitor the health of a web application by checking the contents of a URL at a regular interval� _factor6�
 � �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="updates" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� updates� { id="updates">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� Update Settings� updates_examples� RExamples: Update site URL, auto check for updates, update email notifications etc.� �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="websocket_settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� websocket_settings� � id="websocket_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="websocket_settings">� 
websockets� Web Sockets� LExamples: Update websocket properties like sockettime, port maxframesize etc� _factor7�
 � �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="webservice_settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� webservice_settings� � id="webservice_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="webservice_settings">  
webservice Web Service Examples: Web Services Version �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="pdfservice_settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename= pdfservice_settings
 � id="pdfservice_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="pdfservice_settings"> 
pdfservice PDF Service ?Examples: Enable using webkit implementation for PDF conversion _factor8
  �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="remoteinspection" onclick="setFormValue('archivewizard_page_settings.cfm?archivename= remoteinspection � id="remoteinspection">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="remoteinspection"> remoteinspect Remote Inspection Settings ,Examples: Enable Remote Inspection settings ! r
				</p></td></tr></table></td>
			</tr>
			</table>
		</td>
	</tr>
<input type="hidden" name="csrftoken" value="# getcsrftoken% ARCHIVETABKEYNAME' �">
<input type="Hidden" name="whereto" value="archivewizard_page_settings.cfm">
<input type="Hidden" name="nextStep" value="archivewizard_page_todolist.cfm?archivename=) e">
<input type="Hidden" name="previousStep" value="archivewizard_page_scheduledtasks.cfm?archivename=+ ">
-
��
��
��
�� _factor93
 4 c
	</table>
				<br><br><br>
</td><td width="20" nowrap>&nbsp;</td></tr></table>
</td></tr></table>
6
�� coldfusion/tagext/QueryLoop9
:�
:�
�� 	_factor10>
 ? archivewizard_footer.cfmA metaData Ljava/lang/Object;CD	 E this .Lcfarchivewizard_page_settings2ecfm1681567736; LocalVariableTable Code __factorParent out Ljavax/servlet/jsp/JspWriter; value include0 #Lcoldfusion/tagext/lang/IncludeTag; 	location2 #Lcoldfusion/tagext/net/LocationTag; module3 $Lcoldfusion/tagext/lang/ImportedTag; mode3 I t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 include4 module5 mode5 t17 t18 t19 t20 t21 t22 module6 mode6 t25 t26 t27 t28 t29 t30 output48  Lcoldfusion/tagext/io/OutputTag; mode48 t33 t34 t35 t36 t37 LineNumberTable java/lang/Throwablex varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage ()Ljava/lang/Object; 	include49 module41 mode41 t6 t7 module42 mode42 t14 t15 t16 module43 mode43 t23 t24 module44 mode44 t31 t32 form47 %Lcoldfusion/tagext/html/form/FormTag; mode47 module45 mode45 module46 mode46 module33 mode33 module34 mode34 module35 mode35 module36 mode36 module37 mode37 module38 mode38 module39 mode39 module40 mode40 <clinit> module7 mode7 module8 mode8 module9 mode9 module10 mode10 module11 mode11 module12 mode12 module13 mode13 module14 mode14 module25 mode25 module26 mode26 module27 mode27 module28 mode28 module29 mode29 module30 mode30 module31 mode31 module32 mode32 module15 mode15 module16 mode16 module17 mode17 module18 mode18 module19 mode19 t38 t39 t40 t41 t42 t43 module20 mode20 t46 t47 t48 t49 t50 t51 getMetadata module21 mode21 module22 mode22 module23 mode23 module24 mode24 1                      "     &     *     .     2     6     :     >     B     F     J     N     R     V     y z   3 z   N z   � z   � z   CD       J   #     *� 
�   I       GH   > J  	�  &  *,r� v*,x� v*� �+� �� �:*� ����� �� �� �� �� �*,x� v**� -���� �*,�� v*+� �Y�S� �Y�� �*+� �Y�S� �� Ŷ �˶ ɶ Ѷ �*,r� v**� 9�ٶ ݙ6*,߶ v*� �***+� �Y�SY�S� �*�� �YKS� �� � �� �Y�S� ��� ж �W*,�� v**� !�� �*,߶ v*� *� �**� !�� Ÿ	��*� �***+� �Y�SY�S� �*�� �YKS� �� � �� �Y�S� �� �Y**� �S� �W*,�� v*,� v**� E�� 9*,߶ v*� �**� Y�*� �Y**� M�S� W*,�� v�**� =�� 9*,߶ v*"� �**� )�"*� �Y**� M�S� W*,�� v� �*,߶ v**� 9$&� ݸ*Y�.� 0W*%� �**� Q�0*� �Y*7� �Y$S� �S� �.� m*,2� v*�7+� ��9:*&� �;=?�B�E�H;J*7� �Y$S� �� �� ��M� �� �� �*,߶ v*,�� v*,�� v*,r� v*�R+� ��T:*+� �VXZ�^�`Y� �YbSYdSYfSYhS�k�q� ��uY6� 6*,�yM,{�������� � :� �:	*,��M�	��� :
� #
�� � #:��� � :� �:���*,�� v*� �+� �� �:*,� ����� �� �� �� �� �*,r� v*�R+� ��T:*.� �VXZ�^�`Y� �YbSY�SYfSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*,�� v*�R+� ��T:*/� �VXZ�^�`Y� �YbSY�SYfSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*,r� v*��0+� ���:*1� �� ���Y6 � &*,�5� :!� D!�,7���8����;� :"� #"�� � #:##�<� � :$� $�:%�=�%*�  >Z]y]b]y3}�y���y3}�y���y���y���yGcfyfkfy<��y���y<��y���y���y���y25y5:5yUay[^ayUpy[^pyampypupy���y���y���y���y���y���y���y���y I  ~ &  GH    K h   LM   ND   OP   QR   ST   UV   WX   YD 	  ZD 
  [X   \X   ]D   ^P   _T   `V   aX   bD   cD   dX   eX   fD   gT   hV   iX   jD   kD   lX   mX   nD   op   qV    rD !  sD "  tX #  uX $  vD %w  V U   (    Q  m  r  r  �  i  i  ]  ]  �  �  �  �  �  �  �  �  �  �  �  �  �      5 I s 3 3   � � � � � � � � � �  �  �  � "� "� "� "� ! % % %  % % %7 %I %7 %7 % %� &� &� &k & % $�  �  �  +# +� +� ,� ,  ., .� .� /� /� /� 1    J       �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y�   I        �GH     �z{    �|}  ~ J   �     e*� `� fL*� jN*l� p*-+�@� �*+�� v*� �1-� �� �:*L� ���B� �� �� �� �� �*+r� v�   I   4    eGH     eLM    eND    e g h    e�P w     BL &L     J  �  $  �,���,*"� �*�� �YKS� �� �**� �� Ÿ۶�,��*#� �**� %�� �����
� 
,��,��*�R)+� ��T:*%� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,&��*�R*+� ��T:*(� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,	��,*,� �*�� �YKS� �� �**� �� Ÿ۶�,��*-� �**� %�� ����
� 
,��,��*�R++� ��T:*/� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R,+� ��T:*2� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � � �y � �y � y � �y � yyy|��y���yq��y���yq��y���y���y���y���y���y���y���y���y���y���y���yc�y���yX��y���yX��y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   �   " " !" !" " " " @# @# K# @# @# �% f%a(*(�,�,,,�,�,�,'-'-2-'-'-�/M/H22 3 J  	-  %  �,���,*+� �Y�S� �� Ŷ�,���*� %*O� �**+� �Y�SY�S� �*�� �YKS� �� � �� �Y�S��������*,�� v*��/+� ���:*P� ����� ������� ����ѻ �Y*�� �Y�S� �� ŷ �׶ �*P� �*�� �YKS� �� �**� �� Ÿ۶ ɶ �� ���� ���Y6��*,�yM*,�� :�r���*,�7� :�[���*,�l� :�D�|�*,��� :	�-�e	�*,��� :
��N
�*,��� :���7�*,��� :�� �*,��� :�Ѩ	�*,�� :�����,��,*6� �*�� �YKS� �� �**� �� Ÿ۶�,��*7� �**� %�� ����
� 
,��,��*�R-� ��T:*9� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM, �������� � :� �:*,��M���� :� )������ � #:��� � :� �:���,&��*�R.� ��T:*<� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM,"�������� � :� �:*,��M���� :� )� �#�� � #:��� � :� �:���,$��,*B� �**� U�&*� �Y*+� �Y(S� �S� � Ŷ�,*��,*D� �*�� �YKS� �� �**� �� Ÿ۶�,,��,*E� �*�� �YKS� �� �**� �� Ÿ۶�,.���/���� � :� �: *,��M� �0� :!� #!�� � #:""�1� � :#� #�:$�2�$*� 9���y���y���y���y��y��y�
yyx��y���ym��y���ym��y���y���y���y6�y<M�ySd�yj{�y���y���y���y���y���y���y���y���y���y6�y<M�ySd�yj{�y���y���y���y���y���y���y���y���y���y6�y<M�ySd�yj{�y���y���y���y���y���y���y���y���y���y���y���y I  t %  �GH    �K h   �LM   �ND   ���   ��V   ��D   ��D   �WD   �YD 	  �ZD 
  �[D   �\D   �]D   ��D   ��T   ��V   �aX   �bD   �cD   �dX   �eX   �fD   ��T   ��V   �iX   �jD   �kD   �lX   �mX   �nD   ��X   ��D    �rD !  �sX "  �tX #  �uD $w   � ;  3  3  3 0 O D O / O / O / O / O % O % O � P � P � P � P � P � P � P � P � P � P � P � P666666�64747?74747�9Z9]<%<�B
B�B�B�B3D3DEDED3D3D+DeEeEwEwEeEeE]E u P � J    $  �,ö�* �� �**� 1��*� и �.��,Ƕ�,* �� �*�� �YKS� �� �**� �� Ÿ۶�,��* �� �**� %�� �ɸ��
� 
,��,˶�*�R!+� ��T:* �� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,Ͷ������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,&��*�R"+� ��T:* �� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,Ѷ������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,ö�,Ӷ�,*� �*�� �YKS� �� �**� �� Ÿ۶�,��*� �**� %�� �ո��
� 
,��,׶�*�R#+� ��T:*� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,ٶ������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R$+� ��T:*
� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,ݶ������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � �y �*y$'*y �9y$'9y*69y9>9y���y���y���y���y���y���y���y��y���y���y�yy�'y'y$'y','y���y���y���y���y���y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   � #  �  � 6 � 6 � H � H � 6 � 6 � . � g � g � r � g � g � � � � �� �Q �  �$$66$$UU`UU�{v
?
 � J  �  $  �,��,*� �*�� �YKS� �� �**� �� Ÿ۶�,��*� �**� %�� ����
� 
,��,��*�R%+� ��T:*� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,&��*�R&+� ��T:*� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��,*� �*�� �YKS� �� �**� �� Ÿ۶�,��*� �**� %�� ����
� 
,��,��*�R'+� ��T:*� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R(+� ��T:*� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � � �y � �y � y � �y � yyy|��y���yq��y���yq��y���y���y���y���y���y���y���y���y���y���y���yc�y���yX��y���yX��y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   �     ! !    @ @ K @ @ � fa*�����''2''�MH �  J   Y     ;|� �� �5� ��7P� ��R�� ����� ����`Y� зk�F�   I       ;GH    J  +  $  ,��,**� 5�� Ŷ�,��,**� I�� Ŷ�,��,*+� �Y�S� �� Ŷ�,��*�R+� ��T:*[� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,��,*+� �Y�S� �� Ŷ�,��,*+� �Y�S� �� Ŷ�,���*�R+� ��T:*b� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,*+� �Y�S� �� Ŷ�,���*�R	+� ��T:*c� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,*g� �*�� �YKS� �� �**� �� Ÿ۶�,��*h� �**� %�� ����
� 
,��,��*�R
+� ��T:*j� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � � �y � � �y � � �y � � �y � � �y � � �y � �y���y���y���y���y���y���y���y� �y���y���yw��y���yw��y���y���y���y���y���y���y���y���y���y���y��y I  j $  GH    K h   LM   ND   �T   �V   �X   �D   WD   YX 	  ZX 
  [D   �T   �V   �X   �D   �D   aX   bX   cD   �T   �V   fX   �D   �D   iX   jX   kD   �T   �V   nX   �D   �D    rX !  sX "  tD #w   � &  U  U  U  U  U  U 4 Z 4 Z 3 Z � [ Q [ a a a3 b3 b2 b� bP b c c cg c1 c� g� g g g� g� g� g+ h+ h6 h+ h+ h� jQ j 5 J  �  $  �,��*�R+� ��T:*m� �VXZ�^�`Y� �YbSYS�k�q� ��uY6� 6*,�yM,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,��,*s� �*�� �YKS� �� �**� �� Ÿ۶�,��*t� �**� %�� � ���
� 
,��,"��*�R+� ��T:*v� �VXZ�^�`Y� �YbSY$S�k�q� ��uY6� 6*,�yM, �������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R+� ��T:*y� �VXZ�^�`Y� �YbSY(S�k�q� ��uY6� 6*,�yM,*�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,,��,*� �*�� �YKS� �� �**� �� Ÿ۶�,��* �� �**� %�� �.���
� 
,��,0��*�R+� ��T:* �� �VXZ�^�`Y� �YbSY2S�k�q� ��uY6� 6*,�yM,4�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   X t wy w | wy M � �y � � �y M � �y � � �y � � �y � � �yx��y���ym��y���ym��y���y���y���y;WZyZ_Zy0z�y���y0z�y���y���y���y]y|y|�|yR��y���yR��y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   �   = m  m � s � s � s � s � s � s � s t t t t t] v' v  y� y� � � � � � � � �� �� �� �� �B � � � J  �  $  �,���,* ̶ �*�� �YKS� �� �**� �� Ÿ۶�,��* Ͷ �**� %�� �����
� 
,��,���*�R+� ��T:* ϶ �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,&��*�R+� ��T:* Ҷ �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,* ض �*�� �YKS� �� �**� �� Ÿ۶�,��* ٶ �**� %�� �����
� 
,��,���*�R+� ��T:* ۶ �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R+� ��T:* ޶ �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � � �y � �y � y � �y � yyy|��y���yq��y���yq��y���y���y���y���y���y���y���y���y���y���y���yc�y���yX��y���yX��y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   �    �  � ! � ! �  �  �  � @ � @ � K � @ � @ � � � f �a �* �� �� � � �� �� �� �' �' �2 �' �' �� �M �H � � � J  �  $  �,���,* � �*�� �YKS� �� �**� �� Ÿ۶�,��* � �**� %�� �����
� 
,��,���*�R+� ��T:* � �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,&��*�R+� ��T:* � �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,* � �*�� �YKS� �� �**� �� Ÿ۶�,��* � �**� %�� �����
� 
,��,���*�R+� ��T:* � �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R +� ��T:* �� �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � � �y � �y � y � �y � yyy|��y���yq��y���yq��y���y���y���y���y���y���y���y���y���y���y���yc�y���yX��y���yX��y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   �    �  � ! � ! �  �  �  � @ � @ � K � @ � @ � � � f �a �* �� �� � � �� �� �� �' �' �2 �' �' �� �M �H � � j J  
*  4  �,&��*�R+� ��T:* �� �VXZ�^�`Y� �YbSY9S�k�q� ��uY6� 6*,�yM,;�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,=��,* �� �*�� �YKS� �� �**� �� Ÿ۶�,��* �� �**� %�� �?���
� 
,��,A��*�R+� ��T:* �� �VXZ�^�`Y� �YbSYCS�k�q� ��uY6� 6*,�yM,?�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R+� ��T:* �� �VXZ�^�`Y� �YbSYES�k�q� ��uY6� 6*,�yM,G�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,I��* �� �**� A�K*� и M�Q�~��*Y�.� -W* �� �**� A�K*� и S�Q�~��*�.��,U��,* �� �*�� �YKS� �� �**� �� Ÿ۶�,��* �� �**� %�� �W���
� 
,��,Y��*�R+� ��T:* �� �VXZ�^�`Y� �YbSY[S�k�q� ��uY6� 6*,�yM,]�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,&��*�R+� ��T:$* �� �$VXZ�^$�`Y� �YbSY_S�k�q$� �$�uY6%� 6*$%,�yM,a��$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+,c��*�R+� ��T:,* �� �,VXZ�^,�`Y� �YbSYeS�k�q,� �,�uY6-� 6*,-,�yM,g��,������ � :.� .�:/*-,��M�/,��� :0� #0�� � #:1,1��� � :2� 2�:3,���3,i��*� 0 Y u xy x } xy N � �y � � �y N � �y � � �y � � �y � � �y|��y���yq��y���yq��y���y���y���y@\_y_d_y5�y���y5�y���y���y���y���y���y�	yy�	$y$y!$y$)$y���y���y���y���y���y���y���y���yRnqyqvqyG��y���yG��y���y���y���y I  
 4  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #  ��T $  ��V %  ��X &  ��D '  ��D (  ��X )  ��X *  ��D +  ��T ,  ��V -  ��X .  ��D /  ��D 0  ��X 1  ��X 2  ��D 3w   � 0 > �  � � � � � � � � � � � � � � � � � � � �a �* �% �� �� �� �� �� �� �� �� �� �� �� �� �! �! �3 �3 �! �! � �R �R �] �R �R �� �x �s �< �7 �  �� � � J   "     �F�   I       GH   � J  �  $  �,n��,* �� �*�� �YKS� �� �**� �� Ÿ۶�,��* �� �**� %�� �p���
� 
,��,r��*�R+� ��T:* �� �VXZ�^�`Y� �YbSYtS�k�q� ��uY6� 6*,�yM,p�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,&��*�R+� ��T:* �� �VXZ�^�`Y� �YbSYvS�k�q� ��uY6� 6*,�yM,x�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,z��,* �� �*�� �YKS� �� �**� �� Ÿ۶�,��* �� �**� %�� �|���
� 
,��,~��*�R+� ��T:* ö �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,|�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,&��*�R+� ��T:* ƶ �VXZ�^�`Y� �YbSY�S�k�q� ��uY6� 6*,�yM,��������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �y � � �y � �y � y � �y � yyy|��y���yq��y���yq��y���y���y���y���y���y���y���y���y���y���y���yc�y���yX��y���yX��y���y���y���y I  j $  �GH    �K h   �LM   �ND   ��T   ��V   ��X   ��D   �WD   �YX 	  �ZX 
  �[D   ��T   ��V   ��X   ��D   ��D   �aX   �bX   �cD   ��T   ��V   �fX   ��D   ��D   �iX   �jX   �kD   ��T   ��V   �nX   ��D   ��D    �rX !  �sX "  �tD #w   �    �  � ! � ! �  �  �  � @ � @ � K � @ � @ � � � f �a �* �� �� � � �� �� �� �' �' �2 �' �' �� �M �H � �       Z    [