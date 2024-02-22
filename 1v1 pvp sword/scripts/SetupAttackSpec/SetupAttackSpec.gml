function SetupAttackSpec(){
	switch(specials[attackVal+1]){
		case 0: //Counter
			SetSpecCD(90);
			specialT = 30;
			break;
		
		case 1: //Sword Summon
			SetSpecCD(90);
			specialT = 44;
			break;
			
		case 2: //Aerial Strike
			SetSpecCD(60);
			specialT = 30;
			CreateAttack(12,16,sSword,specialT,false,oSwing,8);
			break;
			
		case 3: //Spin Jab
			SetSpecCD(120);
			specialT = 55;
			break;
		
		case 4: //Extend
			SetSpecCD(45);
			specialT = 34;
			CreateAttack(14,8,sSpearBig,specialT,false,oSwing,8);
			break;
			
		case 5: //Spear Charge
			SetSpecCD(25);
			specialT = 6;
			CreateAttack(6,8,sSpearSmall,specialT,false,oSwing,4); 
			break;
		
		case 6: //Double Stab
			SetSpecCD(75);
			specialT = 20;
			break;
			
		case 7: //Windup Punch
			SetSpecCD(75);
			specialT = 26;
			break;
			
		case 8: //Stun Punch
			SetSpecCD(90);
			specialT = 16;
			CreateAttack(4,30,sPunch,specialT,false,oSwing,2);
			break;
			
		case 9: //Backflip Kick
			SetSpecCD(60);
			specialT = 16;
			CreateAttack(4,16,sPunch,specialT,false,oSwing,18);
			break;
			
		case 10: //Ground Punch
			SetSpecCD(60);
			specialT = 16;
			CreateAttack(8,20,sPunch,specialT,false,oSwing,4); 
			break;
			
		case 11: //Time bomb
			SetSpecCD(240);
			specialT = 6;
			break;
			
		case 12: //Self
			SetSpecCD(360);
			specialT = 6;
			break;
			
		case 13: //Mine
			SetSpecCD(420);
			specialT = 6;
			break;
			
		case 14: //Firewall
			SetSpecCD(180);
			specialT = 8;
			break;
	}
	subSpecial = 0;
	attackVal = 0;
}