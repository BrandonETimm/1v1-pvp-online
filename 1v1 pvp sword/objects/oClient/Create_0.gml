client = network_create_socket(network_socket_tcp);
network_set_config(network_config_connect_timeout,3000);
var connected = network_connect(client,global.servIP,global.portNum);
if (connected >= 0){
	client_buffer = buffer_create(1024,buffer_fixed,1);
	buffer_seek(client_buffer,buffer_seek_start,0);
	buffer_write(client_buffer,buffer_u8,1+oServerButton.p2);
	buffer_write(client_buffer,buffer_s16,global.pwd);
	network_send_packet(client,client_buffer,buffer_tell(client_buffer));
}
else{
	if (instance_exists(oServer)) instance_destroy(oServer);
	instance_destroy(oServerButton);
	instance_destroy();
}