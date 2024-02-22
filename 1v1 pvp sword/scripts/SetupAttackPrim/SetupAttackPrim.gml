function SetupAttackPrim(){
	switch(specials[1]){
		case 0:
			bAttackT = 21;
			bAttNum = !bAttNum
			break;
		case 1:
			if (bAttNum < 2){
				bAttackT = 12;
				bAttNum += 1;
			}
			else{
				bAttackT = 18;
				bAttNum = 0;
			}
			break;
		case 2:
			if (bAttNum == 0){
				bAttackT = 15;
				bAttNum = 1;
			}
			else{
				bAttackT = 21;
				bAttNum = 0;
			}
			break;
		case 3:
			bAttackT = 36;
			break;
	}

	attackVal = 0;
}