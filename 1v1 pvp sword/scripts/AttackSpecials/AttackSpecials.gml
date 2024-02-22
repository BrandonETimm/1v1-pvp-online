function AttackSpecials(){
	switch (specials[currSpecial+1]){
		case 0: 
			Counter();
			break;
			
		case 1:
			AttackHitbox(10,12,8,false);
			break;
		case 2:
			AttackHitbox(10,12,8,false);
			break;
		case 3:
			SwordDash();
			break;
		
		case 6:
			SpearCharge();
			break;
			
		case 7:
			PunchDash();
			break;
			
		case 11:
			if (specialT == 3) CreateBomb(16,12,sBomb,180,false,false,false,30,12); //Time
			break;
			
		case 12: 
			if (specialT == 3) CreateBomb(24,20,sBomb,300,false,true,false,0,8); //Self
			break;
			
		case 13:
			if (specialT == 3) CreateBomb(16,16,sBomb,1200,true,false,false,0,16); //Mine
			break;
		
		case 14:
			if (specialT == 2){
				var xdisplace = x+round(dcos(attackAngle)*128);
				var ydisplace = y-round(dsin(attackAngle)*128);	
				xdisplace = min(912,xdisplace);
				xdisplace = max(48,xdisplace);
				ydisplace = min(492,ydisplace);
				ydisplace = max(48,ydisplace);
				instance_create_layer(xdisplace,ydisplace,"Attacks",oFirewall);
			}
			break;
	}
}