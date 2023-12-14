class UICustomize_Menu_PA extends UICustomize_Menu;


simulated function UpdateData()
{
	local int i;
	local int currentSel;
	local bool bBasicSoldierClass;
	currentSel = List.SelectedIndex;

	super.UpdateData();

	// Hide all existing options since the number of options can change if player switches genders
	HideListItems();

	CustomizeManager.UpdateBodyPartFilterForNewUnit(CustomizeManager.Unit);

	// INFO
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataDescription(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_FirstName)$ m_strEditInfo, OnCustomizeInfo);

	// WEAPON
	//-----------------------------------------------------------------------------------------
	GetListItem(i++).UpdateDataDescription(CustomizeManager.CheckForAttentionIcon(eUICustomizeCat_NickName)$ m_strEditWeapon, OnCustomizeWeapon);

	//  CHARACTER POOL OPTIONS
	//-----------------------------------------------------------------------------------------
	//If in the armory, allow exporting character to the pool
	if (bInArmory) 
	{
		GetListItem(i++).UpdateDataDescription(m_strExportCharacter, OnExportSoldier);
	}
	else //Otherwise, allow customizing their potential appearances
	{
		if(!bInMP)
		{
			if (Unit.IsSoldier())
			{
				GetListItem(i++).UpdateDataValue(m_strCustomizeClass,
					CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_Class, eUIState_Normal, FontSize), CustomizeClass, true);

				bBasicSoldierClass = (Unit.GetSoldierClassTemplate().RequiredCharacterClass == '');
				GetListItem(i++, !bBasicSoldierClass, m_strNoClassVariants).UpdateDataValue(m_strViewClass,
					CustomizeManager.FormatCategoryDisplay(eUICustomizeCat_ViewClass, bBasicSoldierClass ? eUIState_Normal : eUIState_Disabled, FontSize), CustomizeViewClass, true);
			}
			
			GetListItem(i++).UpdateDataCheckbox(m_strAllowTypeSoldier, m_strAllowed, CustomizeManager.UpdatedUnitState.bAllowedTypeSoldier, OnCheckbox_Type_Soldier);

			GetListItem(i).UpdateDataDescription(m_strTimeAdded @ CustomizeManager.UpdatedUnitState.PoolTimestamp, None);
			GetListItem(i++).SetDisabled(true);
		}
	}
	
	List.OnItemClicked = OnListOptionClicked;

	Navigator.SetSelected(List);
	
	if (currentSel > -1 && currentSel < List.ItemCount)
	{
		//Don't use GetItem(..), because it overwrites enable.disable option indiscriminately. 
		List.Navigator.SetSelected(List.GetItem(currentSel));
	}
	else
	{
		//Don't use GetItem(..), because it overwrites enable.disable option indiscriminately. 
		List.Navigator.SelectFirstAvailable();
	}
	//-----------------------------------------------------------------------------------------
}