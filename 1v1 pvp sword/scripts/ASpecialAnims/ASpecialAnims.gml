function ASpecialAnims(){
	var angleMod = GetAngleMod(attackAngle);
	
	switch(specials[currSpecial+1]){
		case 0: //Counter
			if (sprite_index != sSwordSpec){
				image_index = 32 + angleMod*3;
				sprite_index = sSwordSpec;
				frameTMax = 3;
			}
			switch(subSpecial){
				case 0: 
					if (specialT == 23){
						frameTMax = 0;
					}
					else if (specialT == 5){
						frameTMax = -1;
						frameT = 0;
					}
					else if (specialT < 5){
						frameT++;
						if (frameT == 3){
							image_index--;
							frameT = 0;
						}
					}
					break;
				case 1: 
					if (image_index < 72){
						image_index = 72 + angleMod*5; 
						frameT = 0;
						frameTMax = 3;
					}
					break;
				case 2: 
					if (image_index < 56){
						image_index = 56 + angleMod*2; 
						frameT = 0;
						frameTMax = 3;
					}
					else if (image_index % 2 == 1){
						frameTMax = 0;
					}
					break;
			}
			break;
		
		case 1: //Circle
			if (sprite_index != sSwordSpec){
				image_index = angleMod;
				sprite_index = sSwordSpec;
				frameTMax = 0;
			}
			else if (specialT == 35){
				frameTMax = -1;
				frameT = 1;
				image_index = angleMod + 8;
			}
			else if (specialT > 11){
				frameT++;
				if (frameT == 3){
					if (image_index != 15) image_index++;
					else image_index = 8;
					frameT = 0;
				}
			}
			else if (specialT == 11){
				image_index = angleMod*2 + 16;
				frameTMax = 3;
				frameT = 0;
			}
			else if (specialT == 8) frameTMax = 0;
			break;
			
		case 2: //Sweep
			
			break;
			
		case 3: //Triple
			SetSpecCD(120);
			specialT = 55;
			break;
		
		case 4:
			SetSpecCD(45);
			specialT = 12;
			CreateAttack(14,8,sSpearBig,specialT,false,oSwing,8); //Long Thrust
			break;
			
		case 5:
			SetSpecCD(25);
			specialT = 6;
			CreateAttack(6,8,sSpearSmall,specialT,false,oSwing,4); //Short Thrust
			break;
		
		case 6: //Spear Charge
			SetSpecCD(75);
			specialT = 20;
			break;
			
		case 7: //Windup Punch
			if (sprite_index != sPunchSpec){
				image_index = angleMod;
				sprite_index = sSwordSpec;
				frameTMax = 0;
			}
			else if (specialT == 35){
				frameTMax = -1;
				frameT = 1;
				image_index = angleMod + 8;
			}
			else if (specialT > 11){
				frameT++;
				if (frameT == 3){
					if (image_index != 15) image_index++;
					else image_index = 8;
					frameT = 0;
				}
			}
			break;
			
		case 8:
			SetSpecCD(90);
			specialT = 16;
			CreateAttack(4,30,sPunch,specialT,false,oSwing,2); //Stun Punch
			break;
			
		case 9:
			SetSpecCD(60);
			specialT = 16;
			CreateAttack(4,16,sPunch,specialT,false,oSwing,18); //Launch Punch
			break;
			
		case 10:
			SetSpecCD(60);
			specialT = 16;
			CreateAttack(8,20,sPunch,specialT,false,oSwing,4); //Ground Punch
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
}