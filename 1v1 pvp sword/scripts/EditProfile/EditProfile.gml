function EditProfile(){
	if (editSelect){
		if (selected == 1){
			if (keyboard_check_pressed(vk_escape)){
				editSelect = false;
			}
			else if (keyboard_check_pressed(vk_enter) && currName != ""){
				editSelect = false;
				currEditInfo[0] = currName;
			}
			else{
				if (string_length(keyboard_string) <= 12){
					if (keyboard_string == " ") keyboard_string = "";
					else currName = keyboard_string;
				}
				else keyboard_string = string_copy(keyboard_string,0,12);
			}
		}
		else if (selected < 14){
			if (keyboard_check_pressed(vk_escape)){
				editSelect = false;	
			}
			else if (keyboard_check_pressed(vk_anykey)){
				prevPressed = keyboard_lastkey;
				editSelect = false;	
				currEditInfo[selected-1] = prevPressed;
				if (key_left) latest = 0;
				else if (key_right) latest = 1;
				else if (key_up) latest = 2;
				else if (key_down) latest = 3;
				btnDelay = 14;
			}
			else if (mouse_check_button_pressed(mb_any)){
				prevPressed = mouse_lastbutton;
				editSelect = false;
				currEditInfo[selected-1] = prevPressed;
			}
		}
		else{
			var gp_count = gamepad_get_device_count();
			for (var i = 0 ; i < gp_count ; i++){
				if (gamepad_is_connected(i)){
					if (gamepad_button_check_pressed(i, gp_start)) editSelect = false;
					else if (keyboard_check_pressed(vk_escape)){
						editSelect = false;	
					}
					else{
						for (var j = gp_face1 ; j < gp_axisrv ; j++){
							if (gamepad_button_check_pressed(i, j) && j != gp_select){
								prevPressed = j;
								editSelect = false;
								currEditInfo[selected-2] = prevPressed;
								switch(prevPressed){
									case gp_padl: latest = 0; break;
									case gp_padr: latest = 1; break;
									case gp_padu: latest = 2; break;
									case gp_padd: latest = 3; break;
								}
								btnDelay = 15;
								break;
							}
						}
					}
				}
			}
		}
	}
	else{
		if (key_right && btnDelay == 0 && selected != 1){
			if (selected % 2 == 0 && selected != 14 && selected != 15 && selected != 24 && selected != 25) selected++;
			else if (selected < 8) selected += 13;
			else if (selected < 14) selected = 22;
			else if (selected < 16) selected += 10;
			btnDelay = 15;
			latest = 1;
		}
		else if (key_left && btnDelay == 0){
			if (selected % 2 == 1 && selected != 14 && selected != 15 && selected != 24 && selected != 25) selected--;
			else if (selected > 23) selected -= 10;
			else if (selected > 15) selected -= 13;
			btnDelay = 15;
			latest = 0;
		}
		if ((key_down || key_up) && btnDelay == 15) btnDelay = 0;
		if (key_down && btnDelay == 0){
			if (selected > 12 && (selected % 10 == 3 || selected % 10 == 4)) selected++;
			else if (selected != 15 && selected != 25) selected += 2;
			btnDelay = 15;
			latest = 3;
		}
		else if (key_up && btnDelay == 0){
			if (selected == 16 || selected == 17) selected = 1;
			else if (selected > 13 && (selected % 10 == 4 || selected % 10 == 5)) selected--;
			else if (selected > 1) selected -= 2;
			btnDelay = 15;
			latest = 2;
		}
		else if ((!key_left && latest == 0) || (!key_right && latest == 1) || (!key_up && latest == 2) || (!key_down && latest == 3)) btnDelay = 0;
		if (btnDelay > 0) btnDelay--;
		if (key_select){
			if (selected == 0){
				if (currEditInfo[0] != "") SaveProfileInfo(edit,currEditInfo);
				selected = edit;
				edit = -1;
				
			}
			else if (selected == 14) currEditInfo[13] = 1;
			else if (selected == 15) currEditInfo[13] = 0;
			else if (selected == 24) currEditInfo[22] = 1;
			else if (selected == 25) currEditInfo[22] = 0;
			else{
				if (selected == 1){
					keyboard_string = currEditInfo[0];
					currName = currEditInfo[0];
				}
				editSelect = true;	
			}
		}
		else if (key_back){
			if (currEditInfo[0] != "") SaveProfileInfo(edit,currEditInfo);
			selected = edit;
			edit = -1;
		}
	}
}