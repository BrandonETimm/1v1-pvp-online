function PSBasicAttack(local){
	Movement(local);
	if (bAttackT > 0) bAttackT--;
	else{
		ds_list_clear(hit);
		state = PLAYERSTATE.FREE;
	}
	AttackPrim();
	CollisionCheckPlayer();
}