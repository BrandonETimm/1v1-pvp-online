if (appearAnim < 8 || close){
	if (!close) appearAnim++;
	else{
		appearAnim--;
		if (appearAnim == 0){
			playID.selected = false;
			instance_destroy();	
		}
	}
	exit;
}
if (controller == -2){
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
	key_select = keyboard_check_pressed(vk_space);
	key_enter = keyboard_check_pressed(vk_enter);
	key_back = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_escape);
	key_escape = keyboard_check_pressed(vk_escape);
}
else if (controller != -1){
	if (!gamepad_is_connected(controller)){
		key_back = true;
	}
	else{
		key_left = gamepad_button_check(controller, gp_padl) || gamepad_axis_value(controller,gp_axislh) < -0.15;
		key_right = gamepad_button_check(controller, gp_padr) || gamepad_axis_value(controller, gp_axislh) > 0.15;
		key_up = gamepad_button_check(controller, gp_padu) || gamepad_axis_value(controller, gp_axislv) < -0.15;
		key_down = gamepad_button_check(controller, gp_padd) || gamepad_axis_value(controller, gp_axislv) > 0.15;
		key_back = gamepad_button_check_pressed(controller, gp_face2);
		key_select = gamepad_button_check_pressed(controller, gp_face1);
		key_escape = gamepad_button_check_pressed(controller, gp_face2);
		key_enter = gamepad_button_check_pressed(controller, gp_face1);
	}
}
if (key_back || controller == -1){
	editingName = -1;
	close = true;
}
if (editingName != -1){
	if (key_escape){
		editingName = -1;
	}
	else if (key_enter){
		if (currName != ""){
			SaveProfileInfo(editingName,[currName,ord("W"),ord("A"),ord("S"),ord("D"),ord("Q"),ord("E"),ord("R"),ord("F"),vk_shift,vk_control,mb_left,mb_right,1,gp_face1,gp_face3,gp_face4,gp_face2,gp_shoulderlb,gp_shoulderrb,gp_shoulderr,gp_shoulderl,1,0,0,0,0,1,2,3]);
			editingName = -1;
		}
	}
	else{
		if (string_length(keyboard_string) <= 12){
			if (keyboard_string == " ") keyboard_string = "";
			else currName = keyboard_string;
		}
		else keyboard_string = string_copy(keyboard_string,0,12);	
	}
	exit;
}

if (appearAnim == 8){
	var _offset = 0;
	switch(subSelected){
		case 0: _offset = 0; break;
		case 1: _offset = 17; break;
		case 2: _offset = 33; break;
	}
	if (key_right && btnDelay == 0){
		if (btnSelected % 2 == 0) btnSelected = min(btnSelected+1,17);
		btnDelay = 10;
		latest = 1;
	}
	if (key_left && btnDelay == 0){
		if (btnSelected % 2 == 1) btnSelected = max(btnSelected-1,0);
		btnDelay = 10;
		latest = 0;
	}
	if ((key_down || key_up) && btnDelay == 10) btnDelay = 0;
	if (key_down && btnDelay == 0){
		if (btnSelected+2 <= 17) btnSelected +=2;
		btnDelay = 10;
		latest = 3;
	}
	if (key_up && btnDelay == 0){
		if (btnSelected-2 >= 0) btnSelected -=2;
		btnDelay = 10;
		latest = 2;
	}
	else if ((!key_left && latest == 0) || (!key_right && latest == 1) || (!key_up && latest == 2) || (!key_down && latest == 3)) btnDelay = 0;
	if (btnDelay > 0) btnDelay--;
	
	if (subSelected == 0){
		if (key_select){
			if (btnSelected == 17){
				subSelected = 1;
			}
			else{
				if (oProfiles.profInfo[btnSelected][0] != ""){
					playID.profileSel = btnSelected;
					for (var i = 0 ; i < 7 ; i++){
						playID.specials[i] = oProfiles.profInfo[btnSelected][i+23];	
					}
					close = true;
				}
				else{
					for (var i = 0; i < instance_number(oSSettings); i++){
						if (instance_find(oSSettings, i).editingName != -1) exit;
					}
					keyboard_string = "";
					editingName = btnSelected;
				}
			}
		}
	}
	else if (subSelected == 1){
		if (key_select){
			if (btnSelected == 17){
				subSelected = 2;
			}
			else if (btnSelected == 16){
				subSelected = 0;
			}
			else{
				if (oProfiles.profInfo[17+btnSelected][0] != ""){
					playID.profileSel = 17+btnSelected;
					for (var i = 0 ; i < 7 ; i++){
						playID.specials[i] = oProfiles.profInfo[17+btnSelected][i+23];	
					}
					close = true;
				}
				else{
					for (var i = 0; i < instance_number(oSSettings); i++){
						if (instance_find(oSSettings, i).editingName != -1) exit;
					}
					keyboard_string = "";
					editingName = 17+btnSelected;
				}
			}
		}
	}
	else{
		if (key_select){
			if (btnSelected == 16){
				subSelected = 1;
			}
			else{
				if (btnSelected == 17){
					if (oProfiles.profInfo[49][0] != ""){
						playID.profileSel = 49;
						for (var i = 0 ; i < 7 ; i++){
							playID.specials[i] = oProfiles.profInfo[49][i+23];	
						}
						close = true;
					}
					else{
						for (var i = 0; i < instance_number(oSSettings); i++){
							if (instance_find(oSSettings, i).editingName != -1) exit;
						}
						keyboard_string = "";
						editingName = 49;	
					}
				}
				else if (oProfiles.profInfo[33+btnSelected][0] != ""){
					playID.profileSel = 33+btnSelected;
					for (var i = 0 ; i < 7 ; i++){
						playID.specials[i] = oProfiles.profInfo[33+btnSelected][i+23];	
					}
					close = true;
				}
				else{
					for (var i = 0; i < instance_number(oSSettings); i++){
						if (instance_find(oSSettings, i).editingName != -1) exit;
					}
					keyboard_string = "";
					editingName = 33+btnSelected;	
				}
			}
		}
	}
}