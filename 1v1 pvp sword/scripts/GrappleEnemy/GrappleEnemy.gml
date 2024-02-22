function GrappleEnemy(){
	if (bAttackT > 0) bAttackT--;
	if (attackVal == 1) SetupAttackPrim();
	if (specialT <= 2){
		xsp = round(xsp*0.5);
		ysp = round(ysp*0.5);
	}
	var hit = CollisionCheck();
	if (hit){
		specialT = 0;
		xsp = 0;
		ysp = 0;
	}
}