class X2StrategyElement_Rewards_PA extends X2StrategyElement_DefaultRewards;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateSectoidReward());
	Templates.AddItem(CreateMutonReward());
	Templates.AddItem(CreateAndromedonReward());

	Templates.AddItem(CreateRescueMissionReward());

	return Templates;
}

static function X2DataTemplate CreateAndromedonReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_Andromedon');
	Template.rewardObjectTemplateName = 'PA_Andromedon';

	Template.GenerateRewardFn = GeneratePersonnelReward;
	Template.SetRewardFn = SetPersonnelReward;
	Template.GiveRewardFn = GivePersonnelReward;
	Template.GetRewardStringFn = GetPersonnelRewardString;
	Template.GetRewardImageFn = GetPersonnelRewardImage;
	Template.GetRewardIconFn = GetGenericRewardIcon;

	return Template;
}

static function X2DataTemplate CreateMutonReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_Muton');
	Template.rewardObjectTemplateName = 'PA_Muton';

	Template.GenerateRewardFn = GeneratePersonnelReward;
	Template.SetRewardFn = SetPersonnelReward;
	Template.GiveRewardFn = GivePersonnelReward;
	Template.GetRewardStringFn = GetPersonnelRewardString;
	Template.GetRewardImageFn = GetPersonnelRewardImage;
	Template.GetRewardIconFn = GetGenericRewardIcon;

	return Template;
}


static function X2DataTemplate CreateSectoidReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_Sectoid');
	Template.rewardObjectTemplateName = 'PA_Sectoid';

	Template.GenerateRewardFn = GeneratePersonnelReward;
	Template.SetRewardFn = SetPersonnelReward;
	Template.GiveRewardFn = GivePersonnelReward;
	Template.GetRewardStringFn = GetPersonnelRewardString;
	Template.GetRewardImageFn = GetPersonnelRewardImage;
	Template.GetRewardIconFn = GetGenericRewardIcon;

	return Template;
}


static function X2DataTemplate CreateRescueMissionReward()
{
	local X2RewardTemplate Template;

	`CREATE_X2Reward_TEMPLATE(Template, 'Reward_AlienRescue');

	Template.GiveRewardFn = GiveAlienRescueReward;
	Template.GetRewardStringFn = GetMissionRewardString;
	Template.RewardPopupFn = MissionRewardPopup;

	return Template;
}


static function GiveAlienRescueReward(XComGameState NewGameState, XComGameState_Reward RewardState, optional StateObjectReference AuxRef, optional bool bOrder = false, optional int OrderHours = -1)
{
	local XComGameState_MissionSite MissionState;
	local XComGameState_WorldRegion RegionState;
	local XComGameState_Reward MissionRewardState;
	local X2RewardTemplate RewardTemplate;
	local X2StrategyElementTemplateManager StratMgr;
	local X2MissionSourceTemplate MissionSource;
	local array<XComGameState_Reward> MissionRewards;
	local float MissionDuration;
	local XComGameState_CovertAction ActionState;
	local XComGameState_HeadquartersResistance ResHQ;
	local array<name> Rewardnames;

	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	ActionState = XComGameState_CovertAction(`XCOMHISTORY.GetGameStateForObjectID(AuxRef.ObjectID));
	RegionState = ActionState.GetWorldRegion();
	RewardNames.Length = 0;

	RewardNames.AddItem('Reward_Sectoid');
	RewardNames.AddItem('Reward_Muton');
	RewardNames.AddItem('Reward_Andromedon');

	ResHQ = class'UIUtilities_Strategy'.static.GetResistanceHQ();
	MissionRewards.Length = 0;
	RewardTemplate = X2RewardTemplate(StratMgr.FindStrategyElementTemplate(RewardNames[`SYNC_RAND_STATIC(RewardNames.Length)]));
	MissionRewardState = RewardTemplate.CreateInstanceFromTemplate(NewGameState);
	MissionRewardState.GenerateReward(NewGameState, ResHQ.GetMissionResourceRewardScalar(RewardState), RegionState.GetReference());
	MissionRewards.AddItem(MissionRewardState);

	MissionState = XComGameState_MissionSite(NewGameState.CreateNewStateObject(class'XComGameState_MissionSite'));

	MissionSource = X2MissionSourceTemplate(StratMgr.FindStrategyElementTemplate('MissionSource_Council'));
	
	MissionDuration = float((default.MissionMinDuration + `SYNC_RAND_STATIC(default.MissionMaxDuration - default.MissionMinDuration + 1)) * 3600);
	MissionState.BuildMission(MissionSource, RegionState.GetRandom2DLocationInRegion(), RegionState.GetReference(), MissionRewards, true, true, , MissionDuration);
	MissionState.PickPOI(NewGameState);

	RewardState.RewardObjectReference = MissionState.GetReference();
}
