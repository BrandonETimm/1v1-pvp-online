if (oPlayer1.hp <= 0){
	p1Dead = true;
}
if (oPlayer2.hp <= 0){
	p2Dead = true;	
}
if (p1Dead && p2Dead){
	p1Dead = false;
	p2Dead = false;
	oPlayer1.hp = 1;
	oPlayer2.hp = 1;
}
else if (p1Dead && oPlayer1.state != PLAYERSTATE.DEAD){
	oPlayer1.state = PLAYERSTATE.DEAD;
	countdown = 180;
}
else if (p2Dead && oPlayer2.state != PLAYERSTATE.DEAD){
	oPlayer2.state = PLAYERSTATE.DEAD;
	countdown = 180;
}
if (countdown > 0) countdown--;
else if (countdown == 0) MenuReturn();