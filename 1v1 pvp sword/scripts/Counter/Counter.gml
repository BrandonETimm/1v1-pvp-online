function Counter(){
	if (subSpecial == 0){
		if (specialT > 6 && specialT <= 24) countering = true;
		else countering = false;
		if (counterHit == 1){ //Player
			subSpecial = 1;	
			specialT = 15;
			countering = false;
		}
		else if (counterHit == 2){ //Projectile
			subSpecial = 2;
			specialT = 15;
			countering = false;
		}	
	}
	else if (subSpecial == 1){
		AttackHitbox(20,8,12,false);
	}
}