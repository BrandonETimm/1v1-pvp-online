function CollisionCheck(){
	var collhit = false;
	
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
	
	return collhit;
}