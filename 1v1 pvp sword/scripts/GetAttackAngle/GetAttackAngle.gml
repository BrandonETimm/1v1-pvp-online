function GetAttackAngle(){
	if (controller == -2) return point_direction(x,y,mouse_x,mouse_y);
	else{
		if (abs(gamepad_axis_value(controller,gp_axisrh)) < 0.15 && abs(gamepad_axis_value(controller,gp_axisrv)) < 0.15){
			if (abs(gamepad_axis_value(controller,gp_axislh)) < 0.15 && abs(gamepad_axis_value(controller,gp_axislv)) < 0.15){
				var gp_pad_angle = point_direction(0, 0, gamepad_button_check(controller, gp_padr) - gamepad_button_check(controller, gp_padl), gamepad_button_check(controller, gp_padd) - gamepad_button_check(controller, gp_padu));
				if (gp_pad_angle == 0) return currAttAngle;
				else return gp_pad_angle;
			}
			else return moveAngle;
		}
		else return point_direction(0,0,gamepad_axis_value(controller, gp_axisrh),gamepad_axis_value(controller, gp_axisrv));
	}
}