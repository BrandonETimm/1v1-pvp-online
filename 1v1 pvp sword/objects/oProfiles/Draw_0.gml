var _cGray = make_color_rgb(80,80,80);
if (edit != -1){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite(sEditProfileBG,0,480,270);
	_colour = _cGray;
	if (selected == 0) _colour = c_white;
	draw_sprite_ext(sProfileBtnBG,0,120,60,1,1,0,_colour,1);
	draw_text(120,60,"Back");
	_colour = _cGray;
	if (selected == 1) _colour = c_white;
	draw_sprite_ext(sProfileNameBG,0,400,60,1,1,0,_colour,1);
	draw_sprite_ext(sProfileNameFr,0,400,60,1,1,0,c_white,1);
	draw_set_halign(fa_left);
	draw_text(290,60,currEditInfo[0]);
	draw_set_halign(fa_center);
	for (var i = 2 ; i < 14 ; i += 2){
		for (var j = 0 ; j < 2 ; j++){
			_colour = _cGray;
			if (selected == i+j) _colour = c_white;
			draw_sprite_ext(sProfileBtnBG,0,250+j*150,80+22*i,1,1,0,_colour,1);
			draw_sprite_ext(sProfileBtnFr,0,250+j*150,80+22*i,1,1,0,c_white,1);
			draw_text(250+j*150,80+22*i,currEditInfo[i+j-1]);
		}
	}
	for (var i = 0 ; i < 2 ; i++){
		_colour = _cGray;
		if (selected == i+14) _colour = c_white;
		draw_sprite_ext(sProfileBtnBG,0,400,424+44*i,1,1,0,_colour,1);
	}
	if (currEditInfo[13]){
		draw_sprite(sDashDirSel,0,440,424);
		draw_sprite(sDashDirNotSel,0,440,468);
	}
	else{
		draw_sprite(sDashDirNotSel,0,440,424);
		draw_sprite(sDashDirSel,0,440,468);
	}
	for (var i = 2 ; i < 10 ; i += 2){
		for (var j = 0 ; j < 2 ; j++){
			_colour = _cGray;
			if (selected == i+j+14) _colour = c_white;
			draw_sprite_ext(sProfileBtnBG,0,700+j*150,80+22*i,1,1,0,_colour,1);
			draw_sprite_ext(sProfileBtnFr,0,700+j*150,80+22*i,1,1,0,c_white,1);
			draw_text(700+j*150,80+22*i,currEditInfo[i+j+12]);
		}
	}
	for (var i = 0 ; i < 2 ; i++){
		_colour = _cGray;
		if (selected == i+24) _colour = c_white;
		draw_sprite_ext(sProfileBtnBG,0,850,336+44*i,1,1,0,_colour,1);
	}
	if (currEditInfo[22]){
		draw_sprite(sDashDirSel,0,890,336);
		draw_sprite(sDashDirNotSel,0,890,380);
	}
	else{
		draw_sprite(sDashDirNotSel,0,890,336);
		draw_sprite(sDashDirSel,0,890,380);
	}
	if (selected == 1 && editSelect) draw_text(480,270,currName);
	else draw_text(480,270,prevPressed);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
else if (shown){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(make_color_rgb(80,80,80));
	draw_sprite(sProfiles,0,480,270);
	var _colour = c_white
	for (var i = 0 ; i < 10 ; i++){
		for (var j = 0 ; j < 5 ; j++){
			_colour = _cGray;
			if (j+i*5 == selected) _colour = c_white;
			draw_sprite_ext(sProfileBtnBG,0,480-360+150*j,270-220+i*49,1,1,0,_colour,1);
			draw_sprite(sProfileBtnFr,0,480-360+150*j,270-220+i*49);
			if (profInfo[j+i*5][0] != ""){
				draw_set_halign(fa_left);
				
				draw_text(424-360+150*j,270-220+i*49,profInfo[j+i*5][0]);
			}
			else{
				draw_set_halign(fa_middle);
				draw_text(480-360+150*j,270-220+i*49,"New");
			}
		}
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}