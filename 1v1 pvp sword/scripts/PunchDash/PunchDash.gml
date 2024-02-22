function PunchDash(){
	switch (subSpecial){
		case 0:
			if (specialT == 16){
				subSpecial = 1;
				xsp = round(dcos(attackAngle)*24);
				ysp = round(-dsin(attackAngle)*24);
			}
			break;
		
		case 1:
			AttackHitbox(20,16,8,false);
			CollisionCheck();
			if (specialT == 4){
				subSpecial = 2;
			}
			break;
			
		case 2:
			AttackHitbox(20,16,8,false);
			CollisionCheck();
			xsp = floor(xsp*0.9);
			ysp = floor(ysp*0.9);
			break;
	}
}