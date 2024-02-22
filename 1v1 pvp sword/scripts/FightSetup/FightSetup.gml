function FightSetup(){
	for (var i = 0 ; i < 2 ; i++){
		var load = instance_find(oLoadoutBtns1,i);
		with(load){
			btnSelected = 1;
			selected = false;
			doneSelect = true;
			if (profileSel != -1){
				for (var j = 0 ; j < 7 ; j++){
					oProfiles.profInfo[profileSel][j+23] = specials[j];
				}
				SaveProfileInfo(profileSel,oProfiles.profInfo[profileSel])
			}
		}
	}
	room_goto_next();
}