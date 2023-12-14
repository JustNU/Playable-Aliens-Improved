class X2Effect_VolatileMixAcidBlobBonus_PA extends X2Effect_Persistent;

var int BonusDamage;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local X2Effect_ApplyWeaponDamage DamageEffect;

	if (AbilityState.m_TemplateName == 'PA_AcidBlob')
	{
		//	no game state means it's for damage preview
		if (NewGameState == none)
		{				
			return BonusDamage;
		}

		//	only add the bonus damage when the damage effect is applying the weapon's base damage
		DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
		if (DamageEffect != none && !DamageEffect.bIgnoreBaseDamage)
		{
			return BonusDamage;
		}			
	}
	
	return 0;
}

DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	bDisplayInSpecialDamageMessageUI = true
}
