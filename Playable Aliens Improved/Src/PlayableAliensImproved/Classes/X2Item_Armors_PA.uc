class X2Item_Armors_PA extends X2Item;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

	Armors.AddItem(CreateAndromedonArmor());
	Armors.AddItem(CreatePlatedAndromedonArmor());
	Armors.AddItem(CreatePoweredAndromedonArmor());
	
	Armors.AddItem(CreateSectoidArmor());
	Armors.AddItem(CreatePlatedSectoidArmor());
	Armors.AddItem(CreatePoweredSectoidArmor());

	Armors.AddItem(CreateMutonArmor());
	Armors.AddItem(CreatePlatedMutonArmor());
	Armors.AddItem(CreatePoweredMutonArmor());

	return Armors;
}

static function X2DataTemplate CreateAndromedonArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'AndromedonArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorConv";
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.ArmorTechCat = 'conventional';
	Template.ArmorCat = 'andromedon';
	Template.ArmorClass = 'basic';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 0, true);

	return Template;
}

static function X2DataTemplate CreatePlatedAndromedonArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PlatedAndromedonArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPlat";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('HeavyPlatedArmorStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'andromedon';
	Template.ArmorClass = 'heavy';
	Template.Tier = 2;
	Template.AkAudioSoldierArmorSwitch = 'EXO';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PlatedMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	Template.CreatorTemplateName = 'MediumPlatedArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'AndromedonArmor'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.HEAVY_PLATED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.HEAVY_PLATED_MITIGATION_AMOUNT);
	
	return Template;
}

static function X2DataTemplate CreatePoweredAndromedonArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PoweredAndromedonArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPowr";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('HeavyPoweredArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'andromedon';
	Template.ArmorClass = 'heavy';
	Template.Tier = 4;
	Template.AkAudioSoldierArmorSwitch = 'WAR';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PoweredMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";

	Template.CreatorTemplateName = 'MediumPoweredArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PlatedAndromedonArmor'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.HEAVY_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.HEAVY_POWERED_MITIGATION_AMOUNT);
	
	return Template;
}


static function X2DataTemplate CreateSectoidArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'SectoidArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorConv";
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.ArmorTechCat = 'conventional';
	Template.ArmorCat = 'Sectoid';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 0, true);

	return Template;
}

static function X2DataTemplate CreatePlatedSectoidArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PlatedSectoidArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPlat";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('MediumPlatedArmorStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'sectoid';
	Template.Tier = 1;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PlatedMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	Template.CreatorTemplateName = 'MediumPlatedArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'SectoidArmor'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_PLATED_HEALTH_BONUS, true);

	return Template;
}

static function X2DataTemplate CreatePoweredSectoidArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PoweredSectoidArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPowr";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('MediumPoweredArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'Sectoid';
	Template.Tier = 3;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PoweredMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";

	Template.CreatorTemplateName = 'MediumPoweredArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PlatedSectoidArmor'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_POWERED_MITIGATION_AMOUNT);

	return Template;
}


static function X2DataTemplate CreateMutonArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'MutonArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorConv";
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.ArmorTechCat = 'conventional';
	Template.ArmorCat = 'Muton';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 0, true);

	return Template;
}

static function X2DataTemplate CreatePlatedMutonArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PlatedMutonArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPlat";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('MediumPlatedArmorStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'Muton';
	Template.Tier = 1;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PlatedMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	Template.CreatorTemplateName = 'MediumPlatedArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'MutonArmor'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_PLATED_HEALTH_BONUS, true);

	return Template;
}

static function X2DataTemplate CreatePoweredMutonArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PoweredMutonArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPowr";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('MediumPoweredArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'Muton';
	Template.Tier = 3;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PoweredMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";

	Template.CreatorTemplateName = 'MediumPoweredArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PlatedMutonArmor'; // Which item this will be upgraded from

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_POWERED_MITIGATION_AMOUNT);

	return Template;
}
