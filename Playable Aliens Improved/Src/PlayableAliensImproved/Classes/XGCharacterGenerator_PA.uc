class XGCharacterGenerator_PA extends XGCharacterGenerator
	dependson(X2StrategyGameRulesetDataStructures);

// Alien names
// Muton: Krogan names via fantasynamegenerators.com

//RM contributions
//Muton: Klingons

//Mutons, Sectoids, Andromedons
var localized array<string> m_arrMutMFirstNames;
var localized array<string> m_arrMutFFirstNames;
var localized array<string> m_arrMutLastNames;


function name PickAlienCountry(X2CharacterTemplate CharacterTemplate)
{
	if (CharacterTemplate.DataName == 'PA_Muton')
		return 'Country_Muton';

	if (CharacterTemplate.DataName == 'PA_Sectoid')
		return 'Country_Sectoid';
	
	if (CharacterTemplate.DataName == 'PA_Andromedon')
		return 'Country_Andromedon';

	return 'Country_Alien'; //fallback
}

function GenerateAlienName( int iGender, X2CharacterTemplate CharacterTemplate, out string strFirst, out string strLast, optional int iRace = -1 )
{
	//local X2CountryTemplate CountryTemplate;
	//local array<CountryNames> AllNames, GeneralNames, RaceSpecificNames;

	strFirst = "";
	strLast = "";

	// sectoid names
	if(CharacterTemplate.DataName == 'PA_Sectoid')
	{
		strFirst = m_arrMutMFirstNames[`SYNC_RAND(m_arrMutMFirstNames.Length)];
		strLast = m_arrMutLastNames[`SYNC_RAND(m_arrMutLastNames.Length)];
	}
	
	// muton & berserker names
	if(CharacterTemplate.DataName == 'PA_Muton' || CharacterTemplate.DataName == 'PA_Berserker')
	{
		if(iGender == eGender_Female)
		{
			strFirst = m_arrMutFFirstNames[`SYNC_RAND(m_arrMutFFirstNames.Length)];
		}
		else
		{
			strFirst = m_arrMutMFirstNames[`SYNC_RAND(m_arrMutMFirstNames.Length)];
		}

		strLast = m_arrMutLastNames[`SYNC_RAND(m_arrMutLastNames.Length)];
	}

	// andromedon names
	if(CharacterTemplate.DataName == 'PA_Andromedon')
	{
		strFirst = m_arrMutMFirstNames[`SYNC_RAND(m_arrMutMFirstNames.Length)];
		strLast = m_arrMutLastNames[`SYNC_RAND(m_arrMutLastNames.Length)];
	}

	// fallback
	if(strFirst == "" && strLast == "")
	{
		if(iGender == eGender_Female)
		{
			strFirst = m_arrMutFFirstNames[`SYNC_RAND(m_arrMutFFirstNames.Length)];
		}
		else
		{
			strFirst = m_arrMutMFirstNames[`SYNC_RAND(m_arrMutMFirstNames.Length)];
		}

		strLast = m_arrMutLastNames[`SYNC_RAND(m_arrMutLastNames.Length)];
	}
}

function TSoldier CreateTSoldier( optional name CharacterTemplateName, optional EGender eForceGender, optional name nmCountry = '', optional int iRace = -1, optional name ArmorName )
{
	local X2BodyPartTemplateManager PartTemplateManager;
	local X2SimpleBodyPartFilter BodyPartFilter;
	local X2CharacterTemplate CharacterTemplate;
	local TAppearance DefaultAppearance;

	PartTemplateManager = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager();

	BodyPartFilter = `XCOMGAME.SharedBodyPartFilter;

	kSoldier.kAppearance = DefaultAppearance;

	MatchArmorTemplateForTorso = 'NoArmor'; //Default armor match value
	MatchCharacterTemplateForTorso = CharacterTemplateName;

	CharacterTemplate = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager().FindCharacterTemplate(CharacterTemplateName);
	if(CharacterTemplate == None)
		CharacterTemplate = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager().FindCharacterTemplate('Soldier');

	// pick country
	nmCountry = PickAlienCountry(CharacterTemplate);

	kSoldier.nmCountry = nmCountry; // set country
	PickGender(CharacterTemplate, kSoldier.kAppearance.iGender); // pick gender
	kSoldier.kAppearance.nmFlag = kSoldier.nmCountry; // needs to be copied here for pawns -- jboswell
	kSoldier.kAppearance.iAttitude = 2; // Should correspond with Personality_Normal

	// randomize gun camos
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmWeaponPattern, "Patterns", BodyPartFilter.FilterAny);

	GenerateAlienName(kSoldier.kAppearance.iGender, CharacterTemplate, kSoldier.strFirstName, kSoldier.strLastName);

	return kSoldier;
}

function PickGender(X2CharacterTemplate CharacterTemplate, int gender)
{
	// sectoids have no confirmed gender, default to male
	if (CharacterTemplate.DataName == 'PA_Sectoid')
		gender = eGender_Male;

	// mutons were confirmed to be both genders
	if (CharacterTemplate.DataName == 'PA_Muton')
		gender = (Rand(2) == 0) ? eGender_Female : eGender_Male;

	// andromedons have no confirmed genders, default to male
	if (CharacterTemplate.DataName == 'PA_Andromedon')
		gender = eGender_Male;
}