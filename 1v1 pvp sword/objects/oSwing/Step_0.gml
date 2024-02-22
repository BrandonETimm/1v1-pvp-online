if (global.paused != -1){
	exit;
}
if (player.state != PLAYERSTATE.DASH && player.state != PLAYERSTATE.STUNNED && player.state != PLAYERSTATE.DEAD){
	if (place_meeting(x,y,oPlayer)) Attack(attackDmg,stunDur,burnT,burnDmg,xknocksp,yknocksp,0);
	if (life > 0) life--;	
	else instance_destroy();
}
else instance_destroy();
x = player.x;
y = player.y;