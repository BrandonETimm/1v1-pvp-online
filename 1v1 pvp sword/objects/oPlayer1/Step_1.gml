/*key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_swing = mouse_check_button_pressed(mb_left);
key_grapple = mouse_check_button_pressed(mb_right);
key_dash = keyboard_check_pressed(vk_shift);
if (oServerButton.mult && oServerButton.p2 == false){
	MultCalc();
}
else if (!oServerButton.mult){
	PlayerStep(true);
}*/
if keyboard_check_pressed(vk_left) specials[3] = max(0,specials[3]-1);
if keyboard_check_pressed(vk_right) specials[3] = min(14,specials[3]+1);
event_inherited();