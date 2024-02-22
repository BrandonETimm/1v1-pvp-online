function GrappleWall(){
	var hit = CollisionCheck();
	if (hit && place_meeting(x,y,grapple)){
		subSpecial = 2;
		specialT = 90;
		xsp = 0;
		ysp = 0;
		instance_destroy(grapple);
	}
}