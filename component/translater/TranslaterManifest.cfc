import app.Entity;

component
	accessors = true
    displayname = 'TranslaterManifest'
    extends = 'app.Component'
{

	property name = 'message' default = false;
	property name = 'messageDefault' default = 'algum problema encontrado, verifique com o administrador do sistema';
	property String stFile;
	property userRole;

	public TranslaterManifest function setPath(String filePath)
	{
		setFilePath('translater');

		return this;
	}

	public TranslaterManifest function setFile(String stFile)
	{
		setStFile(stFile);

		return this;
	}

	public String function tag(String tag, array params = [])
	{

		var yaml = getContainer(this).getComponent('yaml').getConfig(loadFile());

		if(structKeyExists(yaml, tag)){
			return syntacticalAnalysis(parseLanguage(yaml[tag]), params);
		}

		if(getMessage() != false){
			return getMessage();
		}

		return getMessageDefault();

	}

	public String function translater(String field, String tag, array params = [])
	{

		var yaml = getContainer(this).getComponent('yaml').getConfig(loadFile());

		var stMessage = existKeyInRole(yaml, field, getUserRole(), params);
		if(stMessage != false){
			return stMessage;
		}

		if(structKeyExists(yaml, tag)){
			setMessage(syntacticalAnalysis(parseLanguage(yaml[tag]), params));
		}

		if(getMessage() != false){
			return getMessage();
		}

		return getMessageDefault();

	}


	public String function existKeyInRole(struct yaml, String field, Any role, array params = [])
	{

		if(structKeyExists(role,field)){

			var temp = role[field];

			if(structKeyExists(temp,"tag") and structKeyExists(yaml, temp['tag'])){

				if(temp['tag'] != '' and yaml[temp['tag']] != ''){
					return yaml[temp['tag']];
				}
			}

		}

		return false;

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
		if(getStFile() == ''){
			return getFilePath() & '/trans.#LCase(application.language)#';
		}else{
			return getFilePath() & '/' & getStFile();
		}
	}

}
