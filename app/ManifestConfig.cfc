component
    displayname = 'ManifestConfig'
{

	public String function parseNameDir(String parseString)
    {
        var temp = LCase(parseString);
        return uCase(left(temp,1)) & right(temp,len(temp)-1);
    }
}

