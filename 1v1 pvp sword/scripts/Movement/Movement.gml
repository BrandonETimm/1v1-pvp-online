function Movement(local){
	var movMult = 1;
	if (acceleratedT > 0) movMult = 2;
	if (local){
		movex = key_right - key_left;
		movey = key_down - key_up;
		if (movex != 0 && movey != 0){
			if (controller == -2){
				movex = round(movex/sqrt(2)*100)/100;
				movey = round(movey/sqrt(2)*100)/100;
			}
			else{
				movex = round(dcos(moveAngle)*100)/100;
				movey = -round(dsin(moveAngle)*100)/100;	
			}
		}
	}
	xsp = round(movex*walksp*movMult);
	ysp = round(movey*walksp*movMult);
}