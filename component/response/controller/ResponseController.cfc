component
    displayname = 'ResponseController'
    extends = 'config.Component'
{

	public String function toJson(config.Entity out)
	{
		return serializeJSON(out);
	}

}

