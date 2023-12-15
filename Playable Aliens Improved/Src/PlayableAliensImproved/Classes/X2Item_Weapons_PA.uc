class X2Item_Weapons_PA extends X2Item
	config(GameData_WeaponData);

var config WeaponDamageValue AndromedonCannon_Conventional_BaseDamage;
var config int AndromedonCannon_Conventional_Aim;
var config int AndromedonCannon_Conventional_CritChance;
var config int AndromedonCannon_Conventional_iClipSize;
var config int AndromedonCannon_Conventional_iSoundRange;
var config int AndromedonCannon_Conventional_iEnvironmentDamage;
var config int AndromedonCannon_Conventional_NumUpgradeSlots;

var config WeaponDamageValue AndromedonCannon_Magnetic_BaseDamage;
var config int AndromedonCannon_Magnetic_Aim;
var config int AndromedonCannon_Magnetic_CritChance;
var config int AndromedonCannon_Magnetic_iClipSize;
var config int AndromedonCannon_Magnetic_iSoundRange;
var config int AndromedonCannon_Magnetic_iEnvironmentDamage;
var config int AndromedonCannon_Magnetic_NumUpgradeSlots;

var config WeaponDamageValue AndromedonCannon_Beam_BaseDamage;
var config int AndromedonCannon_Beam_Aim;
var config int AndromedonCannon_Beam_CritChance;
var config int AndromedonCannon_Beam_iClipSize;
var config int AndromedonCannon_Beam_iSoundRange;
var config int AndromedonCannon_Beam_iEnvironmentDamage;
var config int AndromedonCannon_Beam_NumUpgradeSlots;

var config WeaponDamageValue AndromedonAcidBlobT1_BaseDamage;
var config int AndromedonAcidBlobT1_iSoundRange;
var config int AndromedonAcidBlobT1_iEnvironmentDamage;
var config int AndromedonAcidBlobT1_iRange;
var config int AndromedonAcidBlobT1_iRadius;
var config int AndromedonLauncher_Conventional_RangeBonus;
var config int AndromedonLauncher_Conventional_RadiusBonus;

var config WeaponDamageValue AndromedonAcidBlobT2_BaseDamage;
var config int AndromedonAcidBlobT2_iSoundRange;
var config int AndromedonAcidBlobT2_iEnvironmentDamage;
var config int AndromedonAcidBlobT2_iRange;
var config int AndromedonAcidBlobT2_iRadius;
var config int AndromedonLauncher_Magnetic_RangeBonus;
var config int AndromedonLauncher_Magnetic_RadiusBonus;


var config WeaponDamageValue MutonRifle_Conventional_BaseDamage;
var config int MutonRifle_Conventional_Aim;
var config int MutonRifle_Conventional_CritChance;
var config int MutonRifle_Conventional_iClipSize;
var config int MutonRifle_Conventional_iSoundRange;
var config int MutonRifle_Conventional_iEnvironmentDamage;
var config int MutonRifle_Conventional_NumUpgradeSlots;

var config WeaponDamageValue MutonRifle_Magnetic_BaseDamage;
var config int MutonRifle_Magnetic_Aim;
var config int MutonRifle_Magnetic_CritChance;
var config int MutonRifle_Magnetic_iClipSize;
var config int MutonRifle_Magnetic_iSoundRange;
var config int MutonRifle_Magnetic_iEnvironmentDamage;
var config int MutonRifle_Magnetic_NumUpgradeSlots;

var config WeaponDamageValue MutonRifle_Beam_BaseDamage;
var config int MutonRifle_Beam_Aim;
var config int MutonRifle_Beam_CritChance;
var config int MutonRifle_Beam_iClipSize;
var config int MutonRifle_Beam_iSoundRange;
var config int MutonRifle_Beam_iEnvironmentDamage;
var config int MutonRifle_Beam_NumUpgradeSlots;

var config WeaponDamageValue MutonMelee_Conventional_BaseDamage;
var config int MutonMelee_Conventional_Aim;
var config int MutonMelee_Conventional_CritChance;
var config int MutonMelee_Conventional_iSoundRange;
var config int MutonMelee_Conventional_iEnvironmentDamage;
//var config int MutonMelee_Conventional_StunChance;
var config int MutonMelee_Conventional_NumUpgradeSlots;

var config WeaponDamageValue MutonMelee_Magnetic_BaseDamage;
var config int MutonMelee_Magnetic_Aim;
var config int MutonMelee_Magnetic_CritChance;
var config int MutonMelee_Magnetic_iSoundRange;
var config int MutonMelee_Magnetic_iEnvironmentDamage;
//var config int MutonMelee_Magnetic_StunChance;
var config int MutonMelee_Magnetic_NumUpgradeSlots;

var config WeaponDamageValue MutonMelee_Beam_BaseDamage;
var config int MutonMelee_Beam_Aim ;
var config int MutonMelee_Beam_CritChance;
var config int MutonMelee_Beam_iSoundRange;
var config int MutonMelee_Beam_iEnvironmentDamage;
//var config int MutonMelee_Beam_StunChance;
var config int MutonMelee_Beam_NumUpgradeSlots;


var config WeaponDamageValue SectoidBlaster_Conventional_BaseDamage;
var config int SectoidBlaster_Conventional_Aim;
var config int SectoidBlaster_Conventional_CritChance;
var config int SectoidBlaster_Conventional_iClipSize;
var config int SectoidBlaster_Conventional_iSoundRange ;
var config int SectoidBlaster_Conventional_iEnvironmentDamage ;
var config int SectoidBlaster_Conventional_NumUpgradeSlots;

var config WeaponDamageValue SectoidBlaster_Magnetic_BaseDamage;
var config int SectoidBlaster_Magnetic_Aim;
var config int SectoidBlaster_Magnetic_CritChance;
var config int SectoidBlaster_Magnetic_iClipSize ;
var config int SectoidBlaster_Magnetic_iSoundRange;
var config int SectoidBlaster_Magnetic_iEnvironmentDamage;
var config int SectoidBlaster_Magnetic_NumUpgradeSlots;

var config WeaponDamageValue SectoidBlaster_Beam_BaseDamage;
var config int SectoidBlaster_Beam_Aim;
var config int SectoidBlaster_Beam_CritChance;
var config int SectoidBlaster_Beam_iClipSize;
var config int SectoidBlaster_Beam_iSoundRange;
var config int SectoidBlaster_Beam_iEnvironmentDamage;
var config int SectoidBlaster_Beam_NumUpgradeSlots;

var config array <WeaponDamageValue> SectoidPsiAmpT1_AbilityDamage;
var config array <WeaponDamageValue> SectoidPsiAmpT2_AbilityDamage;
var config array <WeaponDamageValue> SectoidPsiAmpT3_AbilityDamage;

var config int AndromedonCannon_Conventional_TradingPostValue;
var config int AndromedonCannon_Magnetic_TradingPostValue;
var config int AndromedonCannon_Beam_TradingPostValue;
var config int AndromedonLauncher_Conventional_TradingPostValue;
var config int AndromedonLauncher_Magnetic_TradingPostValue;
var config int MutonRifle_Conventional_TradingPostValue;
var config int MutonRifle_Magnetic_TradingPostValue;
var config int MutonRifle_Beam_TradingPostValue;
var config int MutonMelee_Conventional_TradingPostValue;
var config int MutonMelee_Magnetic_TradingPostValue;
var config int MutonMelee_Beam_TradingPostValue;
var config int SectoidBlaster_Conventional_TradingPostValue;
var config int SectoidBlaster_Magnetic_TradingPostValue;
var config int SectoidBlaster_Beam_TradingPostValue;
var config int SectoidPsiAmpT1_TradingPostValue;
var config int SectoidPsiAmpT2_TradingPostValue;
var config int SectoidPsiAmpT3_TradingPostValue;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_PA_AndromedonCannon_Conventional());
	ModWeapons.AddItem(CreateTemplate_PA_AndromedonCannon_Magnetic());
	ModWeapons.AddItem(CreateTemplate_PA_AndromedonCannon_Beam());
	ModWeapons.AddItem(CreateTemplate_PA_AndromedonLauncher_Conventional());
	ModWeapons.AddItem(CreateTemplate_PA_AndromedonLauncher_Magnetic());

	ModWeapons.AddItem(CreateTemplate_PA_MutonRifle_Conventional());
	ModWeapons.AddItem(CreateTemplate_PA_MutonRifle_Magnetic());
	ModWeapons.AddItem(CreateTemplate_PA_MutonRifle_Beam());
	ModWeapons.AddItem(CreateTemplate_PA_MutonBayonet_Conventional());
	ModWeapons.AddItem(CreateTemplate_PA_MutonBayonet_Magnetic());
	ModWeapons.AddItem(CreateTemplate_PA_MutonBayonet_Beam());

	ModWeapons.AddItem(CreateTemplate_PA_SectoidPistol_Conventional());
	ModWeapons.AddItem(CreateTemplate_PA_SectoidPistol_Magnetic());
	ModWeapons.AddItem(CreateTemplate_PA_SectoidPistol_Beam());
	ModWeapons.AddItem(CreateTemplate_PA_SectoidPsiAmp_Conventional());
	ModWeapons.AddItem(CreateTemplate_PA_SectoidPsiAmp_Magnetic());
	ModWeapons.AddItem(CreateTemplate_PA_SectoidPsiAmp_Beam());

	return ModWeapons;
}

static function X2DataTemplate CreateTemplate_PA_AndromedonCannon_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_AndromedonCannon_CV');
	Template.WeaponPanelImage = "_MagneticRifle"; // used by the UI. Probably determines iconview of the weapon.
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_AndromedonGunCat';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.AndromedonRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;

	Template.BaseDamage = default.AndromedonCannon_Conventional_BaseDamage;
	Template.Aim = default.AndromedonCannon_Conventional_Aim;
	Template.CritChance = default.AndromedonCannon_Conventional_CritChance;
	Template.iClipSize = default.AndromedonCannon_Conventional_iClipSize;
	Template.iSoundRange = default.AndromedonCannon_Conventional_iSoundRange;
	Template.iEnvironmentDamage = default.AndromedonCannon_Conventional_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.AndromedonCannon_Conventional_NumUpgradeSlots;

	Template.TradingPostValue = default.AndromedonCannon_Conventional_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Andromedon_Cannon.WP_AndromedonCannon";

	Template.iPhysicsImpulse = 5;

	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;
	Template.StartingItem = true;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_AndromedonCannon_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_AndromedonCannon_MG');
	Template.WeaponPanelImage = "_MagneticRifle"; // used by the UI. Probably determines iconview of the weapon.
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_AndromedonGunCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.AndromedonRifle";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;

	Template.BaseDamage = default.AndromedonCannon_Magnetic_BaseDamage;
	Template.Aim = default.AndromedonCannon_Magnetic_Aim;
	Template.CritChance = default.AndromedonCannon_Magnetic_CritChance;
	Template.iClipSize = default.AndromedonCannon_Magnetic_iClipSize;
	Template.iSoundRange = default.AndromedonCannon_Magnetic_iSoundRange;
	Template.iEnvironmentDamage = default.AndromedonCannon_Magnetic_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.AndromedonCannon_Magnetic_NumUpgradeSlots;

	Template.TradingPostValue = default.AndromedonCannon_Magnetic_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Andromedon_Cannon.WP_AndromedonCannon";

	Template.iPhysicsImpulse = 5;
	
	Template.CreatorTemplateName = 'Cannon_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_AndromedonCannon_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_AndromedonCannon_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_AndromedonCannon_BM');
	Template.WeaponPanelImage = "_MagneticRifle"; // used by the UI. Probably determines iconview of the weapon.
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_AndromedonGunCat';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.AndromedonRifle";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;

	Template.BaseDamage = default.AndromedonCannon_Beam_BaseDamage;
	Template.Aim = default.AndromedonCannon_Beam_Aim;
	Template.CritChance = default.AndromedonCannon_Beam_CritChance;
	Template.iClipSize = default.AndromedonCannon_Beam_iClipSize;
	Template.iSoundRange = default.AndromedonCannon_Beam_iSoundRange;
	Template.iEnvironmentDamage = default.AndromedonCannon_Beam_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.AndromedonCannon_Beam_NumUpgradeSlots;

	Template.TradingPostValue = default.AndromedonCannon_Beam_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Andromedon_Cannon.WP_AndromedonCannon";
	
	Template.CreatorTemplateName = 'Cannon_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_AndromedonCannon_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_AndromedonLauncher_Conventional()
{
	local X2GrenadeLauncherTemplate Template;

	Template = new class'X2GrenadeLauncherTemplate';
	
	`CREATE_X2TEMPLATE(class'X2GrenadeLauncherTemplate', Template, 'PA_AndromedonLauncher_CV');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_AcidBlobCat';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.AndromedonRifle";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.GameArchetype = "WP_Andromedon_AcidAttack.WP_Andromedon_AcidAttack";
	Template.StowedLocation = eSlot_None;
	Template.Tier = 0;

	Template.BaseDamage = default.AndromedonAcidBlobT1_BaseDamage;
	Template.iSoundRange = default.AndromedonAcidBlobT1_iSoundRange;
	Template.iEnvironmentDamage = default.AndromedonAcidBlobT1_iEnvironmentDamage;
	Template.iRange = default.AndromedonAcidBlobT1_iRange;
	Template.iRadius = default.AndromedonAcidBlobT1_iRadius;

	
	Template.IncreaseGrenadeRange = default.AndromedonLauncher_Conventional_RangeBonus;
	Template.IncreaseGrenadeRadius = default.AndromedonLauncher_Conventional_RadiusBonus;

	Template.TradingPostValue = default.AndromedonLauncher_Conventional_TradingPostValue;

	Template.BaseDamage.DamageType = 'Acid';

	Template.iClipSize = 1;
	Template.InfiniteAmmo = false;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	
	Template.bSoundOriginatesFromOwnerLocation = false;

	Template.bInfiniteItem = true;
	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRangeBonusLabel, , default.AndromedonLauncher_Conventional_RangeBonus);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRadiusBonusLabel, , default.AndromedonLauncher_Conventional_RadiusBonus);

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_AndromedonLauncher_Magnetic()
{
	local X2GrenadeLauncherTemplate Template;

	Template = new class'X2GrenadeLauncherTemplate';
	
	`CREATE_X2TEMPLATE(class'X2GrenadeLauncherTemplate', Template, 'PA_AndromedonLauncher_MG');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_AcidBlobCat';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.AndromedonRifle";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.GameArchetype = "WP_Andromedon_AcidAttack.WP_Andromedon_AcidAttack";
	Template.StowedLocation = eSlot_None;
	Template.Tier = 1;

	Template.BaseDamage = default.AndromedonAcidBlobT2_BaseDamage;
	Template.iSoundRange = default.AndromedonAcidBlobT2_iSoundRange;
	Template.iEnvironmentDamage = default.AndromedonAcidBlobT2_iEnvironmentDamage;
	Template.iRange = default.AndromedonAcidBlobT2_iRange;
	Template.iRadius = default.AndromedonAcidBlobT2_iRadius;

	
	Template.IncreaseGrenadeRange = default.AndromedonLauncher_Magnetic_RangeBonus;
	Template.IncreaseGrenadeRadius = default.AndromedonLauncher_Magnetic_RadiusBonus;

	Template.TradingPostValue = default.AndromedonLauncher_Magnetic_TradingPostValue;

	Template.BaseDamage.DamageType = 'Acid';

	Template.iClipSize = 1;
	Template.InfiniteAmmo = false;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	
	Template.bSoundOriginatesFromOwnerLocation = false;

	Template.CreatorTemplateName = 'GrenadeLauncher_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_AndromedonLauncher_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRangeBonusLabel, , default.AndromedonLauncher_Magnetic_RangeBonus);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRadiusBonusLabel, , default.AndromedonLauncher_Magnetic_RadiusBonus);

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_MutonRifle_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_MutonRifle_CV');
	Template.WeaponPanelImage = "_MagneticRifle"; // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_MutonGunCat';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.MutonRifle";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;

	Template.BaseDamage = default.MutonRifle_Conventional_BaseDamage;
	Template.Aim = default.MutonRifle_Conventional_Aim;
	Template.CritChance = default.MutonRifle_Conventional_CritChance;
	Template.iClipSize = default.MutonRifle_Conventional_iClipSize;
	Template.iSoundRange = default.MutonRifle_Conventional_iSoundRange;
	Template.iEnvironmentDamage = default.MutonRifle_Conventional_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.MutonRifle_Conventional_NumUpgradeSlots;

	Template.TradingPostValue = default.MutonRifle_Conventional_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Muton_Rifle.WP_MutonRifle";

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_MutonRifle_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_MutonRifle_MG');
	Template.WeaponPanelImage = "_MagneticRifle"; // used by the UI. Probably determines iconview of the weapon.
	
	Template.WeaponCat = 'PA_MutonGunCat';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.MutonRifle";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;

	Template.BaseDamage = default.MutonRifle_Magnetic_BaseDamage;
	Template.Aim = default.MutonRifle_Magnetic_Aim;
	Template.CritChance = default.MutonRifle_Magnetic_CritChance;
	Template.iClipSize = default.MutonRifle_Magnetic_iClipSize;
	Template.iSoundRange = default.MutonRifle_Magnetic_iSoundRange;
	Template.iEnvironmentDamage = default.MutonRifle_Magnetic_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.MutonRifle_Magnetic_NumUpgradeSlots;

	Template.TradingPostValue = default.MutonRifle_Magnetic_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Muton_Rifle.WP_MutonRifle";

	Template.iPhysicsImpulse = 5;
	
	Template.CreatorTemplateName = 'AssaultRifle_MG_Schematic';
	Template.BaseItem = 'PA_MutonRifle_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_MutonRifle_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_MutonRifle_BM');
	Template.WeaponPanelImage = "_MagneticRifle";	// used by the UI. Probably determines iconview of the weapon.
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_MutonGunCat';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.MutonRifle";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);
	Template.Tier = 4;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;

	Template.BaseDamage = default.MutonRifle_Beam_BaseDamage;
	Template.Aim = default.MutonRifle_Beam_Aim;
	Template.CritChance = default.MutonRifle_Beam_CritChance;
	Template.iClipSize = default.MutonRifle_Beam_iClipSize;
	Template.iSoundRange = default.MutonRifle_Beam_iSoundRange;
	Template.iEnvironmentDamage = default.MutonRifle_Beam_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.MutonRifle_Beam_NumUpgradeSlots;

	Template.TradingPostValue = default.MutonRifle_Beam_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Muton_Rifle.WP_MutonRifle";

	Template.iPhysicsImpulse = 5;
	
	Template.CreatorTemplateName = 'AssaultRifle_BM_Schematic';
	Template.BaseItem = 'PA_MutonRifle_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_MutonBayonet_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_MutonBayonet_CV');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_MutonBayonetCat';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.MutonRifle";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.GameArchetype = "WP_Muton_Bayonet.WP_MutonBayonet";
	Template.Tier = 0;
	Template.EquipSound = "Sword_Equip_Conventional";

	Template.iRange = 0;
	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iIdealRange = 1;

	Template.BaseDamage = default.MutonMelee_Conventional_BaseDamage;
	Template.Aim = default.MutonMelee_Conventional_Aim;
	Template.CritChance = default.MutonMelee_Conventional_CritChance;
	Template.iSoundRange = default.MutonMelee_Conventional_iSoundRange;
	Template.iEnvironmentDamage = default.MutonMelee_Conventional_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.MutonMelee_Conventional_NumUpgradeSlots;

	Template.TradingPostValue = default.MutonMelee_Conventional_TradingPostValue;

	//Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.MutonMelee_Conventional_StunChance, false));

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.Abilities.AddItem('PA_Bayonet');

	Template.DamageTypeTemplateName = 'Melee';

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.MutonMelee_Conventional_StunChance, , , "%");

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_MutonBayonet_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_MutonBayonet_MG');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_MutonBayonetCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.MutonRifle";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.GameArchetype = "WP_Muton_Bayonet.WP_MutonBayonet";
	Template.Tier = 2;
	Template.EquipSound = "Sword_Equip_Magnetic";

	Template.iRange = 0;
	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iIdealRange = 1;

	Template.BaseDamage = default.MutonMelee_Magnetic_BaseDamage;
	Template.Aim = default.MutonMelee_Magnetic_Aim;
	Template.CritChance = default.MutonMelee_Magnetic_CritChance;
	Template.iSoundRange = default.MutonMelee_Magnetic_iSoundRange;
	Template.iEnvironmentDamage = default.MutonMelee_Magnetic_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.MutonMelee_Magnetic_NumUpgradeSlots;

	Template.TradingPostValue = default.MutonMelee_Magnetic_TradingPostValue;

	//Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.MutonMelee_Magnetic_StunChance, false));

	Template.CreatorTemplateName = 'Sword_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_MutonBayonet_CV'; // Which item this will be upgraded from
	
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.Abilities.AddItem('PA_Bayonet');

	Template.DamageTypeTemplateName = 'Melee';

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.MutonMelee_Magnetic_StunChance, , , "%");

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_MutonBayonet_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_MutonBayonet_BM');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_MutonBayonetCat';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.MutonRifle";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.GameArchetype = "WP_Muton_Bayonet.WP_MutonBayonet";
	Template.Tier = 4;
	Template.EquipSound = "Sword_Equip_Beam";

	Template.iRange = 0;
	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iIdealRange = 1;

	Template.BaseDamage = default.MutonMelee_Beam_BaseDamage;
	Template.Aim = default.MutonMelee_Beam_Aim;
	Template.CritChance = default.MutonMelee_Beam_CritChance;
	Template.iSoundRange = default.MutonMelee_Beam_iSoundRange;
	Template.iEnvironmentDamage = default.MutonMelee_Beam_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.MutonMelee_Beam_NumUpgradeSlots;

	Template.TradingPostValue = default.MutonMelee_Beam_TradingPostValue;

	//Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.MutonMelee_Beam_StunChance, false));

	Template.CreatorTemplateName = 'Sword_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_MutonBayonet_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.Abilities.AddItem('PA_Bayonet');

	Template.DamageTypeTemplateName = 'Melee';

	//Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.MutonMelee_Beam_StunChance, , , "%");

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SectoidPistol_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SectoidPistol_CV');

	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	
	Template.WeaponCat = 'PA_SectoidGunCat';
	Template.WeaponTech = 'conventional';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.SectoidPistol";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;

	Template.BaseDamage = default.SectoidBlaster_Conventional_BaseDamage;
	Template.Aim = default.SectoidBlaster_Conventional_Aim;
	Template.CritChance = default.SectoidBlaster_Conventional_CritChance;
	Template.iClipSize = default.SectoidBlaster_Conventional_iClipSize;
	Template.iSoundRange = default.SectoidBlaster_Conventional_iSoundRange;
	Template.iEnvironmentDamage = default.SectoidBlaster_Conventional_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.SectoidBlaster_Conventional_NumUpgradeSlots;

	Template.TradingPostValue = default.SectoidBlaster_Conventional_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Sectoid_ArmPistol.WP_SectoidPistol";
	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.StartingItem = true;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SectoidPistol_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SectoidPistol_MG');

	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	
	Template.WeaponCat = 'PA_SectoidGunCat';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.SectoidPistol";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;

	Template.BaseDamage = default.SectoidBlaster_Magnetic_BaseDamage;
	Template.Aim = default.SectoidBlaster_Magnetic_Aim;
	Template.CritChance = default.SectoidBlaster_Magnetic_CritChance;
	Template.iClipSize = default.SectoidBlaster_Magnetic_iClipSize;
	Template.iSoundRange = default.SectoidBlaster_Magnetic_iSoundRange;
	Template.iEnvironmentDamage = default.SectoidBlaster_Magnetic_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.SectoidBlaster_Magnetic_NumUpgradeSlots;

	Template.TradingPostValue = default.SectoidBlaster_Magnetic_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Sectoid_ArmPistol.WP_SectoidPistol";
	Template.iPhysicsImpulse = 5;
	
	Template.CreatorTemplateName = 'Pistol_MG_Schematic';
	Template.BaseItem = 'PA_SectoidPistol_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SectoidPistol_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SectoidPistol_BM');

	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	
	Template.WeaponCat = 'PA_SectoidGunCat';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.SectoidPistol";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;

	Template.BaseDamage = default.SectoidBlaster_Beam_BaseDamage;
	Template.Aim = default.SectoidBlaster_Beam_Aim;
	Template.CritChance = default.SectoidBlaster_Beam_CritChance;
	Template.iClipSize = default.SectoidBlaster_Beam_iClipSize;
	Template.iSoundRange = default.SectoidBlaster_Beam_iSoundRange;
	Template.iEnvironmentDamage = default.SectoidBlaster_Beam_iEnvironmentDamage;
	Template.NumUpgradeSlots = default.SectoidBlaster_Beam_NumUpgradeSlots;

	Template.TradingPostValue = default.SectoidBlaster_Beam_TradingPostValue;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Sectoid_ArmPistol.WP_SectoidPistol";
	Template.iPhysicsImpulse = 5;
	
	Template.CreatorTemplateName = 'Pistol_BM_Schematic';
	Template.BaseItem = 'PA_SectoidPistol_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	
	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SectoidPsiAmp_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SectoidPsiAmp_CV');
	Template.WeaponPanelImage = "_PsiAmp";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.DamageTypeTemplateName = 'Psi';
	Template.WeaponCat = 'sectoidpsiamp';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvSecondaryWeapons.PsiAmp";
	Template.EquipSound = "Psi_Amp_Equip";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.Tier = 0;
	// This all the resources; sounds, animations, models, physics, the works.
	
	//Template.GameArchetype = "WP_PsiAmp_CV.WP_PsiAmp_CV";

	Template.Abilities.AddItem('PsiAmpCV_BonusStats');
	
	Template.ExtraDamage = default.SectoidPsiAmpT1_AbilityDamage;

	Template.TradingPostValue = default.SectoidPsiAmpT1_TradingPostValue;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	// Show In Armory Requirements
	Template.ArmoryDisplayRequirements.RequiredTechs.AddItem('Psionics');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseBonusLabel, eStat_PsiOffense, class'X2Ability_ItemGrantedAbilitySet'.default.PSIAMP_CV_STATBONUS, true);

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SectoidPsiAmp_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SectoidPsiAmp_MG');
	Template.WeaponPanelImage = "_PsiAmp";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sectoidpsiamp';
	Template.DamageTypeTemplateName = 'Psi';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.MagSecondaryWeapons.MagPsiAmp";
	Template.EquipSound = "Psi_Amp_Equip";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.Tier = 2;
	// This all the resources; sounds, animations, models, physics, the works.
	
	//Template.GameArchetype = "WP_PsiAmp_MG.WP_PsiAmp_MG";

	Template.Abilities.AddItem('PsiAmpMG_BonusStats');

	Template.ExtraDamage = default.SectoidPsiAmpT2_AbilityDamage;

	Template.TradingPostValue = default.SectoidPsiAmpT2_TradingPostValue;

	Template.CreatorTemplateName = 'PsiAmp_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_SectoidPsiAmp_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseBonusLabel, eStat_PsiOffense, class'X2Ability_ItemGrantedAbilitySet'.default.PSIAMP_MG_STATBONUS);

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SectoidPsiAmp_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SectoidPsiAmp_BM');
	Template.WeaponPanelImage = "_PsiAmp";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sectoidpsiamp';
	Template.DamageTypeTemplateName = 'Psi';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.BeamSecondaryWeapons.BeamPsiAmp";
	Template.EquipSound = "Psi_Amp_Equip";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.Tier = 4;
	// This all the resources; sounds, animations, models, physics, the works.
	
	Template.GameArchetype = "WP_PsiAmp_BM.WP_PsiAmp_BM";

	Template.Abilities.AddItem('PsiAmpBM_BonusStats');

	Template.ExtraDamage = default.SectoidPsiAmpT3_AbilityDamage;

	Template.TradingPostValue = default.SectoidBlaster_Beam_TradingPostValue;

	Template.CreatorTemplateName = 'PsiAmp_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PA_SectoidPsiAmp_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseBonusLabel, eStat_PsiOffense, class'X2Ability_ItemGrantedAbilitySet'.default.PSIAMP_BM_STATBONUS);

	return Template;
}