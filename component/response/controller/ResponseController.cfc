component
    displayname = 'ResponseController'
    extends = 'app.Component'
{

	public String function toJson(struct data)
	{
		return serializeJSON(data);
	}

}

