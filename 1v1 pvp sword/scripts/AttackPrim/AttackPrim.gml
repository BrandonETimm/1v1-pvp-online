function AttackPrim(){
	switch(specials[1]){
		case 0:
			if (bAttNum){
				AttackHitbox(4, 10, 2, true);
			}
			else{
				AttackHitbox(7, 5, 8, true);
			}
			break;
		case 1:
			if (bAttNum != 0){
				AttackHitbox(2, 5, 2, true);
			}
			else{
				AttackHitbox(6, 8, 6, true);
			}
			break;
		case 2:
			if (bAttNum){
				AttackHitbox(6, 5, 2, true);
			}
			else{
				AttackHitbox(6, 5, 4, true);
			}
			break;
		case 3:
			AttackHitbox(10, 10, 16, true);
			break;
	}
}