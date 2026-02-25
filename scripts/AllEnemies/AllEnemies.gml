
enum STATS {
	STR,
	DEX,
	CON,
	INT,
	WIS,
	CHA
}

enum TARGETS {
	FIRST,
	MAX,
	ALL, 
}

global.Actions = {
		placeholder: {
			name: "Placeholder", 
			desc: "Forces an enemy to be stuck in place",
			callout: "{0} stickys the floor!",

			modifier: 0,
			stat: STATS.DEX,
			distance: 2,
			friendlyfire: false,
			targets: TARGETS.FIRST,
			targetsamnt: 2,
			
			func: function(_user, _targets) {
				// gets squares in the distance (new func!!)
				// for loop that gets all the plausible targets (friendlyfire) (also a func)
				// for loop that finds out who they should get in those targets (amount, first or max) (also func)
				// applies the status affect
			}
		}
}
	
global.Enemies = {

	MrPlaceholder: {
		Name: "Placeholder",
		Level: 18,
		Stats: [2, 7, 3, 2, 3, 1],
		
		HP: 12	,
		SP: 1,
		
		Actions: [],
		
		Bonus: [],
		
		React: [],
		
		Sprites: {idle: sSlimeIcon}
	}	
}
