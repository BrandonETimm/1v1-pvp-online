function PSSpecial(){
	switch(currSpecial){
		case 2:
		case 3:
		case 4:
		case 5: AttackSpecials(); break;
		case 6: UtilitySpecials(); break;
		case 7: RangedSpecials(); break;
	}
	if (specialT > 0) specialT--;
	else{
		ds_list_clear(hit);
		state = PLAYERSTATE.FREE;
		counterHit = 0;
	}
}