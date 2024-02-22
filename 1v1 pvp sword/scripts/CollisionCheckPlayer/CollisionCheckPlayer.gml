function CollisionCheckPlayer(){
	var collhit = false;
	var tempxsp = xsp;
	var tempysp = ysp;
	if (abs(xknockbacksp) > 0 || abs(yknockbacksp) > 0){
		if (state == PLAYERSTATE.STUNNED){
			xsp = round(xknockbacksp+xsp*0.1);
			ysp = round(yknockbacksp+ysp*0.1);
		}
		else{
			xsp = round(xknockbacksp+xsp*0.5);
			ysp = round(yknockbacksp+ysp*0.5);
		}
	}
	
	if (place_meeting(x+xsp,y,oColl)){
		while (!place_meeting(x+sign(xsp),y,oColl)){
			x += sign(xsp);
		}
		collhit = true;
	}
	else x += xsp;
	
	if (place_meeting(x,y+ysp,oColl)){
		while (!place_meeting(x,y+sign(ysp),oColl)){
			y += sign(ysp);
		}
		collhit = true;
	}
	else y += ysp;
	
	xsp = tempxsp;
	ysp = tempysp;
	if (state == PLAYERSTATE.STUNNED){
		if (abs(xknockbacksp) > 0.5){
			if (xsp == 0) xknockbacksp *= 0.96;
			else if (sign(xsp) == sign(xknockbacksp)) xknockbacksp *= 0.98;
			else xknockbacksp *= 0.94;
		}
		else xknockbacksp = 0;
	
		if (abs(yknockbacksp) > 0.5){
			if (xsp == 0) yknockbacksp *= 0.96;
			else if (sign(ysp) == sign(yknockbacksp)) yknockbacksp *= 0.98;
			else yknockbacksp *= 0.94;
		}
		else yknockbacksp = 0;
	}
	else{
		if (abs(xknockbacksp) > 0.5){
			if (xsp == 0) xknockbacksp *= 0.92;
			else if (sign(xsp) == sign(xknockbacksp)) xknockbacksp *= 0.94;
			else xknockbacksp *= 0.90;
		}
		else xknockbacksp = 0;
	
		if (abs(yknockbacksp) > 0.5){
			if (xsp == 0) yknockbacksp *= 0.92;
			else if (sign(ysp) == sign(yknockbacksp)) yknockbacksp *= 0.94;
			else yknockbacksp *= 0.90;
		}
		else yknockbacksp = 0;
	}
	
	return collhit;
}