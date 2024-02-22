function CreateAttack(dmg,stunDur,sprite,life,canBurn,tAtt,knocksp){
	var dmgMod = GetDmgMod();
	attack = instance_create_layer(x,y,"Attacks",tAtt);
	attack.attackDmg = ceil(dmg*dmgMod);
	attack.stunDur = stunDur;
	attack.sprite_index = sprite;
	attack.image_angle = attackAngle % 45;
	attack.player = id;
	attack.life = life;
	if (canBurn && burnBuffT > 0){
		attack.burnT = 61;
		attack.burnDmg = max(1,floor(attack.attackDmg/4));
	}
	attack.xknocksp = round(dcos(attackAngle)*knocksp);
	attack.yknocksp = -round(dsin(attackAngle)*knocksp);
}