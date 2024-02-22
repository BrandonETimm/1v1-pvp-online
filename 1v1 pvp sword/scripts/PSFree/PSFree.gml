function PSFree(local){
	Movement(local);
	if (abs(xknockbacksp) < 2 && abs(yknockbacksp) < 2){
		xknockbacksp = 0;
		yknockbacksp = 0;
		if (attackVal > 1 && attackVal < 8){
			attackAngle = currAttAngle;
			currSpecial = attackVal;
			state = PLAYERSTATE.SPECIAL;
		}
		switch(attackVal){
			case 1:
				state = PLAYERSTATE.BASICATTACK;
				attackAngle = currAttAngle;
				SetupAttackPrim();
				break;
			case 2:
			case 3:
			case 4:
			case 5:
				SetupAttackSpec();
				break;
			case 6:
				SetupUtilSpec();
				break;
			case 7:
				SetupRangedSpec();
				break;
		}
	}
	if (attackDirT > 0) attackDirT--;
	CollisionCheckPlayer();
}