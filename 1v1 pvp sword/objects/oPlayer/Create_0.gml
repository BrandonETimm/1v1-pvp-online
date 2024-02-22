state = PLAYERSTATE.FREE;
dispx = x;
dispy = y;
specials = [0,0,0,0,1,2,3];
window_set_fullscreen(true)
binds = array_create(30);
image_speed = 0;
hit = ds_list_create();
player = id;

if (!oServerButton.mult){
	for (var i = 0 ; i < 2 ; i++){
		var load = instance_find(oLoadoutBtns1,i);
		if (load.p2 == p2){
			for (var j = 0 ; j < 7 ; j++){
				specials[j] = load.specials[j];
			}
			controller = load.controller;
			if (specials[0] == 1) defStance = 0;
			if (load.profileSel != -1){
				binds = oProfiles.profInfo[load.profileSel];
			}
			else{
				binds = ["",ord("W"),ord("A"),ord("S"),ord("D"),ord("Q"),ord("E"),ord("R"),ord("F"),vk_shift,vk_control,mb_left,mb_right,1,gp_face1,gp_face3,gp_face4,gp_face2,gp_shoulderlb,gp_shoulderrb,gp_shoulderr,gp_shoulderl,1,0,1,2,3,0,0,0];	
			}
		}
	}
}
//window_set_fullscreen(true);