class X2Ability_PA extends X2Ability config(PlayableAdvent);

var config int PA_Bayonet_Cooldown;
var config int PA_AcidBlob_Cooldown;
var config int PA_WallSmash_MobilityBonus;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(PA_GrenadePocket());
	Templates.AddItem(PA_Bayonet());
	Templates.AddItem(PA_AcidBlob());
	Templates.AddItem(PA_WallSmash());
	Templates.AddItem(PA_WallSmashCancel());
	Templates.AddItem(PA_WallSmashDesc());

	return Templates;
}

static function X2AbilityTemplate PA_GrenadePocket()
{

	local X2AbilityTemplate Template;

	Template = PurePassive('PA_GrenadePocket', "img:///UILibrary_PerkIcons.UIPerk_grenade_launcher");
	
	return Template;
}

static function X2DataTemplate PA_Bayonet()
{
	// Because the Bayonet is a real weapon, the damage for it is in the weapon defintion. This just creates the capacity for the skill to exist.
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			PhysicalDamageEffect;
	local X2Effect_SetUnitValue					SetUnitValEffect;
	local X2Effect_ImmediateAbilityActivation	ImpairingAbilityEffect;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2AbilityTarget_MovingMelee			MeleeTarget;
	local X2AbilityCooldown						Cooldown;
	local array<name>							SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Bayonet');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_muton_bayonet";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.Hostility = eHostility_Offensive;

	Template.AdditionalAbilities.AddItem(class'X2Ability_Impairing'.default.ImpairingAbilityName);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Bayonet_Cooldown;
	Template.AbilityCooldown = Cooldown;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;

	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	// Damage Effect
	//
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(PhysicalDamageEffect);

	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;

	//Impairing effects need to come after the damage. This is needed for proper visualization ordering.
	//Effect on a successful melee attack is triggering the Apply Impairing Effect Ability
	ImpairingAbilityEffect = new class 'X2Effect_ImmediateAbilityActivation';
	ImpairingAbilityEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	ImpairingAbilityEffect.EffectName = 'ImmediateStunImpair';
	ImpairingAbilityEffect.AbilityName = class'X2Ability_Impairing'.default.ImpairingAbilityName;
	ImpairingAbilityEffect.bRemoveWhenTargetDies = true;
	ImpairingAbilityEffect.VisualizationFn = class'X2Ability_Impairing'.static.ImpairingAbilityEffectTriggeredVisualization;
	Template.AddTargetEffect(ImpairingAbilityEffect);

	// The Muton gets to counterattack once
	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = class'X2Ability'.default.CounterattackDodgeEffectName;
	SetUnitValEffect.NewValueToSet = 0;
	SetUnitValEffect.CleanupType = eCleanup_BeginTurn;
	SetUnitValEffect.bApplyOnHit = true;
	SetUnitValEffect.bApplyOnMiss = true;
	Template.AddShooterEffect(SetUnitValEffect);

	// Remove the dodge increase (happens with a counter attack, which is one time per turn)
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Ability'.default.CounterattackDodgeEffectName);
	RemoveEffects.bApplyOnHit = true;
	RemoveEffects.bApplyOnMiss = true;
	Template.AddShooterEffect(RemoveEffects);

	//Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	MeleeTarget = new class'X2AbilityTarget_MovingMelee';
	MeleeTarget.MovementRangeAdjustment = 0;
	Template.AbilityTargetStyle = MeleeTarget;
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";

	Template.CinescriptCameraType = "Muton_Punch";
	
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;	
	
	return Template;
}

static function X2AbilityTemplate PA_AcidBlob()
{
	local X2AbilityTemplate				Template;	
	local X2AbilityCost_Ammo			AmmoCost;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2Effect_ApplyWeaponDamage	WeaponEffect;
	local X2AbilityTarget_Cursor		CursorTarget;
	local X2AbilityMultiTarget_Radius	RadiusMultiTarget;
	local X2Condition_UnitProperty		UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput	InputTrigger;
	local X2AbilityCooldown				Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_AcidBlob');
	Template.bDontDisplayInAbilitySummary = false;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_acidblob"; // TODO: This needs to be changed

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.bUseAmmoAsChargesForHUD = false;

	Template.TargetingMethod = class'X2TargetingMethod_Grenade';

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_AcidBlob_Cooldown;
	Template.AbilityCooldown = Cooldown;
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 0;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.AddItem('Salvo');
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;
	
	WeaponEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponEffect.DamageTypes.AddItem('Acid');
	Template.AddMultiTargetEffect(WeaponEffect);
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyAcidToWorld');
	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreateAcidBurningStatusEffect(2, 1));
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.CustomFireAnim = 'FF_AcidBlob';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Andromedon_AcidBlob";

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate PA_WallSmash()
{
	local X2AbilityTemplate						Template;
	local X2Condition_UnitEffects				EffectsCondition;
	local X2Effect_PersistentTraversalChange	WallSmashEffect;
	local X2Effect_PersistentStatChange			MobilityBonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_WallSmash');
	Template.AbilityCosts.AddItem(default.FreeActionCost);

	//	Ability conditions
	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect('PA_WallSmashEffect', 'AA_MissingRequiredEffect');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.bHideOnClassUnlock = true;
	Template.HideErrors.AddItem('AA_CannotAfford_Charges');
	Template.HideErrors.AddItem('AA_MissingRequiredEffect');
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_DLC3Images.UIPerk_spark_wreckingball";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY + 1;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger); 

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	WallSmashEffect = new class'X2Effect_PersistentTraversalChange';
	WallSmashEffect.AddTraversalChange(eTraversal_BreakWall, true);
	WallSmashEffect.EffectName = 'PA_WallSmashEffect';
	WallSmashEffect.DuplicateResponse = eDupe_Ignore;
	WallSmashEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	WallSmashEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, , , Template.AbilitySourceName);
	Template.AddTargetEffect(WallSmashEffect);

	MobilityBonusEffect = new class'X2Effect_PersistentStatChange';
	MobilityBonusEffect.EffectName = 'PA_WallSmashBonusMobilityEffect';
	MobilityBonusEffect.BuildPersistentEffect(1, true, false);
	MobilityBonusEffect.AddPersistentStatChange(eStat_Mobility, default.PA_WallSmash_MobilityBonus);
	Template.AddTargetEffect(MobilityBonusEffect);

	Template.bShowActivation = true;
	Template.bSkipFireAction = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.AdditionalAbilities.AddItem('PA_WallSmashCancel');

	return Template;
}

static function X2AbilityTemplate PA_WallSmashCancel()
{
	local X2AbilityTemplate			Template;
	local X2Condition_UnitEffects	EffectsCondition;
	local X2Effect_RemoveEffects	RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_WallSmashCancel');

	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.bHideOnClassUnlock = true;
	Template.DisplayTargetHitChance = false;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_DLC3Images.UIPerk_spark_overdrive";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY + 2;

	//	Ability conditions
	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddRequireEffect('PA_WallSmashEffect', 'AA_MissingRequiredEffect');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	//	Targeting and triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem('PA_WallSmashEffect');
	RemoveEffects.EffectNamesToRemove.AddItem('PA_WallSmashBonusMobilityEffect');
	Template.AddTargetEffect(RemoveEffects);

	//	Visualization
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.Hostility = eHostility_Neutral;

	Template.bShowActivation = true;
	Template.bSkipFireAction = true;

	return Template;
}

static function X2AbilityTemplate PA_WallSmashDesc()
{

	local X2AbilityTemplate Template;

	Template = PurePassive('PA_WallSmashDesc', "img:///UILibrary_DLC3Images.UIPerk_spark_wreckingball");
	
	return Template;
}