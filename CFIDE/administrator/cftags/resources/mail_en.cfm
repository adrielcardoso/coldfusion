����  -k 
SourceFile 1/CFIDE/administrator/cftags/resources/mail_en.cfm cfmail_en2ecfm185441247  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   CALLER Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   
ATTRIBUTES   	   BSUCCESS   	    com.macromedia.SourceModTime  A/� pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
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
 � � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � Mail Settings � #Connection Verification Successful. � Connection Verification Failed! � Server Settings &gt; Mail � Mail Server Settings � Mail Server � � Specifies the server for
sending SMTP mail messages. You can specify an Internet address (for
example, mail.company.com) or the IP address of the mail server (for example,
127.0.0.1).
 � 	User name � Password � _
If your mail server requires authentication, you can specify a
user name and password to use.
 � Sign the mail � 9
Select this check box to have ColdFusion Sign the Mail.
 � Browse Server � Keystore � �
"Location of the Keystore" - Keystore containing the private key and certificate. The supported type is JKS (java key store) and pkcs12.
     � KeystorePassword � 
Password of the Keystore.
     � KeyAlias � �
     Alias of the key with which the certificate and private key is stored in Keystore. If it is not specified then the first entry in the Keystore will be picked up.
     � KeyPassword � �
Password with which the private key is stored. If it is not specified, KeystorePassword will be used as KeyPassword as well.
     � Verify mail server connection � t Select this check box
to have ColdFusion verify that it can connect to this mail server when you
submit this form.  � Server Port � U The default port number for
mail servers. The standard SMTP mail server port is 25.  � Backup Mail Servers ��
  <br>Specifies backup servers for sending SMTP mail messages. Use a comma to separate
    the names of multiple servers. To specify a port number other than the default,
    use a colon (for example, mail.company.com:123). If your mail server requires
    authentication different from the default server, you can specify a user name and password in the format <strong>
            user:password@mail.company.com</strong>.
     � "Maintain connection to mail server � w Select
this check box to keep the connection to a mail server open for reuse
after delivering a message (recommended). � Connection Timeout(in seconds) � T Specifies the time that ColdFusion should wait for a response from the mail server. � ,Enable SSL socket connections to mail server � USelect this check box to enable SSL encryption on the connections to the mail server. � $Enable TLS connection to mail server � e Select this check box to enable Transport Level Security (TLS) on the connection to the mail server. � Mail Spool Settings � Spool Interval(in seconds) � D Specifies the time the
mail spooler waits to process spooled mail.  � Mail
Delivery Threads � �
Specifies the maximum number of simultaneous threads that ColdFusion uses to deliver
spooled mail. A higher number indicates an increase in the volume of mail
messages that are delivered.
  "Spool mail messages
  for delivery to Disk Memory � Select this check
box to spool messages for delivery by the mail spooler (recommended). When
not selected, the mail spooler attempts to deliver messages during page
processing.
 Spooling to disk is more robust, because
the messages are written to disk and are delivered even if you restart
ColdFusion. Spooling to memory substantially increases performance,
but it requires additional memory and places the messages in volatile
storage.  ,Maximum
number of messages spooled to memory y
Specifies the maximum number of messages that ColdFusion holds in memory before switching
to spooling messages to disk.  9Allow downloading the attachments for undelivered emails. � Select this check
box to allow downloading attachments for undelivered emails. It is recommended not to enable it in case undelivered email functionality is not being used.  View Undelivered Mail Mail Logging Settings Error Log Severity Debug Information Warning  8
Select the type of SMTP-related error messages to log.
" (Log all mail messages sent
by ColdFusion$ [ Select this check box
to save the To, From, and Subject fields of messages to a log file. & Mail Charset Setting( '<strong>Default CFMail Charset</strong>* Subject, Sender. To0 	File Size2 Date4 Delete6 Respool8 message(s) successfully deleted: !message(s) successfully respooled< )Server Settings > Mail > Undelivered Mail> 4
Server port must be numeric and greater than zero.
@ 6
Timeout value must be numeric and greater than zero.
B 7
Spool interval must be numeric and greater than zero.
D O
Maximum number of simultaneous threads must be numeric and greater than zero.
F U
Maximum number of messages spooled to memomy must be numeric and greater than zero.
H $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTagKJ :	 M coldfusion/tagext/io/OutputTagO
P j '
Unable to update mail settings.<br />
R CFCATCHT MESSAGEV _String &(Ljava/lang/Object;)Ljava/lang/String;XY
 YZ EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;\]
 ^ <br />
` DETAILb
P  coldfusion/tagext/QueryLoope
f �
f �
P � 2
The mail server connection was not tested.<br />
j )
Unable to retrieve mail settings.<br />
l Errorn falsep set (Ljava/lang/Object;)Vrs coldfusion/runtime/Variableu
vt coldfusion/runtime/SwitchTablex
y 	 BUTTON_BROWSE{ addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;}~
y SEVERITY_TIP� MESSAGE_RESPOOLED� KEYPASSWORD� 
SERVER_TIP� KEYALIAS� STATMESS� VIEW_UNDELIVERED_MAIL� 	CONN_FAIL� SCHEDULER_TIP� MESSAGE_DELETED� SS_ERROR_MAIL_TIMEOUT� SEVERITY_DEBUG� CLICK_NORMAL� KEYSTOREPASSWORD_TIP� SENDER� SUBMIT_CHANGES� MAXMESSAGESINMEMORY� SPOOLSETTINGS� KEYALIAS_TIP� SS_ERROR_MAIL_SCHEDULE� CHARSETSETTING� SERVER_PORT� LOGSENT� ALLOWDOWNLOAD_TIP� SPOOLTOMEMORY_TIP� FILESIZE� MAILLOGGING� SPOOLENABLE� LOGSENT_TIP� 	ENABLESSL� VERIFY� 
MAILSERVER� ENABLETLS_TIP� PAGEHEADER_UNDELIVEREDMAIL� USERNAME_TIP� BACKUPMAILSERVERS� 	SCHEDULER� 	ERROR_GET� SUBJECT� 	ENABLETLS� CONNECTIONTIMEOUT_SEC� DELETE� ERROR_UPDATE� SEVERITY_WARNING� KEYSTOREPASSWORD� SEVERITY� CONN_OK� SEVERITY_INFORMATION� KEYPASSWORD_TIP� IMPORTANT_NOTICE� MAXMESSAGESINMEMORY_TIP�  SS_ERROR_MAIL_MAXDELIVERYTHREADS� KEYSTORE_TIP� SIGN_TIP� PAGEHEADER_MAIL� CLICK_RETURN� !SS_ERROR_MAIL_MAXMESSAGESINMEMORY� MAINTAINCONNECTIONS� SEVERITY_ERROR� DATE� ALLOWDOWNLOAD� SS_ERROR_MAIL_SMTPPORT� SPOOLTO_MEMORY� SPOOLTO_DISK� 
CONNECTION PORT_TIP ALERT 
VERIFY_TIP MAILSERVERPASSWORD	 MAXDELIVERYTHREADS_TIP SPOOLTOMEMORY MAXDELIVERYTHREADS SPOOLENABLE_TIP MAILSERVERUSERNAME TIMEOUT_TIP RESPOOL MAINTAINCONNECTIONS_TIP SIGN TO CHARSET ENABLESSL_TIP! PAGENAME_MAILSET# ERROR_NOTEST% BACKUPMAILSERVERS_TIP' KEYSTORE)
 J �
 J � 

- metaData Ljava/lang/Object;/0	 1 &coldfusion/runtime/AttributeCollection3 java/lang/Object5 ([Ljava/lang/Object;)V 7
48 this Lcfmail_en2ecfm185441247; LocalVariableTable Code <clinit> varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; getMetadata ()Ljava/lang/Object; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective3 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode3 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 output2 mode2 t22 t23 t24 t25 t26 t27 t28 t29 LineNumberTable java/lang/Throwablei 1                      9 :    r :    � �   J :   /0       =   #     *� 
�   <       :;   >  =  �    �<� B� Dt� B� vL� B�N�yY�z|���>���K���������������8������+���J���N���;���������D������4���)������O���A������?���7���3���F���9���.���@���%���������(���L���������*���T���C���'���#���H���R���=������:������<���������5���P���������	������Q���!���U���G���6���M���1�� 0��
��������
��-��/��,��2����$��I��"����E�� B��"&��$��&S��( ��*��� ��4Y�6�9�2�   <      �:;      =   ]     +*+,� **+,� � **+,� � **+,� � !�   <        +:;     +?@    +AB  CD =   "     �2�   <       :;   ED =  �    �*� (� .L*� 2N*4� 8*� D-� H� J:*� NPRT� Z� ^� b� g� kY6��*+m� q*� v� H� x:*� N� g� yY6� /*+� }L� ����� � :� �:	*+� �L�	� �� :
� &��
�� � #:� �� � :� �:� ��*+m� q� �**� � �Y�S� �� ��   )       U  f  o  x  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        #  ,  5  >  G  P  Y  b  k  t  }  �  �  �  �  �  �  �  �  �  �  �  �  �  �        #  -  7  A  K  U  _  i  s  }  �  �  �  �  �  �  �  �  �  �  �  �  �  	      '  1  ;  E  O  Y  c  m  A  K  +�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ��y+�� ��p+�� ��g+�� ��^+�� ��U+ö ��L+Ŷ ��C+Ƕ ��:+ɶ ��1+˶ ��(+Ͷ ��+϶ ��+Ѷ ��+Ӷ ��+ն ���+׶ ���+ٶ ���+۶ ���+ݶ ���+߶ ���+� ���+� ���+� ���+� ���+� ���+� ���+�� ���+� ���+� ��}+� ��t+�� ��k+�� ��b+�� ��Y+�� ��P+�� ��G+�� ��>+� ��4+� ��*+� �� +� ��+	� ��+� ��+� ���+� ���+� ���+� ���+� ���+� ���+� ���+� ���+� ���+� ���+!� ���+#� ���+%� ���+'� ��v+)� ��l++� ��b+-� ��X+/� ��N+1� ��D+3� ��:+5� ��0+7� ��&+9� ��+;� ��+=� ��+?� ���+A� ���+C� ���+E� ���+G� ���+I� ���*�N� H�P:* � N� g�QY6� r+S� �+* � N**� � �YUSYWS� ��[�_� �+a� �+* � N**� � �YUSYcS� ��[�_� �+a� ��d����g� :� &�b�� � #:�h� � :� �:�i�� �+k� �� �*�N� H�P:* �� N� g�QY6� r+m� �+* �� N**� � �YUSYWS� ��[�_� �+a� �+* �� N**� � �YUSYcS� ��[�_� �+a� ��d����g� :� &� ��� � #:�h� � :� �:�i�� +o� �� *� !q�w� *+m� q� ���� �� :� #�� � #:�+� � :� �:�,�*+.� q�   u � �j � � �j j � �j � � �j j � �j � � �j � � �j � � �j�jj�'j'j$'j','ja��j���ja�j��j�j
j > �Wj �Wj�Wj�KWjQTWj > �fj �fj�fj�KfjQTfjWcfjfkfj <  .   �:;    �FG   �H0   � / 0   �IJ   �KL   �MN   �OL   �PQ   �R0 	  �S0 
  �TQ   �UQ   �V0   �WX   �YL   �Z0   �[Q   �\Q   �]0   �^X   �_L   �`0   �aQ   �bQ   �c0   �d0   �eQ   �fQ   �g0 h  � x ,  P  �  � ` i r { � � � � � � !� #� %� '� -� /� 1� 6� 8 < > @ D& F/ J8 LA PJ RS V\ Xe \n ^w a� c� k� m� q� s� u� w� y� {� }� � �� �� �� �	 � � �' �1 �; �E �O �Y �c �m �w �� �� �� �� �� �� �� �� �� �� �� �� �� � � � �! �+ �5 �? �I �S �] �� �� �� �� �� �� �� �� �� �� �g �g �; �{ �{ �{ �{ �s �� �� �� �� �� �E �E � �''### �             "    #