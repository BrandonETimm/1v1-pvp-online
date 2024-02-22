function receivedPacket(buffer, socket){
	msgid = buffer_read(buffer, buffer_u8);
	if ((msgid == 1 && receivedPwd[0]) || (msgid == 2 && receivedPwd[1])){
	if ((msgid == 1 && socket == ds_list_find_value(socket_list,0)) || (msgid == 2 && socket == ds_list_find_value(socket_list,1))){
		player = oPlayer2;
		if (msgid == 1) player = oPlayer1;
		var _keyL = buffer_read(buffer,buffer_f16);
		var _keyU = buffer_read(buffer,buffer_f16);
		var _keyR = buffer_read(buffer,buffer_f16);
		var _keyD = buffer_read(buffer,buffer_f16);
		var _attackVal = buffer_read(buffer,buffer_u8);
		if (player.attackVal == 0 && (_attackVal != 3 || (_attackVal == 3 && player.dashCD == 0))) player.attackVal = _attackVal;
		if (_attackVal == 3 && player.dashCD == 0) player.attackVal = _attackVal;
		var _movex = _keyR - _keyL;
		var _movey = _keyD - _keyU;
		if (_movex != 0 && _movey != 0){
			_movex = _movex/sqrt(2);
			_movey = _movey/sqrt(2);
		}
		player.attackAngle = buffer_read(buffer,buffer_u16);
		player.movex = _movex;
		player.movey = _movey;
		with (player){
			PlayerStep(false);
		}
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,msgid+2);
		buffer_write(server_buffer,buffer_u16,player.x);
		buffer_write(server_buffer,buffer_u16,player.y);
		buffer_write(server_buffer,buffer_u16,player.hp);
		
		var instCount = instance_number(oEntity);
		buffer_write(server_buffer,buffer_u8,instCount);
		for (i = 0; i < instCount ; i++){
			var enemy = instance_find(oEntity,i);
			var _player = 0;
			if (enemy.player == oPlayer2.id) _player = 1;
			buffer_write(server_buffer,buffer_bool,_player);
			buffer_write(server_buffer,buffer_u16,enemy.sprite_index);
			buffer_write(server_buffer,buffer_s8,enemy.image_xscale);
			buffer_write(server_buffer,buffer_s8,enemy.image_yscale);
			buffer_write(server_buffer,buffer_s16,enemy.x);
			buffer_write(server_buffer,buffer_s16,enemy.y);
			buffer_write(server_buffer,buffer_u16,enemy.image_angle);
		}
		var i = 0;
		repeat(ds_list_size(socket_list)){
			_sock = ds_list_find_value(socket_list,i);
			if (receivedPwd[i]){
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
			}
			i += 1;
		}
	}
	}
	else if (msgid == 1 || msgid == 2){
		pwd = buffer_read(buffer, buffer_s16);
		if (global.pwd != -1 && pwd != global.pwd){
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_bool,false);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			network_destroy(socket);
			ds_list_delete(socket_list,ds_list_find_index(socket_list,socket));
		}
		else{
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_bool,true);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			receivedPwd[msgid-1] = true;
		}
	}
}