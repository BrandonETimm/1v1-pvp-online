function PSDash(){
	dashT--;
	if (dashT <= 0){
		state = PLAYERSTATE.FREE;
	}
	else{
		 if (dashT <= 2){
			xsp = round(xsp*0.5);
			ysp = round(ysp*0.5);
		 }
	}
	CollisionCheck();
}