if (global.paused != -1){
	exit;	
}
Attack(30,10,0,0,0,0,knockbacksp);
if (life > 0) life--;
else instance_destroy();