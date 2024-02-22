if (oPlayer1.controller != -2 && !p1dc && !gamepad_is_connected(oPlayer1.controller)){
		p1dc = true;
		global.paused = -4;
		oPlayer1.controller = -1;
}
if (oPlayer2.controller != -2 && !p2dc && !gamepad_is_connected(oPlayer2.controller)){
		p2dc = true;
		global.paused = -4;
		oPlayer2.controller = -1;
}
if (oCheckDead.p1Dead || oCheckDead.p2Dead) exit;
if (global.paused == -1){
	if (global.paused == -4) exit;
	if (oPlayer1.controller == -2){
		key_pause = keyboard_check_pressed(vk_escape);
	}
	else{
		key_pause = gamepad_button_check_pressed(oPlayer1.controller, gp_start);	
	}
	if (key_pause){
		global.paused = oPlayer1.controller;
		playerPaused = 1;
	}
	else{
		if (oPlayer2.controller == -2){
			key_pause = keyboard_check_pressed(vk_escape);
		}
		else{
			key_pause = gamepad_button_check_pressed(oPlayer2.controller, gp_start);	
		}
		if (key_pause){
			playerPaused = 2;
			global.paused = oPlayer2.controller;
		}
	}	
}
else if (global.paused == -4){
	if (p1dc && !p1dcPass){
		if (keyboard_check_pressed(vk_escape) && !p2dcPass && playerPaused != 1) p1dcPass = true;
		if (oPlayer2.controller != -2 && keyboard_check_pressed(vk_space)) oPlayer1.controller = -2;
		else{
			var gp_count = gamepad_get_device_count();
			for (var i = 0 ; i < gp_count ; i++){
				if (gamepad_is_connected(i)){
					if (gamepad_button_check_pressed(i,gp_face1) && oPlayer2.controller != i){
						oPlayer1.controller = i;
						gamepad_set_axis_deadzone(i, 0.15);
						break;
					}
				}
			}
		}
		if (oPlayer1.controller != -1){
			p1dc = false
			if (!p2dc){
				if (playerPaused == 1){
					global.paused = oPlayer1.controller;
				}
				else if (playerPaused == 2) global.paused = oPlayer2.controller;
				else global.paused = -1;
			}
		}
		else if (p1dcPass && !p2dc){
			if (playerPaused == 2) global.paused = oPlayer2.controller;
			else global.paused = -1;
		}
	}
	else if (p2dc && !p2dcPass){
		if (keyboard_check_pressed(vk_escape) && !p1dcPass && playerPaused != 2) p2dcPass = true;
		if (oPlayer1.controller != -2 && keyboard_check_pressed(vk_space)) oPlayer2.controller = -2;
		else{
			var gp_count = gamepad_get_device_count();
			for (var i = 0 ; i < gp_count ; i++){
				if (gamepad_is_connected(i)){
					if (gamepad_button_check_pressed(i,gp_face1) && oPlayer1.controller != i){
						oPlayer2.controller = i;
						gamepad_set_axis_deadzone(i, 0.15);
						break;
					}
				}
			}
		}
		if (oPlayer2.controller != -1){
			p2dc = false;
			if (playerPaused == 1){
				global.paused = oPlayer1.controller;	
			}
			else if (playerPaused == 2){
				global.paused = oPlayer2.controller;	
			}
			else global.paused = -1;
		}
		else if (p2dcPass){
			if (playerPaused == 1) global.paused = oPlayer1.controller;
			else global.paused = -1;
		}
	}
}
else{
	var pPausedC = oPlayer2.controller;
	if (oPlayer1.controller == global.paused) pPausedC = oPlayer1.controller;
	if (pPausedC == -2){
		key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
		key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
		key_select = keyboard_check_pressed(vk_space);
		key_close = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_escape);
	}
	else{
		key_up = gamepad_button_check(pPausedC, gp_padu) || gamepad_axis_value(pPausedC, gp_axislv) < -0.15;
		key_down = gamepad_button_check(pPausedC, gp_padd) || gamepad_axis_value(pPausedC, gp_axislv) > 0.15;
		key_close = gamepad_button_check_pressed(pPausedC,gp_face2) || gamepad_button_check_pressed(pPausedC,gp_start);
		key_select = gamepad_button_check_pressed(pPausedC, gp_face1);	
	}
	if (key_close){
		selected = 0;
		global.paused = -3;
		btnDelay = 0;
	}
	else if (key_select){
		switch (selected){
			case 0:
				global.paused = -3;
				btnDelay = 0;
				break;
			case 1:
				p1dc = true;
				p2dc = true;
				p1dcPass = false;
				p2dcPass = false;
				global.paused = -4;
				oPlayer1.controller = -1;
				oPlayer2.controller = -1;
				btnDelay = 0;
				break;
			case 2:
				MenuReturn();
				break;
		}
		selected = 0;
	}
	else if (key_down && (btnDelay == 0 || latest == 1)){
		btnDelay = 15;
		latest = 0;
		selected = min(selected+1,2);
	}
	else if (key_up && (btnDelay == 0 || latest == 0)){
		btnDelay = 15;
		latest = 1;
		selected = max(selected-1,0);
	}
	else if (!key_down && !key_up) btnDelay = 0;
	if (btnDelay > 0) btnDelay--;
}