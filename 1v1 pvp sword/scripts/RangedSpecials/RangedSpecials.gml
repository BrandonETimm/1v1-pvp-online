function RangedSpecials(){
	switch (specials[2]){
		case 0: 
			if (specialT == 3) CreateProj(10,6,sBoomSword,30,false,false,true,16,8,0); //Sword
			break;
			
		case 1:
			if (specialT == 3) CreateProj(15,8,sThrowSpear,60,false,false,false,14,6,0); //Spear
			break;
			
		case 2: 
			if (specialT == 3) CreateProj(10,6,sBullet,180,false,true,false,12,6,8); //Bounce
			break;
			
		case 3:
			if (specialT == 3) CreateProj(4,0,sBullet,60,false,false,false,24,2,24); //Quick
			break;
			
		case 4: 
			if (specialT == 3) CreateProj(10,6,sBullet,180,false,false,false,4,4,16); //Slow
			break;
			
		case 5:
			if (specialT == 3) CreateProj(4,45,sBullet,60,false,false,false,10,0,0); //Stun
			break;
			
		case 6:
			if (specialT == 3) CreateProj(0,0,sBullet,240,true,false,false,12,8,32); //Sticky
			break;
	}
}