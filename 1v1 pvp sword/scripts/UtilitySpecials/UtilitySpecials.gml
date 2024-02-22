function UtilitySpecials(){
	switch (specials[0]){
		case 0: Grapple(); break;
		case 2: SpearDash(); break;
		case 3:
			if (specialT == 3) CreateBomb(0,12,sBomb,360,false,false,true,30,16);
			break;
		case 5: BlinkSpec(); break;
	}
}