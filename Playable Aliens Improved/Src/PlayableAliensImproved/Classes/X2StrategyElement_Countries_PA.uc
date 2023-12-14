class X2StrategyElement_Countries_PA extends X2StrategyElement
	dependson(X2CountryTemplate, XGCharacterGenerator);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Countries;
	Countries.AddItem(CreatePlayAlienTemplate());

	Countries.AddItem(CreateAndromedonTemplate());
	Countries.AddItem(CreateMutonTemplate());
	Countries.AddItem(CreateSectoidTemplate());
	return Countries;
}

static function X2DataTemplate CreatePlayAlienTemplate()
{
	local X2CountryTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CountryTemplate', Template, 'Country_PlayAlien');

	return Template;
}


static function X2DataTemplate CreateAndromedonTemplate()
{
	local X2CountryTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CountryTemplate', Template, 'Country_Andromedon');

	return Template;
}

static function X2DataTemplate CreateMutonTemplate()
{
	local X2CountryTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CountryTemplate', Template, 'Country_Muton');

	return Template;
}

static function X2DataTemplate CreateSectoidTemplate()
{
	local X2CountryTemplate Template;

	`CREATE_X2TEMPLATE(class'X2CountryTemplate', Template, 'Country_Sectoid');

	return Template;
}