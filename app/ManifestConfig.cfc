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

}

