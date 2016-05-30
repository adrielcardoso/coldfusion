
        (function() {
        var BsUserAgent = false;
        if( window.navigator.userAgent.toLowerCase().indexOf("applewebkit") > -1)
            BsUserAgent = true;
        var booklistcookie = GetTopCookie("filter_product");
        if(booklistcookie == null  && typeof(localStorage) != 'undefined'  && document.location.href.indexOf("adobe.com") < 0 && BsUserAgent == true){ 
            booklistcookie = getlocalStorage("filter_product");
        }
        var booklisttree;
        function treeInit() {
        booklisttree = new YAHOO.widget.TreeView("booklist1");
        var root = booklisttree.getRoot();            
        
        
        
        var dataObjbooklist1 = 
        { label: "Adobe ColdFusion 10 設定と管理",
        href:"",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        var dataObjbooklist1 = 
        { label: "Adobe ColdFusion 10 CFML リファレンス",
        href:"http://help.adobe.com/ja_JP/ColdFusion/10.0/CFMLRef/index.html",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        var dataObjbooklist1 = 
        { label: "Adobe ColdFusion 10 アプリケーションの開発",
        href:"http://help.adobe.com/ja_JP/ColdFusion/10.0/Developing/index.html",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        var dataObjbooklist1 = 
        { label: "Adobe ColdFusion 10 インストール",
        href:"http://help.adobe.com/ja_JP/ColdFusion/10.0/Installing/index.html",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        var dataObjbooklist1 = 
        { label: "ColdFusion 10 リファレンスガイド",
        href:"http://help.adobe.com/ja_JP/FlashPlatform/reference/actionscript/3/index.html",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        var dataObjbooklist1 = 
        { label: "Adobe ColdFusion Builder 2.0 ユーザーガイド",
        href:"http://help.adobe.com/ja_JP/ColdFusionBuilder/2.0/Using/index.html",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        var dataObjbooklist1 = 
        { label: "Adobe ColdFusion Builder 2.0 インストール",
        href:"http://help.adobe.com/ja_JP/ColdFusionBuilder/2.0/Installing/index.html",
        target:"_self",
        product:"all"};
        var productlist = dataObjbooklist1.product.split(",");
        var includeproduct = false;
        if (booklistcookie != null) {
			for(var i=0; i < productlist.length; i++){
				if(booklistcookie.indexOf(productlist[i]) >= 0){
					includeproduct = true;
				}
			}
        }
        if(dataObjbooklist1.product == "all" || includeproduct == true){
            var booklist1 = 
            new YAHOO.widget.TextNode(dataObjbooklist1,  
        root, false);
        includeproduct = false;
        }
        
        
        if (root.children.length > 0) {
        	updateTOCClass();
        	booklisttree.draw();
        }
        else {
            document.getElementById("booklist1").previousSibling.style.display = "none";
        	hideElement("booklist1");
        }
        }
        
        YAHOO.util.Event.onDOMReady(treeInit);
        })();
            