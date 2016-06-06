component
	output="false"
    displayname = 'YamlController'
    extends = 'config.Component'
{

	public YamlController function init(String jar)
	{

		var lib = arrayNew(1);
		var loader = "";

		lib.add( arguments.jar );

		loader = createObject("component", "/component/yaml/lib/io/javaloader/JavaLoader").init( lib );


		setYaml( loader.create( 'org.ho.yaml.Yaml' ) );

		return this;
	}

	public void function setYaml(any yaml)
	{
		variables.instance.yaml = yaml;
	}

	public Any function load(String yamlFile)
	{

		var file = createObject( 'java', 'java.io.File' ).init( arguments.yamlFile );

		return  getYaml().load(file);
	}

	private Any function getYaml(String yamlFile)
	{
		return variables.instance.yaml;
	}

}
