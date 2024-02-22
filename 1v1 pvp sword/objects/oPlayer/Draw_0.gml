if (!oServerButton.mult) draw_self();
else draw_sprite(sprite_index,0,dispx,dispy);
if (!instance_exists(oClient)) draw_text(20,20,string(hp));
else draw_text(20,20,string(dispHp));
draw_text(60,20,string(movex));
draw_text(60,40,string(movey));
draw_text(60,60,string(x));
draw_text(60,80,string(y));
draw_text(80,20,string(dashCD));