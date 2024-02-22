function CreateBomb(dmg,stunDur,img,time,isMine,selfBomb,boost,sp,knocksp){
	proj = instance_create_layer(x,y,"Attacks",oBomb);
	var dmgMod = GetDmgMod();
	proj.img = img;
	proj.dmg = ceil(dmg*dmgMod);
	proj.stunDur = stunDur;
	proj.isMine = isMine;
	proj.selfBomb = selfBomb;
	proj.boost = boost;
	proj.player = id;
	if (!isMine && !selfBomb) proj.image_angle = attackAngle;
	proj.time = time;
	proj.xspD = round(dcos(attackAngle)*sp);
	proj.yspD = -round(dsin(attackAngle)*sp);
	proj.knocksp = knocksp;
	proj.knockbacksp = knocksp;
}