if (global.paused != -1){
	exit;
}
if (controller == -2){
	key_left = keyboard_check(binds[2]);
	key_right = keyboard_check(binds[4]);
	key_up = keyboard_check(binds[1]);
	key_down = keyboard_check(binds[3]);
	key_swing = mouse_check_button_pressed(binds[11]);
	key_dash = mouse_check_button_pressed(binds[12]);
	key_spec1 = keyboard_check_pressed(binds[5]);
	key_spec2 = keyboard_check_pressed(binds[6]);
	key_spec3 = keyboard_check_pressed(binds[7]);
	key_spec4 = keyboard_check_pressed(binds[8]);
	key_util = keyboard_check_pressed(binds[9]);
	key_range = keyboard_check_pressed(binds[10]);
	//if (key_right - key_left == 0 && key_down - key_up == 0) moveAngle = point_direction(x,y,mouse_x,mouse_y);
	if (key_left && !key_right){
		if (key_up && !key_down) moveAngle = 135;
		else if (key_down && !key_up) moveAngle = 225;
		else moveAngle = 180;
	}
	else if (key_right && !key_left){
		if (key_up && !key_down) moveAngle = 45;
		else if (key_down && !key_up) moveAngle = 315;
		else moveAngle = 0;
	}
	else if (key_up && !key_down) moveAngle = 90;
	else if (key_down && !key_up) moveAngle = 270;
	dashAim = binds[13];
		
}
else{
	key_left = gamepad_axis_value(controller,gp_axislh) < -0.15;
	key_right = gamepad_axis_value(controller, gp_axislh) > 0.15;
	key_up = gamepad_axis_value(controller, gp_axislv) < -0.15;
	key_down = gamepad_axis_value(controller, gp_axislv) > 0.15;
	key_swing = gamepad_button_check_pressed(controller, binds[20]);
	key_dash = gamepad_button_check_pressed(controller, binds[21]);
	key_spec1 = gamepad_button_check_pressed(controller, binds[14]);
	key_spec2 = gamepad_button_check_pressed(controller, binds[15]);
	key_spec3 = gamepad_button_check_pressed(controller, binds[16]);
	key_spec4 = gamepad_button_check_pressed(controller, binds[17]);
	key_util = gamepad_button_check_pressed(controller, binds[18]);
	key_range = gamepad_button_check_pressed(controller, binds[19]);
	if (key_left || key_right || key_up || key_down) moveAngle = point_direction(0,0,gamepad_axis_value(controller, gp_axislh),gamepad_axis_value(controller, gp_axislv));
	dashAim = binds[22];
}
if (oServerButton.mult && oServerButton.p2 == p2){
	MultCalc();
}
else{
	PlayerStep(true);
	Animation();
}