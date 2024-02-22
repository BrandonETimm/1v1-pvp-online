function GetDmgMod(){
	var dmgMod = 1;
	if (defStance == 0) dmgMod = 1.2;
	if (defStance == 1) dmgMod = 0.75;
	return dmgMod;
}