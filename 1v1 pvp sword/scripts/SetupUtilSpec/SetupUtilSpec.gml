function SetupUtilSpec(){
	switch(specials[0]){
		case 0: //Grapple
			specialT = 16;
			subSpecial = 0;
			grapple = instance_create_layer(x,y,"Attacks",oGrapple);
			grapple.image_angle = attackAngle;
			grapple.xsp = round(dcos(attackAngle)*32);
			grapple.ysp = round(-dsin(attackAngle)*32);
			grapple.player = id;
			break;
		
		case 1: //Stance
			specialT = 8;
			if (defStance == 0) defStance = 1;
			else defStance = 0;
			SetSpecCD(60);
			break;
		
		case 2: //Spear Dash
			specialT = 16;
			subSpecial = 0;
			SetSpecCD(150);
			break;
			
		case 3: //Boost Bomb
			SetSpecCD(300);
			specialT = 6;
			break;
		
		case 4: //Ignite
			SetSpecCD(720);
			specialT = 6;
			burnBuffT = 306;
			break;
		
		case 5: //Blink
			SetSpecCD(420);
			specialT = 16;
			break;
		
		case 6: //Accelerate
			SetSpecCD(420);
			specialT = 8;
			acceleratedT = 246;
			break;
	}
	attackVal = 0;
}