function PrimaryAnims(){
	var angleMod = GetAngleMod(attackAngle);
	frameTMax = 3;
	switch(specials[1]){
		case 0:
			if (sprite_index != sSwordPrim){
				image_index = 7*angleMod + 56*!bAttNum;
				sprite_index = sSwordPrim;
			}
			break;
		case 1:
			if (sprite_index != sSpearPrim){
				image_index = (4+2*(bAttNum==0))*angleMod + 32*(bAttNum==0);
				sprite_index = sSpearPrim;
			}
			break;
		case 2:
			if (sprite_index != sPunchPrim){
				image_index = (5+2*!bAttNum)*angleMod + 40*!bAttNum;
				sprite_index = sPunchPrim;
			}
			break;
		case 3:
			if (sprite_index != sExplPrim){
				image_index = 12*angleMod;
				sprite_index = sExplPrim;
			}
			break;
	}
}