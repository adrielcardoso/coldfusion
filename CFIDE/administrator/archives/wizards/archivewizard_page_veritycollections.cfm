����  -- 
SourceFile N/CFIDE/administrator/archives/wizards/archivewizard_page_veritycollections.cfm 4cfarchivewizard_page_veritycollections2ecfm936503553  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   NAME Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   SELECTALLVERITYCOLLECTIONS   	   DESELECTALLSOLRCOLLECTIONS   	    	URLENCHAR " " 	  $ PATH & & 	  ( SELECTALLSOLRCOLLECTIONS * * 	  , REQUEST . . 	  0 COLLECTIONNAME 2 2 	  4 	DESELECTC 6 6 	  8 SELECTC : : 	  < 
SELECT_ALL > > 	  @ FORM B B 	  D DESELECT_ALL F F 	  H ACOLLECTIONS J J 	  L ARCHIVENAME N N 	  P DESELECTALLVERITYCOLLECTIONS R R 	  T COLLECTIONS V V 	  X 
VERITYLIST Z Z 	  \ 	ISSAFEURL ^ ^ 	  ` GETCSRFTOKEN b b 	  d SOLRCOLLECTIONS f f 	  h SOLRCOLLECTIONNAME j j 	  l com.macromedia.SourceModTime  D�A�� pageContext #Lcoldfusion/runtime/NeoPageContext; q r	  s getOut ()Ljavax/servlet/jsp/JspWriter; u v javax/servlet/jsp/JspContext x
 y w parent Ljavax/servlet/jsp/tagext/Tag; { |	  } com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V � �
  � 

 � _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V � �
  � 



 � 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � !coldfusion/tagext/lang/IncludeTag � _setCurrentLineNo (I)V � �
  � 	cfinclude � template � controludfs.cfm � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setTemplate � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � LOCALE � REQUEST.LOCALE � en � checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V � �
  � 
 � java/lang/String � 
LOCALEFILE � java/lang/StringBuffer � resources/archives_ �  �
 � � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � .cfm � toString ()Ljava/lang/String; � � java/lang/Object �
 � � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � WHERETO � FORM.WHERETO �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z � �
  � 
		 � CAR � ARCHIVES � _resolve � �
  � URL � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map;
 � VERITYCOLLECTIONS 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
  clear
 _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
  
	 isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z
  _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;
  ListToArray $(Ljava/lang/String;)Ljava/util/List;
  _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array;
 �  setArray (Lcoldfusion/runtime/Array;)V"# coldfusion/runtime/Variable%
&$ addAll( 

	* _get,
 - selectAllVerityCollections/ 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;12
 3 selectAllSolrCollections5 deSelectAllVerityCollections7 deSelectAllSolrCollections9 NEXTSTEP; FORM.NEXTSTEP= _Object (Z)Ljava/lang/Object;?@
 �A _boolean (Ljava/lang/Object;)ZCD
 �E 	isSafeURLG 
			I 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTagLK �	 N !coldfusion/tagext/net/LocationTagP 
cflocationR addtokenT NoV (Ljava/lang/String;)ZCX
 �Y :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z �[
 \ setAddtoken^ �
Q_ urla setUrlc �
Qd 


f *coldfusion/runtime/TransientVariableHolderh &(Lcoldfusion/runtime/NeoPageContext;)V j
ik ,class$coldfusion$tagext$search$CollectionTag &coldfusion.tagext.search.CollectionTagnm �	 p &coldfusion/tagext/search/CollectionTagr cfcollectiont actionv LISTx 	setActionz �
s{ name} collections setName� �
s� engine� verity� 	setEngine� �
s� unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t22 [Ljava/lang/String; Any���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� CFCATCH� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
i� 	name,path� QueryNew /(Ljava/lang/String;)Lcoldfusion/sql/QueryTable;��
 � set (Ljava/lang/Object;)V��
&� 
		
	� unbind� 
i� solrcollections� solr� t23��	 � (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag�� �	 � "coldfusion/tagext/lang/ImportedTag� l10n� ../../cftags/� admin� :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V��
�� &coldfusion/runtime/AttributeCollection� id� archive_avc� var� title� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
�� 
doStartTag ()I��
�� 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � Archive Solr Collection� write� � java/io/Writer�
�� doAfterBody��
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�� #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
�� 	doFinally� 
�� archivewizard_header.cfm� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� �	  coldfusion/tagext/io/OutputTag
� K

<table border="0" cellpadding="1" cellspacing="0" width="100%" bgcolor="# 
GRAYMEDIUM�"><tr><td>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="white">
<tr valign="top">
	<td height="350">
		<table border="0" cellpadding="0" cellspacing="0" width="20" bgcolor="#888885"><tr><td>
		<table border="0" cellpadding="0" cellspacing="1" width="20">
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
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
		</table>
		</td></tr></table>
	</td>

	<td height="20" width="20" nowrap>&nbsp;</td>
	<td width="100%"><br>
	

 
select_all 
Select All deselect_all Deselect All �

<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="2" cellspacing="1" width="100%">
 )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag �	  #coldfusion/tagext/html/form/FormTag cfform editForm
� method" POST$ 	setMethod& �
' CGI) SCRIPT_NAME+ ?archivename=- URLEncodedFormat 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;/0
 1
{
� �
<tr >
	<td>
	<table border="0" cellpadding="0" cellspacing="1" width="100%">
	<tr>
	<td class="cellBlueTopAndBottom" align="right" ><input type=submit value="5 p" name="selectc" class="buttn"></td>
	<td class="cellBlueTopAndBottom" align="right" ><input type=submit value="7 o" name="deselectc" class="buttn"></td>
	</tr>
	</table></td>
</tr>
<tr>
	<td height="18" colspan="3" bgcolor="#9 	GRAYLIGHT; P" class="cellBlueTopAndBottom"><font class="label">&nbsp; <b class="form-title">= l10n_solrarchdata? Registered Solr CollectionsA J</b></font></td>
</tr>
<tr >
	<th width="18" nowrap height="20" bgcolor="#C 	BLUELIGHTE A" class="cellBlueTopAndBottom">&nbsp;</th>
	<th nowrap bgcolor="#G 7" class="cellBlueTopAndBottom"><p class="label">&nbsp; I NameK . &nbsp;</p></th>
	<th  width="100%" bgcolor="#M collection_directoryO Collection DirectoryQ  &nbsp;</p></th>
</tr>
			S �
 U _List $(Ljava/lang/Object;)Ljava/util/List;WX
 �Y ArrayToList $(Ljava/util/List;)Ljava/lang/String;[\
 ] $class$coldfusion$tagext$lang$LoopTag coldfusion.tagext.lang.LoopTag`_ �	 b coldfusion/tagext/lang/LoopTagd cfloopf queryh \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �j
 k setQuerym� coldfusion/tagext/QueryLoopo
pn
e� �
			
				<tr >
					<td align="center" height="18" nowrap class="cell3BlueSides">
						<input type="checkbox" name="solrcollectionname" value="s EncodeForHTMLAttribute &(Ljava/lang/String;)Ljava/lang/String;uv
 w N" onclick="setFormValue('archivewizard_page_veritycollections.cfm?archivename=y ')"
							{ ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I}~
  (D)ZC�
 �� checked�  id="� e">
					</td>
					<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="� ">� e</label> &nbsp;</p></td>
					<td nowrap class="cellRightAndBottomBlueSide"	><p class="label">&nbsp; � 
ESAPIUTILS� encodeForHTMLFilePath�  &nbsp;</p></td>
				</tr>
		�
e�
e�
p�
e� /

<input type="Hidden" name="csrftoken" value="� getcsrftoken� ARCHIVETABKEYNAME� �">
<input type="Hidden" name="whereto" value="archivewizard_page_veritycollections.cfm">
<input type="Hidden" name="previousStep" value="archivewizard_page_datasources.cfm?archivename=� Z">
<input type="Hidden" name="nextStep" value="archivewizard_page_applets.cfm?archivename=� ">
�
�
�
�
� t
</table>
</td></tr></table>
<br>
<br>
<br>
</td><td width="20" nowrap>&nbsp;</td></tr>
</table>
</td></tr></table>
�
�
p�
� archivewizard_footer.cfm� metaData Ljava/lang/Object;��	 � this 6Lcfarchivewizard_page_veritycollections2ecfm936503553; LocalVariableTable Code <clinit> varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; getMetadata ()Ljava/lang/Object; runPage out Ljavax/servlet/jsp/JspWriter; value include0 #Lcoldfusion/tagext/lang/IncludeTag; 	location2 #Lcoldfusion/tagext/net/LocationTag; t6 ,Lcoldfusion/runtime/TransientVariableHolder; collection3 (Lcoldfusion/tagext/search/CollectionTag; t8 t9 #Lcoldfusion/runtime/AbortException; t10 Ljava/lang/Exception; __cfcatchThrowable0 Ljava/lang/Throwable; t12 t13 t14 collection4 t16 t17 t18 __cfcatchThrowable1 t20 t21 module5 $Lcoldfusion/tagext/lang/ImportedTag; mode5 I t24 t25 t26 t27 t28 t29 include6 output14  Lcoldfusion/tagext/io/OutputTag; mode14 module7 mode7 t35 t36 t37 t38 t39 t40 module8 mode8 t43 t44 t45 t46 t47 t48 form13 %Lcoldfusion/tagext/html/form/FormTag; mode13 module9 mode9 t53 t54 t55 t56 t57 t58 module10 mode10 t61 t62 t63 t64 t65 t66 module11 mode11 t69 t70 t71 t72 t73 t74 loop12  Lcoldfusion/tagext/lang/LoopTag; mode12 t77 t78 t79 t80 t81 t82 t83 t84 t85 t86 t87 t88 t89 t90 	include15 LineNumberTable !coldfusion/runtime/AbortException' java/lang/Exception) java/lang/Throwable+ 1                       "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     � �   K �   m �   ��   ��   � �   � �    �   _ �   ��       �   #     *� 
�   �       ��   �  �   �     g�� �� �M� ��Oo� ��q� �Y�S��� �Y�S���� ��� � ��� ��a� ��c��Y� �ӳ��   �       g��      �  A    *+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m�   �       ��    ��   ��  �� �   "     ���   �       ��   �� �  _  \  s*� t� zL*� ~N*�� �*+�� �*+�� �*� �-� �� �:*	� ����� �� �� �� �� �*+�� �**� 1���� �*+Ŷ �*/� �Y�S� �Yͷ �*/� �Y�S� Ӹ ٶ �߶ ݶ � �*+�� �**� E��� �j*+� �*� �***/� �Y�SY�S� �*�� �YOS� Ӹ �� �YS�	� �W*+� �**� 5�� �*+� �*� M*� �**� 5�� ٸ�!�'*� �***/� �Y�SY�S� �*�� �YOS� Ӹ �� �YS�	)� �Y**� M�S�W*+� �*+� �*� �***/� �Y�SY�S� �*�� �YOS� Ӹ �� �YgS�	� �W*+� �**� m�� �*+� �*� M*!� �**� m�� ٸ�!�'*"� �***/� �Y�SY�S� �*�� �YOS� Ӹ �� �YgS�	)� �Y**� M�S�W*+� �*++� �**� =�� _*+� �*(� �**� �.0*� �Y**� Q�S�4W*)� �**� -�.6*� �Y**� Q�S�4W*+� ��.**� 9�� _*+� �*-� �**� U�.8*� �Y**� Q�S�4W*.� �**� !�.:*� �Y**� Q�S�4W*+� �� �*+� �**� E<>� �BY�F� 0W*1� �**� a�.H*� �Y*C� �Y<S� �S�4�F� m*+J� �*�O-� ��Q:*2� �SUW�Z�]�`Sb*C� �Y<S� Ӹ �� ��e� �� �� �*+� �*+� �*+Ŷ �*+g� ��iY*� t�l:*++� �*�q-� ��s:*<� �uwy� ��|u~�� ���u��� ���� �� �� :� �*++� �� q� w:		�:

��:�����      D           ���*+� �*� Y*?� �*�����*+�� �� 
�� � :� �:���*+�� ��iY*� t�l:*++� �*�q-� ��s:*F� �uwy� ��|u~�� ���u��� ���� �� �� :� |�*++� �� n� t:�:��:�����   A           ���*+� �*� i*I� �*�����*+�� �� �� � :� �:���*+�� �*��-� ���:*P� ��������Y� �Y�SY�SY�SY�S�Ӷ�� ���Y6� 6*+��L+������� � :� �:*+��L���� :� #�� � #:��� � :� �:���*+Ŷ �*� �-� �� �:*Q� ����� �� �� �� �� �*+�� �*�-� ��:*S� �� ��Y6 ��+��+*/� �Y	S� Ӹ ٶ�+��*��� ���:!*p� �!�����!��Y� �Y�SYSY�SYS�Ӷ�!� �!��Y6"� 6*!"+��L+��!����� � :#� #�:$*"+��L�$!��� :%� &�
%�� � #:&!&��� � :'� '�:(!���(*+Ŷ �*��� ���:)*q� �)�����)��Y� �Y�SYSY�SYS�Ӷ�)� �)��Y6*� 6*)*+��L+��)����� � :+� +�:,**+��L�,)��� :-� &�7-�� � #:.).��� � :/� /�:0)���0+��*�� ��:1*u� �1~ � ��!1#%� ��(1w� �Y**� �Y,S� Ӹ ٷ �.� �*u� �*�� �YOS� Ӹ �**� %�� ٸ2� ݶ �� ��31� �1�4Y62��*12+��L+6��+**� A�� ٶ�+8��+**� I�� ٶ�+:��+*/� �Y<S� Ӹ ٶ�+>��*��	1� ���:3* �� �3�����3��Y� �Y�SY@S�Ӷ�3� �3��Y64� 6*34+��L+B��3����� � :5� 5�:6*4+��L�63��� :7� ,��#�g7�� � #:838��� � :9� 9�::3���:+D��+*/� �YFS� Ӹ ٶ�+H��+*/� �YFS� Ӹ ٶ�+J��*��
1� ���:;* �� �;�����;��Y� �Y�SY~S�Ӷ�;� �;��Y6<� 6*;<+��L+L��;����� � :=� =�:>*<+��L�>;��� :?� ,�ި�]?�� � #:@;@��� � :A� A�:B;���B+N��+*/� �YFS� Ӹ ٶ�+J��*��1� ���:C* �� �C�����C��Y� �Y�SYPS�Ӷ�C� �C��Y6D� 6*CD+��L+R��C����� � :E� E�:F*D+��L�FC��� :G� ,��-�qG�� � #:HCH��� � :I� I�:JC���J+T��*� ]* �� �**/� �Y�SY�S� �*�� �YOS� Ӹ �� �YgS�V�Z�^��*+� �*�c1� ��e:K* �� �Kgi��l�qK� �K�rY6L�4+t��+* �� �**� �� ٸx��+z��+* �� �*�� �YOS� Ӹ �**� %�� ٸ2��+|��* �� �**� ]�� �**� �� ٸ����� 
+���+���+* �� �**� �� ٸx��+���+* �� �**� �� ٸx��+���+* �� �**� �� ٸx��+���+* �� �**/� �Y�S� ��� �Y**� )�S�� ٶ�+���K�����K��� :M� ,� �)�mM�� � #:NKN��� � :O� O�:PK���P+���+* �� �**� e�.�*� �Y*/� �Y�S� �S�4� ٶ�+���+* �� �*�� �YOS� Ӹ �**� %�� ٸ2��+���+* �� �*�� �YOS� Ӹ �**� %�� ٸ2��+���1����C� � :Q� Q�:R*2+��L�R1��� :S� &� jS�� � #:T1T��� � :U� U�:V1���V+�������c��� :W� #W�� � #:XX��� � :Y� Y�:Z���Z*+Ŷ �*� �-� �� �:[* �� �[���� �� �[� �[� �� �*+�� �� n7��(���(7��*���*7�,��,�,,6��(���(6��*���*6�,��,�
,,���,���,v��,���,v��,���,���,���,���,���,�&, #&,�5, #5,&25,5:5,���,���,���,���,��	,��	,�		,			,
u
�
�,
�
�
�,
j
�
�,
�
�
�,
j
�
�,
�
�
�,
�
�
�,
�
�
�,��,���,t��,���,t��,���,���,���,k��,���,`��,���,`��,���,���,���,f��,���,f��,���,���,���,	�
��,
���,���,���,���,���,	�
��,
���,���,���,���,���,	�
��,
���,���,���,���,���,���,���,J, �,�
�,
��,��,��,��,�,
,J, �,�
�,
��,��,��,��,�,
,,!, �  � \  s��    s��   s��   s { |   s��   s��   s��   s��   s��   s�� 	  s�� 
  s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��   s��    s�� !  s�� "  s�� #  s�� $  s�� %  s�� &  s�� '  s�� (  s�� )  s�� *  s�� +  s�� ,  s�� -  s�� .  s�� /  s�� 0  s�� 1  s�� 2  s�� 3  s�� 4  s�� 5  s�� 6  s � 7  s� 8  s� 9  s� :  s� ;  s� <  s� =  s� >  s� ?  s	� @  s
� A  s� B  s� C  s� D  s� E  s� F  s� G  s� H  s� I  s� J  s K  s� L  s� M  s� N  s� O  s� P  s� Q  s� R  s� S  s� T  s� U  s � V  s!� W  s"� X  s#� Y  s$� Z  s%� [&  � �   ; 	 ! 	 d  �  �  �  �  |  |  p  p  �  �  �  �  �  �  �  �  �  �    / / / / % K _ � I I %  � � � � � � � �  ! ! ! ! !. "B "l ", ", "  � � &� &� &� (� (� (� (� )� )� )� )� '� +� +� + - - - -- .? .- .- . ,_ 1_ 1c 1f 1^ 1^ 1} 1� 1} 1} 1^ 1� 2� 2� 2� 2^ 1W 0� +� & � [ <m < <? <� ?� ?� ?� ?� ?* :Z Fl F~ F> F� I� I� I� I� I) DZ Pf P% P Q� Q] U] U\ U� p� pz p� q� qM q	> u	P u	f u	f u	} u	� u	� u	� u	� u	� u	� u	b u	� z	� z	� z	� {	� {	� {
 �
 �
 �
Z �
" �
� �
� �
� � � � �d �, �� �� �� �P � �� � �� �� �� �� �� �� �V �� �� �� �� �x �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � �� �' �' �' �' � �G �G �G �G �? �� �g �g �_ �7 �� � �� �� �� �- �- �? �? �- �- �% �_ �_ �q �q �_ �_ �W �	  u/ SP �4 �          n    o