����  -� 
SourceFile 6/CFIDE/administrator/cftags/resources/debugging_en.cfm cfdebugging_en2ecfm922625540  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   CALLER Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   
ATTRIBUTES   	   BSUCCESS   	    com.macromedia.SourceModTime  DJv.X pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
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
 � � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � Debug Output Settings � 2Debugging &amp; Logging &gt; Debug Output Settings � #Enable Robust Exception Information �
Allow visitors to see the following information in the exceptions page:
<ul>
<li>Physical path of template</li>
<li>URI of template</li>
<li>Line number and line snippet</li>
<li>SQL statement used (if any)</li>
<li>Data source name (if any)</li>
<li>Java stack trace</li>
</ul>
 � Enable AJAX Debug Log Window � �
Allows display of the AJAX debug log window when the cfdebug flag is passed
in the URL. If you disable this option, the AJAX debug log window does not
display, even if the cfdebug flag is specified.
 � Enable Request Debugging Output � �
Enables the page-level debugging output on CFML pages.
Uncheck this box to override all of the settings below.
Debugging information is appended to the end of each request.
 � Custom Debugging Output � Select Debugging Output Format �H
ColdFusion offers several debugging output formats: <br />
<b>classic.cfm</b> - The format available in ColdFusion 5 and earlier. It provides a basic view and few browser restrictions. <br />
<b>dockable.cfm</b> - A dockable tree-based debugging panel. For details about the panel and browser restrictions, see the online Help. � Report Execution Times � 5Highlight templates taking longer than the following  � 1(in milliseconds) using the following output mode � summary � tree �
Execution times for templates, includes, modules, custom tags, and component method calls. Template execution times over this minimum highlight time appear in red. The default is 250 ms. ColdFusion offers the following template modes:
<br />
<b>summary</b> - A summary of each page called. Columns include Total Time, Avg Time, Count, and Template. Sorted by highest total time. <br />
<b>tree</b> - Hierarchical tree view of individual page executions. <i>Note: Processing time and output will be longer than summary.</i>
 � General Debug Information � �
Select this option to show general information about this request.
General items are ColdFusion Server Version, Template, Time Stamp, User Locale, User Agent, User IP, and Host Name.
 � Database Activity � �
Select this option to show the database activity for the SQL Query events and Stored Procedure events in the debugging output.
 � Exception Information � i
Select this option to collect all ColdFusion exceptions raised for the request in the debugging output.
 � Tracing Information � �
Select this option to show trace event information in the debugging output.
Tracing lets a developer track program flow and efficiency through the use of the CFTRACE tag.
 � Timer Information � �
Select this option to show timer event information in the debugging output.
Timers let a developer track the execution time of the code between the start and end tags of the CFTIMER tag.
 � 	Variables � R
Select this option to enable variable reporting. Select the following variables:
 � Application � Cookie � Server � CGI � Form � Session � Client � Request � URL � Enable Performance Monitoring � �
Select this option so the standard NT Performance Monitor application shows information about a running ColdFusion application server.
  Enable Metrics Logging :
Select this option to enable ColdFusion Metrics Logging.
 Metrics Frequency :
The ColdFusion Metrics will be logged at this frequency.
 Enable CFSTAT
	
The cfstat command-line utility provides real-time performance metrics for ColdFusion.
Using a socket connection to obtain metric data, cfstat displays the information
that ColdFusion writes to System Monitor without actually using the System Monitor application.
 Connector Port q
The cfstat command-line utility performance metrics for ColdFusion will read performance metrics for this port.
 >For these changes to take effect, you must restart ColdFusion. �Enabling request debugging is not recommended for secure profile. If enabled site-wide error handler will be switched to the default one. Click OK to proceed. Debugging IP Address 3Debugging &amp; Logging &gt; Debugging IP Addresses\
Specify the IP addresses that should receive debugging messages, including messages for the
AJAX Debug Log window.
To include an IP address in the list, enter the address and click Add.
To delete an IP address from the list, select the address and click Remove Selected.
When no IP addresses are selected, all users receive debugging information.
 $Select IP Addresses for Debug Output 
IP Address Add  Add Current" 4View / Remove Selected IP Addresses for Debug Output$ Remove Selected& bTo ensure that the changes that you specify on this page take effect, you must restart ColdFusion.( hWarning: Specifying a debugger port that is already in use prevents the ColdFusion server from starting.* Debugger Settings, .Debugging &amp; Logging &gt; Debugger Settings. Line Debugger Settings0 Allow Line Debugging2 Debugger Port:4 �You must specify this debugger port in the JVM settings of your application server, for example:
 <br>-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=6 , and restart the server.8 (Maximum Simultaneous Debugging Sessions:: Debugging Server<The debugging server runs as a process separate from the ColdFusion Server. 
You can start, stop or restart the debugging server from this page, however, this is usually not necessary because the debug process is managed automatically when a debug session is started.> Start Debugger Server@ Stop Debugger ServerB Restart Debugger ServerD �Enable the Allow Line Debugging option to use the ColdFusion Debugger that runs in Eclipse(ColdFusion Builder). Specify the port and the maximum number of simultaneous debugging sessions.F �The port number that you specifed for the debugger is currently being used, possibly by the ColdFusion debugger. If you use this port for any purpose other than debugging this ColdFusion server, enter an available port number and restart the server.H $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTagKJ :	 M coldfusion/tagext/io/OutputTagO
P j ,
Unable to update debugging settings.<br />
R CFCATCHT MESSAGEV _String &(Ljava/lang/Object;)Ljava/lang/String;XY
 YZ EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;\]
 ^ <br />
` DETAILb
P  coldfusion/tagext/QueryLoope
f �
f �
P � .
Unable to retrieve debugging settings.<br />
j &Flash Form Compile Errors and Messagesl �
 (Development use only) Select this option to have ColdFusion display ActionScript errors in
 the browser when compiling Flash forms; this affects the display time of the page.
n 2
The IP you attempted to add should not be blank.
p 
The IP you attempted to add (r FORMt IPTOBEADDEDv 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; �x
 y �) is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format.
{ �) is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format. <br />
}  <br />
 
� 5
An error occurred attempting to add the current IP (� REMOTE_ADDR� #)
to the Debugging Service. <br />
� _
An error occurred attempting to remove the requested IP(s).
from the Debugging Service.<br />
� n
An error occurred attempting to retrieve a list of restricted IP addresses
from the Debugging Service.<br />
� 2Port number must be numeric and greater than zero.� 7Maximum sessions must be numeric and greater than zero.� $Unable to update debugging settings.� false� set (Ljava/lang/Object;)V�� coldfusion/runtime/Variable�
�� coldfusion/runtime/SwitchTable�
� 	 ENABLE_CFSTAT_DESC� addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;��
�� DA_TIP� 
ENABLE_TIP� IP_ERROR_INVALID� TIMER� TRACE� DS_MSG_SELECTUNUSEDPORT� GENERAL_TIP� IP_ERROR_REMOVE� ENABLE� STATMESS� URLVAR� CUSTOMDEBUGOUTPUT� 
SESSIONVAR� OPTIONS_PAGENAME� 	TRACE_TIP� DS_MSG_RESTARTSERVER� TEMPLATE_TIP� AJAX_ENABLED� DEBUGGER_SERVER� IP_ERROR_ADD� !CFSTAT_CONNECTOR_PORT_CHANGE_DESC� CLICK_NORMAL� SELECTIP� PORT_IN_USE_WARNING� SUBMIT_CHANGES� PAGEHEADER_DEBUGGING� 	COOKIEVAR� ENABLE_METRICS� AJAX_ENABLED_TIP� ENABLE_METRICS_DESC� VARS_TIP� DEBUG_ERROR_UPDATE� 	SERVERVAR� PAGEHEADER_IPLIST� RESTART_DEBUGGER_SERVER� ENABLE_PERFMON_DESC� CGIVAR� ENABLE_CFSTAT� DEBUG_IP_ERROR_EMPTY� EXCEPTION_TIP� IP_DEBUGGER_PORT� 	CLIENTVAR� DEBUGGER_SERVER_DESC� CF_METRICS_FREQUENCY_DESC� PAGEHEADER_LINEDEBUGGER� VARS� STOP_DEBUGGER_SERVER  HF_APPLY LINEDEBUG_ERROR_UPDATE DS_ERROR_PORTNUM LINEDEBUGGER_DEBUGPORT_WARNING METRICS_FREQUENCY
 	TIMER_TIP IP_PAGENAME 
ADD_BUTTON DS_ERROR_MAXSESSIONS DA IMPORTANT_NOTICE FLASHFORMCOMPILEERRORS $LINEDEBUGGER_DEBUGPORT_WARNING_PART2 ENABLE_ROBUST GENERAL FORMVAR  DEBUG_APPLY" LINEDEBUGSETTINGS$ VIEWDELETEIP& TEMPLATE_MODE_SUMMARY( FLASHFORMCOMPILEERRORS_TIP* ALLOW_LINE_DEBUGGING, CLICK_RETURN. IP_ERROR_GET0 ADD_CURRENT_BUTTON2 REMOVE_BUTTON4 START_DEBUGGER_SERVER6 
IP_ADDRESS8 DEBUGSLOWTEMPLATHIGHLIGHT: ENABLE_PERFMON< IP_ERROR_ADD_CURRENT> MAX_DEBUGGING_SESSIONS@ ALERTB DEBUG_TEMPLATE_OUTPUTD TEMPLATEF CFSTAT_CONNECTOR_PORT_CHANGEH OPTIONS_PAGENAME_LINEDEBUGJ 	PAGE_DESCL IP_WELCOMETEXTN TEMPLATE_MODE_TREEP 	EXCEPTIONR TEMPLATE_USINGT DEBUG_TEMPLATE_TIPV APPLICATIONVARX DEBUG_ERROR_GETZ 
REQUESTVAR\ ENABLE_ROBUST_DESC^
 J �
 J � 

b metaData Ljava/lang/Object;de	 f &coldfusion/runtime/AttributeCollectionh java/lang/Objectj ([Ljava/lang/Object;)V l
im this Lcfdebugging_en2ecfm922625540; LocalVariableTable Code <clinit> varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; getMetadata ()Ljava/lang/Object; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective8 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode8 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 output2 mode2 t22 t23 t24 t25 output3 mode3 t28 t29 t30 t31 output4 mode4 t34 t35 t36 t37 output5 mode5 t40 t41 t42 t43 output6 mode6 t46 t47 t48 t49 output7 mode7 t52 t53 t54 t55 t56 t57 t58 t59 LineNumberTable java/lang/Throwable� 1                      9 :    r :    � �   J :   de       r   #     *� 
�   q       op   s  r  B    $<� B� Dt� B� vL� B�N��Y���3���������W���������B������Z���������+������(���������A������
���K���X���5������;���Q���������$���.������/���"���R���%���9���O���-���&���2���V������G���)���L���1���D���!��N��6��^��\��	H��0�� ��8��=��]������T��I������!'��#7��%E��'?��)��+U��-F��/��1[��3>��5@��7M��9<��;��=,��?Y��AJ��C��E��G��I4��KC��MP��O:��Q��S��U��W��Y#��[S��]*��_	��� ��iY�k�n�g�   q      $op      r   ]     +*+,� **+,� � **+,� � **+,� � !�   q        +op     +tu    +vw  xy r   "     �g�   q       op   zy r  �  <  *� (� .L*� 2N*4� 8*� D-� H� J:*� NPRT� Z� ^� b� g� kY6�~*+m� q*� v� H� x:*� N� g� yY6� /*+� }L� ����� � :� �:	*+� �L�	� �� :
� &�C
�� � #:� �� � :� �:� ��*+m� q� �**� � �Y�S� �� ��  
�       ^  �  �  �  �  �  �  �  �  �  �  �  �  �  �        "  +  4  =  F  O  X  a  j  s  |  �  �  �  �  �  �  �  �  �  �  �  �  �  �          (  2  <  F  P  Z  d  n  x  �  �  �  �  �  �  �  �  �  �  �  �  �        "  ,  6  @  J  T  ^  h  r  |  �  �  d  8  B  L  V  �  �  �  	�  
�  
�  
�+�� ��	,+�� ��	#+�� ��	+�� ��	+�� ��	+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+ö ���+Ŷ ���+Ƕ ���+ɶ ���+˶ ���+Ͷ ���+϶ ��x+Ѷ ��o+Ӷ ��f+ն ��]+׶ ��T+ٶ ��K+۶ ��B+ݶ ��9+߶ ��0+� ��'+� ��+� ��+� ��+� ��+� ���+�� ���+� ���+� ���+� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+� ���+� ���+� ���+� ��x+	� ��n+� ��d+� ��Z+� ��P+� ��F+� ��<+� ��2+� ��(+� ��+� ��+� ��
+� �� +!� ���+#� ���+%� ���+'� ���+)� ���++� ���+-� ���+/� ���+1� ���+3� ���+5� ���+7� ���+9� ��~+;� ��t+=� ��j+?� ��`+A� ��V+C� ��L+E� ��B+G� ��8+I� ��.*�N� H�P:* � N� g�QY6� r+S� �+* � N**� � �YUSYWS� ��[�_� �+a� �+* � N**� � �YUSYcS� ��[�_� �+a� ��d����g� :� &���� � #:�h� � :� �:�i��Z*�N� H�P:* �� N� g�QY6� r+k� �+* �� N**� � �YUSYWS� ��[�_� �+a� �+* �� N**� � �YUSYcS� ��[�_� �+a� ��d����g� :� &���� � #:�h� � :� �:�i���+m� ��|+o� ��r+q� ��h*�N� H�P:*� N� g�QY6� ;+s� �+*� N*u� �YwS�z�[�_� �+|� ��d����g� :� &�5�� � #:�h� � :� �:�i���*�N� H�P: *� N � g �QY6!� �+s� �+*� N*u� �YwS�z�[�_� �+~� �+*� N**� � �YUSYWS� ��[�_� �+�� �+*� N**� � �YUSYcS� ��[�_� �*+�� q �d��j �g� :"� &�7"�� � #:# #�h� � :$� $�:% �i�%��*�N� H�P:&*� N&� g&�QY6'� �+�� �+*�� �Y�S�z�[� �+�� �+*� N**� � �YUSYWS� ��[�_� �+�� �+*� N**� � �YUSYcS� ��[�_� �*+�� q&�d��u&�g� :(� &�D(�� � #:)&)�h� � :*� *�:+&�i�+��*�N� H�P:,*� N,� g,�QY6-� s+�� �+*� N**� � �YUSYWS� ��[�_� �+�� �+* � N**� � �YUSYcS� ��[�_� �*+�� q,�d���,�g� :.� &�n.�� � #:/,/�h� � :0� 0�:1,�i�1�*�N� H�P:2*#� N2� g2�QY63� s+�� �+*&� N**� � �YUSYWS� ��[�_� �+a� �+*'� N**� � �YUSYcS� ��[�_� �*+�� q2�d���2�g� :4� &� �4�� � #:525�h� � :6� 6�:72�i�7� .+�� �� $+�� �� +�� �� *� !���� *+m� q� ���� �� :8� #8�� � #:99�`� � ::� :�:;�a�;*+c� q� H v � �� � � �� k � �� � � �� k � �� � � �� � � �� � � ���0<�69<��0K�69K�<HK�KPK�{�
�{�
��$�m�������m���������������
�������
���������������		�	��	�	�	��		�	��	�	�	��	�	�	��	�	�	��	�
�
��
�
�
��	�
�
��
�
�
��
�
�
��
�
�
��
�\h�beh�
�\w�bew�htw�w|w� ? ��� �0��6��
��������	���	�
���
�\��b������� ? ��� �0��6��
��������	���	�
���
�\��b��������������� q  Z <  op    {|   }e    / 0   ~   ��   ��   ��   ��   �e 	  �e 
  ��   ��   �e   ��   ��   �e   ��   ��   �e   ��   ��   �e   ��   ��   �e   ��   ��   �e   ��   ��   �e   ��    �� !  �e "  �� #  �� $  �e %  �� &  �� '  �e (  �� )  �� *  �e +  �� ,  �� -  �e .  �� /  �� 0  �e 1  �� 2  �� 3  �e 4  �� 5  �� 6  �e 7  �e 8  �� 9  �� :  �e ;�  � � -  Q  �  � � � � � � � � � � � !� -� /� 5� 7 = ? A F& H/ J8 LA NJ PS W\ Ye ^n `w d� f� j� l� q� s� x� z� ~� �� �� �� �� �� �� � � � �# �- �7 �A �K �U �_ �i �s �} �� �� �� �� �� �� �� �� �� �� �� �� �� �	 � � �' �1 �; �E �O �Y �c �m �w �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �_ �_ �3 �= �G����QQ$$$$MMMME}}}}u��				@	@	@	@	8	p	p	p	p	h��





F 
F 
F 
F 
> 	�	�
�&
�&
�&
�&
�&'''''
�#
�#�*�,�.�1�1�1�1�1 �             "    #