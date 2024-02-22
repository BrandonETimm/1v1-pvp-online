function SetupRangedSpec(){
	switch(specials[2]){
		case 0: //Sword Throw
			SetSpecCD(120);
			specialT = 21;
			break;
		case 1: //Spear Throw
			SetSpecCD(120);
			specialT = 18;
			break;
		case 2: //Bouncing Bullet
			SetSpecCD(150);
			specialT = 21;
			break;
		case 3: //Quick
			SetSpecCD(30);
			specialT = 21;
			break;
		case 4: //Slow
			SetSpecCD(180);
			specialT = 21;
			break;
		case 5: //Stun
			SetSpecCD(90);
			specialT = 21;
			break;
		case 6: //Sticky
			SetSpecCD(180);
			specialT = 21;
			break;
	}
	attackVal = 0;
}