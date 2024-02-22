function SwordDash(){
	switch (subSpecial){
		case 0:
			if (specialT == 40){
				subSpecial = 1;
				//CreateAttack(6,15,sSword,30,false,oSwing,3);
				xsp = round(dcos(attackAngle)*8);
				ysp = round(-dsin(attackAngle)*8);
			}
			break;
		
		case 1:
			CollisionCheck();
			if (specialT == 30){
				ds_list_clear(attack.hit);
			}
			else if (specialT == 20){
				attack.attackDmg = 16;
				attack.xknocksp = round(dcos(attack.image_angle)*8);
				attack.yknocksp = -round(dsin(attack.image_angle)*8);
				ds_list_clear(attack.hit);
			}
			else if (specialT == 10){
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