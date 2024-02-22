function UnGrapple(){
	if (attackVal == 6){
		specialT = 12;
		xsp = round(dcos(attackAngle)*20);
		ysp = round(-dsin(attackAngle)*20);
		subSpecial = 3;
		attackVal = 0;
		utilSpCD = 120;
	}
}