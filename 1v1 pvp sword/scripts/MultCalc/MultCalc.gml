function MultCalc(){
	buffer_seek(oClient.client_buffer,buffer_seek_start,0);
	buffer_write(oClient.client_buffer,buffer_u8,1+oServerButton.p2);
	buffer_write(oClient.client_buffer,buffer_f16,key_left);
	buffer_write(oClient.client_buffer,buffer_f16,key_up);
	buffer_write(oClient.client_buffer,buffer_f16,key_right);
	buffer_write(oClient.client_buffer,buffer_f16,key_down);
	if (key_swing) buffer_write(oClient.client_buffer,buffer_u8,1);
	else if (key_util) buffer_write(oClient.client_buffer,buffer_u8,3);
	else if (key_dash) buffer_write(oClient.client_buffer,buffer_u8,6);
	else buffer_write(oClient.client_buffer,buffer_u8,0);
	buffer_write(oClient.client_buffer,buffer_u16,GetAttackAngle());
	network_send_packet(oClient.client,oClient.client_buffer,buffer_tell(oClient.client_buffer));
}