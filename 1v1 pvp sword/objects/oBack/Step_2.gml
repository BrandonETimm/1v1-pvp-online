backHeld = false;
for (var i = 0 ; i < 2 ; i++) backHeld = max(backHeld,instance_find(oLoadoutBtns1,i).exitBack);
if (backHeld){
	if (backT < 60) backT++;
	else{
		if (instance_exists(oServer)) instance_destroy(oServer);
		if (instance_exists(oClient)) instance_destroy(oClient);
		if (instance_exists(oServerButton)) instance_destroy(oServerButton);
		if (instance_exists(oLoadoutBtns1)) instance_destroy(oLoadoutBtns1);
		room_goto_previous();	
	}
}
else backT = 0;