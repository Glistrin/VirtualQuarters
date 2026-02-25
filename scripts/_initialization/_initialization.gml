enum CHARAS {
	MAPLE = 1,
	LEON,
	KM,
	MYER,
	JADE,
	HODDO,
	TEM,
	SYOL
}

#macro RES_W 640
#macro RES_H 360
surface_resize(application_surface,RES_W, RES_W)

global.Quests = {
	Testing: {
	TalkedtoBaconornoGames: false,
	TalkedtoTracker: false
	}
}

global.CurrentRoom = -1
global.CurrentY = -1
global.CurrentX = -1
global.CurrentDir = -1

global.CurrentBattle = -1


global.MainChara = {
	Sprites: {
		Walk: PlayerWalk,
		Idle: PlayerIdle,
		Icon: PlayerIcon
	}
}

global.MapleChara = {
	Sprites: {
		Walk: MapleWalk,
		Idle: MapleIdle,
		Icon: MapleIcon
	}
}

global.KMChara = {
	Sprites: {
		Walk: KMWalk,
		Idle: KMIdle,
		Icon: KMIcon
	}
}

global.MyerChara = {

}

global.Party = [global.MainChara, global.KMChara, global.MapleChara]
global.CurrentPartyM = 0
