component
    displayname = 'ManifestConfig'
{

	public String function parseNameDir(String parseString)
    {

        return uCase(left(parseString,1)) & right(parseString,len(parseString)-1);
        // var temp = LCase(parseString);
        // return uCase(left(temp,1)) & right(temp,len(temp)-1);
    }


}

