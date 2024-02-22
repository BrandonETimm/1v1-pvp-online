if (global.paused != -1){
	exit;	
}
if (player.state != PLAYERSTATE.DASH && player.state != PLAYERSTATE.STUNNED && player.state != PLAYERSTATE.DEAD){
	var hitEn = Attack(attackDmg,stunDur,0,0,xknocksp,yknocksp,0);
	if (hitEn){
		player.subSpecial = 2;
		player.specialT = 8;
		player.xsp = -floor(player.xsp*0.8);
		player.ysp = -floor(player.ysp*0.8);
		life = 5;
	}
	if (life > 0) life--;	
	else instance_destroy();
}
else instance_destroy();
x = player.x;
y = player.y;