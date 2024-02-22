function RSpecialAnims(){
	var angleMod = GetAngleMod(attackAngle);
	switch(specials[2]){
		case 0: //Sword Throw
			if (sprite_index != sRangeSpec){
				image_index = 7*angleMod;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
		case 1: //Spear Throw
			if (sprite_index != sRangeSpec){
				image_index = 6*angleMod + 56;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
		case 2: //Bouncing Bullet
			if (sprite_index != sRangeSpec){
				image_index = 7*angleMod + 216;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
		case 3: //Quick
			if (sprite_index != sRangeSpec){
				image_index = 7*angleMod + 328;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
		case 4: //Slow
			if (sprite_index != sRangeSpec){
				image_index = 7*angleMod + 161;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
		case 5: //Stun
			if (sprite_index != sRangeSpec){
				image_index = 7*angleMod + 272;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
		case 6: //Sticky
			if (sprite_index != sRangeSpec){
				image_index = 7*angleMod + 104;
				sprite_index = sRangeSpec;
				frameTMax = 3;
			}
			break;
	}
}