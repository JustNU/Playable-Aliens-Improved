class XComGameState_Unit_PA extends XComGameState_Unit;

static function RemoveAllLoot(XComGameState_Unit Unit)
{
	Unit.PendingLoot.LootToBeCreated.Length = 0;
}