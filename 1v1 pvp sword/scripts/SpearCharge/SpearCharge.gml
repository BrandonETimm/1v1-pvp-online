function SpearCharge(){
	switch (subSpecial){
		case 0:
			if (specialT == 14){
				subSpecial = 1;
				//CreateAttack(14,8,sChargeSpear,specialT,false,oSpearJ,8);
				xsp = round(dcos(attackAngle)*20);
				ysp = round(-dsin(attackAngle)*20);
			}
			break;
		
		case 1:
			var hitW = CollisionCheck();
			if (hitW){
				subSpecial = 2;
				specialT = 8;
				xsp = -floor(xsp*0.8);
				ysp = -floor(ysp*0.8);
			}
			else if (specialT == 1){
				subSpecial = 3;
				specialT = 6;
			}
			break;
			
		case 2:
			CollisionCheck();	
			break;
		case 3:
			CollisionCheck();
			xsp = floor(xsp*0.9);
			ysp = floor(ysp*0.9);
			break;
	}
}