function receivedPacketC(buffer){
	if (receivedPwd){
	msgid = buffer_read(buffer,buffer_u8);
	switch(msgid){
		case 3:
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			oPlayer1.dispHp = buffer_read(buffer,buffer_u16);
			oPlayer1.dispx = _x;
			oPlayer1.dispy = _y;
			break;
		case 4:
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			oPlayer2.dispHp = buffer_read(buffer,buffer_u16);
			oPlayer2.dispx = _x;
			oPlayer2.dispy = _y;
			break;
	}
	if (msgid == 3 || msgid == 4){
		instance_destroy(oDispEntity);
		var _entCount = buffer_read(buffer,buffer_u8);
		for (i = 0 ; i < _entCount ; i++){
			dispEnt = instance_create_layer(0,0,"Attacks",oDispEntity);
			dispEnt.connectedP = buffer_read(buffer,buffer_bool);
			dispEnt.sprite_index = buffer_read(buffer,buffer_u16);
			dispEnt.image_xscale = buffer_read(buffer,buffer_s8);
			dispEnt.image_yscale = buffer_read(buffer,buffer_s8);
			dispEnt.x = buffer_read(buffer,buffer_s16);
			dispEnt.y = buffer_read(buffer,buffer_s16);
			dispEnt.image_angle = buffer_read(buffer,buffer_u16);
		}
	}
	}
	else{
		var confirmed = buffer_read(buffer,buffer_bool);
		if (confirmed){
			receivedPwd = true;
			room_goto_next();
		}
		else{
			instance_destroy();
		}
	}
}