if (global.paused != -1){
	exit;
}
if (!selfBomb){
	xspD *= 0.9;
	yspD *= 0.9;
	if (abs(xspD) < 1) xspD = 0;
	if (abs(yspD) < 1) yspD = 0;
	xsp = floor(xspD);
	ysp = floor(yspD);
	CollisionCheck();
}
else{
	x = player.x;
	y = player.y;
}
if (isMine && time < 1170 && place_meeting(x,y,oPlayer)) instance_destroy();
if (time > 0) time--;
else instance_destroy();