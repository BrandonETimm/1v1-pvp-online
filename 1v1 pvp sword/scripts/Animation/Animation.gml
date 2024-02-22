function Animation(){
	var angleMod = GetAngleMod(currAttAngle);
	
	if (state = PLAYERSTATE.FREE){
		if ((xsp != 0 || ysp != 0) && state = PLAYERSTATE.FREE){
			if (sprite_index != sRun){
				image_index = 0;
				sprite_index = sRun;
			}
			frameTMax = 3;
			image_index = image_index % 8 + 8*angleMod;
			if (image_index % 8 == 0 && image_index != angleMod*8) image_index -= 8;
		}
		else{
			sprite_index = sPlayer;
			image_index = angleMod;
			frameTMax = 0;
		}
	}
	else if (state == PLAYERSTATE.BASICATTACK){
		PrimaryAnims();	
	}
	else if (state == PLAYERSTATE.SPECIAL){
		switch(currSpecial){
			case 2:
			case 3:
			case 4:
			case 5: ASpecialAnims(); break;
			case 6: USpecialAnims(); break;
			case 7: RSpecialAnims(); break;
		}	
	}
	if (frameTMax > 0 && frameT < frameTMax) frameT++;
	else{
		if (frameTMax > 0) image_index++;
		if (frameTMax != -1) frameT = 0;
	}
	
}