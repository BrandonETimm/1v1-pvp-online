function PSStunned(local){
	if (!grabbed){
		Movement(local);
		CollisionCheckPlayer();
	}
	if (stunDur > 0) stunDur--;
	else state = PLAYERSTATE.FREE;
}