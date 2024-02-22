if (global.paused != -1){
	exit;	
}
if (life > 0) life--;
else instance_destroy();
if (oCheckDead.p1Dead || oCheckDead.p2Dead) exit;
if (dmgTick > 0) dmgTick--;
else dmgTick = 6;
var player = 0;
for (var i = 0 ; i < instance_number(oPlayer) ; i++){
	player = instance_find(oPlayer,i);
	if (place_meeting(x, y, player)){
		if (dmgTick == 6) player.hp -= 1;	
		if (player.burningT % 20 == 1 || player.burningT == 0) player.burningT = 80;
		player.burningDmg = 6;
	}
}