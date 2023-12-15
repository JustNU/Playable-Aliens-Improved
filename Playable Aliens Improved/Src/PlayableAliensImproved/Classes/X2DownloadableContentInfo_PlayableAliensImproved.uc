//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_AUReduxPlayableAliens.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_PlayableAliensImproved extends X2DownloadableContentInfo config(PlayableAdvent);


var config int PA_AcidBlob_VolatileMixDmgBonus;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>

static event OnLoadedSavedGame()
{

	UpdateStorage();

}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}


static event OnLoadedSavedGameToStrategy()
{

	UpdateStorage();

}



/// <summary>
/// Called after the player exits the post-mission sequence while this DLC / Mod is installed.
/// </summary>
static event OnExitPostMissionSequence()
{
	CheckForRequiredHealing();
}




/// <summary>
/// Called after the player exits the post-mission sequence while this DLC / Mod is installed.
/// </summary>
// I'm using this event instead of OnPostMission(), since we're using XComHQ and I need to make sure the player's in the Geoscape fully by then
static function CheckForRequiredHealing()
{
	local XComGameState									NewGameState;
	local XComGameState_HeadquartersXCom				XComHQ;
	local XComGameState_Unit							UnitState;
	local int											i;
	local XComGameState_HeadquartersProjectRecoverWill	WillProject;
	local XComGameState_HeadquartersProjectHealSoldier	ProjectState;
	local bool											AddedProject;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Checking Project Required");

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	AddedProject = false;
	//NewGameState.AddStateObject(XComHQ);

	for (i = 0; i < XComHQ.Crew.Length; i++)
	{
		if (XComHQ.Crew[i].ObjectID != 0)
		{
			UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(XComHQ.Crew[i].ObjectID));

			UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', UnitState.GetReference().ObjectID));
			if ((UnitState.GetMyTemplateName() == 'PA_Sectoid' || UnitState.GetMyTemplateName() == 'PA_Viper' || UnitState.GetMyTemplateName() == 'PA_Muton') && ((UnitState.IsInjured() && !UnitState.HasHealingProject()) || (!HasWillProject(UnitState) && UnitState.NeedsWillRecovery()) ) )
			{
		
				if(UnitState.IsInjured() && !UnitState.HasHealingProject())
				{
					ProjectState = XComGameState_HeadquartersProjectHealSoldier(NewGameState.CreateNewStateObject(class'XComGameState_HeadquartersProjectHealSoldier'));

					ProjectState.SetProjectFocus(UnitState.GetReference(), NewGameState);

					UnitState.SetStatus(eStatus_Healing);
					XComHQ.Projects.AddItem(ProjectState.GetReference());
					AddedProject = true;
				}

			 
				if(!HasWillProject(UnitState) && UnitState.NeedsWillRecovery())
				{
					WillProject = XComGameState_HeadquartersProjectRecoverWill(NewGameState.CreateNewStateObject(class'XComGameState_HeadquartersProjectRecoverWill'));
					WillProject.SetProjectFocus(UnitState.GetReference(), NewGameState);
					XComHQ.Projects.AddItem(WillProject.GetReference());
					AddedProject = true;
				}
			}
		}
	}
	if (AddedProject)
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	else
		`XCOMHISTORY.CleanupPendingGameState(NewGameState);

}

static function bool HasWillProject(XComGameState_Unit UnitState)
{
	local XComGameStateHistory							History;
	local XComGameState_HeadquartersProjectRecoverWill	WillProject;

	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_HeadquartersProjectRecoverWill', WillProject)
	{
		if(WillProject.ProjectFocus == UnitState.GetReference())
		{
			return true;
		}
	}

	return false;
}

exec function AddSectoidRecruit()
{
	local XComGameState_Unit				NewSoldierState;
	local XComOnlineProfileSettings			ProfileSettings;
	local X2CharacterTemplate				CharTemplate;
	local X2CharacterTemplateManager		CharTemplateMgr;
	local XComGameState						NewGameState;
	local XComGameState_HeadquartersXCom	XComHQ;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('PA_Sectoid');
		if(CharTemplate == none)
		{
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
}

exec function AddMutonRecruit()
{
	local XComGameState_Unit				NewSoldierState;
	local XComOnlineProfileSettings			ProfileSettings;
	local X2CharacterTemplate				CharTemplate;
	local X2CharacterTemplateManager		CharTemplateMgr;
	local XComGameState						NewGameState;
	local XComGameState_HeadquartersXCom	XComHQ;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('PA_Muton');
		if(CharTemplate == none)
		{
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
}

exec function AddAndromedonRecruit()
{
	local XComGameState_Unit				NewSoldierState;
	local XComOnlineProfileSettings			ProfileSettings;
	local X2CharacterTemplate				CharTemplate;
	local X2CharacterTemplateManager		CharTemplateMgr;
	local XComGameState						NewGameState;
	local XComGameState_HeadquartersXCom	XComHQ;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('PA_Andromedon');
		if(CharTemplate == none)
		{
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
}

// ******** HANDLE UPDATING STORAGE ************* //
// This handles updating storage in order to create variations of various PA stuff based on techs unlocked
static function UpdateStorage()
{
	local XComGameState						NewGameState;
	local XComGameStateHistory				History;
	local XComGameState_HeadquartersXCom	XComHQ;
	local X2ItemTemplateManager				ItemTemplateMgr;
	local X2ItemTemplate					ItemTemplate;
	local XComGameState_Item				NewItemState;
	local bool								CleanupGameState;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to playable aliens stuff");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	CleanupGameState = true;

	// add conventional stuff
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_AndromedonCannon_CV');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_AndromedonLauncher_CV');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_MutonRifle_CV');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_MutonBayonet_CV');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_SectoidPistol_CV');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_SectoidPsiAmp_CV');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('AndromedonArmor');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('MutonArmor');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	ItemTemplate = ItemTemplateMgr.FindItemTemplate('SectoidArmor');
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate))
		{
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			CleanupGameState = false;
		} 
	}

	// mag cannons
	if(XComHQ.HasItemByName('Cannon_MG'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_AndromedonGun_MG');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}
	
	// mag rifles
	if(XComHQ.HasItemByName('AssaultRifle_MG'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_MutonRifle_MG');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			}
		}
	}

	// mag swords
	if(XComHQ.HasItemByName('Sword_MG'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_MutonBayonet_MG');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			}
		}
	}

	// mag pistols
	if(XComHQ.HasItemByName('Pistol_MG'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_SectoidPistol_MG');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// mag psi amps
	if(XComHQ.HasItemByName('PsiAmp_MG'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_SectoidPsiAmp_MG');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// mag grenade launchers
	if(XComHQ.HasItemByName('GrenadeLauncher_MG'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_AndromedonLauncher_MG');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// beam cannons
	if(XComHQ.HasItemByName('Cannon_BM'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_AndromedonCannon_BM');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// beam rifles
	if(XComHQ.HasItemByName('AssaultRifle_BM'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_MutonBayonet_BM');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// beam swords
	if(XComHQ.HasItemByName('Sword_BM'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_MutonBayonet_BM');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// beam pistols
	if(XComHQ.HasItemByName('Pistol_BM'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_SectoidPistol_BM');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}

	// beam psi amps
	if(XComHQ.HasItemByName('PsiAmp_BM'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PA_SectoidPsiAmp_BM');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}
	
	// plated armor
	if(XComHQ.HasItemByName('MediumPlatedArmor'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PlatedAndromedonArmor');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
		
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PlatedMutonArmor');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}

		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PlatedSectoidArmor');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			}
		}
	}

	// powered armor
	if(XComHQ.HasItemByName('MediumPoweredArmor'))
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PoweredAndromedonArmor');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
		
		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PoweredMutonArmor');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}

		ItemTemplate = ItemTemplateMgr.FindItemTemplate('PoweredSectoidArmor');
		if(ItemTemplate != none)
		{
			if (!XComHQ.HasItem(ItemTemplate))
			{
				NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				CleanupGameState = false;
			} 
		}
	}
	
	//schematics should be handled already, as the BuildItem UI draws from ItemTemplates, which are automatically loaded
	if(CleanUpGameState)
		History.CleanupPendingGameState(NewGameState);
			
	if(!CleanupGameState)
		History.AddGameStateToHistory(NewGameState);

}

static function bool CanAddItemToInventory_CH(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, optional XComGameState CheckGameState, optional out string DisabledReason)
{
	local XGParamTag		LocTag;
	local X2WeaponTemplate	WeaponTemplate;


	WeaponTemplate = X2WeaponTemplate(ItemTemplate);
	//DisabledReason = "";

	if(CheckGameState != none)
		return CanAddItemToInventory(bCanAddItem, Slot, ItemTemplate, Quantity, UnitState, CheckGameState);

	if(WeaponTemplate == none || WeaponTemplate.DataName != 'SKULLJACK')
		return true; //do nothing

	if(CheckGameState == none && IsAlienUnit(UnitState.GetMyTemplateName())) //only do this check for our grenades on SPARKs
	{

		LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
		LocTag.StrValue0 = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().FindSoldierClassTemplate(UnitState.GetSoldierClassTemplateName()).DisplayName;
		DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strUnavailableToClass));
	
		return false; //return false to give our disabled reason;

	}

	return true; //return true as a fallback or if we got nothing to do with the item
}

static function bool CanAddItemToInventory(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, XComGameState CheckGameState)
{
	local X2WeaponTemplate WeaponTemplate;


	WeaponTemplate = X2WeaponTemplate(ItemTemplate);


	if(WeaponTemplate == none || WeaponTemplate.DataName != 'SKULLJACK'){
		return false; //do nothing
	}

	if(IsAlienUnit(UnitState.GetMyTemplateName())) //is a SKULLJACK and is an alien unit
	{
		bCanAddItem = 0;
		return true; //we set this to true so grenades return false for SPARKs
	}

	return false;
}

static function bool IsAlienUnit(name UnitName)
{
	if(UnitName == 'PA_Andromedon' || UnitName == 'PA_Sectoid' || UnitName == 'PA_Muton') {
		return true;
	}

	return false;
}

static function FinalizeUnitAbilitiesForInit(XComGameState_Unit UnitState, out array<AbilitySetupData> SetupData, optional XComGameState StartState, optional XComGameState_Player PlayerState, optional bool bMultiplayerDisplay)
{
    local int	Index;
	local bool	bLaunchGrenadeAbilityFound;


	if (UnitState.GetSoldierClassTemplateName() == 'AndromedonClass')
	{
		// dont like the two loops, but what can ye do, eh?
		for (Index = 0; Index <= SetupData.Length - 1; Index++)
		{
			if (SetupData[Index].TemplateName == 'LaunchGrenade')
			{
				bLaunchGrenadeAbilityFound = true;
				break;
			}
		}

		if (bLaunchGrenadeAbilityFound)
		{
			for (Index = 0; Index <= SetupData.Length - 1; Index++)
			{
				if (SetupData[Index].TemplateName == 'ThrowGrenade')
				{
					SetupData.Remove(Index, 1);
				}
			}
		}
	}
}

// modify some of the default abilities
static event OnPostTemplatesCreated()
{
	//EditGrenadeThrow();
	EditVolatileMix();
}

static function EditVolatileMix()
{
	local X2AbilityTemplateManager				AbilityManager;
	local X2AbilityTemplate						AbilityTemplate;
	local X2Effect_VolatileMixAcidBlobBonus_PA	PA_MixEffect;

	AbilityManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	AbilityTemplate = AbilityManager.FindAbilityTemplate('VolatileMix');

	PA_MixEffect = new class'X2Effect_VolatileMixAcidBlobBonus_PA';
	PA_MixEffect.BuildPersistentEffect(1, true, false, false);
	//PA_MixEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	PA_MixEffect.BonusDamage = default.PA_AcidBlob_VolatileMixDmgBonus;

	AbilityTemplate.AbilityTargetEffects.AddItem(PA_MixEffect);
}
