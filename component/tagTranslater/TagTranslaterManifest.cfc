import app.Entity;

component
	accessors = true
    displayname = 'TagTranslaterManifest'
    extends = 'app.Component'
{

	property name = 'message' default = 'Invalid value, try again';
	property String filePath;
	property String stFile;

	public TagTranslaterManifest function setPath(String filePath)
	{
		setFilePath(filePath);

		return this;
	}

	public TagTranslaterManifest function setFile(String stFile)
	{
		setStFile(stFile);

		return this;
	}

	public String function translater(String tag, array params = [])
	{

		var yaml = getContainer(this).getComponent('yaml').getConfig(loadFile());

		if(structKeyExists(yaml, tag)){

			return syntacticalAnalysis(parseLanguage(yaml[tag]), params);
		}

		return getMessage();

	}

	public any function parseLanguage(any stru)
	{

		if(isArray(stru)){

			for(single in stru){

				if(lCase(trim(single['language'])) == lCase(trim(application.language))){
					return single['label'];
				}
			}
		}

		if(IsValid('string', stru)){
			return stru;
		}

		return false;
	}

	public String function syntacticalAnalysis(String str, array params)
	{

		if(str == false){
			return getMessage();
		}

		var count = ArrayLen(params);
		if(count > 0){
			var i = 1;
			for(single in params){
				str = Replace(str, '$+#i#', LCase(params[i]), 'all');
				i++;
			}
		}

		return str;

	}

	public String function loadFile()
	{

		if(getFilePath() != '' and getStFile() == ''){

			return getFilePath() & '/trans.#LCase(application.language)#';
		}else

			if(getFilePath() != '' and getStFile() != ''){

				return getFilePath() & '/' & getStFile();

			}else if(getFilePath() == '' and getStFile() != ''){

				return 'tranlater/#getStFile()#';
			}

		return 'translater';

	}

}
