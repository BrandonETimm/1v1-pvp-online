if (!shown) exit;
if (releasedT > 0) releasedT--;
key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
key_select = keyboard_check_pressed(vk_space);
key_back = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_escape);

var gp_count = gamepad_get_device_count();
for (var i = 0 ; i < gp_count ; i++){
	if (gamepad_is_connected(i)){
		key_left = key_left || gamepad_button_check(i, gp_padl) || gamepad_axis_value(i,gp_axislh) < -0.15;
		key_right = key_right || gamepad_button_check(i, gp_padr) || gamepad_axis_value(i, gp_axislh) > 0.15;
		key_up = key_up || gamepad_button_check(i, gp_padu) || gamepad_axis_value(i, gp_axislv) < -0.15;
		key_down = key_down || gamepad_button_check(i, gp_padd) || gamepad_axis_value(i, gp_axislv) > 0.15;
		key_back = key_back || gamepad_button_check_pressed(i, gp_face2);
		key_select = key_select || gamepad_button_check_pressed(i, gp_face1);
	}
}
if (!key_up && !key_left && !key_right && !key_down) releasedT = 0;

if (edit != -1){
	EditProfile();
	exit;
}
else if (releasedT > 0) exit;

if (key_right && btnDelay == 0){
	if (selected % 5 < 4) selected = min(selected+1,49);
	btnDelay = 10;
	latest = 1;
}
if (key_left && btnDelay == 0){
	if (selected % 5 != 0) selected = max(selected-1,0);
	btnDelay = 10;
	latest = 0;
}
if ((key_down || key_up) && btnDelay == 10) btnDelay = 0;
if (key_down && btnDelay == 0){
	if (selected+5 <= 49) selected += 5;
	btnDelay = 10;
	latest = 3;
}
if (key_up && btnDelay == 0){
	if (selected-5 >= 0) selected -= 5;
	btnDelay = 10;
	latest = 2;
}
else if ((!key_left && latest == 0) || (!key_right && latest == 1) || (!key_up && latest == 2) || (!key_down && latest == 3)) btnDelay = 0;
if (btnDelay > 0) btnDelay--;

if (key_select){
	edit = selected;
	currEditInfo = profInfo[selected];
	for (var i = 0 ; i < 30 ; i++){
		currEditInfo[i] = profInfo[selected][i];
	}
	selected = 0;
}
else if (key_back){
	shown = false;
	selected = 0;
	releasedT = 6;
}