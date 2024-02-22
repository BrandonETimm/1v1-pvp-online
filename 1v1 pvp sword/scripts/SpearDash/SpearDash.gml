function SpearDash(){
	switch (subSpecial){
		case 0:
			if (specialT == 12){
				subSpecial = 1;
				//CreateAttack(4,6,sSword,45,false,oSwing,3);
				xsp = round(dcos(attackAngle)*24);
				ysp = round(-dsin(attackAngle)*24);
			}
			break;
		
		case 1:
			CollisionCheck();
			if (specialT == 4){
				subSpecial = 2;
			}
			break;
			
		case 2:
			CollisionCheck();
			xsp = floor(xsp*0.9);
			ysp = floor(ysp*0.9);
			break;
	}
}