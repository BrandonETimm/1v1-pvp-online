function CreateProj(dmg,stunDur,img,time,sticky,canBounce,boomerang,sp,knocksp,frame){
	proj = instance_create_layer(x,y,"Attacks",oProjectile);
	var dmgMod = GetDmgMod();
	var angleMod = GetAngleMod(attackAngle);
	switch(img){
		case sBoomSword:
			switch(angleMod){
				case 0:
					proj.x = x-15;
					proj.y = y+32;
					break;
				case 1:
					proj.x = x+2;
					proj.y = y+35;
					break;
				case 2:
					proj.x = x+18;
					proj.y = y+23;
					break;
				case 3:
					proj.x = x+26;
					proj.y = y+7;
					break;
				case 4:
					proj.x = x+15;
					proj.y = y+5;
					break;
				case 5:
					proj.x = x-4;
					proj.y = y+9;
					break;
				case 6:
					proj.x = x-18;
					proj.y = y+23;
					break;
				case 7:
					proj.x = x-20;
					proj.y = y+24;
					break;
			}
			break;
		
		case sThrowSpear:
			switch(angleMod){
				case 0:
					proj.x = x-10;
					proj.y = y+12;
					break;
				case 1:
					proj.x = x+10;
					proj.y = y+4;
					break;
				case 2:
					proj.x = x+20;
					proj.y = y+3;
					break;
				case 3:
					proj.x = x+17;
					proj.y = y-3;
					break;
				case 4:
					proj.x = x+9;
					proj.y = y+4;
					break;
				case 5:
					proj.x = x-11;
					proj.y = y-7;
					break;
				case 6:
					proj.x = x-20;
					proj.y = y+3;
					break;
				case 7:
					proj.x = x-20;
					proj.y = y+2;
					break;
			}
			break;
		
		case sBullet:
			switch(angleMod){
				case 0:
					proj.x = x-3;
					proj.y = y+18;
					break;
				case 1:
					proj.x = x+2;
					proj.y = y+20;
					break;
				case 2:
					proj.x = x+10;
					proj.y = y+15;
					break;
				case 3:
					proj.x = x+15;
					proj.y = y+6;
					break;
				case 4:
					proj.x = x+4;
					proj.y = y+18;
					break;
				case 5:
					proj.x = x-10;
					proj.y = y+14;
					break;
				case 6:
					proj.x = x-13;
					proj.y = y+15;
					break;
				case 7:
					proj.x = x-14;
					proj.y = y+19;
					break;
			}
			break;
	}
	proj.dmg = ceil(dmg*dmgMod);
	proj.stunDur = stunDur;
	proj.image_angle = attackAngle;
	proj.sprite_index = img;
	proj.image_index = frame;
	proj.player = id;
	proj.time = time;
	proj.sticky = sticky;
	proj.canBounce = canBounce;
	proj.boomerang = boomerang;
	proj.xsp = round(dcos(attackAngle)*sp);
	proj.ysp = -round(dsin(attackAngle)*sp);
	proj.xknocksp = round(dcos(attackAngle)*knocksp);
	proj.yknocksp = -round(dsin(attackAngle)*knocksp);
	proj.centerknocksp = knocksp;
}