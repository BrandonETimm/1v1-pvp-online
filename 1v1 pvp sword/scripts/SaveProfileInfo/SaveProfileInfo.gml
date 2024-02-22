function SaveProfileInfo(edit,editInfo){
	for (var i = 0 ; i < 30 ; i++){
		oProfiles.profInfo[edit][i] = editInfo[i];
	}
	var file = file_text_open_write("profiles.txt");
	for (var i = 0 ; i < 50 ; i++){
		if (i != edit){
			file_text_write_string(file,string(oProfiles.profInfo[i]));
			file_text_writeln(file);
		}
		else{
			file_text_write_string(file,string(editInfo));
			file_text_writeln(file);	
		}
	}
	file_text_close(file);
}