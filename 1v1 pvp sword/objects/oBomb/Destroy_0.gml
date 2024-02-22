expl = instance_create_layer(x,y,"Attacks",oExplosion);
expl.dmg = dmg;
expl.stunDur= stunDur;
expl.knockbacksp = knockbacksp;
if (expl.dmg == 0) expl.player = player;
if (selfBomb) expl.player = player;