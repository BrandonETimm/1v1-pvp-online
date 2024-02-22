if (oCheckDead.p1Dead || oCheckDead.p2Dead) exit;
if (global.paused == -4){
	draw_text(480,260,oPlayer1.controller);
	draw_text(480,280,oPlayer2.controller);
}
else if (global.paused != -1){
	draw_set_halign(fa_center);
	draw_set_color(c_gray);
	if (selected == 0) draw_set_color(c_white);
	draw_text(480,250,"Resume");
	draw_set_color(c_gray);
	if (selected == 1) draw_set_color(c_white);
	draw_text(480,270,"Reset Controllers");
	draw_set_color(c_gray);
	if (selected == 2) draw_set_color(c_white);
	draw_text(480,290,"Quit");
	draw_set_color(c_white);
	draw_set_halign(fa_left);
}