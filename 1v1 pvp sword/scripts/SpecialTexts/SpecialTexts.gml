function SpecialTexts(){
	switch(btnSelected){
		case 0:
			switch(specials[0]){
				case 0: return "Grappling Hook:\n\nShoots out a grappling hook that hooks onto players and walls, pulling you towards them.\n\nAfter colliding with a wall, you can jump off of it.\nAfter hooking onto a player, you can hit them with a primary attack."
				case 1: return "Switch Stance:\n\nSwitch between aggressive and defensive stances.\n\nStart in Aggressive Stance.\n\nAggressive Stance:\nDeal more damage\nTake more damage\n\nDefensive Stance:\nTake less damage\nDeal less damage";
				case 2: return "Spear Dash:\n\nCharge in a direction. Has a long range, but does little damage.";
				case 3: return "Boost Bomb:\n\nDrop a bomb that detonates after reactivation or after a long duration\n\nThe explosion doesn't do damage, however it boosts both players and stuns opponents.";
				case 4: return "Ignite:\n\nPowers up your primary attacks, making them deal bonus damage over time based on the attack's strength.";
				case 5: return "Blink:\n\nTeleport a short distance in a given direction.";
				case 6: return "Accelerate:\n\nIncreases movement speed substantially for a short duration.";
			}
				
		case 1:
			switch(specials[1]){
				case 0: return "Sword:\nA two hit attack where the second hit does a bit more damage";
				case 1: return "Spear:\nThrust forward quickly twice, followed by a slow, strong thrust";
				case 2: return "Gauntlets:\nTwo quick, moderate strength attacks";
				case 3: return "Explosive Punch:\nA slow punch that creates a large, powerful explosion.";
			}
				
		case 2:
			switch(specials[2]){
				case 0: return "Sword Throw:\n\nThrows a sword that returns to you after travelling a certain distance or hitting a wall.";
				case 1: return "Spear Throw:\n\nThrows a spear after a small windup.";
				case 2: return "Bouncing Bullet:\n\nShoots a moderate speed bullet that gains power after bouncing off of walls.";
				case 3: return "Quick Shot:\n\nShoot a quick bullet that does little damage and doesn't stun.";
				case 4: return "Slow Shot:\n\nShoot a slow bullet that does massive damage.";
				case 5: return "Stun Gun:\n\nShoot a bullet that doesn't do much damage, but stuns for a moderate duration.";
				case 6: return "Sticky Bomb:\n\nShoots a bullet that sticks to people and walls. Detonates after a set amount of time.";
			}
				
		case 3:
		case 4:
		case 5:
		case 6:
			switch(specials[btnSelected]){
				case 0: return "Counter:\n\nUpon being hit with an attack, blocks it and hits the opponent with your sword.\n\nIf hit with a projectile, reflects it.";
				case 1: return "Spin Strike:\n\nSwing your sword in a circle around you.";
				case 2: return "Sword Sweep:\n\nSwing your sword over a large area in an arc, dealing massive damage";
				case 3: return "Triple Spin:\n\nSpin forward three times, carrying any opponents you hit with you.";
				case 4: return "Piercing Thrust:\n\nThrusts your spear forward after a long windup, dealing massive damage.";
				case 5: return "Quick Jab:\n\nThrusts your spear forward quickly.";
				case 6: return "Spear Charge:\n\nCharge in a direction with your spear for a set duration.\n\nUpon colliding with an opponent or a wall, jump away from them.";
				case 7: return "Windup Punch:\n\nCharge up your fist to dash forward, dealing massive damage.";
				case 8: return "Stunning Blow:\n\nPunch forward, stunning the opponent for a long duration.";
				case 9: return "Launching Blow\n\nLaunches the opponent away, dealing bonus damage if they collide with a wall.";
				case 10: return "Ground Breaker:\n\nPunch the ground, breaking it in an arc dealing damage to enemies caught in the blast.";
				case 11: return "Time Bomb:\n\nSet down an explosive that detonates after a set duration.";
				case 12: return "Self-Detonate:\n\nAttaches a time bomb to yourself, dealing high damage to a opponents and moderate damage to yourself after a set duration.";
				case 13: return "Landmine:\n\nSets down a landmine that explodes once stepped on. Activates after a set duration and can be activated by anyone.";
				case 14: return "Firewall:\n\nSets down a wall of fire that does damage when walked through and additional damage over time once exited.";		
			}
	}
}