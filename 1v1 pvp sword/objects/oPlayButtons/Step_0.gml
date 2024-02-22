key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
key_select = keyboard_check_pressed(vk_space);
key_back = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_escape);

var gp_count = gamepad_get_device_count();
for (var i = 0 ; i < gp_count ; i++){
	if (gamepad_is_connected(i)){
		key_up = key_up || gamepad_button_check(i, gp_padu) || gamepad_axis_value(i, gp_axislv) < -0.15;
		key_down = key_down || gamepad_button_check(i, gp_padd) || gamepad_axis_value(i, gp_axislv) > 0.15;
		key_select = key_select || gamepad_button_check_pressed(i, gp_face1);	
		key_back = key_back || gamepad_button_check_pressed(i, gp_face2);
	}
}


if (key_down && (btnDelay == 0 || latest == 1)){
	btnSelected = min(btnSelected+1,3);
	latest = 0;
	btnDelay = 15;
}
else if (key_up && (btnDelay == 0 || latest == 0)){
	btnSelected = max(btnSelected-1,0);
	latest = 1;
	btnDelay = 15;
}
else if (!key_down && !key_up) btnDelay = 0;
if (btnDelay > 0) btnDelay--;

if (key_select){
	switch(btnSelected){
		case 0:
			sbut = instance_create_layer(0,0,"ServerStuff",oServerButton);
			sbut.p2 = false;
			sbut.mult = false;
			room_goto_next();
			break;
		
		case 1:
			instance_create_layer(0,0,"Buttons",oHostButtons);
			instance_destroy();
			break;
		
		case 2:
			instance_create_layer(0,0,"Buttons",oJoinButtons);
			instance_destroy();
			break;
		
		case 3:
			instance_create_layer(0,0,"Buttons",oTitleButtons);
			instance_destroy();
			break;
	}
}
else if (key_back){
	instance_create_layer(0,0,"Buttons",oTitleButtons);
	instance_destroy();
}