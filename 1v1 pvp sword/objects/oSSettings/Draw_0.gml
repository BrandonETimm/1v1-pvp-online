draw_sprite_part(sSSettings,0,0,250-31.25*appearAnim,440,63*appearAnim,x-220,y-31.25*appearAnim);
var _offset = 0;
if (editingName != -1){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x,y,currName);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	exit;
}
switch(subSelected){
	case 0: _offset = 0; break;
	case 1: _offset = 17; break;
	case 2: _offset = 33; break;
}
var _colour = c_white
var _gray = make_color_rgb(80,80,80);
var _val = 0;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(_gray);
for (var i = 0 ; i < 9 ; i++){
	for (var j = 0 ; j < 2 ; j++){
		if (y-200+50*i > y-31.25*appearAnim && y-200+50*i < y+63*appearAnim)
		{
			_val = _offset+j+i*2;
			if (_val == 50) _val = 49;
			draw_set_halign(fa_center);
			if (j+i*2 == btnSelected) _colour = c_white;
			else _colour = _gray
			draw_sprite_ext(sProfileBtnBG,0,x-70+140*j,y-200+i*50,1,1,0,_colour,1);
			draw_sprite(sProfileBtnFr,0,x-70+140*j,y-200+i*50);
			if (j+i*2 == 17 && subSelected < 2){
				draw_text(x-70+140*j,y-200+i*50,"Next");
			}
			else if (j+i*2 == 16 && subSelected > 0){
				draw_text(x-70+140*j,y-200+i*50,"Previous");
			}
			else{
				if (oProfiles.profInfo[_val][0] == ""){
					draw_text(x-70+140*j,y-200+i*50,"New");
				}
				else{
					draw_set_halign(fa_left);
					draw_text(x-124+140*j,y-200+i*50,oProfiles.profInfo[_val][0]);
				}
			}
		}
	}
}
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);