function MenuReturn(){
	for (var i = 0 ; i < 2 ; i++){
		var load = instance_find(oLoadoutBtns1,i);
		load.doneSelect = false;
	}
	room_goto_previous();
}