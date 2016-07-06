component
	accessors = true
    displayname = 'ManifestConfig'
{

	// property ManifestConfig mFormContext;
	/*
		init application and manegement context
	// */
	// public ManifestConfig function init(ManifestConfig context)
	// {

	// 	setMFormContext(context);

	// 	return this;
	// }

	public any function parseBefore()
	{
		// writeDump('application before');
	}

	public any function parseAfter()
	{
		// writeDump('the end of the application');
	}

	public any function finish(ManifestConfig mContext)
	{
		mContext.setStreamBundleName(mContext.getRequest().getStBundle());
	}

	public String function parseNameDir(String parseString)
    {
        return uCase(left(parseString,1)) & right(parseString,len(parseString)-1);
    }

    public function onMissingMethod(String missingMethodName, Struct missingMethodArguments)
    {
        writeDump( missingMethodName );
        writeDump( missingMethodArguments );
        abort;
    }

    public struct function parseStruct(struct data, String key, any value)
    {

    	if(!StructKeyExists(data, key)){

    		StructInsert(data,key,value);

    		return data;
    	}

    	var temp = data[key][StructKeyList(value)];

    	for(message in value[StructKeyList(value)]){

	    	ArrayAppend(temp, message);
    	}

    	var attr = {};
    	structInsert(attr, StructKeyList(value), temp);

		structAppend(value, attr);

    	structAppend(data[key], value);

    	return data;

    }

    public String function getStatusCode()
    {
    	return getPageContext().getResponse().getResponse().getStatus();
    }

    public String function setStatusCode(String codeStatus)
    {

        getPageContext().getResponse().getResponse().setStatus(codeStatus);

        return getStatusCode();
    }


    // convert object 

    function base64ToHex( String base64Value )
    {
        var binaryValue = binaryDecode( base64Value, "base64" );
        var hexValue = binaryEncode( binaryValue, "hex" );
        return( lcase( hexValue ) );
    }

    function base64ToString( String base64Value )
    {
        var binaryValue = binaryDecode( base64Value, "base64" );
        var stringValue = toString( binaryValue );
        return( stringValue );
    }

    function hexToBase64( String hexValue )
    {
        var binaryValue = binaryDecode( hexValue, "hex" );
        var base64Value = binaryEncode( binaryValue, "base64" );
        return( base64Value );
    }

    function hexToString( String hexValue )
    {
        var binaryValue = binaryDecode( hexValue, "hex" );
        var stringValue = toString( binaryValue );
        return( stringValue );
    }
    
    function stringToBase64( String stringValue )
    {
        var binaryValue = stringToBinary( stringValue );
        var base64Value = binaryEncode( binaryValue, "base64" );
        return( base64Value );
    }
    
    function stringToBinary( String stringValue )
    {
        var base64Value = toBase64( stringValue );
        var binaryValue = toBinary( base64Value );
        return( binaryValue );
    }

    function stringToHex( String stringValue )
    {
        var binaryValue = stringToBinary( stringValue );
        var hexValue = binaryEncode( binaryValue, "hex" );
        return( lcase( hexValue ) );
    }

    function binaryToJson(binary val)
    {
        var hexValue = binaryEncode(GetHttpRequestData().content, "hex");

        var binaryValue = binaryDecode(hexValue, "hex");

        var str = charsetEncode(binaryValue, "utf-8");

        return deserializeJSON(str);
    }
    
}

