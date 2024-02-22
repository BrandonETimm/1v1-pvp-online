function PlayerStep(local){
	if (local){
		if (key_swing) attackVal = 1;
		else if (key_spec1 && attSp1CD == 0) attackVal = 2;
		else if (key_spec2 && attSp2CD == 0) attackVal = 3;
		else if (key_spec3 && attSp3CD == 0) attackVal = 4;
		else if (key_spec4 && attSp4CD == 0) attackVal = 5;
		else if (key_util && utilSpCD == 0) attackVal = 6;
		else if (key_range && rangSpCD == 0) attackVal = 7;
		else if (key_dash && dashCD == 0) attackVal = 8;
		currAttAngle = GetAttackAngle();
	}
	if (attackVal == 8 && dashCD == 0){
		attackAngle = currAttAngle;
		dashCD = maxDashCD;
		countering = false;
		if (dashAim){
			xsp = round(dcos(attackAngle)*dashSp);
			ysp = round(-dsin(attackAngle)*dashSp);
		}
		else{
			xsp = round(dcos(moveAngle)*dashSp);
			ysp = round(-dsin(moveAngle)*dashSp);	
		}
		dashT = maxDashT;
		subSpecial = 0;
		currSpecial = -1;
		attackVal = 0;
		state = PLAYERSTATE.DASH;
		xknockbacksp = 0;
		yknockbacksp = 0;
	}
	switch(state){
		case PLAYERSTATE.FREE: PSFree(local); break;
		case PLAYERSTATE.BASICATTACK: PSBasicAttack(local); break;
		case PLAYERSTATE.SPECIAL: PSSpecial(); break;
		case PLAYERSTATE.STUNNED: PSStunned(local); break;
		case PLAYERSTATE.DASH: PSDash(); break;
	}
	if (state != PLAYERSTATE.DASH && dashCD > 0) dashCD--;
	if (attackDirT > 0) attackDirT--;
	if (attSp1CD > 0) attSp1CD--;
	if (attSp2CD > 0) attSp2CD--;
	if (attSp3CD > 0) attSp3CD--;
	if (attSp4CD > 0) attSp4CD--;
	if (utilSpCD > 0) utilSpCD--;
	if (rangSpCD > 0) rangSpCD--;
	if (acceleratedT > 0) acceleratedT--;
	
	if (burningT > 0){
		if (burningT % 20 == 0) hp -= burningDmg;
		burningT--;
	}
	if (burnBuffT > 0) burnBuffT--;
}