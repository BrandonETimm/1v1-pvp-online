if (doneSelect) exit;
var has_key = false;
var all_ready = true;
for (var i = 0 ; i < 2 ; i++){
	controllerNums[i] = instance_find(oLoadoutBtns1,i).controller;
	has_key = max(controllerNums[i] == -2, has_key);
	all_ready = min(all_ready,(instance_find(oLoadoutBtns1,i).selected && instance_find(oLoadoutBtns1,i).btnSelected == 8));
}
if (controller == -2){
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
	key_select = keyboard_check_pressed(vk_space);
	key_back = keyboard_check(vk_shift);
	key_back_press = keyboard_check_pressed(vk_shift);
	key_tut = keyboard_check_pressed(vk_escape);
}
else if (controller == -1){
	key_left = false;
	key_right = false;
	key_up = false;
	key_down = false;
	key_select = false;
	key_back = false;
	key_back_press = false;
	key_tut = false;
	btnDelay = 0;
	btnSelected = 1;
	selected = false;
	latest = 0;
	showTut = false;
	if (!has_key) exitBack = keyboard_check(vk_shift);
	if (keyboard_check_pressed(vk_space) && !has_key) controller = -2;
	else{
		var gp_count = gamepad_get_device_count();
		for (var i = 0 ; i < gp_count ; i++){
			if (gamepad_is_connected(i)){
				if (gamepad_button_check_pressed(i,gp_face1) && controllerNums[0] != i && controllerNums[1] != i){
					controller = i;
					gamepad_set_axis_deadzone(i, 0.15);
					break;
				}
				else if (gamepad_button_check(i,gp_face2) && controllerNums[0] != i && controllerNums[1] != i) exitBack = true;
			}
		}
	}
}
else{
	if (!gamepad_is_connected(controller)) controller = -1;
	else{
		key_left = gamepad_button_check(controller, gp_padl) || gamepad_axis_value(controller,gp_axislh) < -0.15;
		key_right = gamepad_button_check(controller, gp_padr) || gamepad_axis_value(controller, gp_axislh) > 0.15;
		key_up = gamepad_button_check(controller, gp_padu) || gamepad_axis_value(controller, gp_axislv) < -0.15;
		key_down = gamepad_button_check(controller, gp_padd) || gamepad_axis_value(controller, gp_axislv) > 0.15;
		key_back = gamepad_button_check(controller, gp_face2);
		key_back_press = gamepad_button_check_pressed(controller,gp_face2);
		key_select = gamepad_button_check_pressed(controller, gp_face1);
		key_tut = gamepad_button_check_pressed(controller, gp_start);
	}
}

if (!selected && !showTut){
	if (key_back_press) started_back = true;
	if (key_back && started_back){
		backHold++;
		if (backHold > 45){
			controller = -1;
			backHold = 0;
		}
	}
	else{
		backHold = 0;
		started_back = false;
	}

	if (controller == -1) exit;
	//0 = left, 1 = right, 2 = up, 3 = down
	if (key_right && btnDelay == 0){
		if (btnSelected < 3) btnSelected = min(btnSelected+1,2);
		else if (btnSelected % 2 == 1) btnSelected = min(btnSelected+1,8);
		btnDelay = 15;
		latest = 1;
	}
	if (key_left && btnDelay == 0){
		if (btnSelected < 3) btnSelected = max(btnSelected-1,0);
		else if (btnSelected % 2 == 0) btnSelected = max(btnSelected-1,3);
		btnDelay = 15;
		latest = 0;
	}
	if ((key_down || key_up) && btnDelay == 15) btnDelay = 0;
	if (key_down && btnDelay == 0){
		if (btnSelected == 0) btnSelected = 3;
		else if (btnSelected+2 <= 8) btnSelected +=2;
		btnDelay = 15;
		latest = 3;
	}
	if (key_up && btnDelay == 0){
		if (btnSelected == 3) btnSelected = 0;
		else if (btnSelected-2 >= 2) btnSelected -=2;
		btnDelay = 15;
		latest = 2;
	}
	else if ((!key_left && latest == 0) || (!key_right && latest == 1) || (!key_up && latest == 2) || (!key_down && latest == 3)) btnDelay = 0;

	if (key_select){
		selected = true;
		if (btnSelected == 7){
			settings = instance_create_layer(240+p2*480,270,"Settings",oSSettings);
			settings.playID = id;
			settings.controller = controller;
			if (profileSel >= 33){
				settings.subSelected = 2;
				if (profileSel == 49) settings.btnSelected = 17;
				else settings.btnSelected = profileSel-33;
			}
			else if (profileSel >= 17){
				settings.subSelected = 1;
				settings.btnSelected = profileSel-17;
			}
			else if (profileSel != -1){
				settings.subSelected = 0;
				settings.btnSelected = profileSel;
			}
		}
		else if(btnSelected < 7){
			prevAbNum = specials[btnSelected];
		}
	}
	else if (key_tut){
		showTut = true;
		tutNum = 0;
	}
}
else if (showTut){
	if (key_select){
		tutNum++;
		if (tutNum == 3) showTut = false;
	}
	else if (key_back_press){
		tutNum--;
		if (tutNum == -1) showTut = false;
	}
	else if (key_tut){
		showTut = false;	
	}
}
else{
	if (btnSelected < 7){
		if (btnSelected < 4) specialSelected = btnSelected;
		else specialSelected = 3;
		if (key_right && btnDelay == 0){
			specials[btnSelected]++;
			if (specials[btnSelected] > specialMax[specialSelected]) specials[btnSelected] = 0;
			btnDelay = 15;
			latest = 1;
		}
		else if (key_left && btnDelay == 0){
			specials[btnSelected]--;
			if (specials[btnSelected] == -1) specials[btnSelected] = specialMax[specialSelected];
			btnDelay = 15;
			latest = 0;
		}
		else if ((!key_left && latest == 0) || (!key_right && latest == 1) || (latest > 1)) btnDelay = 0;
		
	}
	if ((key_back || (key_select && btnSelected < 7)) && btnSelected != 7){
		selected = false;
		if (btnSelected < 7){
			if (key_back) specials[btnSelected] = prevAbNum;
			else if (btnSelected > 2){
				for (var i = 3 ; i < 7 ; i++){
					if (btnSelected != i && specials[btnSelected] == specials[i]){
						specials[i] = prevAbNum;
						break;
					}
				}
			}
		}
	}
	if (key_select && all_ready) FightSetup();
}
if (btnDelay > 0) btnDelay--;