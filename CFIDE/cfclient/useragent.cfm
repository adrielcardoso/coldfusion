Êþº¾  -  
SourceFile /CFIDE/cfclient/useragent.cfm cfuseragent2ecfm2006328415  coldfusion/runtime/CFPage  <init> ()V  
  	 com.macromedia.SourceModTime  D«ÚÀ coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   javax/servlet/jsp/JspContext 
   parent Ljavax/servlet/jsp/tagext/Tag;  	   com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   !
  " $class$coldfusion$tagext$io$OutputTag Ljava/lang/Class; coldfusion.tagext.io.OutputTag & forName %(Ljava/lang/String;)Ljava/lang/Class; ( ) java/lang/Class +
 , * $ %	  . _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; 0 1
  2 coldfusion/tagext/io/OutputTag 4 _setCurrentLineNo (I)V 6 7
  8 	hasEndTag (Z)V : ; coldfusion/tagext/GenericTag =
 > < 
doStartTag ()I @ A
 5 B 
<script>
	var userAgent = " D write F ! java/io/Writer H
 I G CGI K java/lang/String M HTTP_USER_AGENT O _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; Q R
  S _String &(Ljava/lang/Object;)Ljava/lang/String; U V coldfusion/runtime/Cast X
 Y W EncodeForJavaScript &(Ljava/lang/String;)Ljava/lang/String; [ \
  ] Ó";
	if (userAgent.search(/iPad|iPhone/) >=0)
		__cfclient_platform = "ios";
	else if (userAgent.search(/Android/) >= 0)
		__cfclient_platform = "android";
	else
		__cfclient_platform = "pg_emulator";	
</script>
 _ doAfterBody a A
 5 b doEndTag d A coldfusion/tagext/QueryLoop f
 g e doCatch (Ljava/lang/Throwable;)V i j
 g k 	doFinally m 
 5 n metaData Ljava/lang/Object; p q	  r &coldfusion/runtime/AttributeCollection t java/lang/Object v ([Ljava/lang/Object;)V  x
 u y this Lcfuseragent2ecfm2006328415; LocalVariableTable Code <clinit> getMetadata ()Ljava/lang/Object; runPage out Ljavax/servlet/jsp/JspWriter; value output0  Lcoldfusion/tagext/io/OutputTag; mode0 I t6 t7 Ljava/lang/Throwable; t8 t9 LineNumberTable java/lang/Throwable  1       $ %    p q        ~   #     *· 
±    }        { |       ~   5     '¸ -³ /» uY½ w· z³ s±    }        { |       ~   "     ² s°    }        { |       ~  o  
   £*´ ¶ L*´ N*¶ #*² /-¶ 3À 5:*¶ 9¶ ?¶ CY6 5+E¶ J+*¶ 9*L½ NYPS¶ T¸ Z¸ ^¶ J+`¶ J¶ cÿÑ¶ h  :¨ #°¨ § #:¶ l¨ § :¨ ¿:	¶ o©	°  , u   { ~   , u   { ~            }   f 
   £ { |     £      £  q    £      £      £      £  q    £      £      £  q 	      C  C  C  C  =                 