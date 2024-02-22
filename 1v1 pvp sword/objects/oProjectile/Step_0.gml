if (global.paused != -1){
	exit;
}

if (sprite_index != sThrowSpear){
	if (frameT < 3) frameT++;
	else{
		frameT = 0;
		image_index++;
		if (sprite_index == sBoomSword){
			if (image_index == 4) image_index = 0;
		}
		else if (sprite_index == sBullet){
			if (image_index % 8 == 0) image_index -= 8;	
		}
	}
}

if (pHit == -1){
	var wallHit = false;
	if (time != -1) wallHit = CollisionCheck();
	if (wallHit){
		if (sticky){
			xsp = 0;
			ysp = 0;
		}
		else if (canBounce){
			if (place_meeting(x+sign(xsp),y,oColl)){
				xsp = -xsp;
				dmg += 5;
				xknocksp = -xknocksp;
			}
			if (place_meeting(x,y+sign(ysp),oColl)){
				ysp = -ysp;
				dmg += 5;
				yknocksp = -yknocksp;
			}
		}
		else if (boomerang){
			if (time != -1) time = 0;
		}
		else instance_destroy();
	}
}
else{
	x = pHit.x;
	y = pHit.y;
}

if (time > 0) time--;
else if (!boomerang) instance_destroy();
else if (time == 0){
	time = -1;
	ds_list_clear(hit);
}
else{
	var dir = point_direction(x,y,player.x,player.y)
	x += dcos(dir)*16;
	y += -dsin(dir)*16;
	xknocksp = round(dcos(dir)*centerknocksp);
	yknocksp = -round(dsin(dir)*centerknocksp);	
	if (place_meeting(x,y,player)) instance_destroy();
}
if (selfHitT > 0) selfHitT--;