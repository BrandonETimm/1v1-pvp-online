if (global.paused != -1){
	exit;	
}
if (dmg == 0) BoostAttack(stunDur,knockbacksp);
else Attack(dmg,stunDur,0,0,0,0,knockbacksp);
if (life > 0) life--;
else instance_destroy();