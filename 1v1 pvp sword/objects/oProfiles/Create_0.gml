profInfo = array_create(50);
currEditInfo = array_create(30);

//Name,W,A,S,D,1,2,3,4,Util,Shoot,Prim,Dash,DashMouse,1C,2C,3C,4C,UtilC,ShootC,PrimC,DashC,DashAim,UtilE,PrimE,ShootE,1E,2E,3E,4E

//if file_exists("profiles.txt") file_delete("profiles.txt");

var file = file_text_open_read("profiles.txt");
if (file != -1){
	for (var i = 0 ; i < 50 ; i++){
		try{
			var info = file_text_readln(file);
			var slot = 0;
			var tempinfo = "";
			var splitInfo = array_create(30);
			for (var j = 1; j <= string_length(info) ; j++){
				var currChar = string_copy(info, j, 1);
				if (currChar == ",") {
					if (slot > 0){
						splitInfo[slot] = int64(tempinfo);
					}
					else splitInfo[slot] = tempinfo;
					slot++;
					tempinfo = "";
				}
				else if (currChar != "\"" && currChar != "[" && currChar != "]" && (currChar != " " || tempinfo != "")){
					tempinfo += currChar;
					if (slot > 0){
						splitInfo[slot] = int64(tempinfo);
					}
					else splitInfo[slot] = tempinfo;
				}
			}
			if (splitInfo[0] == " ") splitInfo[0] = "";
			profInfo[i] = splitInfo;
		}
		catch(e){
			profInfo[i] = ["",ord("W"),ord("A"),ord("S"),ord("D"),ord("Q"),ord("E"),ord("R"),ord("F"),vk_shift,vk_control,mb_left,mb_right,1,gp_face1,gp_face3,gp_face4,gp_face2,gp_shoulderlb,gp_shoulderrb,gp_shoulderr,gp_shoulderl,1,0,0,0,0,1,2,3];
		}
	}
	file_text_close(file);
}
else{
	var file = file_text_open_write("profiles.txt");
	for (var i = 0 ; i < 50 ; i++){
		file_text_write_string(file,string(["",ord("W"),ord("A"),ord("S"),ord("D"),ord("Q"),ord("E"),ord("R"),ord("F"),vk_shift,vk_control,mb_left,mb_right,1,gp_face1,gp_face3,gp_face4,gp_face2,gp_shoulderlb,gp_shoulderrb,gp_shoulderr,gp_shoulderl,1,0,0,0,0,1,2,3]));
		file_text_writeln(file);
	}
	file_text_close(file);
	for (var i = 0 ; i < 50 ; i++){
		profInfo[i] = ["",ord("W"),ord("A"),ord("S"),ord("D"),ord("Q"),ord("E"),ord("R"),ord("F"),vk_shift,vk_control,mb_left,mb_right,1,gp_face1,gp_face3,gp_face4,gp_face2,gp_shoulderlb,gp_shoulderrb,gp_shoulderr,gp_shoulderl,1,0,0,0,0,1,2,3];
	}
}
/*
var file = file_text_open_write("profiles.txt");
editline = 4;
for (var i = 0 ; i < 50 ; i++){
	if (i != editline){
		file_text_write_string(file,string(profInfo[i]));
		file_text_writeln(file);
	}
	else{
		file_text_write_string(file,string(["gamer",ord("W"),ord("A"),ord("S"),ord("D"),ord("Q"),ord("E"),ord("R"),ord("F"),vk_shift,vk_control,mb_left,mb_right,1,gp_face1,gp_face3,gp_face4,gp_face2,gp_shoulderlb,gp_shoulderrb,gp_shoulderr,gp_shoulderl,1,0,0,0,0,1,2,3]));
		file_text_writeln(file);	
	}
}
file_text_close(file);*/
//show_message(profInfo);

prevPressed = 0;