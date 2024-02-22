if (txtSelected == 0){
	try{
		if (string_length(keyboard_string) <= 5){
			portNum = int64(keyboard_string);
		}
		else keyboard_string = string_copy(keyboard_string,0,5);
	}
	catch(e){}
	if (keyboard_string == "") portNum = -1;
	if (keyboard_check_pressed(vk_enter) && portNum != -1){
		txtSelected = 1;
		keyboard_string = string(servIP);
	}
	else if (keyboard_check_pressed(vk_escape)){
		instance_create_layer(0,0,"Buttons",oJoinButtons);
		instance_destroy();
	}
	else{
		var gp_count = gamepad_get_device_count();
		for (var i = 0 ; i < gp_count ; i++){
			if (gamepad_is_connected(i)){
				if (gamepad_button_check_pressed(i, gp_face2)){
					instance_create_layer(0,0,"Buttons",oJoinButtons);
					instance_destroy();
				}
			}
		}
	}
}
else if (txtSelected == 1){
	if (string_length(keyboard_string) <= 30){
		servIP = keyboard_string;
	}
	else keyboard_string = string_copy(keyboard_string,0,30);
	if (keyboard_check_pressed(vk_enter)){
		txtSelected = 2;
		keyboard_string = string(pwd);
		if (keyboard_string == "-1") keyboard_string = "";
	}
	else if (keyboard_check_pressed(vk_escape)){
		txtSelected = 0;
		keyboard_string = string(portNum);
	}
}
else{
	try{
		if (string_length(keyboard_string) <= 4){
			pwd = int64(keyboard_string);
		}
		else keyboard_string = string_copy(keyboard_string,0,4);
	}
	catch(e){}
	if (keyboard_string == "") pwd = -1;
	if (keyboard_check_pressed(vk_enter)){
		sbut = instance_create_layer(0,0,"ServerStuff",oServerButton);
		sbut.p2 = true;
		sbut.mult = true;
		global.servIP = servIP;
		global.portNum = portNum;
		global.pwd = pwd;
		instance_create_layer(0,0,"ServerStuff",oClient);
	}
	else if (keyboard_check_pressed(vk_escape)){
		txtSelected = 1;
		keyboard_string = string(servIP);
	}
}