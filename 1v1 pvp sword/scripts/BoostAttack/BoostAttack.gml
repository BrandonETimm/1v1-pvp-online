function BoostAttack(stunAm,centerknock){
	var hitNow = ds_list_create();
	var hits = instance_place_list(x,y,oPlayer,hitNow,false);
	var dmgMod = 1;
	connected = false;
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			var hitID = hitNow[| i];
			if (ds_list_find_index(hit,hitID) == -1 && hitID.state != PLAYERSTATE.DEAD && hitID != player){
				ds_list_add(hit,hitID);
				connected = true;
				if (!hitID.countering)
				{
					dmgMod = 1;
					if (hitID.defStance == 1) dmgMod = 0.75;
					else if (hitID.defStance == 0) dmgMod = 1.2;
					hitID.stunDur = ceil(stunAm*dmgMod);
					if (stunDur > 0) hitID.state = PLAYERSTATE.STUNNED;
					hitID.dashT = 0;
					hitID.specialT = 0;
					hitID.subSpecial = 0;
					hitID.bAttackT = 0;
					if (centerknock != 0 && hitID.x != x && hitID.y != y){
						var knockbackAngle = point_direction(x,y,hitID.x,hitID.y);
						hitID.xknockbacksp += round(dcos(knockbackAngle)*centerknock);
						hitID.yknockbacksp += -round(dsin(knockbackAngle)*centerknock);	
					}
				}
				else hitID.counterHit = 1;
			}
			else if (hitID == player){
				ds_list_add(hit, hitID);
				if (centerknock != 0 && hitID.x != x && hitID.y != y){
					var knockbackAngle = point_direction(x,y,hitID.x,hitID.y);
					hitID.xknockbacksp += round(dcos(knockbackAngle)*centerknock);
					hitID.yknockbacksp += -round(dsin(knockbackAngle)*centerknock);	
				}
			}
		}
	}
	ds_list_destroy(hitNow);
	return connected;
}