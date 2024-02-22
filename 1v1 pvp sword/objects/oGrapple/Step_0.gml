if (global.paused != -1){
	exit;	
}
if (!wallHit && !pullingEn){
	var hit = CollisionCheck();
	var hitNow = ds_list_create()
	var hitPl = instance_place_list(x,y,oPlayer,hitNow,false);
	if (hit == 1){
		player.subSpecial = 1;
		player.specialT = 15;
		life = 15;
		player.xsp = xsp;
		player.ysp = ysp;
		xsp = 0;
		ysp = 0;
		wallHit = true;
	}
	if (hitPl > 0){
		for (var i = 0 ; i < hitPl ; i++){
			var hitID = hitNow[| i];
			if (hitID != player){
				pullingEn = true;
				enID = hitID.id;
				player.subSpecial = 4;
				player.specialT = 15;
				life = 15;
				player.xsp = xsp;
				player.ysp = ysp;
				xsp = -xsp;
				ysp = -ysp;
				player.utilSpCD = 120;
			}
		}
	}
	ds_list_destroy(hitNow);
}
else if (pullingEn){
	if (place_meeting(x,y,player)){
		player.specialT = 2;
		enID.xknocksp = xsp;
		enID.yknocksp = ysp;
		instance_destroy();
	}
	var hit = CollisionCheck();
	enID.xsp = xsp;
	enID.ysp = ysp;
	enID.grabbed = true;
	with (enID) var hit = max(hit, CollisionCheck());
	enID.state = PLAYERSTATE.STUNNED;
	enID.stunDur = 8;
	if (hit){
		enID.xknocksp = xsp;
		enID.yknocksp = ysp;
		instance_destroy();
	}
	if (place_meeting(x,y,player)){
		player.specialT = 2;
		enID.xknocksp = xsp;
		enID.yknocksp = ysp;
		instance_destroy();
	}
}

if (player.state != PLAYERSTATE.DASH && player.state != PLAYERSTATE.STUNNED && player.state != PLAYERSTATE.DEAD){
	if (life > 0) life--;
	else instance_destroy();
}
else instance_destroy();