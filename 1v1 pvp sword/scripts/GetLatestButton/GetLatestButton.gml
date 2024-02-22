function GetLatestButton(){
	var gp_count = gamepad_get_device_count();
	for (var i = 0 ; i < gp_count ; i++){
		if (gamepad_is_connected(i)){
			for (var j = gp_face1 ; j < gp_axisrv ; j++){
				if (gamepad_button_check_pressed(i, j) && j != gp_start && j != gp_select){
					prevPressed = j;
					break;
				}
			}
		}
	}
	if (keyboard_check_pressed(vk_anykey)){
		prevPressed = keyboard_lastkey;	
	}
	else if (mouse_check_button_pressed(mb_any)){
		prevPressed = mouse_lastbutton;
	}
}