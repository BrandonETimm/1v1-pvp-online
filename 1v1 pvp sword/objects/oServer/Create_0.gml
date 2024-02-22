enum network{
	move	
}
receivedPwd = [false,false]
network_create_server(network_socket_tcp, global.portNum, 32);
server_buffer = buffer_create(1024,buffer_fixed,1);
socket_list = ds_list_create();