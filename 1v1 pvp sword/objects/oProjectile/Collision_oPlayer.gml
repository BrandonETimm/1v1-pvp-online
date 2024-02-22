if (global.paused != -1){
	exit;
}
if (pHit == -1){
	if (!sticky){
		var playHit = Attack(dmg,stunDur,0,0,xknocksp,yknocksp,0);
		if (playHit){
			if (other.countering){
				xsp = -xsp;
				ysp = -ysp;
				xknocksp = -xknocksp;
				yknocksp = -yknocksp;
				player = other.id;
				boomerang = false;
				time = max(time, 15);
				other.counterHit = 2;
				ds_list_clear(hit);
			}
			else if (!boomerang) instance_destroy();
		}
	}
	else{
		if (other.countering){
			xsp = -xsp;
			ysp = -ysp;
			xknocksp = -xknocksp;
			yknocksp = -yknocksp;
			player = other.id;
			time = max(time, 15);
			selfHitT = 8;
			other.counterHit = 2;
			ds_list_clear(hit);
		}
		if (selfHitT == 0 || other.id != player) pHit = other.id;
	}
}