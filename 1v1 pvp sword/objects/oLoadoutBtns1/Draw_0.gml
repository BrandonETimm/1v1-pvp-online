if (doneSelect) exit;
if (controller == -1){
	draw_text(240+p2*480,270,"Join");
	exit;	
}
else if (showTut){
	draw_sprite(sSSettings,0,240+p2*480,270);
	switch(tutNum){
		case 0: break;
		case 1: break;
		case 2: break;
	}
	draw_text(240+p2*480,270,tutNum);
	exit;
}

var _bgGray = make_color_rgb(100,100,100);
var _colour = c_white;
_colour = _bgGray;
for (var i = 0 ; i < 3 ; i++){
	_colour = _bgGray;
	if (btnSelected == i) _colour = c_white;
	draw_sprite_ext(sMainAttackBG,0,120+p2*480+120*i,80,1,1,0,_colour,1);
	draw_sprite(sMainAttack,0,120+p2*480+120*i,80);
}
for (var i = 3 ; i < 7 ; i++){
	_colour = _bgGray;
	if (btnSelected == i) _colour = c_white;
	draw_sprite_ext(sAttBG,0,155+170*(i % 2 == 0)+p2*480,210+145*(i > 4),1,1,0,_colour,1);
	draw_text(155+166*(i % 2 == 0)+p2*480,250+145*(i > 4),i-2);
}
for (var i = 7 ; i < 9 ; i++){
	_colour = _bgGray;
	if (btnSelected == i) _colour = c_white;
	draw_sprite_ext(sSettingBG,0,155+170*(i % 2 == 0)+p2*480,475,1,1,0,_colour,1);
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (profileSel == -1) draw_text(155+p2*480,475,"Player " + string(p2+1));
else draw_text(155+p2*480,475,oProfiles.profInfo[profileSel][0]);
draw_text(325+p2*480,475,"Ready");
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (selected){
	if (btnSelected != 7){
		draw_set_colour(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(20+p2*480,20,459+p2*480,519,false);
		draw_set_colour(c_white);
		draw_set_alpha(1);
		if (btnSelected == 8) draw_sprite(sReady,0,240+p2*480,270);
		else{
			if (btnSelected < 3){
				draw_sprite(sBtnArrow,0,180+p2*480+120*btnSelected,80);
				draw_sprite_ext(sBtnArrow,0,60+p2*480+120*btnSelected,80,-1,1,0,c_white,1);
				draw_sprite(sAbilBub,0,240+p2*480,320);
				draw_set_colour(c_black);
				draw_text_ext(160+p2*480,180,SpecialTexts(),16,162);
				draw_set_colour(c_white);
			}
			else{
				draw_sprite(sBtnArrow,0,225+170*(btnSelected % 2 == 0)+p2*480,210+145*(btnSelected > 4));
				draw_sprite_ext(sBtnArrow,0,85+170*(btnSelected % 2 == 0)+p2*480,210+145*(btnSelected > 4),-1,1,0,c_white,1);
				draw_sprite(sAbilBub,0,370+p2*480-260*(btnSelected % 2 == 0),270+40*(btnSelected > 4));
				draw_set_colour(c_black);
				draw_text_ext(290+p2*480-260*(btnSelected % 2 == 0),130+40*(btnSelected > 4),SpecialTexts(),16,162);
				draw_set_colour(c_white);
			}
		}
	}
}

draw_text(40,40+p2*40,backHold);
draw_text(60,40+p2*40,specials);