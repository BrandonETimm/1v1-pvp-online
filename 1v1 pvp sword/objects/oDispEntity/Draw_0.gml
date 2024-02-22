draw_self();
if (sprite_index == sGrapple){
	player = oPlayer1;
	if (connectedP == 1) player = oPlayer2;
	draw_line_width(player.dispx,player.dispy,x,y,3);
}