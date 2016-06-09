component
    displayname = 'ResponseController'
    extends = 'app.Component'
{

	public String function toJson(config.Entity out)
	{
		return serializeJSON(out);
	}

}

