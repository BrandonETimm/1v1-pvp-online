function AttackHitbox(dmg, stun, kb, canBurn){
	var angle = GetAngleMod(attackAngle);
	if (angle == GetAngleMod(currAttAngle)) angle = currAttAngle;
	else angle = (angle - 2)*45;

	if (canBurn && burnBuffT > 0) Attack(dmg,stun,61,max(1,floor(dmg/4)),dcos(angle)*kb,-dsin(angle)*kb,false);
	else Attack(dmg,stun,0,0,dcos(angle)*kb,-dsin(angle)*kb,false);
}