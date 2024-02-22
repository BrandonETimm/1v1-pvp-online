if (!oServerButton.mult) draw_self();
else draw_sprite(sprite_index,0,dispx,dispy);
if (!instance_exists(oClient)) draw_text(700,20,string(hp));
else draw_text(700,20,string(dispHp));

draw_text(860,180,attSp1CD);
draw_text(860,220,attSp2CD);
draw_text(860,260,attSp3CD);
draw_text(860,300,attSp4CD);
draw_text(860,340,utilSpCD);
draw_text(860,380,rangSpCD);