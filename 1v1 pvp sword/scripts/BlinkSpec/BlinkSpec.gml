function BlinkSpec(){
	if (specialT == 12){
		var xtp = round(round(dcos(attackAngle)*192));
		var ytp = round(-round(dsin(attackAngle)*192));
		
		x += xtp;
		y += ytp;
		x = max(48,x);
		x = min(912,x);
		y = max(48,y);
		y = min(496,y);
		
		var xCountL = 0;
		var xCountR = 0;
		var yCountU = 0;
		var yCountD = 0;
		
		while (!place_meeting(x-xCountL,y,oColl)) xCountL += 1;
		while (!place_meeting(x+xCountR,y,oColl)) xCountR += 1;
		while (!place_meeting(x,y-yCountU,oColl)) yCountU += 1;
		while (!place_meeting(x,y+yCountD,oColl)) yCountD += 1;
		
		if (xCountL < xCountR){
			if (yCountU < yCountD){
				if (xCountL < yCountU){
					while (place_meeting(x,y,oColl)) x -= 1;
					while (place_meeting(x,y,oColl)) y -= 1;
				}
				else{
					while (place_meeting(x,y,oColl)) y -= 1;
					while (place_meeting(x,y,oColl)) x -= 1;
				}
			}
			else{
				if (xCountL < yCountD){
					while (place_meeting(x,y,oColl)) x -= 1;
					while (place_meeting(x,y,oColl)) y += 1;
				}
				else{
					while (place_meeting(x,y,oColl)) y += 1;
					while (place_meeting(x,y,oColl)) x -= 1;
				}	
			}
		}
		else{
			if (yCountU < yCountD){
				if (xCountR < yCountU){
					while (place_meeting(x,y,oColl)) x += 1;
					while (place_meeting(x,y,oColl)) y -= 1;
				}
				else{
					while (place_meeting(x,y,oColl)) y -= 1;
					while (place_meeting(x,y,oColl)) x += 1;
				}
			}
			else{
				if (xCountR < yCountD){
					while (place_meeting(x,y,oColl)) x += 1;
					while (place_meeting(x,y,oColl)) y += 1;
				}
				else{
					while (place_meeting(x,y,oColl)) y += 1;
					while (place_meeting(x,y,oColl)) x += 1;
				}	
			}	
		}
	}
}