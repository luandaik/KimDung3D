local tblProto = {
	[0x6202] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'groupId', }
		}
	end,
	[0x5103] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'info','playerId', 'time', }},}
		}
	end,
	[0x5110] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v8', 'v8', 'v8', }},},
			{{true,{'count','playerId', 'todayCount', 'totalCount', 'createTime', 'lastUpdate', 'instanceId', }},}
		}
	end,
	[0x0E94] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'b', }},{true,{'v4', 'v4', }},},
			{{true,{'unlockedlist','id', 'expireTime', 'firstGet', }},{true,{'lockedList','id', 'currentNum', }},}
		}
	end,
	[0x1051] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v8', {false,{'v4', 'v4', }},}},},
			{'result', {false,{'gemchanged','userid', {false,{'gem','pos', 'id', }},}},}
		}
	end,
	[0x4f09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 's', 's', },
			{'instanceId', 'tameMessage', 'tameHole', }
		}
	end,
	[0x6101] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v8', }},'v8', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},},
			{{true,{'infos','count', 'refreshTime', 'toName', 'toPlayer', 'round', 'toIcon', 'name', 'player', 'icon', 'isEscape', 'id', }},'lastRefreshTime', 'leftRefreshMyTimes', 'leftRefreshOthersTimes', 'leftRefreshBackTimes', {true,{'dropMoney','index', 'gameMoney', }},}
		}
	end,
	[0x1507] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {false,{'v4', 'v4', 'v4', }},},
			{'instanceId', {false,{'acupointInfo','position', 'level', 'breachLevel', }},}
		}
	end,
	[0x7f20] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', }},},
			{{true,{'stateList','functionId', 'newMark', }},}
		}
	end,
	[0x6307] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', },
			{'zongjuli', 'isFirstFree', 'boxIndex', 'round', 'actTime', 'historyBest', 'specialLength', }
		}
	end,
	[0x4415] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'coin', }
		}
	end,
	[0x6906] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', {false,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},'tv4', },
			{{false,{'info','floorId', {false,{'item','type', 'number', 'itemId', }},'minedCount', 'reviveCount', 'resetCount', {true,{'luckyBag','type', 'number', 'itemId', }},}},'befPointType', }
		}
	end,
	[0x1304] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 'v4', },
			{'win', 'myRank', }
		}
	end,
	[0x5930] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'hasBuriedTreasures', 'remainingTimes', 'hasTreausre', }
		}
	end,
	[0x1924] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 'v8', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{true,{'giftList','id', 'type', 'resType', 'resId', 'number', 'consumeType', 'consumeId', 'consumeNumber', 'isLimited', 'consumeAdd', 'needVipLevel', 'beginTime', 'endTime', 'maxType', 'maxNum', 'vipMaxNumMap', 'oldPrice', 'limitType', 'isHot', 'timeType', 'orderNo', }},'type', }
		}
	end,
	[0x0e30] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', 'v4', 'v4', },
			{'chatFree', 'chapterSweepFree', 'lastUpdate', 'crossFreeChat', 'vipDeclaration', }
		}
	end,
	[0x2600] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'myCode', }
		}
	end,
	[0x3404] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'martialId', }
		}
	end,
	[0x1920] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'consume', 'coin', 'mutil', }
		}
	end,
	[0x1042] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', 'v8', },
			{'roleId', 'equipment', 'drop', }
		}
	end,
	[0x5f07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'guildId', 'quality', }
		}
	end,
	[0x4441] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', }},},
			{{true,{'infos','eliteId', {true,{'battleInfo','playerId', 'power', 'name', 'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'id', }},}
		}
	end,
	[0x6701] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'tv8', }},},
			{{true,{'data','type', 'formation', }},}
		}
	end,
	[0x5162] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3f02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'pos', }
		}
	end,
	[0x1000] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v8', 'v4', }},{true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},{true,{'v8', 'v4', 'v4', }},},
			{{true,{'equipmentlist','userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'ItemInfo','id', 'num', }},{true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},{true,{'keyinfo','id', 'template_id', 'level', }},}
		}
	end,
	[0x1052] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'result', 'userid', 'pos', }
		}
	end,
	[0x430E] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5923] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'chat','playerId', 'name', 'useIcon', 'frameId', 'starHeroRanking', 'chatTime', 'vipLevel', 'content', 'level', 'quality', }},}
		}
	end,
	[0x430F] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5f04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'guildId', 'targetId', }
		}
	end,
	[0x2801] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7901] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v8', 'v4', 's', 's', {false,{'v4', 'v4', 'v4', }},'v4', },
			{'grade', 'star', {true,{'challengers','playerId', 'name', 'grade', 'star', 'serverName', 'useIcon', 'power', 'state', 'level', }},'lastSeasonTime', 'stopBattleCount', 'missionTypes', 'drowMissions', {false,{'lastSeasonGrade','grade', 'star', 'rank', }},'status', }
		}
	end,
	[0x6e11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x1809] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x1F04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'skill_point', }
		}
	end,
	[0x1D02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', },
			{'playerName', 'bookId', }
		}
	end,
	[0x150B] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'baseRate', 'extraRate', 'payCount', }
		}
	end,
	[0x7107] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 's', 'v4', }},'v4', 'v4', 'v4', 'v4', },
			{{true,{'info','ranking', 'name', 'guildName', 'serverName', 'integral', }},'myRanking', 'myIntegral', 'bestIntegral', 'guildIntegral', }
		}
	end,
	[0x3102] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6010] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'result', 'instanceId', 'level', }
		}
	end,
	[0x5152] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', }},{true,{'v8', 'v4', }},'v8', 'v4', 'v4', },
			{{true,{'battleRole','instanceId', 'position', }},{true,{'assistant','instanceId', 'position', }},'startTime', 'coin', 'employCount', }
		}
	end,
	[0x6004] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v8', 'v4', 'v4', },
			{'result', 'roleId', 'essential', 'itemId', 'pos', }
		}
	end,
	[0x3310] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'type', 'currstep', }
		}
	end,
	[0x6011] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'v8', 'v4', 'v4', }},},
			{{true,{'mosaic','result', 'roleId', 'essential', 'itemId', 'pos', }},}
		}
	end,
	[0x1402] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'hp', 'neigong', 'waigong', 'neifang', 'waifang', 'hurt', }
		}
	end,
	[0x4f06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', {true,{'v8', 'v4', 'v8', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'v4', }},'s', 's', }},},
			{'removePetId', {true,{'battlePetInfo','instanceId', 'templateId', 'trainerId', 'quality', 'star', 'formationType', {true,{'holeAttResponse','type', 'level', 'quality', }},'tameMessage', 'tameHole', }},}
		}
	end,
	[0x7F01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{{false,{'reward','type', {true,{'items','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x4525] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'betRadio', }
		}
	end,
	[0x3214] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', {true,{'v4', 'b', 'v4', 'v4', 'v4', }},'v4', 'v4', }},'v4', 'v4', },
			{{true,{'BloodyBoxList','index', 'status', {true,{'BloodyBoxList','index', 'bIsget', 'type', 'itemId', 'number', }},'needResType', 'needResNum', }},'index', 'getType', }
		}
	end,
	[0x2102] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'records','type', 'maxValue', 'todayUse', 'currentValue', 'todayBuyTime', 'cooldownRemain', 'waitTimeRemain', 'todayResetWait', }},}
		}
	end,
	[0x6b07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'id', 'startTime', }
		}
	end,
	[0x3b03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'takeTime', 'trueCount', }
		}
	end,
	[0x5701] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3305] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'type', 'rewardId', }
		}
	end,
	[0x4604] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7b14] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6e18] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'betRadio', }
		}
	end,
	[0x6024] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v8', },
			{'result', 'bible', 'keyId', }
		}
	end,
	[0x7b09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'instanceId', 'itemIed', }
		}
	end,
	[0x4302] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'b', }},},
			{{true,{'list',{false,{'info','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'apply', }},}
		}
	end,
	[0x7407] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1B02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'tv4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'chat','chatType', 'content', 'playerId', 'roleId', 'quality', 'name', 'vipLevel', 'level', 'timestamp', 'guildId', 'guildName', 'competence', 'invitationGuilds', 'titleType', 'guideType', 'icon', 'headPicFrame', 'serverId', 'serverName', 'audioTime', 'audioId', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x1520] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v4', },
			{'userid', 'oldLevel', 'newLevel', 'skillId', }
		}
	end,
	[0x7F10] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', }},},
			{{true,{'resource','resource', 'num', }},}
		}
	end,
	[0x1700] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'curId', }
		}
	end,
	[0x3212] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', {false,{'v4', 'b', 'v4', 'v4', 'v4', }},}},},
			{{false,{'updateInfo','boxIndex', {false,{'prize','index', 'bIsget', 'type', 'itemId', 'number', }},}},}
		}
	end,
	[0x5c01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'b', 'b', 'v4', {false,{'v4', 's', 's', 'v4', }},{true,{'v4', 's', 's', 'v4', }},}},},
			{{true,{'config','id', 'goods', 'price', 'grouponPrice', 'discount', 'count', 'customerLimit', 'beginTime', 'endTime', }},{true,{'grouponInfo','id', 'isSettle', 'isEnd', 'totalCount', {false,{'myInfo','playerId', 'name', 'guildName', 'num', }},{true,{'playerInfo','playerId', 'name', 'guildName', 'num', }},}},}
		}
	end,
	[0x3221] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5934] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v8', 'v8', 'v4', 's', 's', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'buriedHistory','playerName', 'treasureId', 'leftTimes', 'buriedTime', 'mapId', 'isHiddenName', 'dropItem', 'digName', 'serverName', 'rowId', 'colId', 'specialBox', }},}
		}
	end,
	[0x0e98] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{false,{'info','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x1b05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'playerId', }
		}
	end,
	[0x4445] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'smallStatus', 'bigStatus', 'secondlyProgress', }
		}
	end,
	[0x1D50] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', 'v4', 'v4', },
			{'playerName', 'templateId', 'number', 'operationType', }
		}
	end,
	[0x3208] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'enemyList','name', 'section', 'anger', 'power', {true,{'roles','profession', 'lv', 'index', 'maxHp', 'currHp', 'quality', 'forgingQuality', }},'icon', 'headPicFrame', 'playerId', 'starHeroRanking', }},}
		}
	end,
	[0x6029] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'instanceId', }
		}
	end,
	[0x7c03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{'id', {true,{'rewardInfo','type', 'radio', {true,{'item','itemId', 'type', 'number', }},}},}
		}
	end,
	[0x3211] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', }},'v4', },
			{'section', {true,{'items','rewardId', 'getType', 'status', }},'status', }
		}
	end,
	[0x1817] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 's', },
			{'isSuccess', 'buffStr', }
		}
	end,
	[0x5164] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v8', 'v8', }},},
			{{true,{'count','playerId', 'todayCount', 'totalCount', 'createTime', 'lastUpdate', }},}
		}
	end,
	[0x7803] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v8', },
			{'playerId', 'name', 'hurt', }
		}
	end,
	[0x4910] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', }},'v4', 'v4', },
			{{true,{'result','exp', 'oldLevel', 'currentLevel', 'coin', {true,{'item','type', 'number', 'itemId', }},'id', }},'nextId', 'tokens', }
		}
	end,
	[0x4708] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', },
			{'ColorEggSpecialReward', 'clearRewardState', }
		}
	end,
	[0x6f04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', }},'v4', 'v4', },
			{'rankGroup', {true,{'topPlayerRanks','rank', 'playerName', 'playerLevel', 'useIcon', 'fightPower', 'playerScore', 'serverName', 'guildName', 'playerGroup', 'playerId', }},{true,{'otherRanks','beginRank', 'endRank', 'playerRank', 'playerName', 'minScore', 'playerId', 'playerScore', }},'myScore', 'myRank', }
		}
	end,
	[0x6e14] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 's', 'v4', },
			{'id', 'serverId', 'name', 'sycee', }
		}
	end,
	[0x5939] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'digTreasure', 'buriedTreasure', }
		}
	end,
	[0x0F02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', }},'v4', 'v4', {false,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv8', 'tv8', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v8', 'v8', },
			{'result', {false,{'teamexp','typeid', 'oldExp', 'oldLev', 'currExp', 'currLev', 'addExp', }},{true,{'explist','typeid', 'oldExp', 'oldLev', 'currExp', 'currLev', 'addExp', }},{true,{'itemlist','type', 'itemid', 'num', }},{true,{'reslist','type', 'num', }},'rank', 'climblev', {false,{'championsInfo','atkWinStreak', 'atkMaxWinStreak', 'defWinStreak', 'defMaxWinSteak', 'score', 'atkFormation', 'defFormation', 'atkWinCount', 'atkLostCount', 'defWinCount', 'defLostCount', 'betWinCount', }},'achievement', 'challengeTime', 'worldHurt', }
		}
	end,
	[0x6002] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'result', 'drop', }
		}
	end,
	[0x0d00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', },
			{'statusCode', 'empty', }
		}
	end,
	[0x5b02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v8', }},{false,{'v4', 'v4', }},'v4', },
			{{true,{'historyInfo','id', 'type', 'time', }},{false,{'buyBackData','id', 'current', }},'consumeNum', }
		}
	end,
	[0x7e05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'progress', 'signTime', 'type', }
		}
	end,
	[0x4602] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3210] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'s', 'v4', 'v4', 'v4', }},},
			{'currSection', {true,{'enemy','name', 'section', 'star', 'roleId', }},}
		}
	end,
	[0x7e06] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'v8', }},},
			{{true,{'detil','type', 'startTime', 'endTime', }},}
		}
	end,
	[0x440b] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1701] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 'v4', },
			{'win', 'curId', }
		}
	end,
	[0x4603] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1604] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 'b', 'v8', 'v8', 'v8', }},},
			{{true,{'booklist','objID', 'resID', 'level', 'exp', 'lock', 'roleID', 'position', 'attrAdd', }},}
		}
	end,
	[0x3e03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'index', }
		}
	end,
	[0x1D21] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'mail','id', 'status', }},}
		}
	end,
	[0x5800] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'type', }
		}
	end,
	[0x180E] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x5011] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', }},},
			{{true,{'remind','status', 'endTime', }},}
		}
	end,
	[0x4310] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6005] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'result', 'bible', 'pos', }
		}
	end,
	[0x1D0B] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'rankingInfo','playerId', 'displayId', 'name', 'level', 'vipLevel', }},}
		}
	end,
	[0x1F06] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'useSkill_list','skillId', 'pos', }},}
		}
	end,
	[0x3b00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{'myTakeTime', 'myTrueCount', 'myRank', 'myDatiTotalCount', {true,{'rankInfo','playerId', 'name', 'takeTime', 'trueCount', 'datiTotalCount', 'rank', }},}
		}
	end,
	[0x4440] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','guildId', 'guildName', 'bannerId', 'serverName', 'score', 'winCount', 'lostCount', 'cityId', }},}
		}
	end,
	[0x5a01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},},
			{{true,{'config','id', 'goods', 'price', 'currentPrice', 'customerLimit', 'goodsLimit', 'discount', 'beginTime', 'endTime', }},{true,{'dataInfo','id', 'current', 'serverCurrent', }},}
		}
	end,
	[0x1704] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', }},},
			{{true,{'carbonList','index', 'leftTimes', 'isEnable', 'coolTime', }},}
		}
	end,
	[0x4b02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'stage', }
		}
	end,
	[0x3101] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'val', }
		}
	end,
	[0x4520] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 's', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', },
			{'lastOpenTime', 'name', 'power', 'useCoin', 'framId', 'serverName', 'formation', 'myRank', 'serverUseCoin', 'serverFramId', 'serverPlayerName', 'serverServerName', 'serverRank', 'serverPower', 'serverStarHeroRanking', 'ladderGrade', }
		}
	end,
	[0x2802] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'id', }
		}
	end,
	[0x4c04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{'myRanking', 'myErrantry', 'myGuildName', 'myName', 'myUseCoin', 'myFrameId', {true,{'guildGiveRank','guildId', 'guildName', 'playerId', 'playerName', 'useCoin', 'frameId', 'rank', 'errantry', }},}
		}
	end,
	[0x4b11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', }},},
			{'myPlayerId', 'myRanking', 'myAttackCount', {true,{'guildBossAttackRankData','playerId', 'playerName', 'attackCount', 'rank', }},}
		}
	end,
	[0x7908] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'b', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{{true,{'info','name', 'power', 'isWin', 'index', {true,{'items','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x4901] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'score', 'nextId', 'tokens', }
		}
	end,
	[0x0e42] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'resVersion', }
		}
	end,
	[0x1D0F] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', },
			{'playerId', 'name', }
		}
	end,
	[0x6e10] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4','s', },
			{'type','msg', }
		}
	end,
	[0x6312] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'success', }
		}
	end,
	[0x7400] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'tv4', 'v4', {true,{'v4', 'tv4', 'v4', 'v4', 'v4', 's', 'v8', }},'v4', },
			{'level', 'exp', 'praiseCount', 'praiseFriends', 'drawCount', {true,{'events','eventId', 'players', 'totleCount', 'count', 'state', 'args', 'time', }},'eventOpenCount', }
		}
	end,
	[0x7505] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'freeCount', }
		}
	end,
	[0x2206] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'boxContent','index', 'resType', 'resId', 'number', }},}
		}
	end,
	[0x5924] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', }},{true,{'v8', 'v4', }},},
			{'chapterId', {true,{'copy','copyId', 'pass', {true,{'monster','index', 'hp', 'maxHp', }},'killName', }},{true,{'data','instanceId', 'hp', }},}
		}
	end,
	[0x6e07] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'chat','playerId', 'name', 'useIcon', 'frameId', 'starHeroRanking', 'chatTime', 'vipLevel', 'content', 'level', 'quality', 'ladderGrade', }},}
		}
	end,
	[0x1921] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'count', }
		}
	end,
	[0x6111] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5926] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},},
			{{false,{'obtain','type', 'itemId', 'number', }},{true,{'show','type', 'itemId', 'number', }},}
		}
	end,
	[0x6028] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v8', }},},
			{{true,{'bible','bibleId', 'noteChapterId', 'noteFloorId', 'BibleKeyId', }},}
		}
	end,
	[0x6012] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', {false,{'v8', {true,{'v4', 'v4', }},}},},
			{'bibleId', 'result', {false,{'info','bibleId', {true,{'info','pos', 'itemId', }},}},}
		}
	end,
	[0x5935] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v8', 'v8', 'v4', 's', 's', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'digHistory','playerName', 'treasureId', 'leftTimes', 'buriedTime', 'mapId', 'isHiddenName', 'dropItem', 'digName', 'serverName', 'rowId', 'colId', 'specialBox', }},}
		}
	end,
	[0x6c01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', }},},
			{{false,{'data','id', 'value', 'isBuy', }},}
		}
	end,
	[0x6e01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', }},'tv4', 'v4', 'v4', 'v8', },
			{{false,{'team','id', 'name', 'type', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'loginTime', 'position', 'vipLevel', 'level', 'inspireNum', 'inspireSycee', 'ladderGrade', }},'serverId', 'serverName', }},'playerId', 'signUp', 'bet', 'leiZhuTeamId', }
		}
	end,
	[0x7907] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'grade', 'star', }
		}
	end,
	[0x5f01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},{true,{'v4', 's', 'v4', 'v4', 's', {true,{{false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},'s', 's', 'v4', 'v4', }},}},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', {true,{'v4', 'v4', 'v4', 's', 'v4', 's', 's', 'v4', 'v4', 'v4', }},}},{true,{{true,{{false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},'s', 's', 'v4', 'v4', 'v4', 'v4', }},}},},
			{'targetId', 'attGuildId', 'isEscort', 'defBattleResult', 'attBattleResult', 'updateTime', 'resetTime', {true,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},{true,{'cardRankInfo','myGuildId', 'bannerId', 'lastScore', 'myRanking', 'myGuildName', {true,{'cardRank',{false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},'guildName', 'serverName', 'serverId', 'rank', }},}},{true,{'killRankInfo','myPlayerId', 'useCoin', 'frameId', 'lastScore', 'myRanking', 'myPlayerName', 'guildName', {true,{'killRank','playerId', 'useCoin', 'frameId', 'serverName', 'serverId', 'playerName', 'guildName', 'power', 'killCount', 'rank', }},}},{true,{'targetRankInfo',{true,{'targetRank',{false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},'guildName', 'serverName', 'serverId', 'killCount', 'time', 'rank', }},}},}
		}
	end,
	[0x0d11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'resVersion', }
		}
	end,
	[0x2604] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 'b', 'v4', 's', },
			{'myCode', 'invited', 'invitedAward', 'inviteCount', 'getRewardRecord', }
		}
	end,
	[0x5403] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'success', }
		}
	end,
	[0x6e17] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', }},},
			{{false,{'team','id', 'name', 'type', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'loginTime', 'position', 'vipLevel', 'level', 'inspireNum', 'inspireSycee', 'ladderGrade', }},'serverId', 'serverName', }},}
		}
	end,
	[0x1b07] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'tv4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'infos','chatType', 'content', 'playerId', 'roleId', 'quality', 'name', 'vipLevel', 'level', 'timestamp', 'guildId', 'guildName', 'competence', 'invitationGuilds', 'titleType', 'guideType', 'icon', 'headPicFrame', 'serverId', 'serverName', 'audioTime', 'audioId', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x4451] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 's', },
			{'opsName', 'impeachmentDesc', }
		}
	end,
	[0x5005] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x2300] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 's', 'v4', 's', 'v4', 'b', 's', 's', 's', 's', 's', 'v4', 'b', 'b', 'b', },
			{'id', 'name', 'title', 'type', 'resetCron', 'status', 'history', 'icon', 'details', 'reward', 'beginTime', 'endTime', 'showWeight', 'crossServer', 'show', 'limitStore', }
		}
	end,
	[0x1801] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v4', 'v4', 's', 'v4', 's', 's', },
			{'gangId', 'gangName', 'memberNum', 'masterId', 'masterName', 'myGangRole', 'bulletin', 'buffStr', }
		}
	end,
	[0x5402] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{true,{'info','roleId', 'roleNum', 'roleSycee', 'isGetReward', }},'indexId', }
		}
	end,
	[0x3f06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'instanceId', 'templateId', 'roleId', 'pos', 'level', 'stepExp', 'quality', 'type', 'star', 'starLevel', }
		}
	end,
	[0x0F21] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{true,{{true,{'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'b', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 'v4', }},}},{true,{'v4', 'v4', }},{true,{'v4', 'b', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', }},'v4', }},{true,{'v4', 'v4', }},'tv4', 'b', },
			{{true,{'round',{true,{'action',{true,{'target','position', 'effectType', 'effectValue', {true,{'passiveEffect','type', 'value', }},{true,{'activeEffect','type', 'value', }},{true,{'newState','fromPos', 'stateTrigger', 'triggerId', 'stateId', 'stateLevel', 'result', }},{true,{'lostState','position', 'stateId', 'repeatNum', }},{true,{'stateCycle','position', 'stateId', 'effectType', 'effectValue', }},{false,{'deepHurt','type', 'value', }},}},{true,{'skill','skillId', 'level', }},{true,{'newState','fromPos', 'stateTrigger', 'triggerId', 'stateId', 'stateLevel', 'result', }},{true,{'lostState','position', 'stateId', 'repeatNum', }},{true,{'stateCycle','position', 'stateId', 'effectType', 'effectValue', }},'type', 'fromPos', }},{true,{'lostState','position', 'stateId', 'repeatNum', }},{true,{'stateCycle','position', 'stateId', 'effectType', 'effectValue', }},'roundIndex', }},{true,{'lastHp','position', 'currentHp', }},'energy', 'win', }
		}
	end,
	[0x5160] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'useType', 'fromId', }
		}
	end,
	[0x5500] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},'v4', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},{true,{'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{false,{'info','userid', 'id', 'level', 'curexp', 'quality', 'starlevel', 'starExp', {true,{'spellId','skillId', 'level', }},{true,{'equiplist','userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},{true,{'ppInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},{true,{'changePPInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},'skillStarLevel', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},{true,{'destiny','instanceId', 'templateId', 'roleId', 'pos', 'level', 'stepExp', 'quality', 'type', 'star', 'starLevel', }},}},}
		}
	end,
	[0x4f04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', },
			{'instanceId', 'formationType', 'type', }
		}
	end,
	[0x6f0a] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'tv4', },
			{'yesterdayRank', 'currentRank', 'rewardIds', }
		}
	end,
	[0x6e04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'playerId', }
		}
	end,
	[0x7b10] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', },
			{'removeXinfa', }
		}
	end,
	[0x4512] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3207] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'s', 'v4', 'v4', 'v4', }},},
			{'currSection', {true,{'allEnemys','name', 'section', 'star', 'roleId', }},}
		}
	end,
	[0x2303] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 's', 's', 'v4', }},},
			{{true,{'progress','id', 'progress', 'extend', 'got', 'lastUpdate', 'resetRemaining', }},}
		}
	end,
	[0x6e12] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{false,{'v8', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', }},{false,{'v8', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', }},'tv4', 'tv4', 'v8', }},{true,{'s', 'v4', 'v4', 's', 'v4', 'v8', }},'v4', 'v4', 'v4', 'v4', },
			{{true,{'info',{false,{'atkTeam','id', 'name', 'type', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'loginTime', 'position', 'vipLevel', 'level', 'inspireNum', 'inspireSycee', 'ladderGrade', }},'serverId', 'serverName', }},{false,{'defTeam','id', 'name', 'type', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'loginTime', 'position', 'vipLevel', 'level', 'inspireNum', 'inspireSycee', 'ladderGrade', }},'serverId', 'serverName', }},'result', 'replayId', 'createTime', }},{true,{'rank','name', 'integral', 'ranking', 'serverName', 'serverId', 'id', }},'integral', 'ranking', 'leizhuCount', 'first', }
		}
	end,
	[0x1E01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x5705] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', }},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'atkGuildTeamInfos','eliteId', {true,{'battleInfo','playerId', 'power', 'name', 'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'id', }},{true,{'replays','roundId', 'index', 'scene', 'team', 'atkPlayerId', 'defPlayerId', 'winPlayerId', 'replayId', }},}
		}
	end,
	[0x7701] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', }},},
			{{true,{'rechargeTicketInfo','instanceId', 'templateId', 'createTime', 'endTime', }},}
		}
	end,
	[0x1812] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x1A21] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'staus', }
		}
	end,
	[0x1404] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'rankList','name', 'rolenum', 'viplevel', 'level', 'questnum', 'playerid', }},}
		}
	end,
	[0x4519] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x6201] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'b', {true,{'s', 'v4', 'v4', 'v4', }},}},},
			{{true,{'list','roleId', 'x', 'y', 'scale', 'flipX', {true,{'msg','txt', 'delayF', 'delayB', 'index', }},}},}
		}
	end,
	[0x0D22] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'zone', }
		}
	end,
	[0x3300] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 's', 's', },
			{'type', 'status', 'startTime', 'endTime', }
		}
	end,
	[0x1023] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 's', },
			{'equipment', 'extra_attr', }
		}
	end,
	[0x7410] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', }},},
			{{true,{'records','type', 'recordstr', }},}
		}
	end,
	[0x1F01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},'v4', },
			{{true,{'skill_list','skillId', 'level', }},{true,{'useSkill_list','skillId', 'pos', }},'skill_point', }
		}
	end,
	[0x5906] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7b06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'instanceId', 'id', }
		}
	end,
	[0x1D61] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v8', 'v8', 'v4', 'v4', }},},
			{{true,{'msg','messageId', 'content', 'intervalTime', 'beginTime', 'endTime', 'repeatTime', 'priority', }},}
		}
	end,
	[0x2309] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'itemlist','type', 'number', 'itemId', }},}
		}
	end,
	[0x4412] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','playerId', 'name', 'vip', 'profession', 'level', 'guildId', 'guildName', 'createTime', 'quality', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x2105] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'type', }
		}
	end,
	[0x0F04] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', {false,{'v4', 'v4', }},{true,{'v4', 'v4', }},'s', 's', 's', 's', 'v4', }},'v4', 'v4', 'v4', 's', }},{false,{'v4', 'b', {true,{'b', 'v4', 'v4', 'v4', 'v4', 'b', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', }},}},'v4', },
			{{false,{'beginInfo','fighttype', 'angerSelf', 'angerEnemy', {true,{'rolelist','typeid', 'roleId', 'maxhp', 'posindex', 'level', 'attr', {false,{'spellId','skillId', 'level', }},{true,{'passiveskill','skillId', 'level', }},'name', 'immune', 'effectActive', 'effectPassive', 'anger', }},'index', 'myBattlearrayId', 'enemyBattlearrayId', 'suppress', }},{false,{'fightData','fighttype', 'win', {true,{'actionlist','bManualAction', 'roundIndex', 'attackerpos', 'skillid', 'skillLevel', 'bBackAttack', {true,{'targetlist','targetpos', 'effect', 'hurt', 'triggerBufferID', 'triggerBufferLevel', 'passiveEffect', 'passiveEffectValue', 'activeEffect', 'activeEffectValue', }},{true,{'stateList','frompos', 'targetpos', 'stateId', 'skillId', 'skillLevel', 'bufferId', 'bufferLevel', }},'triggerType', }},{true,{'livelist','posindex', 'currhp', 'anger', }},'angerSelf', 'angerEnemy', {true,{'hurtcountlist','posindex', 'hurt', }},}},'rank', }
		}
	end,
	[0x2501] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', {true,{'v4', 'v4', }},},
			{'lastTime', {true,{'info','type', 'status', }},}
		}
	end,
	[0x5201] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5324] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1055] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'max', }
		}
	end,
	[0x4404] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'playerId', }
		}
	end,
	[0x5704] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', }},},
			{{true,{'infos','round', 'index', 'atkGuildId', 'atkGuildName', 'atkBannerId', 'winGuildId', 'defGuildId', 'defGuildName', 'defBannerId', 'atkPeakAddition', 'defPeakAddition', }},}
		}
	end,
	[0x440a] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'list','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'applyTime', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x3001] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1D30] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', },
			{'playerId', 'name', }
		}
	end,
	[0x5121] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'playerId', 'instanceId', 'useType', }
		}
	end,
	[0x0f2b] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5937] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v8', }},},
			{{true,{'holdTreasure','id', 'treasureId', 'getTime', }},}
		}
	end,
	[0x443E] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 'v4', 's', }},{true,{'s', 'v4', 'v4', 'v4', }},{false,{'v4', 's', 's', 'v4', 's', }},'v4', 'v4', 'v8', },
			{{true,{'infos','guildId', 'guildName', 'bannerId', 'serverId', 'serverName', }},{true,{'members','playerName', 'useCoin', 'frameId', 'starHeroRanking', }},{false,{'serverInfo','guildId', 'guildName', 'bannerId', 'serverId', 'serverName', }},'myRank', 'serverRank', 'lastOpenTime', }
		}
	end,
	[0x3004] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3000] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'v8', 'v4', 'v8', 'v8', 'v4', }},},
			{{true,{'info','id', 'startTime', 'endTime', 'status', 'leftFreeRefreshTime', 'leftYabiaoTime', 'nextRefreshCostSysee', }},}
		}
	end,
	[0x6501] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x1b06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'playerId', }
		}
	end,
	[0x6500] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x0e93] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'newIcon', }
		}
	end,
	[0x7807] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'status', }
		}
	end,
	[0x4401] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 's', 'v4', 's', 'v4', 's', 'v4', 's', 'v4', 'v4', 'v4', 'v8', 'b', 's', }},},
			{{false,{'info','guildId', 'exp', 'name', 'memberCount', 'presidentName', 'power', 'declaration', 'level', 'notice', 'boom', 'state', 'operateId', 'operateTime', 'apply', 'bannerId', }},}
		}
	end,
	[0x4410] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5301] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'taskid', }
		}
	end,
	[0x5913] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'type', }
		}
	end,
	[0x1721] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'info','id', 'star', }},}
		}
	end,
	[0x2001] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'tasklist','taskid', 'state', 'currstep', 'totalstep', }},}
		}
	end,
	[0x7801] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', {true,{'v4', 's', 'v8', 'v4', 'v8', 'v4', }},'v8', {false,{'v4', 's', 'v8', 'v4', 'v8', 'v4', }},'v4', },
			{'level', 'hp', {true,{'ranks','playerId', 'name', 'hurt', 'challengeCount', 'lastHurt', 'replayId', }},'lastChallengeTime', {false,{'myRankInfo','playerId', 'name', 'hurt', 'challengeCount', 'lastHurt', 'replayId', }},'myRank', }
		}
	end,
	[0x5920] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v8', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', 'v4', 'v4', 'v8', 'v4', 'v4', }},'v4', 'v4', 'v4', 'tv4', }},},
			{{true,{'teamInfo','teamId', 'createTime', 'chapterId', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'vipLevel', 'level', 'ready', 'passCopy', 'hosting', 'battleCopyId', 'loginTime', 'serverId', 'isAssist', }},'minLevel', 'maxLevel', 'show', 'passCopy', }},}
		}
	end,
	[0x5150] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', {true,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', {true,{'v4', 'v4', 'v8', 'v4', }},}},},
			{{true,{'outline','playerId', 'power', 'playerName', {true,{'battleRole','instanceId', 'roleId', 'level', 'starLevel', 'martialLevel', 'position', 'quality', 'forgingQuality', }},'relation', {true,{'assistant','position', 'roleId', 'instanceId', 'quality', }},}},}
		}
	end,
	[0x4206] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 's', 's', }},},
			{{true,{'bossInfo','bossId', 'dayOfWeek', 'openTime', 'endTime', 'settlementTime', }},}
		}
	end,
	[0x4201] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v8', 'v4', 'v4', 'v4', 'v4', 'v8', 'v8', },
			{'id', 'total', 'best', 'todayTimes', 'todayPayTimes', 'totalTimes', 'totalPayTimes', 'lastUpdate', 'lastReward', }
		}
	end,
	[0x6e15] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v8', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','playerId', 'name', 'vip', 'level', 'teamId', 'teamName', 'createTime', 'icon', 'headPicFrame', 'starHeroRanking', 'quality', 'ladderGrade', }},}
		}
	end,
	[0x4202] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'v8', 'v4', 'v4', 'v4', 'v4', 'v8', 'v8', }},},
			{{true,{'info','id', 'total', 'best', 'todayTimes', 'todayPayTimes', 'totalTimes', 'totalPayTimes', 'lastUpdate', 'lastReward', }},}
		}
	end,
	[0x4517] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'tv8', 'tv8', 'v4', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','round', 'index', 'atkPlayerId', 'defPlayerId', 'winPlayerId', 'replayId', 'atkPlayerName', 'defPlayerName', 'betPlayerId', 'coin', 'atkPower', 'defPower', 'atkFormation', 'defFormation', 'atkIcon', 'defIcon', 'atkHeadPicFrame', 'defHeadPicFrame', 'atkServerName', 'defServerName', 'atkWinRound', 'defWinRound', 'atkPeakAddition', 'defPeakAddition', 'atkStarHeroRanking', 'defStarHeroRanking', }},}
		}
	end,
	[0x3405] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {false,{'v4', 'v4', 'v4', 'v4', }},},
			{'roleId', {false,{'martial','id', 'position', 'enchantLevel', 'enchantProgress', }},}
		}
	end,
	[0x4204] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', }},},
			{{true,{'players','playerId', 'name', }},}
		}
	end,
	[0x2101] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'type', 'maxValue', 'todayUse', 'currentValue', 'todayBuyTime', 'cooldownRemain', 'waitTimeRemain', 'todayResetWait', }
		}
	end,
	[0x4702] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', },
			{'type', {true,{'rewardList','resType', 'resId', 'number', 'isSpecial', }},'score', 'count', }
		}
	end,
	[0x4205] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'infos','serverId', 'playerId', 'name', 'dieCount', 'useCoin', }},}
		}
	end,
	[0x6310] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'success', 'boxIndex', 'round', }
		}
	end,
	[0x6311] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', }},{true,{'v4', 's', 'v4', 's', }},},
			{{false,{'own','rank', 'name', 'score', 'serverName', }},{true,{'list','rank', 'name', 'score', 'serverName', }},}
		}
	end,
	[0x4309] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'b', 'b', }},},
			{{false,{'friend',{false,{'info','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'give', 'assistantGive', }},}
		}
	end,
	[0x6308] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v4', 'v4', 'v4', }},},
			{'juli', 'boxNum', {true,{'rewardList','resType', 'resId', 'number', }},}
		}
	end,
	[0x6309] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 's', {true,{'v4', 'v4', 'v4', }},'v8', }},},
			{'type', {true,{'HistoryList','playerId', 'playerName', {true,{'rewardList','resType', 'resId', 'number', }},'createTime', }},}
		}
	end,
	[0x6306] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 's', 's', {true,{'v4', 'v4', 'v4', }},{true,{'v4', {true,{'v4', 'v4', 'v4', }},}},{true,{'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{'consumeSycee', 'consumeGoods', 'boxCount', {true,{'configList','resType', 'resId', 'number', }},{true,{'boxRewardList','count', {true,{'boxReward','resType', 'resId', 'number', }},}},{true,{'specialRewardList','length', 'index', {true,{'specialReward','resType', 'resId', 'number', }},}},}
		}
	end,
	[0x0e0e] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},},
			{'userId', {true,{'spellId','skillId', 'level', }},{true,{'allSpellId','skillId', 'level', }},}
		}
	end,
	[0x1803] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'b', }},},
			{{true,{'memberList','playerId', 'playerName', 'playerLevel', 'generalId', 'fightPower', 'allContribution', 'todayContribution', 'role', 'isOnline', }},}
		}
	end,
	[0x2d09] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 's', 'v4', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 'v4', 'v4', 'v8', }},{false,{'v4', 's', 's', 's', 's', 'v8', 'v8', 'v8', 'v4', 's', 'v4', 'tv4', }},{true,{'v4', 's', 's', 's', 'v4', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'rankInfo','playerId', 'playerName', 'serverName', 'guildName', 'achievement', 'formation', 'challengeTime', 'ranking', 'replayId', 'useIcon', 'level', 'joinRanks', }},{false,{'myRankInfo','rankType', 'myRanking', 'myAchievement', 'challengeTime', }},{false,{'lastBestInfo','serverId', 'serverName', 'playerName', 'guildName', 'formation', 'startTime', 'endTime', 'updateTime', 'groupId', 'stage', 'playerId', 'templateId', }},{true,{'totalRank','playerId', 'playerName', 'serverName', 'guildName', 'achievement', 'formation', 'challengeTime', 'ranking', 'replayId', 'useIcon', 'level', 'joinRanks', }},}
		}
	end,
	[0x0e32] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v8', }},},
			{{true,{'list','type', 'multiple', 'endTime', }},}
		}
	end,
	[0x3406] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', {true,{'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'roleMartial','roleId', 'martialLevel', {true,{'martialInfo','id', 'position', 'enchantLevel', 'enchantProgress', }},}},}
		}
	end,
	[0x2d06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', },
			{'rankType', 'formation', }
		}
	end,
	[0x0e61] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'userId', }
		}
	end,
	[0x4447] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'type', }
		}
	end,
	[0x2d11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'startOrClose', }
		}
	end,
	[0x1017] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x7105] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', }},},
			{{false,{'info','playerId', 'serverId', 'name', 'serverName', 'power', 'pos', 'layer', 'useIcon', 'headPicFrame', 'guildName', 'starHeroRanking', }},}
		}
	end,
	[0x5707] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', 'v4', 's', 's', 'tv4', 'v4', 's', 'v4', },
			{'maxGuildLevel', 'guildSize', 'openTime', 'guildId', 'guildName', 'bannerId', 'professions', 'myRank', 'names', 'starHeroRanking', }
		}
	end,
	[0x2d08] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5e06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x1807] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x2d12] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'startOrClose', }
		}
	end,
	[0x5600] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v8', 'b', }},},
			{{true,{'list','instanceId', 'roleFateId', 'endTime', 'forever', }},}
		}
	end,
	[0x6f01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'s', 's', 's', }},{false,{'s', 's', {true,{'v4', 'v4', 'tv4', }},}},{false,{'s', 'v4', 'v4', 'v4', }},'b', 'v4', },
			{{false,{'guildChampion','serverName', 'guildName', 'bannerId', }},{false,{'personalChampion','serverName', 'name', {true,{'role','index', 'roleId', 'suitNum', }},}},{false,{'currentChampion','name', 'useIcon', 'rank', 'power', }},'open', 'number', }
		}
	end,
	[0x2d00] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', }},{true,{'v4', 'v4', 'v4', 'v8', }},'v4', 'v4', 's', 'tv4', 'v4', {true,{'v4', {true,{'v4', 's', 's', 's', 'v4', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},'s', 's', },
			{{true,{'rankInfo','rankType', 'bestFormation', }},{true,{'myInfo','rankType', 'myRanking', 'myAchievement', 'challengeTime', }},'copyId', 'refreshCount', 'formation', 'npcList', 'challengeCount', {true,{'topTen','rankType', {true,{'rank','playerId', 'playerName', 'serverName', 'guildName', 'achievement', 'formation', 'challengeTime', 'ranking', 'replayId', 'useIcon', 'level', 'joinRanks', }},}},'isPass', 'stage', }
		}
	end,
	[0x2d01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 's', 's', 's', 'v8', 'v8', 'v8', 'v4', 's', 'v4', 'tv4', }},'v8', },
			{{false,{'lastBestInfo','serverId', 'serverName', 'playerName', 'guildName', 'formation', 'startTime', 'endTime', 'updateTime', 'groupId', 'stage', 'playerId', 'templateId', }},'startTime', }
		}
	end,
	[0x1301] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv8', }},},
			{'pageNumber', 'currentPage', {true,{'rankList','rank', 'playerId', 'playerName', 'playerLevel', 'generalId', 'fightPower', 'challengeTotalCount', 'challengeWinCount', 'vipLevel', 'prevRank', 'bestRank', 'totalScore', 'activeChallenge', 'activeWin', 'continuityWin', 'maxContinuityWin', 'formation', }},}
		}
	end,
	[0x6018] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', {true,{'v4', 'v4', }},}},'v4', },
			{{false,{'info','bibleId', {true,{'info','pos', 'itemId', }},}},'star', }
		}
	end,
	[0x4a01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},'v4', },
			{{true,{'detil','goodId', 'number', 'discount', }},'vipScore', }
		}
	end,
	[0x3403] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'roleId', 'martialLevel', }
		}
	end,
	[0x7300] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', 'tv4', },
			{'type', 'useCount', }
		}
	end,
	[0x5012] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x0e20] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', },
			{'fromPos', 'toPos', 'userId', }
		}
	end,
	[0x0e0d] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{false,{'v4', 'v4', }},'b', 'v4', }},},
			{{true,{'spell',{false,{'spellId','skillId', 'level', }},'choice', 'sid', }},}
		}
	end,
	[0x1602] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'bookpos', }
		}
	end,
	[0x0e50] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v4', },
			{'userId', 'templateId', 'currentLevel', 'currentExp', }
		}
	end,
	[0x430d] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'b', },
			{{false,{'info','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'apply', }
		}
	end,
	[0x4428] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'name', }
		}
	end,
	[0x7b11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'pos', 'itemId', }
		}
	end,
	[0x1D31] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v8', },
			{'playerId', 'name', 'time', }
		}
	end,
	[0x6600] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', {true,{'v4', 'v4', }},}},},
			{{true,{'xiake','roleId', {true,{'data','acupoint', 'level', }},}},}
		}
	end,
	[0x7702] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', 'v4', 'v4', }},},
			{'type', {true,{'rechargeTicketInfo','instanceId', 'templateId', 'createTime', 'endTime', }},}
		}
	end,
	[0x0e0c] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', }},{false,{'v4', 'v4', }},},
			{{false,{'oldSpellId','skillId', 'level', }},{false,{'spellId','skillId', 'level', }},}
		}
	end,
	[0x6b06] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', {false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v8', 'v4', 's', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', }},},
			{{false,{'info','id', 'guildId', {false,{'sendPlayer','playerId', 'name', 'icon', 'frame', 'level', 'sycee', 'vipLevel', 'guildName', 'ranking', 'competence', 'starHeroRanking', 'ladderGrade', }},'redPacketId', 'totalSycee', 'surplusSycee', 'startTime', 'personNum', 'desc', {true,{'receiver','playerId', 'name', 'icon', 'frame', 'level', 'sycee', 'vipLevel', 'guildName', 'ranking', 'competence', 'starHeroRanking', 'ladderGrade', }},'type', }},}
		}
	end,
	[0x2005] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'taskid', 'currstep', }
		}
	end,
	[0x0e11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'name', }
		}
	end,
	[0x0e71] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},}},{true,{{false,{'v4', 'v4', }},'b', 'v4', }},'v4', 'v4', 'v4', 'v4', },
			{'playerId', 'profession', 'name', 'level', 'vipLevel', 'power', {true,{'warside','id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}},{true,{'spell',{false,{'spellId','skillId', 'level', }},'choice', 'sid', }},'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }
		}
	end,
	[0x0e91] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x4509] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', }},'v4', },
			{{true,{'infos','playerId', 'name', 'score', }},'myRank', }
		}
	end,
	[0x1906] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'commodityId', 'num', }
		}
	end,
	[0x4c03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'currentNum', }
		}
	end,
	[0x1C01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},{false,{'v4', 'b', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'element','resType', 'resId', 'number', }},{false,{'state','cardType', 'firstGet', 'freeTimes', 'cdTime', 'todayTimes', 'totalCount', }},}
		}
	end,
	[0x6022] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},},
			{{false,{'info','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}
		}
	end,
	[0x4436] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'s', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', }},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{true,{'atkGuildTeamInfos','eliteId', {true,{'battleInfo','name', 'useIcon', 'power', 'headPicFrame', 'playerId', 'starHeroRanking', 'ladderGrade', }},'id', }},{true,{'replays','index', 'team', 'atkPlayerId', 'defPlayerId', 'winPlayerId', 'replayId', }},'warId', }
		}
	end,
	[0x1D01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', 'v4', 'v4', },
			{'playerName', 'equipId', 'number', 'operationType', }
		}
	end,
	[0x0e92] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'icon', }
		}
	end,
	[0x0e60] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},'v4', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},{true,{'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{false,{'info','userid', 'id', 'level', 'curexp', 'quality', 'starlevel', 'starExp', {true,{'spellId','skillId', 'level', }},{true,{'equiplist','userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},{true,{'ppInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},{true,{'changePPInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},'skillStarLevel', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},{true,{'destiny','instanceId', 'templateId', 'roleId', 'pos', 'level', 'stepExp', 'quality', 'type', 'star', 'starLevel', }},}},}
		}
	end,
	[0x2603] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 'v4', 's', },
			{'invited', 'inviteCount', 'getRewardRecord', }
		}
	end,
	[0x6802] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},}},},
			{{true,{'xiaKeInfo',{true,{'ppInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},{true,{'changePPInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},}},}
		}
	end,
	[0x4312] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 's', }},'s', 's', 's', 's', 'v4', },
			{{true,{'infos','friendId', 'provideRoles', 'demandRole', 'roleUseCount', }},'usePlayers', 'assistantPlayers', 'roleUseCount', 'provideRoles', 'demandRole', }
		}
	end,
	[0x2056] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'sevenPrompt', }
		}
	end,
	[0x1902] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'b', }},'v8', 'v4', 'v4', 'v8', },
			{'type', {true,{'commodity','commodityId', 'num', 'enabled', }},'nextAutoRefreshTime', 'nextRefreshCost', 'manualRefreshCount', 'opentime', }
		}
	end,
	[0x0E96] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'code', }
		}
	end,
	[0x1702] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'curId', }
		}
	end,
	[0x5f09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'status', }
		}
	end,
	[0x4444] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'redPoint', }
		}
	end,
	[0x3e06] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v8', 'v8', 'v4', 'v4', }},},
			{{true,{'item','index', 'resType', 'resId', 'resNum', 'createTime', 'lastUpdate', 'level', 'exp', }},}
		}
	end,
	[0x3f09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', },
			{'instanceList', }
		}
	end,
	[0x0e34] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'type', 'isPrompt', }
		}
	end,
	[0x0e72] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', },
			{'id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }
		}
	end,
	[0x0e28] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', }},},
			{'capacity', {true,{'configure','userId', 'index', }},}
		}
	end,
	[0x4f07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 's', },
			{'instanceId', 'hole', }
		}
	end,
	[0x6e08] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 's', 'v4', 'v8', }},'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', {true,{{false,{'v8', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', }},{false,{'v8', 's', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', }},'tv4', 'tv4', 'v8', }},'v8', },
			{{true,{'info','name', 'integral', 'ranking', 'serverName', 'serverId', 'id', }},'integral', 'ranking', 'atkWin', 'atkLost', 'defWin', 'defLost', 'atkWinStreak', 'defWinStreak', 'atkFormation', 'defFromation', {true,{'replays',{false,{'atkTeam','id', 'name', 'type', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'loginTime', 'position', 'vipLevel', 'level', 'inspireNum', 'inspireSycee', 'ladderGrade', }},'serverId', 'serverName', }},{false,{'defTeam','id', 'name', 'type', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'loginTime', 'position', 'vipLevel', 'level', 'inspireNum', 'inspireSycee', 'ladderGrade', }},'serverId', 'serverName', }},'result', 'replayId', 'createTime', }},'leizhu', }
		}
	end,
	[0x7a01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', 'v4', },
			{'type', 'level', 'timeLeft', 'leaveTime', }
		}
	end,
	[0x0e9a] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {true,{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},}},},
			{'userid', {true,{'roleDetails','id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}},}
		}
	end,
	[0x5f05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'restTime', }
		}
	end,
	[0x5927] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'chapterId', }
		}
	end,
	[0x1601] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', 'v4', 'v4', },
			{'booklist', 'nextMaster', 'callMasterCount', }
		}
	end,
	[0x1931] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'consume', 'xiayi', }
		}
	end,
	[0x1313] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', {true,{'v4', 'v4', 'v4', }},},
			{'result', {true,{'items','type', 'number', 'itemId', }},}
		}
	end,
	[0x0e21] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'levelUp', 'oldStamina', 'newStamina', }
		}
	end,
	[0x1080] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'instanceId', 'refineLevel', }
		}
	end,
	[0x4414] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4417] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v4', 'v4', 'v4', 'v4', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'playerId', 'name', 'vip', 'profession', 'level', 'guildId', 'guildName', 'createTime', 'quality', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }
		}
	end,
	[0x0e33] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', },
			{'type', 'multiple', 'endTime', }
		}
	end,
	[0x0e0f] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},},
			{'userId', {true,{'spellId','skillId', 'level', }},{true,{'allSpellId','skillId', 'level', }},}
		}
	end,
	[0x3b01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', },
			{'startTime', 'datiIds', }
		}
	end,
	[0x1300] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv8', }},},
			{{true,{'playerList','rank', 'playerId', 'playerName', 'playerLevel', 'generalId', 'fightPower', 'challengeTotalCount', 'challengeWinCount', 'vipLevel', 'prevRank', 'bestRank', 'totalScore', 'activeChallenge', 'activeWin', 'continuityWin', 'maxContinuityWin', 'formation', }},}
		}
	end,
	[0x4405] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5706] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x2d05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', 'v4', },
			{'templateId', 'copyType', }
		}
	end,
	[0x1056] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', }},},
			{'maxLevel', {true,{'change','id', 'changeNum', }},}
		}
	end,
	[0x0e9e] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x6305] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', }},{true,{'v4', 's', 'v4', 's', }},},
			{{false,{'own','rank', 'name', 'score', 'serverName', }},{true,{'list','rank', 'name', 'score', 'serverName', }},}
		}
	end,
	[0x3500] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'code', }
		}
	end,
	[0x4f03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', },
			{'instanceId', 'xiakeId', }
		}
	end,
	[0x7601] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', 'b', }},},
			{{true,{'infos','zoneId', 'pass', 'use', }},}
		}
	end,
	[0x4930] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'sweepCount', }
		}
	end,
	[0x3002] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6021] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},},
			{{false,{'info','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}
		}
	end,
	[0x2200] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'win', }
		}
	end,
	[0x5938] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v8', 'v8', 'v4', 's', 's', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'digHistory','playerName', 'treasureId', 'leftTimes', 'buriedTime', 'mapId', 'isHiddenName', 'dropItem', 'digName', 'serverName', 'rowId', 'colId', 'specialBox', }},}
		}
	end,
	[0x1501] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {true,{'v4', 'v4', 'v4', }},},
			{'instanceId', {true,{'acupointList','position', 'level', 'breachLevel', }},}
		}
	end,
	[0x1D07] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 's', 'v4', 'v4', 'v4', 'b', }},},
			{{true,{'ganglist','time', 'playerName', 'playerLev', 'gangName', 'gangId', 'apply', }},}
		}
	end,
	[0x3304] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 'v4', 's', 's', }},}},},
			{{true,{'rankList','type', {true,{'rank','playerId', 'rankValue', 'name', 'otherDisplay', }},}},}
		}
	end,
	[0x6104] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v8', }},'v8', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},},
			{{true,{'infos','count', 'refreshTime', 'toName', 'toPlayer', 'round', 'toIcon', 'name', 'player', 'icon', 'isEscape', 'id', }},'lastRefreshTime', 'leftRefreshMyTimes', 'leftRefreshOthersTimes', 'leftRefreshBackTimes', {true,{'dropMoney','index', 'gameMoney', }},}
		}
	end,
	[0x1813] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', {false,{'v4', 'v4', 'v4', }},},
			{'isSuccess', {false,{'item','type', 'number', 'itemId', }},}
		}
	end,
	[0x7502] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', }},'tv4', },
			{'rewardType', {true,{'reward','type', 'number', 'itemId', }},'index', }
		}
	end,
	[0x443B] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x2201] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'b', {false,{'v4', 'v4', 'v4', }},{false,{'v4', 'v4', 'v4','s', 'v4', 'v4', }},'v4', }},},
			{'type', {true,{'rolelist','index', 'empty', {false,{'product','resType', 'resId', 'number', }},{false,{'role','playerId', 'profession', 'sex','name', 'level', 'power', }},'reaminTime', }},}
		}
	end,
	[0x7b03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', 'v8', },
			{'roleId', 'heartMid', 'dropMid', }
		}
	end,
	[0x7104] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'info','playerId', 'serverId', 'name', 'serverName', 'power', 'pos', 'layer', 'type', 'useIcon', 'headPicFrame', 'battleTime', 'recordId', 'desc', 'oldLayer', 'starHeroRanking', }},}
		}
	end,
	[0x7402] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'id', }
		}
	end,
	[0x6304] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', }},{true,{'v4', 's', 'v4', 's', }},},
			{{false,{'own','rank', 'name', 'score', 'serverName', }},{true,{'list','rank', 'name', 'score', 'serverName', }},}
		}
	end,
	[0x1200] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4','v4', 'v4', }},'tv4', 'v4', 'v4', },
			{{true,{'missionlist','missionId', 'challengeCount', 'starLevel','resetCount', 'state', }},'openBoxIdList', 'useQuickPassTimes', 'useResetTimes', }
		}
	end,
	[0x6909] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'challengeCount', }
		}
	end,
	[0x6e00] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 's', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v8', }},'v8', 'v4', 'v4', },
			{{false,{'leizhu','number', 'name', 'serverName', 'serverId', {true,{'member','playerId', 'name', 'useIcon', 'frameId', 'starHeroRanking', 'level', 'roleId', 'vipLevel', 'redPacket', }},'leaderId', 'teamId', }},'lastTime', 'myRank', 'leizhuCount', }
		}
	end,
	[0x6302] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 's', {true,{'v4', 'v4', 'v4', 'v4', }},'v8', }},},
			{'type', {true,{'HistoryList','playerId', 'playerName', {true,{'rewardList','resType', 'resId', 'number', 'mulriple', }},'createTime', }},}
		}
	end,
	[0x0e27] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'capacity', }
		}
	end,
	[0x6301] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'index', {true,{'rewardList','resType', 'resId', 'number', 'mulriple', }},}
		}
	end,
	[0x6b05] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', {false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v8', 'v4', 's', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', }},},
			{{true,{'info','id', 'guildId', {false,{'sendPlayer','playerId', 'name', 'icon', 'frame', 'level', 'sycee', 'vipLevel', 'guildName', 'ranking', 'competence', 'starHeroRanking', 'ladderGrade', }},'redPacketId', 'totalSycee', 'surplusSycee', 'startTime', 'personNum', 'desc', {true,{'receiver','playerId', 'name', 'icon', 'frame', 'level', 'sycee', 'vipLevel', 'guildName', 'ranking', 'competence', 'starHeroRanking', 'ladderGrade', }},'type', }},}
		}
	end,
	[0x3215] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'coinInspireCount', 'sysceeInspireCount', }
		}
	end,
	[0x1012] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'statusCode', }
		}
	end,
	[0x6303] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'success', 'boxIndex', 'round', }
		}
	end,
	[0x4300] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'b', 'b', }},'tv4', 'tv4', 'tv4', },
			{{true,{'friends',{false,{'info','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'give', 'assistantGive', }},'givePlayers', 'drawPlayers', 'drawAssistantPlayers', }
		}
	end,
	[0x1F05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'skill_point', }
		}
	end,
	[0x7503] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', }},'v4', 'v4', },
			{{true,{'infos','playerId', 'name', 'score', 'rank', }},'myRank', 'myScore', }
		}
	end,
	[0x4082] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 's', 's', 'v4', 'v4', 'v8', }},{true,{'v4', 's', 's', 'v4', 'v4', 'v8', }},},
			{'myRank', {false,{'firstPass','guildId', 'name', 'presidentName', 'power', 'level', 'passTime', }},{true,{'rankInfos','guildId', 'name', 'presidentName', 'power', 'level', 'passTime', }},}
		}
	end,
	[0x1053] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v8', 'v4', }},},
			{'result', {false,{'gemStatus','userid', 'holeNum', }},}
		}
	end,
	[0x4c06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'templateId', }
		}
	end,
	[0x1306] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv8', }},},
			{{true,{'playerList','rank', 'playerId', 'playerName', 'playerLevel', 'generalId', 'fightPower', 'challengeTotalCount', 'challengeWinCount', 'vipLevel', 'prevRank', 'bestRank', 'totalScore', 'activeChallenge', 'activeWin', 'continuityWin', 'maxContinuityWin', 'formation', }},}
		}
	end,
	[0x1065] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'item','fragmentId', 'mergeId', 'number', }},}
		}
	end,
	[0x1508] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', },
			{'userid', 'level', 'curExp', }
		}
	end,
	[0x4409] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7501] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'type', 'freeCount', }
		}
	end,
	[0x2075] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7804] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x5806] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v8', 'v8', }},},
			{{true,{'item','index', 'resType', 'resId', 'resNum', 'createTime', 'lastUpdate', }},}
		}
	end,
	[0x1510] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'result', }
		}
	end,
	[0x1D08] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', 's', 's', 's', 'v4', {true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', }},}},},
			{{true,{'notifyList','id', 'type', 'canGet', 'time', 'textTitle', 'textTitleSub', 'textContect', 'status', {true,{'itemlist','type', 'itemid', 'num', }},{true,{'reslist','type', 'num', }},}},}
		}
	end,
	[0x2053] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'taskid', }
		}
	end,
	[0x1D22] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', 's', 's', 's', 'v4', {true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', }},}},},
			{{true,{'mail','id', 'type', 'canGet', 'time', 'textTitle', 'textTitleSub', 'textContect', 'status', {true,{'itemlist','type', 'itemid', 'num', }},{true,{'reslist','type', 'num', }},}},}
		}
	end,
	[0x5802] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6905] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'ReviveCount', }
		}
	end,
	[0x6014] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', {true,{'v4', 'v4', }},}},},
			{{true,{'info','bibleId', {true,{'info','pos', 'itemId', }},}},}
		}
	end,
	[0x4925] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'chestGotMark', }
		}
	end,
	[0x2060] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'info','id', 'number', }},}
		}
	end,
	[0x3003] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6e13] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'status', }
		}
	end,
	[0x2052] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'taskid', }
		}
	end,
	[0x4400] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', 'tv4', 'v8', 'v4', },
			{'guildId', 'competence', 'dedication', 'worship', 'coin', 'applyCount', 'makePlayers', 'drawTreasureChests', 'lastOutTime', 'voteStatus', }
		}
	end,
	[0x7409] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x2003] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'taskid', }
		}
	end,
	[0x7806] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1202] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'boxId', }
		}
	end,
	[0x1D04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 's', 'b', 'v4', },
			{'winerName', 'loserName', 'neili', 'rank', }
		}
	end,
	[0x5300] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{true,{'tasklist','taskid', 'state', 'currstep', 'totalstep', }},'days', }
		}
	end,
	[0x1054] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', {false,{'v8', 'v4', 'v4', {false,{'s', 's', }},}},},
			{'result', 'success', {false,{'changed','userid', 'oldTemplateId', 'newTemplateId', {false,{'attr','base_attr', 'extra_attr', }},}},}
		}
	end,
	[0x5350] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', },
			{'backTime', 'rewardGot', 'fromPlayerId', }
		}
	end,
	[0x3800] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'activityInfo','activityId', 'status', }},}
		}
	end,
	[0x4422] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'infos','attributeType', 'level', }},}
		}
	end,
	[0x6a06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'instanceId', }
		}
	end,
	[0x4439] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', }},},
			{{true,{'battleInfos','warId', 'atkGuildId', 'defGuildId', 'winGuildId', 'cityId', 'createTime', 'atkPeakAddition', 'defPeakAddition', }},}
		}
	end,
	[0x2302] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 's', 's', 's', 'v4', },
			{'id', 'progress', 'extend', 'got', 'lastUpdate', 'resetRemaining', }
		}
	end,
	[0x4b09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', {true,{'v4', 's', 'v8', 'v4', }},},
			{'myPlayerId', 'myRanking', 'myDamage', {true,{'guildBossDamageRankData','playerId', 'playerName', 'damage', 'rank', }},}
		}
	end,
	[0x3905] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', },
			{'lastChallengeBoss', {true,{'infos','bossId', 'breakOut', }},'lastBrokenBoss', 'freeChallengeCount', 'buyChallengeCount', 'challengeCount', }
		}
	end,
	[0x2070] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x2071] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x3307] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5323] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1605] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'b', },
			{'objID', 'lock', }
		}
	end,
	[0x2073] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'dropId', }
		}
	end,
	[0x6f05] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 'v4', 's', 's', 'v4', 'v4', }},'v4', 'v4', },
			{{true,{'guildRanks','rank', 'guildName', 'leaderName', 'guildLevel', 'bannerId', 'serverName', 'guildScore', 'guildId', }},'myGuildScore', 'myGuildRank', }
		}
	end,
	[0x2074] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'ids', }
		}
	end,
	[0x4518] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3303] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 's', 's', }},},
			{'type', {true,{'rank','playerId', 'rankValue', 'name', 'otherDisplay', }},}
		}
	end,
	[0x1907] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'commodityId', }
		}
	end,
	[0x6910] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'pointTypes', }
		}
	end,
	[0x2055] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'taskid', 'currstep', }
		}
	end,
	[0x0E97] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'b', }},{true,{'v4', 'v4', }},},
			{{true,{'unlockedlist','id', 'expireTime', 'firstGet', }},{true,{'lockedList','id', 'currentNum', }},}
		}
	end,
	[0x5c02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', 'b', 'v4', {false,{'v4', 's', 's', 'v4', }},{true,{'v4', 's', 's', 'v4', }},}},},
			{{true,{'grouponInfo','id', 'isSettle', 'isEnd', 'totalCount', {false,{'myInfo','playerId', 'name', 'guildName', 'num', }},{true,{'playerInfo','playerId', 'name', 'guildName', 'num', }},}},}
		}
	end,
	[0x6200] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'id', }
		}
	end,
	[0x1D24] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1061] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'itemId', 'num', }
		}
	end,
	[0x5111] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 's', 's', 's', 'v4', 'v4', 's', 'v4', }},},
			{{true,{'role','instanceId', 'useType', 'roleId', 'level', 'martialLevel', 'starlevel', 'power', 'hp', 'spell', 'attributes', 'immune', 'effectActive', 'effectPassive', 'state', 'quality', 'name', 'forgingQuality', }},}
		}
	end,
	[0x5304] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'taskid', 'currstep', }
		}
	end,
	[0x2002] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'taskid', }
		}
	end,
	[0x4081] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 's', 'v4', 's', 'v4', 'b', }},},
			{{true,{'rankInfo','guildId', 'exp', 'name', 'memberCount', 'presidentName', 'power', 'declaration', 'level', 'apply', }},}
		}
	end,
	[0x2054] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'tasklist','taskid', 'state', 'currstep', 'totalstep', }},}
		}
	end,
	[0x6d01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'id', }
		}
	end,
	[0x6d00] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'tv4', },
			{{true,{'data','playerId', 'serverId', 'name', 'serverName', 'power', 'useIcon', 'headPicFrame', 'ranking', 'praise', 'level', 'roleId', }},'isReward', 'myRank', 'praisePlayerId', }
		}
	end,
	[0x1F02] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3b02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'trueResult', }
		}
	end,
	[0x1B03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'words', }
		}
	end,
	[0x7203] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{'floorId', {true,{'result','exp', 'oldLevel', 'currentLevel', 'coin', {true,{'item','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x5e01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v8', 'v8', 'v4', 'tv4', 'v4', }},{true,{'v4', 's', 'v8', 'v8', 'v4', 'tv4', 'v4', }},},
			{{false,{'myDetials','playerId', 'playerName', 'createTime', 'endTime', 'state', 'helper', 'id', }},{true,{'detials','playerId', 'playerName', 'createTime', 'endTime', 'state', 'helper', 'id', }},}
		}
	end,
	[0x7500] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', }},{true,{'v4', 'v4', {false,{'v4', 'v4', 'v4', }},}},{true,{'v4', 's', 's', 'v4', 'v4', {false,{'v4', 'v4', 'v4', }},'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', {true,{'v4', 'v4', 'v4', }},{false,{'v4', 'v4', 'v4', }},'v4', }},'v4', 's', },
			{{false,{'info','isCoin', 'freeCount', }},{true,{'myPush','playerId', 'rewardType', {false,{'reward','type', 'number', 'itemId', }},}},{true,{'serverPush','playerId', 'playerName', 'serverName', 'serverId', 'rewardType', {false,{'reward','type', 'number', 'itemId', }},'rewardTime', }},{true,{'itemList','type', 'number', 'itemId', }},{true,{'extraList','rewardType', {true,{'condition','type', 'number', 'itemId', }},{false,{'reward','type', 'number', 'itemId', }},'index', }},'jackpot', 'coinInfo', }
		}
	end,
	[0x1F03] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},'v4', },
			{{true,{'skill_list','skillId', 'level', }},'skill_point', }
		}
	end,
	[0x3209] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'s', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', {true,{'v4', 'b', 'v4', 'v4', 'v4', }},'v4', 'v4', }},'v4', },
			{'currSection', 'coinInspireCount', 'sysceeInspireCount', 'dailyMaxInspireCount', 'maxPass', 'lastPass', 'sweepPass', 'todaySweep', {true,{'allEnemys','name', 'section', 'star', 'roleId', }},{true,{'BloodyBoxList','index', 'status', {true,{'BloodyBoxList','index', 'bIsget', 'type', 'itemId', 'number', }},'needResType', 'needResNum', }},'resetCount', }
		}
	end,
	[0x2702] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'itemlist','type', 'number', 'itemId', }},}
		}
	end,
	[0x4508] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1060] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'templateId', }
		}
	end,
	[0x7201] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', }},{true,{'v4', 'b', 'b', 'b', 'b', {false,{'b', {false,{'v4', 'tv4', 'tv4', }},'s', 's', 'v4', 'v4', }},'s', 's', }},'s', 's', 'v4', },
			{{false,{'serdangInfo','playerId', 'floorId', }},{true,{'floorInfo','floorId', 'isBox', 'isOpenBox', 'isHistoryReward', 'isSeasonReward', {false,{'npc','isBoss', {false,{'npc','npcId', 'roleId', 'index', }},'playerName', 'serverName', 'icon', 'headPicFrame', }},'boxPlayerName', 'boxServerName', }},'playerName', 'serverName', 'floorId', }
		}
	end,
	[0x7b05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'instanceId', 'id', }
		}
	end,
	[0x4427] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'v4', 'v8', }},{true,{'v8', 'v4', 'v4', }},},
			{{true,{'playerPracticeInfos','pos', 'instanceId', 'attributeType', 'practiceTime', }},{true,{'partnerPracticeInfos','instanceId', 'attributeType', 'level', }},}
		}
	end,
	[0x4425] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1910] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'commodityId', }
		}
	end,
	[0x1930] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'result','consume', 'coin', 'mutil', }},}
		}
	end,
	[0x1925] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'s', 'v4', }},'v8', 'v8', },
			{{true,{'info','id', 'resType', 'resId', 'resNumber', 'consumeType', 'consumeId', 'consumeNumber', }},{true,{'discount','vipLevel', 'discount', }},'beginTime', 'endTime', }
		}
	end,
	[0x1914] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'state', 'goodsId', }
		}
	end,
	[0x4601] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'tv8', }},'tv4', 'v4', 'v8', },
			{'openPos', {true,{'roleInfos','type', 'roles', }},'agreeLevels', 'friendRoleId', 'friendProvideTime', }
		}
	end,
	[0x0e90] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'instanceId', }
		}
	end,
	[0x5112] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 's', 's', 's', 'v4', 'v4', 's', 'v4', }},},
			{'useType', {true,{'role','instanceId', 'useType', 'roleId', 'level', 'martialLevel', 'starlevel', 'power', 'hp', 'spell', 'attributes', 'immune', 'effectActive', 'effectPassive', 'state', 'quality', 'name', 'forgingQuality', }},}
		}
	end,
	[0x1900] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'commodityId', 'num', }
		}
	end,
	[0x1b04] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'tv4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'chat','chatType', 'content', 'playerId', 'roleId', 'quality', 'name', 'vipLevel', 'level', 'timestamp', 'guildId', 'guildName', 'competence', 'invitationGuilds', 'titleType', 'guideType', 'icon', 'headPicFrame', 'serverId', 'serverName', 'audioTime', 'audioId', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x4c01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{{false,{'myInfo','type', 'templateId', 'playerId', 'playerName', 'currentNum', 'limitNum', 'receiveNum', 'updateTime', }},{true,{'memberInfo','type', 'templateId', 'playerId', 'playerName', 'currentNum', 'limitNum', 'receiveNum', 'updateTime', }},}
		}
	end,
	[0x4d01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},},
			{{true,{'items','id', 'goodId', 'type', 'num', 'kind', }},{true,{'selected','id', 'index', 'kind', }},}
		}
	end,
	[0x1932] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'count', }
		}
	end,
	[0x1904] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 'v4', 'b', }},'v8', 'v4', 'v4', 'v8', }},},
			{{true,{'store','type', {true,{'commodity','commodityId', 'num', 'enabled', }},'nextAutoRefreshTime', 'nextRefreshCost', 'manualRefreshCount', 'opentime', }},}
		}
	end,
	[0x2306] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x4922] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', 'v4', 'b', },
			{'index', 'option', 'choice', 'skip', }
		}
	end,
	[0x0e9b] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'time', }
		}
	end,
	[0x4920] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'tv4', 'v4', 'b', }},},
			{{false,{'info','index', 'option', 'choice', 'skip', }},}
		}
	end,
	[0x1D20] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'id', 'status', }
		}
	end,
	[0x6112] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v8', }},},
			{{true,{'records','itmes', 'dropTime', }},}
		}
	end,
	[0x7a02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'info','playerId', 'rank', 'routLevel', 'name', 'headPicFrame', 'icon', }},}
		}
	end,
	[0x7F02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', }},},
			{'type', {true,{'items','type', 'number', 'itemId', }},}
		}
	end,
	[0x4d03] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'result','id', 'index', 'kind', }},}
		}
	end,
	[0x1912] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x1908] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'type', 'opentime', }
		}
	end,
	[0x1E03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', 'v4', },
			{'AntiaddictionCode', 'IncomeCode', 'GameTime', 'getReward', }
		}
	end,
	[0x0F25] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'b', 'v4', 'v4', 'v4', 'v4', 'b', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', }},},
			{'packetIndex', {true,{'actionlist','bManualAction', 'roundIndex', 'attackerpos', 'skillid', 'skillLevel', 'bBackAttack', {true,{'targetlist','targetpos', 'effect', 'hurt', 'triggerBufferID', 'triggerBufferLevel', 'passiveEffect', 'passiveEffectValue', 'activeEffect', 'activeEffectValue', }},{true,{'stateList','frompos', 'targetpos', 'stateId', 'skillId', 'skillLevel', 'bufferId', 'bufferLevel', }},'triggerType', }},}
		}
	end,
	[0x1E00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 'b', 'b', 'b', 'b', },
			{'openMusic', 'openVolume', 'openChat', 'vipVisible', 'ladderGradeVisible', }
		}
	end,
	[0x4514] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 's', }},'v4', 's', 's', },
			{{true,{'rankInfos','playerId', 'name', 'power', 'guildName', }},'myRank', 'atkFormation', 'defFromation', }
		}
	end,
	[0x1504] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', },
			{'userid', 'starlevel', 'starExp', }
		}
	end,
	[0x3407] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v4', 'v4', },
			{'roleId', 'position', 'martialId', 'costType', 'costValue', }
		}
	end,
	[0x5006] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 'v4', 'v4', 'v8', 'v4', }},},
			{{true,{'recordList','playerId', 'employerPlayerName', 'robPlayerName', 'brokerrage', 'extraBrokerrage', 'recordTime', 'robServerId', }},}
		}
	end,
	[0x7a05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 'v4', 'v8', 'v4', }},'v4', {false,{'s', 'v4', }},'v8', 'v8', 'v8', 's', 'tv4', 'tv4', {false,{'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'tv4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 's', 'v4', 'v4', }},},
			{'sharePlayerId', {false,{'knightInfo','type', 'level', 'timeLeft', 'leaveTime', }},'knightState', {false,{'info','name', 'icon', }},'leaveHp', 'maxHp', 'instanceId', 'sharePlayerName', 'eachHp', 'eachMaxHp', {false,{'chatInfo','chatType', 'content', 'playerId', 'roleId', 'quality', 'name', 'vipLevel', 'level', 'timestamp', 'guildId', 'guildName', 'competence', 'invitationGuilds', 'titleType', 'guideType', 'icon', 'headPicFrame', 'serverId', 'serverName', 'audioTime', 'audioId', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x4000] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'playerId', 'power', 'name', 'level', 'vipLevel', 'goodNum', {true,{'formation','instanceId', 'position', 'templateId', }},'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'lastPower', 'myRanking', 'myBestValue', 'praiseCount', }
		}
	end,
	[0x1E02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x1013] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'userId', }
		}
	end,
	[0x3301] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 's', }},},
			{{true,{'statusList','type', 'status', 'startTime', 'endTime', }},}
		}
	end,
	[0x3600] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', 'v8', 'v8', }},},
			{{true,{'switchList','switchType', 'open', 'beginTime', 'endTime', }},}
		}
	end,
	[0x4504] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4084] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', }},'v4', 'v4', },
			{{true,{'infos','guildId', 'name', 'incBoom', }},'myGuildRank', 'incBoom', }
		}
	end,
	[0x7206] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', }},'v4', 'v4', 'v4', },
			{{true,{'rankInfo','playerId', 'playerName', 'icon', 'headPicFrame', 'power', 'level', 'rank', 'serverId', 'serverName', 'floorId', {true,{'formationInfo','position', 'templateId', 'quality', }},'starHeroRanking', }},'minValue', 'myRanking', 'floorId', }
		}
	end,
	[0x4402] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'guildIds', }
		}
	end,
	[0x7202] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'curId', 'challengeCount', }
		}
	end,
	[0x7205] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4706] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', }},{true,{'v4', 's', 'v4', 's', }},},
			{{false,{'player','rank', 'name', 'score', 'serverName', }},{true,{'list','rank', 'name', 'score', 'serverName', }},}
		}
	end,
	[0x4413] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7207] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 's', 's', },
			{'floorId', 'isOpenBox', 'boxPlayerName', 'boxServerName', }
		}
	end,
	[0x1805] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x1b08] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4419] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4','s', }},},
			{{true,{'dyns','type','mess', }},}
		}
	end,
	[0x7200] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', 'b', 'b', },
			{'startTime', 'endTime', 'isPassCave', 'champions', }
		}
	end,
	[0x1F07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'posList', }
		}
	end,
	[0x3e09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'destinyList', }
		}
	end,
	[0x3900] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', 'v4', },
			{'lastChallengeBoss', {true,{'infos','bossId', 'breakOut', }},'lastBrokenBoss', 'freeChallengeCount', 'buyChallengeCount', 'challengeCount', 'leftChallengeCount', }
		}
	end,
	[0x4438] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x4070] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', 'tv4', },
			{'totalCount', 'todayCount', 'remaining', 'lastUpdate', 'targetId', }
		}
	end,
	[0x1C02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 'v4', 'v4', 'v4', 'v4', },
			{'cardType', 'firstGet', 'freeTimes', 'cdTime', 'todayTimes', 'totalCount', }
		}
	end,
	[0x3e02] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3e05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v8', 'v8', 'v4', 'v4', },
			{'index', 'resType', 'resId', 'resNum', 'createTime', 'lastUpdate', 'level', 'exp', }
		}
	end,
	[0x3213] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', {false,{'v4', 'b', 'v4', 'v4', 'v4', }},}},},
			{{false,{'updateInfo','boxIndex', {false,{'prize','index', 'bIsget', 'type', 'itemId', 'number', }},}},}
		}
	end,
	[0x440c] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v4', },
			{'secondlyProgress', 'lastPlayerName', 'worshipCount', }
		}
	end,
	[0x6027] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', 'v4', 'v8', }},},
			{'result', {true,{'newDate','id', 'template_id', 'level', 'bibleId', }},}
		}
	end,
	[0x5801] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'count', }
		}
	end,
	[0x2051] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{true,{'tasklist','taskid', 'state', 'currstep', 'totalstep', }},'days', }
		}
	end,
	[0x1a03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'totalRecharge', 'vipLevel', }
		}
	end,
	[0x2304] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'id', 'index', }
		}
	end,
	[0x6103] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'draw', }
		}
	end,
	[0x1405] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'challengeTimes', 'remainChallengeTimes', }
		}
	end,
	[0x3200] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', 'v4', 'v4', }},},
			{'capacity', {true,{'stations','roleId', 'index', 'currHp', 'maxHp', }},}
		}
	end,
	[0x1a04] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'recordList','id', 'buyTimes', }},}
		}
	end,
	[0x4002] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'playerId', 'value', 'name', 'level', 'vipLevel', 'goodNum', 'power', {true,{'formation','instanceId', 'position', 'templateId', }},'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'lastValue', 'myRanking', 'myBestValue', 'praiseCount', }
		}
	end,
	[0x6f0c] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', }},},
			{'rank', {true,{'info','convertId', 'countNum', }},}
		}
	end,
	[0x3e00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'type', }
		}
	end,
	[0x6a01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', 'tv4', 'tv4', 'tv4', 'tv4', }},'v4', },
			{{false,{'info','instanceId', 'itemId', 'level', 'exp', 'star', 'freeNum', 'position', 'deduceExp', 'researchLevel', 'researchRadio', 'nextRadio', }},'type', }
		}
	end,
	[0x3e08] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'lastGetTime', }
		}
	end,
	[0x7607] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{true,{'v4', 'v4', 'v4', }},}},},
			{{true,{'checkpointItems',{true,{'items','type', 'itemId', 'number', }},}},}
		}
	end,
	[0x7604] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', },
			{'point', 'state', 'type', 'assId', }
		}
	end,
	[0x7602] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', {true,{'v4', 'v4', }},'s', 's', },
			{'checkpointId', 'openPoints', {true,{'elements','point', 'elementId', }},'organ', 'roleState', }
		}
	end,
	[0x3205] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'capacity', }
		}
	end,
	[0x7605] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3230] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{{true,{'result','sectionId', 'exp', 'oldLevel', 'currentLevel', 'coin', {true,{'item','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x3f08] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', },
			{'star', 'starLevel', 'instanceId', }
		}
	end,
	[0x4311] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'friendIds', }
		}
	end,
	[0x7408] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6901] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1509] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'userid', 'starLevel', }
		}
	end,
	[0x7a04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', {false,{'v4', 'v4', 'v8', 'v4', }},'v4', {false,{'s', 'v4', }},'v8', 'v8', 'v8', 's', 'tv4', 'tv4', {false,{'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v8', 'v4', 's', 'v4', 'tv4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 's', 'v4', 'v4', }},}},},
			{'leaveTime', {true,{'knightShareInfo','sharePlayerId', {false,{'knightInfo','type', 'level', 'timeLeft', 'leaveTime', }},'knightState', {false,{'info','name', 'icon', }},'leaveHp', 'maxHp', 'instanceId', 'sharePlayerName', 'eachHp', 'eachMaxHp', {false,{'chatInfo','chatType', 'content', 'playerId', 'roleId', 'quality', 'name', 'vipLevel', 'level', 'timestamp', 'guildId', 'guildName', 'competence', 'invitationGuilds', 'titleType', 'guideType', 'icon', 'headPicFrame', 'serverId', 'serverName', 'audioTime', 'audioId', 'starHeroRanking', 'ladderGrade', }},}},}
		}
	end,
	[0x1500] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', {true,{'v4', 'v4', 'v4', }},}},'v8', 'v4', 'v4', },
			{{true,{'trainlist','instanceId', {true,{'acupointList','position', 'level', 'breachLevel', }},}},'lastTime', 'totalRate', 'waitRemain', }
		}
	end,
	[0x6f0d] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'convertId', 'number', }
		}
	end,
	[0x3302] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 's', 'v4', 'v4', },
			{'logonDayCount', 'logonReward', 'onlineRewardCount', 'onlineRewardLastGetTime', 'onlineRewardRemainingTimes', 'teamLevelReward', }
		}
	end,
	[0x5321] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v8', 's', }},},
			{{true,{'invaite','playerId', 'recalledId', 'luanchTime', 'inviteCode', }},}
		}
	end,
	[0x7504] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'jackpot', }
		}
	end,
	[0x1305] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'myRank', 'fightPower', 'challengeTotalCount', 'challengeWinCount', 'bestRank', 'activeChallenge', 'activeWin', 'continuityWin', 'maxContinuityWin', }
		}
	end,
	[0x5805] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v8', 'v8', },
			{'index', 'resType', 'resId', 'resNum', 'createTime', 'lastUpdate', }
		}
	end,
	[0x1511] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'userid', }
		}
	end,
	[0x1607] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', 'v4', },
			{'bookObjID', 'roleID', 'position', }
		}
	end,
	[0x150A] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'b', {false,{'v4', 'v4', 'v4', }},'v8', 'v4', 'v4', },
			{'instanceId', 'success', {false,{'acupointInfo','position', 'level', 'breachLevel', }},'lastTime', 'totalRate', 'waitRemain', }
		}
	end,
	[0x1E04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'getReward', }
		}
	end,
	[0x6300] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v8', 's', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', {true,{'v4', 'v4', 'v4', 'v4', }},}},},
			{'consumeSycee', 'isFirstFree', 'consumeGoods', 'boxCount', 'count', 'boxIndex', 'round', 'actTime', 'scoreReward', {true,{'configList','id', 'resType', 'resId', 'number', 'quality', 'mulriple', }},{true,{'boxRewardList','count', {true,{'boxReward','resType', 'resId', 'number', 'mulriple', }},}},}
		}
	end,
	[0x6f08] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'b', 'v8', 'v4', 'v4', 's', 'v4', 's', 'v4', 's', 'b', 'v4', }},},
			{{true,{'reports','reportId', 'win', 'time', 'oldRank', 'fromRank', 'serverName', 'targetGroup', 'targetName', 'targetPower', 'targetGuildName', 'back', 'targetId', }},}
		}
	end,
	[0x1B01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'playerId', }
		}
	end,
	[0x5601] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4418] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6107] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', {true,{'v4', 'v4', }},},
			{'blood', 'lastRefreshTime', {true,{'dropGoods','index', 'gameMoney', }},}
		}
	end,
	[0x5908] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'tv4', },
			{{true,{'rankInfo','playerId', 'name', 'level', 'power', 'profession', 'headPicFrame', 'massacreValue', 'ranking', {true,{'formation','instanceId', 'position', 'templateId', 'quality', }},{true,{'secondFormation','instanceId', 'position', 'templateId', 'quality', }},'secondPower', 'starHeroRanking', 'ladderGrade', }},'lastValue', 'myRanking', 'myBestValue', 'challengeId', }
		}
	end,
	[0x1401] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'titleid', 'hp', 'neigong', 'waigong', 'neifang', 'waifang', 'hurt', }
		}
	end,
	[0x2a01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 's', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', },
			{'teamLevel', 'xiaKeCount', 'equipCount', 'serverName', 'power', 'bestXiaKe', 'createTime', 'redPacketCount', 'powerRank', 'heroRank', }
		}
	end,
	[0x7F00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{'statusCode', {false,{'reward','type', {true,{'items','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x4086] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'name', 'playerLevel', 'icon', 'headPicFrame', 'playerId', 'curStep', }},'lastValue', 'myRanking', 'step', }
		}
	end,
	[0x6a00] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', 'tv4', 'tv4', 'tv4', 'tv4', }},},
			{{true,{'info','instanceId', 'itemId', 'level', 'exp', 'star', 'freeNum', 'position', 'deduceExp', 'researchLevel', 'researchRadio', 'nextRadio', }},}
		}
	end,
	[0x4408] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6907] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'challengeCount', }
		}
	end,
	[0x7606] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', {true,{'v4', 'v4', 'v4', }},},
			{'lastBoss', {true,{'items','type', 'itemId', 'number', }},}
		}
	end,
	[0x0e01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},'v4', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},{true,{'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'rolelist','userid', 'id', 'level', 'curexp', 'quality', 'starlevel', 'starExp', {true,{'spellId','skillId', 'level', }},{true,{'equiplist','userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},{true,{'ppInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},{true,{'changePPInfo','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},'skillStarLevel', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},{true,{'destiny','instanceId', 'templateId', 'roleId', 'pos', 'level', 'stepExp', 'quality', 'type', 'star', 'starLevel', }},}},}
		}
	end,
	[0x3801] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7b08] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', },
			{'instanceId', }
		}
	end,
	[0x1505] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'userid', 'quality', }
		}
	end,
	[0x7b01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 'b', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},},
			{{true,{'heartMethodInfo','instanceId', 'itemId', 'practiceId', 'breachId', 'isXinfa', 'number', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}
		}
	end,
	[0x7d04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'number', }
		}
	end,
	[0x2503] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', }},},
			{{true,{'swithList','factionId', 'isOpen', }},}
		}
	end,
	[0x4c05] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'record','playerId', 'playerName', 'type', 'templateId', 'num', 'time', }},}
		}
	end,
	[0x7d01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v8', }},'b', },
			{{true,{'records','type', 'itemId', 'number', 'gainTime', }},'cover', }
		}
	end,
	[0x440d] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5916] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'eventId', }
		}
	end,
	[0x4004] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v8', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v8', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'playerId', 'instanceId', 'goodsId', 'value', 'name', 'playerLevel', 'vipLevel', 'goodNum', 'intensifyLevel', 'starLevel', 'gemId', 'baseAttribute', 'extraAttribute', 'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'lastValue', 'myRanking', 'myBestValue', 'topInstanceId', 'topGoodsId', 'praiseCount', }
		}
	end,
	[0x4704] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', }},{true,{'v4', 's', 'v4', 's', }},},
			{{false,{'player','rank', 'name', 'score', 'serverName', }},{true,{'list','rank', 'name', 'score', 'serverName', }},}
		}
	end,
	[0x5113] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', 'v8', 'v8', },
			{'playerId', 'todayCount', 'totalCount', 'createTime', 'lastUpdate', 'instanceId', }
		}
	end,
	[0x3e07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', },
			{'enableType', 'betToday', 'betTotal', 'lastUpdate', }
		}
	end,
	[0x3601] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 'v8', 'v8', },
			{'switchType', 'open', 'beginTime', 'endTime', }
		}
	end,
	[0x4001] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'playerId', 'power', 'name', 'level', 'vipLevel', 'totalChallenge', 'totalWin', 'goodNum', {true,{'formation','instanceId', 'position', 'templateId', }},'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'lastValue', 'myRanking', 'myBestValue', 'praiseCount', }
		}
	end,
	[0x4080] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 's', 'v4', 's', 'v4', 'b', }},},
			{{true,{'rankInfo','guildId', 'exp', 'name', 'memberCount', 'presidentName', 'power', 'declaration', 'level', 'apply', }},}
		}
	end,
	[0x4060] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'targetId', }
		}
	end,
	[0x5900] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},'tv4', 'v8', 'v8', 'v4', },
			{{true,{'opponent','id', 'name', 'level', 'power', 'icon', 'headPicFrame', 'guildName', 'massacreValue', 'rewardMassacre', 'rewardCoin', 'rewardExperience', {true,{'formation','instanceId', 'position', 'templateId', 'quality', }},{true,{'secondFormation','instanceId', 'position', 'templateId', 'quality', }},'secondPower', 'starHeroRanking', 'ladderGrade', }},'eventId', 'refresheventTime', 'refreshOpponentTime', 'experience', }
		}
	end,
	[0x4011] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},},
			{'last', 'myIntegral', 'myRanking', 'betterRewardValue', 'rewardId', {true,{'rankInfo','rewardIndex', 'minIntegral', 'maxIntegral', }},}
		}
	end,
	[0x4005] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', }},'v8', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v8', 'v4', 'v8', 'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'playerId', 'power', 'name', 'level', 'vipLevel', 'goodNum', {true,{'formation','instanceId', 'position', 'templateId', }},'totalDamage', 'replayId', 'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'last', 'myRanking', 'myBestValue', 'praiseCount', 'betterRewardValue', 'rewardId', }
		}
	end,
	[0x4406] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 's', 'v4', 's', 'v4', 's', 'v4', 's', 'v4', 'v4', 'v4', 'v8', 'b', 's', },
			{'guildId', 'exp', 'name', 'memberCount', 'presidentName', 'power', 'declaration', 'level', 'notice', 'boom', 'state', 'operateId', 'operateTime', 'apply', 'bannerId', }
		}
	end,
	[0x4083] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{true,{'infos','playerId', 'name', 'level', 'profession', 'hurt', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'totleHurt', }
		}
	end,
	[0x7F11] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7d03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'index', }
		}
	end,
	[0x2502] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'power', }
		}
	end,
	[0x2901] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', },
			{'type', 'days', 'times', 'remainWaitTime', }
		}
	end,
	[0x6f0e] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 'b', },
			{'status', 'box', 'settlement', }
		}
	end,
	[0x4f05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', },
			{'instanceId', }
		}
	end,
	[0x6102] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'index', 'isEscape', }
		}
	end,
	[0x5120] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'playerId', 'instanceId', 'useType', }
		}
	end,
	[0x5302] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'taskid', }
		}
	end,
	[0x5200] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'id', 'breachLevel', }
		}
	end,
	[0x1310] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'win', }
		}
	end,
	[0x1315] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},}},{true,{{false,{'v4', 'v4', }},'b', 'v4', }},'v4', 'v4', 'v4', 'v4', }},'v4', },
			{{false,{'player','playerId', 'profession', 'name', 'level', 'vipLevel', 'power', {true,{'warside','id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}},{true,{'spell',{false,{'spellId','skillId', 'level', }},'choice', 'sid', }},'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'starshards', }
		}
	end,
	[0x4507] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'status', }
		}
	end,
	[0x1314] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'times', }
		}
	end,
	[0x1311] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', {false,{'v4', 'v4', 'v4','s', 'v4', 'v4', }},}},},
			{'level', {true,{'rolelist','rank', {false,{'role','playerId', 'profession', 'sex','name', 'level', 'power', }},}},}
		}
	end,
	[0x7e03] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'info','exchangeId', 'count', }},}
		}
	end,
	[0x1307] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', },
			{'oldRank', 'currentRank', 'walk', 'sycee', }
		}
	end,
	[0x4304] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', 'v4', },
			{'playerIds', 'type', }
		}
	end,
	[0x1312] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', {false,{'v4', 'v4', 'v4', 'v4', }},},
			{'hasrank', {false,{'rank','level', 'rank', 'reward', 'nexttime', }},}
		}
	end,
	[0x7f31] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x443F] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {false,{'v4', 's', 's', 's', 'v4', 'v4', 'v4', 'v4', }},}},'v4', },
			{{true,{'infos','count', {false,{'infos','guildId', 'guildName', 'bannerId', 'serverName', 'score', 'winCount', 'lostCount', 'cityId', }},}},'cityId', }
		}
	end,
	[0x6702] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'power', }
		}
	end,
	[0x6800] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},},
			{{false,{'info','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},}
		}
	end,
	[0x0e9c] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'mark', }
		}
	end,
	[0x4087] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'name', 'playerLevel', 'icon', 'headPicFrame', 'playerId', 'curStep', }},'lastValue', 'myRanking', 'step', }
		}
	end,
	[0x1D41] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', {false,{'v4', 'v4', }},{true,{'v4', 'v4', }},'s', 's', 's', 's', 'v4', }},'v4', 'v4', 'v4', 's', }},{false,{'v4', 'b', {true,{'b', 'v4', 'v4', 'v4', 'v4', 'b', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', }},}},'v4', },
			{{false,{'beginInfo','fighttype', 'angerSelf', 'angerEnemy', {true,{'rolelist','typeid', 'roleId', 'maxhp', 'posindex', 'level', 'attr', {false,{'spellId','skillId', 'level', }},{true,{'passiveskill','skillId', 'level', }},'name', 'immune', 'effectActive', 'effectPassive', 'anger', }},'index', 'myBattlearrayId', 'enemyBattlearrayId', 'suppress', }},{false,{'fightData','fighttype', 'win', {true,{'actionlist','bManualAction', 'roundIndex', 'attackerpos', 'skillid', 'skillLevel', 'bBackAttack', {true,{'targetlist','targetpos', 'effect', 'hurt', 'triggerBufferID', 'triggerBufferLevel', 'passiveEffect', 'passiveEffectValue', 'activeEffect', 'activeEffectValue', }},{true,{'stateList','frompos', 'targetpos', 'stateId', 'skillId', 'skillLevel', 'bufferId', 'bufferLevel', }},'triggerType', }},{true,{'livelist','posindex', 'currhp', 'anger', }},'angerSelf', 'angerEnemy', {true,{'hurtcountlist','posindex', 'hurt', }},}},'rank', }
		}
	end,
	[0x1D00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', },
			{'playerName', 'cardId', }
		}
	end,
	[0x6801] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'tv4', 'tv4', 'tv4', }},'tv4', },
			{{true,{'info','roleId', 'stage', 'open', 'attIndex', 'value', 'isLock', }},'isResetChange', }
		}
	end,
	[0x6f11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'myScore', 'myRank', }
		}
	end,
	[0x7100] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v8', 'v8', 'v4', 'v4', 'v4', }},{true,{'v4', 'v8', 'v4', 's', }},'v4', },
			{'layer', {true,{'info','playerId', 'serverId', 'name', 'serverName', 'power', 'pos', 'layer', 'useIcon', 'headPicFrame', 'guildName', 'starHeroRanking', }},{true,{'guildInfo','playerId', 'serverId', 'name', 'layer', 'useIcon', 'headPicFrame', 'starHeroRanking', }},{false,{'myInfo','serverId', 'serverName', 'pos', 'layer', 'startTime', 'challenge', 'settleTime', 'unitedTime', 'unitedTotalIntegral', 'unitedIntegral', 'integral', }},{true,{'united','layer', 'unitedTime', 'serverId', 'serverName', }},'page', }
		}
	end,
	[0x6023] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v8', 'v4', 'v4', 'v8', }},},
			{'result', {false,{'config','bibleId', 'noteChapterId', 'noteFloorId', 'BibleKeyId', }},}
		}
	end,
	[0x5322] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v8', 's', }},'tv4', },
			{{true,{'invaite','playerId', 'recalledId', 'luanchTime', 'inviteCode', }},'playerIds', }
		}
	end,
	[0x2207] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v4', 'v4', 'v4', }},},
			{'type', 'index', {true,{'product','resType', 'resId', 'number', }},}
		}
	end,
	[0x5921] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v8', 'v8', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', 'v4', 'v4', 'v8', 'v4', 'v4', }},'v4', 'v4', 'v4', 'tv4', }},'s', },
			{'status', {false,{'teamInfo','teamId', 'createTime', 'chapterId', 'leader', {true,{'member','playerId', 'name', 'power', 'useIcon', 'frameId', 'starHeroRanking', 'vipLevel', 'level', 'ready', 'passCopy', 'hosting', 'battleCopyId', 'loginTime', 'serverId', 'isAssist', }},'minLevel', 'maxLevel', 'show', 'passCopy', }},'quitMemName', }
		}
	end,
	[0x7108] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1806] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x0d21] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', },
			{'serverStartup', 'lastLogon', }
		}
	end,
	[0x1a06] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1014] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v8', 'v4', {false,{'s', 's', }},}},},
			{'result', {false,{'levelChanged','userid', 'levelUp', {false,{'attr','base_attr', 'extra_attr', }},}},}
		}
	end,
	[0x7109] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'s', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},{false,{'s', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{false,{'serverBest','serverName', 'name', 'formation', 'icon', 'headPicFrame', 'power', 'ranking', 'starHeroRanking', }},{false,{'best','serverName', 'name', 'formation', 'icon', 'headPicFrame', 'power', 'ranking', 'starHeroRanking', }},}
		}
	end,
	[0x7111] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'isOpen', }
		}
	end,
	[0x5400] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'roleId', 'todayCount', 'rewardDay', 'rewardTime', {true,{'info','roleId', 'roleNum', 'roleSycee', 'isGetReward', }},}
		}
	end,
	[0x7112] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 's', 'v4', }},'v4', 'v4', },
			{{true,{'ranks','guildName', 'serverName', 'integra', }},'myIntegra', 'myRank', }
		}
	end,
	[0x7101] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', 'v4', }},},
			{{false,{'info','playerId', 'serverId', 'name', 'serverName', 'power', 'pos', 'layer', 'useIcon', 'headPicFrame', 'guildName', 'starHeroRanking', }},{true,{'formation','instanceId', 'position', 'templateId', 'quality', 'level', }},}
		}
	end,
	[0x5104] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'info','instanceId', 'playerId', 'name', 'relation', 'roleId', 'level', 'start', 'martial', 'power', 'quality', 'forgingQuality', }},}
		}
	end,
	[0x441d] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7106] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x5f08] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},},
			{'type', {false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},}
		}
	end,
	[0x3f05] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1a02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', }},{false,{'v4', 'v4', }},'v4', },
			{{false,{'prev','totalRecharge', 'vipLevel', }},{false,{'current','totalRecharge', 'vipLevel', }},'sycee', }
		}
	end,
	[0x1C04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', },
			{'round', 'alreadyGet', }
		}
	end,
	[0x5903] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', 'tv8', },
			{'formation', 'secondFormation', }
		}
	end,
	[0x1a01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 'b', 'v4', },
			{'id', 'isFirstPay', 'multiple', 'numForRechargeTicket', }
		}
	end,
	[0x1A20] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 's', },
			{'QQ', 'telphone', }
		}
	end,
	[0x2204] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', {false,{'v4', 'v4', 'v4', }},{false,{'v4', 'v4', 'v4','s', 'v4', 'v4', }},'v4', }},},
			{{true,{'info','index', 'empty', {false,{'product','resType', 'resId', 'number', }},{false,{'role','playerId', 'profession', 'sex','name', 'level', 'power', }},'reaminTime', }},}
		}
	end,
	[0x1a12] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'list','index', 'multiple', }},}
		}
	end,
	[0x1a05] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', }},},
			{{true,{'rewardList','id', 'isHaveGot', }},}
		}
	end,
	[0x1D0E] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', },
			{'name', 'gameLevel', }
		}
	end,
	[0x1a00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v4', 's', },
			{'id', 'billNo', 'price', 'goodName', }
		}
	end,
	[0x1a11] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'enable', }
		}
	end,
	[0x4900] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x0E95] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5009] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', }},{true,{{false,{'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},}},{true,{{false,{'v4', 'v4', }},'b', 'v4', }},'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', }},},
			{{true,{'myInfos','instanceId', 'currHp', }},{true,{'infos',{false,{'details','playerId', 'profession', 'name', 'level', 'vipLevel', 'power', {true,{'warside','id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}},{true,{'spell',{false,{'spellId','skillId', 'level', }},'choice', 'sid', }},'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},{true,{'paratInfo','maxHp', 'currHp', 'index', }},'serverId', }},}
		}
	end,
	[0x180B] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x4432] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5928] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','playerId', 'name', 'vip', 'level', 'teamId', 'chapterId', 'createTime', 'icon', 'headPicFrame', 'starHeroRanking', 'quality', 'type', 'serverId', 'isAssist', }},}
		}
	end,
	[0x5700] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'sucess', }
		}
	end,
	[0x4903] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'tv4', 'v4', 'v4', }},},
			{{true,{'gameLevel','sectionId', 'formationId', 'options', 'choice', 'score', }},}
		}
	end,
	[0x4902] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'tv4', 'v4', 'v4', }},{true,{'v4', 'tv4', 'v4', 'b', }},'v4', 'v4', 'v4', 'v4', 'v4', 'b', },
			{'currentId', {true,{'gameLevel','sectionId', 'formationId', 'options', 'choice', 'score', }},{true,{'attribute','index', 'option', 'choice', 'skip', }},'maxPassCount', 'maxSweepCount', 'tokens', 'remainResetCount', 'chestGotMark', 'hasNotPass', }
		}
	end,
	[0x4923] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', },
			{'sectionId', 'options', }
		}
	end,
	[0x4921] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'tv4', 'v4', 'b', }},},
			{{true,{'attribute','index', 'option', 'choice', 'skip', }},}
		}
	end,
	[0x0f2c] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'b', 'tv4', {true,{'v4', 'b', 'v4', 'v4', }},}},{false,{'v4', 'b', 'tv4', {true,{'v4', 'b', 'v4', 'v4', }},}},},
			{{false,{'atkInfo','strategyType', 'isUse', 'baseOrder', {true,{'specialOrder','roleId', 'isCheckBox', 'specialOrderType', 'percentNum', }},}},{false,{'defInfo','strategyType', 'isUse', 'baseOrder', {true,{'specialOrder','roleId', 'isCheckBox', 'specialOrderType', 'percentNum', }},}},}
		}
	end,
	[0x5320] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'playerId', }
		}
	end,
	[0x0f2a] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', 'tv4', {true,{'v4', 'b', 'v4', 'v4', }},}},},
			{{true,{'infos','strategyType', 'isUse', 'baseOrder', {true,{'specialOrder','roleId', 'isCheckBox', 'specialOrderType', 'percentNum', }},}},}
		}
	end,
	[0x1203] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'missionId', }
		}
	end,
	[0x4d04] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 's', 's', }},},
			{{true,{'records','time', 'rewards', 'playerName', }},}
		}
	end,
	[0x7b13] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'pos', 'level', }
		}
	end,
	[0x5b03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'rewardId', }
		}
	end,
	[0x1201] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4','v4', 'v4', },
			{'missionId', 'challengeCount', 'starLevel','resetCount', 'state', }
		}
	end,
	[0x5702] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'sucess', }
		}
	end,
	[0x1207] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv8', },
			{'infolist', }
		}
	end,
	[0x3f10] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'b', },
			{{true,{'info','instanceId', 'templateId', 'roleId', 'pos', 'level', 'stepExp', 'quality', 'type', 'star', 'starLevel', }},'bend', }
		}
	end,
	[0x0F22] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'win', 'result', 'atkName', 'defName', 'atkProfession', 'defProfession', 'atkHurt', 'defHurt', 'atkIcon', 'defIcon', 'atkHeadPicFrame', 'defHeadPicFrame', 'atkStarHeroRanking', 'defStarHeroRanking', }
		}
	end,
	[0x7d02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{'type', 'sycee', 'value', 'number', {true,{'items','index', 'type', 'number', 'itemId', 'kind', }},}
		}
	end,
	[0x5100] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v8', 'v4', 'v4', 'v4', }},},
			{{true,{'roleList','roleId', 'startTime', 'coin', 'indexId', 'count', }},}
		}
	end,
	[0x0e24] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1808] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x5000] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v8', 'v8', 'tv8', {false,{'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},}},{true,{{false,{'v4', 'v4', }},'b', 'v4', }},'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 's', 'v4', {false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', }},'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{'leftFreeRefreshTime', 'hireTime', 'brokerageTotal', {true,{'info','type', 'status', 'robStatus', 'startTime', 'endTime', 'formation', {false,{'guardInfo','playerId', 'profession', 'name', 'level', 'vipLevel', 'power', {true,{'warside','id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}},{true,{'spell',{false,{'spellId','skillId', 'level', }},'choice', 'sid', }},'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'power', 'playerId', 'name', 'profession', {false,{'robInfo','playerId', 'name', 'profession', 'power', 'battleId', 'icon', 'headPicFrame', 'starHeroRanking', 'serverId', }},'id', 'robResource', 'rewardResource', 'icon', 'headPicFrame', 'starHeroRanking', 'mineServerId', }},}
		}
	end,
	[0x5165] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', 'v8', },
			{'playerId', 'todayCount', 'totalCount', 'createTime', 'lastUpdate', }
		}
	end,
	[0x6001] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v8', 'v8', },
			{'result', 'roleId', 'bible', 'drop', }
		}
	end,
	[0x500F] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5003] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5004] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5008] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x0e73] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},},
			{'id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}
		}
	end,
	[0x6f09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'rewardId', }
		}
	end,
	[0x441e] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5001] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5010] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'guardPlayerIds', }
		}
	end,
	[0x4701] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', }},'s', 's', },
			{{true,{'configList','type', 'resType', 'resId', 'number', 'score', 'freeTime', 'reward', }},'ColorEggInfoReward', 'ColorEggSpecialReward', }
		}
	end,
	[0x6007] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', },
			{'result', 'itemId', }
		}
	end,
	[0x5007] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v8', 'v8', 'v4', 'v4', }},},
			{{true,{'info','minePlayerId', 'guardPlayerId', 'mineIcon', 'guardIcon', 'mineHeadIcon', 'guardHeadIcon', 'power', 'playerName', 'serverId', 'endTime', 'startTime', 'id', 'type', }},}
		}
	end,
	[0x3220] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'remainResetTime', }
		}
	end,
	[0x5002] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x500A] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1D60] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v4', 'v8', 'v8', 'v4', 'v4', },
			{'messageId', 'content', 'intervalTime', 'beginTime', 'endTime', 'repeatTime', 'priority', }
		}
	end,
	[0x1D33] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', },
			{'type', 'context', }
		}
	end,
	[0x4b01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', }},{true,{'v4', 's', 'v4', 'v4', 'v4', }},},
			{'battleTime', {false,{'guildBossinfo','secondlyProgress', 'status', 'result', 'triggerTime', 'openTime', 'endTime', 'helpBattleTime', 'passStage', 'stage', 'npcId', }},{true,{'npcInfo','npcId', 'currentBlood', 'dieTime', 'dieCount', 'bossBuff', }},}
		}
	end,
	[0x1043] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', },
			{'roleId', 'equipment', }
		}
	end,
	[0x7e01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'AnniInfo','type', {true,{'mission','activityId', 'progress', 'status', 'missionType', }},}},}
		}
	end,
	[0x1D06] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', 's', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'list','reportId', 'fightType', 'win', 'time', 'playerName', 'playerLev', 'playerPower', 'myRankPos', 'reward', }},}
		}
	end,
	[0x443A] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'sucess', }
		}
	end,
	[0x1D42] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', 'v4', 'v4', 'v4', 'v4', {false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'report','reportId', 'fightType', 'win', 'time', 'ranking', 'fromRank', 'power', 'targetPower', {false,{'fromRole','playerId', 'name', 'profession', 'level', 'vipLevel', 'power', 'serverId', }},{false,{'targetRole','playerId', 'name', 'profession', 'level', 'vipLevel', 'power', 'serverId', }},}},}
		}
	end,
	[0x1D63] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'messageId', }
		}
	end,
	[0x1814] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x3308] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4301] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x6008] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'result', 'bible', }
		}
	end,
	[0x1D09] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'content', }
		}
	end,
	[0x1720] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{'id', {true,{'result','exp', 'oldLevel', 'currentLevel', 'coin', {true,{'item','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x1D70] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v4', },
			{'playerId', 'name', 'type', }
		}
	end,
	[0x7110] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1D0D] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 's', 'v4', },
			{'oldName', 'newName', 'ranking', }
		}
	end,
	[0x4424] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4b04] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'player','npcId', 'playerId', 'playerName', 'useCoin', 'frameId', 'power', }},}
		}
	end,
	[0x6017] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', {true,{'v4', 'v4', }},}},},
			{{false,{'info','bibleId', {true,{'data','position', 'level', }},}},}
		}
	end,
	[0x4505] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5804] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1D23] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1D0A] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', }},},
			{{true,{'rankingInfo','playerId', 'displayId', 'name', 'level', 'vipLevel', }},}
		}
	end,
	[0x5909] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'log','id', 'name', 'level', 'power', 'icon', 'headPicFrame', 'type', 'massacreValue', 'coin', 'experience', 'battleTime', 'firstRecordId', 'secondRecordId', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x1D05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'fightNotifyNum', 'socialNotifyNum', 'systemNotifyNum', }
		}
	end,
	[0x441c] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1D32] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', 'v4', 'v4', 'v4', },
			{'playerName', 'type', 'id', 'num', 'eggType', }
		}
	end,
	[0x5910] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x3401] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', },
			{'roleId', 'martialId', 'position', }
		}
	end,
	[0x4516] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 's', 'v4', 'v4', }},'s', 's', },
			{{true,{'ranks','name', 'serverName', 'power', 'playerId', }},'atkFormation', 'defFromation', }
		}
	end,
	[0x2103] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'battleType', }
		}
	end,
	[0x3402] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'roleId', 'martialLevel', {true,{'martialInfo','id', 'position', 'enchantLevel', 'enchantProgress', }},}
		}
	end,
	[0x1710] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},},
			{'id', {true,{'result','exp', 'oldLevel', 'currentLevel', 'coin', {true,{'item','type', 'number', 'itemId', }},}},}
		}
	end,
	[0x180A] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x1081] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 's', },
			{'equipment', 'lastExtra', }
		}
	end,
	[0x3f01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'info','instanceId', 'templateId', 'roleId', 'pos', 'level', 'stepExp', 'quality', 'type', 'star', 'starLevel', }},}
		}
	end,
	[0x6a07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 'v4', 'v4', }},},
			{'result', {true,{'info','type', 'id', 'number', }},}
		}
	end,
	[0x1090] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', },
			{'srcId', 'targetId', }
		}
	end,
	[0x7c01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v8', 'v8', 'v8', {true,{'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},}},},
			{{false,{'info','id', 'startTime', 'endTime', 'lastGotRewardTime', {true,{'rewardInfo','type', 'radio', {true,{'item','itemId', 'type', 'number', }},}},}},}
		}
	end,
	[0x3100] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 's', 's', 's', 's', 's', },
			{'equipStr', 'roleStr', 'bibleStr', 'battleArrayStr', 'bibleKeyStr', 'xinfaStr', }
		}
	end,
	[0x4b08] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'player','npcId', 'playerId', 'playerName', 'useCoin', 'frameId', 'power', }},}
		}
	end,
	[0x6908] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 's', {false,{'v4', 'v4', 'v4', }},'v4', }},},
			{'type', {true,{'rewardInfo','playerId', 'playerName', {false,{'item','type', 'number', 'itemId', }},'floorId', }},}
		}
	end,
	[0x6f0f] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{'useIcon', 'headPicFrame', 'targetId', 'targetName', 'targetGroup', 'targetRank', 'targetScore', 'targetPower', {true,{'info','position', 'templateId', 'quality', 'level', 'forgingQuality', }},}
		}
	end,
	[0x2800] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v8', 'v8', 'v8', }},'v8', },
			{{true,{'info','id', 'startTime', 'endTime', 'lastGotRewardTime', }},'lastGotCardRewardTime', }
		}
	end,
	[0x6900] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', }},{true,{'v4', {false,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},}},{true,{'v4', 's', }},},
			{{false,{'info','floorId', 'minedCount', 'reviveCount', 'resetCount', 'challengeCount', 'die', 'start', 'point', }},{true,{'floorInfo','floorId', {false,{'item','type', 'number', 'itemId', }},'minedCount', 'reviveCount', 'resetCount', {true,{'luckyBag','type', 'number', 'itemId', }},}},{true,{'consumeInfo','type', 'value', }},}
		}
	end,
	[0x6902] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', },
			{'pointType', 'pointTypes', }
		}
	end,
	[0x3f04] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6e05] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6903] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'index', 'floorId', }
		}
	end,
	[0x4403] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6b04] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', }},},
			{{false,{'info','integral', 'currency', }},}
		}
	end,
	[0x5b01] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v8', }},{true,{'v4', 'v4', }},'v4', 'tv4', 's', },
			{{true,{'config','id', 'goods', 'price', 'currentPrice', 'discount', 'customerLimit', 'beginTime', 'endTime', }},{true,{'rewardConfig','id', 'consumeNum', 'rewardNum', }},{true,{'historyInfo','id', 'type', 'time', }},{true,{'buyBackData','id', 'current', }},'consumeNum', 'rewardId', 'buyBack', }
		}
	end,
	[0x440e] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5202] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6110] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'blood', 'lastRefreshTime', }
		}
	end,
	[0x0d01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'statusCode', }
		}
	end,
	[0x2701] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', 'v4', 'v4', },
			{'monthDay', 'isSign', 'month', 'monthDaySum', }
		}
	end,
	[0x4506] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4','s', },
			{'type','msg', }
		}
	end,
	[0x4521] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4','s', },
			{'type','msg', }
		}
	end,
	[0x100D] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', },
			{'userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }
		}
	end,
	[0x0D23] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'playerId', }
		}
	end,
	[0x5a02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', }},},
			{{false,{'dataInfo','id', 'current', 'serverCurrent', }},}
		}
	end,
	[0x2205] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', },
			{'index', 'resType', 'resId', 'number', }
		}
	end,
	[0x1818] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x1901] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'commodity','commodityId', 'num', }},}
		}
	end,
	[0x1204] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', {true,{{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', }},},
			{'missionId', 'useQuickPassTimes', 'useResetTimes', 'challengeCount', {true,{'itemlist',{true,{'itemlist','type', 'number', 'itemId', }},'addExp', 'oldLev', 'currLev', 'addCoin', }},}
		}
	end,
	[0x7902] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', },
			{{true,{'infos','playerId', 'name', 'grade', 'star', 'serverName', 'useIcon', 'power', 'headPicFrame', 'level', 'starHeroRanking', }},'grade', 'star', }
		}
	end,
	[0x3f03] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x7a07] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1804] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'playerList','playerId', 'playerName', 'playerLevel', 'generalId', 'fightPower', }},}
		}
	end,
	[0x443c] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'sucess', }
		}
	end,
	[0x5602] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v8', 'b', },
			{'instanceId', 'roleFateId', 'endTime', 'forever', }
		}
	end,
	[0x3904] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'freeChallengeCount', 'buyChallengeCount', }
		}
	end,
	[0x4407] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'b', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'competence', 'totleDedication', 'todayDedication', 'makedCoubt', 'online', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x5153] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', },
			{'operation', 'coin', }
		}
	end,
	[0x1041] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4',{false,{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{false,{'v8', 'v4', }},},
			{'type',{false,{'equipment','userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{false,{'item','id', 'num', }},}
		}
	end,
	[0x1050] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'b', },
			{'result', 'success', }
		}
	end,
	[0x5161] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 's', 's', 's', 'v4', }},{true,{'v4', 'v4', 'v8', 'v4', }},},
			{'fromId', 'useType', {true,{'roleDetails','instanceId', 'position', 'roleId', 'level', 'martialLevel', 'starlevel', 'power', 'hp', 'spell', 'attributes', 'immune', 'effectActive', 'effectPassive', 'quality', }},{true,{'assistant','position', 'roleId', 'instanceId', 'quality', }},}
		}
	end,
	[0x3410] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'roleId', {true,{'martial','id', 'position', 'enchantLevel', 'enchantProgress', }},}
		}
	end,
	[0x0dff] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5807] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', },
			{'enableType', 'betToday', 'betTotal', 'lastUpdate', }
		}
	end,
	[0x7F12] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'openTime', }
		}
	end,
	[0x5f10] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 'v4', 's', {true,{{false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},'s', 's', 'v4', 'v4', }},}},{false,{'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', {true,{'v4', 'v4', 'v4', 's', 'v4', 's', 's', 'v4', 'v4', 'v4', }},}},},
			{{false,{'cardRankInfo','myGuildId', 'bannerId', 'lastScore', 'myRanking', 'myGuildName', {true,{'cardRank',{false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},'guildName', 'serverName', 'serverId', 'rank', }},}},{false,{'killRankInfo','myPlayerId', 'useCoin', 'frameId', 'lastScore', 'myRanking', 'myPlayerName', 'guildName', {true,{'killRank','playerId', 'useCoin', 'frameId', 'serverName', 'serverId', 'playerName', 'guildName', 'power', 'killCount', 'rank', }},}},}
		}
	end,
	[0x1011] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'statusCode', }
		}
	end,
	[0x1D40] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', 'v4', 'v4', 'v4', 'v4', {false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'report','reportId', 'fightType', 'win', 'time', 'ranking', 'fromRank', 'power', 'targetPower', {false,{'fromRole','playerId', 'name', 'profession', 'level', 'vipLevel', 'power', 'serverId', }},{false,{'targetRole','playerId', 'name', 'profession', 'level', 'vipLevel', 'power', 'serverId', }},}},}
		}
	end,
	[0x1020] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', 'v4', }},{false,{'v8', 'v4', }},},
			{{false,{'success','equipment', 'star', 'grow', }},{false,{'fail','equipment', 'fail', }},}
		}
	end,
	[0x6904] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'items','type', 'number', 'itemId', }},}
		}
	end,
	[0x4511] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'tv8', 'tv8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'infos','round', 'index', 'atkPlayerId', 'defPlayerId', 'winPlayerId', 'replayId', 'atkPlayerName', 'defPlayerName', 'betPlayerId', 'coin', 'atkProfession', 'defProfession', 'atkPower', 'defPower', 'atkFormation', 'defFormation', 'atkIcon', 'defIcon', 'atkHeadPicFrame', 'defHeadPicFrame', 'atkPeakAddition', 'defPeakAddition', 'atkStarHeroRanking', 'defStarHeroRanking', }},}
		}
	end,
	[0x4b06] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 'v4', 'v4', 's', 'v4', {true,{'v4', 's', 's', 'v4', 'v4', 'v4', 'v4', }},}},},
			{'type', {false,{'rankInfo','myGuildId', 'myRanking', 'myStage', 'myGuildName', 'myTime', {true,{'guildBossRank','guildId', 'guildName', 'serverName', 'serverId', 'rank', 'stage', 'time', }},}},}
		}
	end,
	[0x1019] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 's', },
			{'equipment', 'extra_attr', }
		}
	end,
	[0x2072] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', }},},
			{{true,{'fundInfo','fundId', 'status', }},}
		}
	end,
	[0x6108] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', {true,{'v4', 'v4', }},},
			{'blood', 'lastRefreshTime', {true,{'dropGoods','index', 'gameMoney', }},}
		}
	end,
	[0x6109] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', }},'v4', 'v4', },
			{{true,{'infos','playerId', 'name', 'score', 'rank', }},'myRank', 'myScore', }
		}
	end,
	[0x6026] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v8', }},},
			{{true,{'info','id', 'template_id', 'level', 'bibleId', }},}
		}
	end,
	[0x5170] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'playerId', 'useType', }
		}
	end,
	[0x7906] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {false,{'v4', 'v4', 's', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v8', 'v4', 's', 'v4', {true,{'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},'v4', 'tv4', {true,{'v4', 'v4', }},'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'s', 's', 's', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},'tv4', {false,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},}},'v4', 'v4', 'v4', {true,{'v4', 'v4', }},'b', {true,{'v8', 'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},}},}},{true,{{false,{'v4', 'v4', }},'b', 'v4', }},'v4', 'v4', 'v4', 'v4', }},},
			{'grade', {false,{'details','playerId', 'profession', 'name', 'level', 'vipLevel', 'power', {true,{'warside','id', 'level', 'curexp', 'power', 'attributes', 'warIndex', {true,{'equipment','id', 'level', 'quality', 'refineLevel', {true,{'gem','pos', 'id', }},{true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{true,{'book','templateId', 'level', 'attribute', }},{true,{'meridians','index', 'level', 'attribute', }},'starlevel', 'fateIds', {true,{'spellId','skillId', 'level', }},'quality', 'martialLevel', {true,{'martial','id', 'position', 'enchantLevel', }},'immune', 'effectActive', 'effectPassive', {true,{'bibleInfo','instanceId', 'id', 'roleId', 'level', 'breachLevel', {true,{'essential','pos', 'id', }},'gemId', {false,{'comInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}},'forgingQuality', 'skillStarLevel', 'biblePracticeQuality', {true,{'biblePracticeData','position', 'level', }},'equipHide', {true,{'xinfa','instanceId', 'itemId', 'roleId', 'practiceId', 'breachId', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}},}},{true,{'spell',{false,{'spellId','skillId', 'level', }},'choice', 'sid', }},'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x6f03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 's', 's', 'v4', 'tv4', 's', 'v4', }},},
			{'myGroup', 'myRank', 'myScore', {true,{'players','rank', 'playerId', 'playerName', 'playerLevel', 'useIcon', 'fightPower', 'serverName', 'guildName', 'playerGroup', 'suitNum', 'bannerId', 'playerScore', }},}
		}
	end,
	[0x6013] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', },
			{'result', 'pos', 'bibleId', }
		}
	end,
	[0x4b07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', 'tv4', 'v4', 's', },
			{'type', 'npcId', 'hurt', 'playerId', 'playerName', }
		}
	end,
	[0x1016] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'result', 'userid', }
		}
	end,
	[0x5130] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', }},{true,{'v4', 'v4', 'v8', 'v4', }},'v8', },
			{'type', {true,{'role','instanceId', 'position', }},{true,{'assistant','position', 'roleId', 'instanceId', 'quality', }},'employRole', }
		}
	end,
	[0x5404] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'roleId', 'rewardDay', {true,{'info','roleId', 'roleNum', 'roleSycee', 'isGetReward', }},}
		}
	end,
	[0x4448] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'smallStatus', 'bigStatus', 'secondlyProgress', }
		}
	end,
	[0x4430] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x0e70] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4','s', 'v4', 'v4', },
			{'playerId', 'profession', 'sex','name', 'level', 'power', }
		}
	end,
	[0x2601] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3306] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', 's', 's', 's', }},},
			{{true,{'award','type', 'step', 'condition', 'state', 'reward_1', 'reward_2', 'reward_3', }},}
		}
	end,
	[0x5114] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 's', 's', 's', 'v4', 'v4', 's', 'v4', },
			{'instanceId', 'useType', 'roleId', 'level', 'martialLevel', 'starlevel', 'power', 'hp', 'spell', 'attributes', 'immune', 'effectActive', 'effectPassive', 'state', 'quality', 'name', 'forgingQuality', }
		}
	end,
	[0x2203] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'b', 'v4', 'v4', 'v4', },
			{'treasureExpression', 'hasMiningPoint', 'remainTime', 'type', 'index', }
		}
	end,
	[0x7406] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v4', 'tv4', 'v4', 'v4', 'v4', 's', 'v8', }},}},},
			{{true,{'ranks','playerId', 'name', 'homeLevel', 'praiseCount', 'icon', 'headPicFrame', 'exp', {true,{'events','eventId', 'players', 'totleCount', 'count', 'state', 'args', 'time', }},}},}
		}
	end,
	[0x5803] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'index', }
		}
	end,
	[0x441a] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v8', {true,{'v4', 'b', {true,{'v4', 'v4', 'v4', }},}},'b', 'v8', 's', 'v4', }},{true,{'v4', 'v4', {true,{'v4', 'v4', }},'tv4', }},},
			{{true,{'guildZones','zoneId', 'resetCount', 'lockPlayerId', 'lockTime', {true,{'checkpoints','checkpointId', 'pass', {true,{'states','index', 'hp', 'maxHp', }},}},'pass', 'bastPassTime', 'lockPlayerName', 'profession', }},{true,{'playerZones','zoneId', 'challengeCount', {true,{'checkpoints','checkpointId', 'hurt', }},'dropAwards', }},}
		}
	end,
	[0x7404] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'level', }
		}
	end,
	[0x4522] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5f06] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},},
			{{false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},}
		}
	end,
	[0x4523] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4308] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 'v4', 'v8', 'v4', 'v4', 'b', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{false,{'info','playerId', 'name', 'vip', 'power', 'lastLoginTime', 'profession', 'level', 'online', 'guildId', 'guildName', 'minePower', 'icon', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x5912] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'result', 'playerId', 'type', }
		}
	end,
	[0x4003] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v8', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', 'v8', 'v4', },
			{{true,{'rankInfo','ranking', 'playerId', 'instanceId', 'roleId', 'value', 'name', 'playerLevel', 'vipLevel', 'goodNum', 'roleLevel', 'martialLevel', 'starLevel', 'quality', 'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'lastValue', 'myRanking', 'myBestValue', 'topRoleId', 'topInstanceId', 'praiseCount', }
		}
	end,
	[0x4433] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{false,{'v4', 's', 's', 's', 'v4', 'v4', 'v4', 'v4', }},{true,{'s', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'infos',{false,{'guildInfo','guildId', 'guildName', 'bannerId', 'serverName', 'score', 'winCount', 'lostCount', 'cityId', }},{true,{'members','name', 'useIcon', 'power', 'headPicFrame', 'playerId', 'starHeroRanking', 'ladderGrade', }},}},}
		}
	end,
	[0x6a02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', }},},
			{{true,{'data','instanceId', 'type', }},}
		}
	end,
	[0x4707] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'count', 'score', {true,{'rewardList','resType', 'resId', 'number', 'isSpecial', }},}
		}
	end,
	[0x1800] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', }},},
			{{true,{'rankList','rank', 'gangId', 'gangName', 'gangLevel', 'memberNum', 'masterId', 'masterName', 'applyStatus', }},}
		}
	end,
	[0x2308] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', },
			{'activityId', }
		}
	end,
	[0x6e09] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 'v4', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v8', }},},
			{{true,{'leizhu','number', 'name', 'serverName', 'serverId', {true,{'member','playerId', 'name', 'useIcon', 'frameId', 'starHeroRanking', 'level', 'roleId', 'vipLevel', 'redPacket', }},'leaderId', 'teamId', }},}
		}
	end,
	[0x4303] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3206] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v8', },
			{'fromPos', 'toPos', 'roleId', }
		}
	end,
	[0x0e51] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'userId', 'currentExp', }
		}
	end,
	[0x6f07] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'b', 'v8', {false,{'s', 'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', }},{false,{'s', 'v4', 's', 'v4', 'v4', 'v4', 's', 'v4', }},'v4', }},},
			{{true,{'reports','reportId', 'win', 'time', {false,{'fromRole','serverName', 'playerGroup', 'playerName', 'playerPower', 'playerRank', 'playerScore', 'guildName', 'playerOldRank', }},{false,{'targetRole','serverName', 'playerGroup', 'playerName', 'playerPower', 'playerRank', 'playerScore', 'guildName', 'playerOldRank', }},'serverId', }},}
		}
	end,
	[0x0d20] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', },
			{'serverStartup', 'lastLogon', }
		}
	end,
	[0x1603] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'bookpos', }
		}
	end,
	[0x6f0b] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'rewardId', }
		}
	end,
	[0x1811] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{'buildLevel', 'cdLeaveTime', 'leaveRefleshNum', 'dayRefleshNum', {true,{'exchangeList','type', 'number', 'itemId', 'price', 'status', }},}
		}
	end,
	[0x5303] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'tasklist','taskid', 'state', 'currstep', 'totalstep', }},}
		}
	end,
	[0x5907] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', },
			{'massacre', 'coin', 'experience', 'ranking', }
		}
	end,
	[0x4085] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', },
			{{true,{'rankInfo','ranking', 'name', 'playerLevel', 'icon', 'headPicFrame', 'playerId', 'curStep', }},'lastValue', 'myRanking', 'step', }
		}
	end,
	[0x500E] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'b', 'v8', 'v4', 'v4', 'v4', 'v4', {false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},}},},
			{{true,{'report','reportId', 'fightType', 'win', 'time', 'ranking', 'fromRank', 'power', 'targetPower', {false,{'fromRole','playerId', 'name', 'profession', 'level', 'vipLevel', 'power', 'serverId', }},{false,{'targetRole','playerId', 'name', 'profession', 'level', 'vipLevel', 'power', 'serverId', }},}},}
		}
	end,
	[0x4501] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv8', 'tv8', 'v4', 'v4', 'v4', 'v4', 'v4', }},'tv4', 'v4', 'v8', 'b', },
			{{false,{'info','atkWinStreak', 'atkMaxWinStreak', 'defWinStreak', 'defMaxWinSteak', 'score', 'atkFormation', 'defFormation', 'atkWinCount', 'atkLostCount', 'defWinCount', 'defLostCount', 'betWinCount', }},'boxes', 'matchCount', 'lastMatchTime', 'hosting', }
		}
	end,
	[0x3e01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'count', }
		}
	end,
	[0x4411] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4','s', },
			{'type','mess', }
		}
	end,
	[0x4446] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'type', 'sendStatus', }
		}
	end,
	[0x6f02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 's', 's', 'v4', 'tv4', 's', 'v4', }},'v8', },
			{'myGroup', 'myRank', 'myScore', 'challengeNum', 'rewardIds', {true,{'players','rank', 'playerId', 'playerName', 'playerLevel', 'useIcon', 'fightPower', 'serverName', 'guildName', 'playerGroup', 'suitNum', 'bannerId', 'playerScore', }},'endTime', }
		}
	end,
	[0x1810] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x0F03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'result', 'killnum', 'bloodnum', }
		}
	end,
	[0x440f] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6f12] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'playerId', 'power', }
		}
	end,
	[0x6106] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'have', }
		}
	end,
	[0x2307] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'power', }
		}
	end,
	[0x2004] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'tasklist','taskid', 'state', 'currstep', 'totalstep', }},}
		}
	end,
	[0x6700] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1206] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', },
			{'info', }
		}
	end,
	[0x6019] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'info','type', 'id', 'number', }},}
		}
	end,
	[0x2301] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 'v4', 's', 'v4', 'b', 's', 's', 's', 's', 's', 'v4', 'b', 'b', 'b', }},},
			{{true,{'info','id', 'name', 'title', 'type', 'resetCron', 'status', 'history', 'icon', 'details', 'reward', 'beginTime', 'endTime', 'showWeight', 'crossServer', 'show', 'limitStore', }},}
		}
	end,
	[0x443D] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x3902] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4010] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', {true,{'v8', 'v4', 'v4', }},'v4', 'v4', 'v4', 'v4', }},},
			{'last', 'myIntegral', 'myRanking', 'betterRewardValue', 'rewardId', 'praiseCount', {true,{'rankInfo','ranking', 'playerId', 'name', 'level', 'vipLevel', 'integral', 'praiseCount', 'power', {true,{'formation','instanceId', 'position', 'templateId', }},'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x4437] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 's', 's', 's', 'v4', 'v4', 'v4', 'v4', }},}},'v4', },
			{{true,{'simpleInfos','cityId', {true,{'infos','guildId', 'guildName', 'bannerId', 'serverName', 'score', 'winCount', 'lostCount', 'cityId', }},}},'cityId', }
		}
	end,
	[0x3b04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'tv4', 'tv4', },
			{'status', 'startTime', 'trueCount', 'datiIds', 'id', }
		}
	end,
	[0x4524] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'betRadio', }
		}
	end,
	[0x7FFF] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'errorCode', 'cmdId', }
		}
	end,
	[0x5932] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'buriedTreasures', }
		}
	end,
	[0x1015] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv8', },
			{'result', 'userid', }
		}
	end,
	[0x4510] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5703] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', {true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', }},},
			{{true,{'infos','eliteId', {true,{'battleInfo','playerId', 'power', 'name', 'profession', 'headPicFrame', 'starHeroRanking', 'ladderGrade', }},'id', }},}
		}
	end,
	[0x4421] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', {true,{'v4', 'b', {true,{'v4', 'v4', 'v4', }},}},'b', 'v8', 's', 'v4', },
			{'zoneId', 'resetCount', 'lockPlayerId', 'lockTime', {true,{'checkpoints','checkpointId', 'pass', {true,{'states','index', 'hp', 'maxHp', }},}},'pass', 'bastPassTime', 'lockPlayerName', 'profession', }
		}
	end,
	[0x5905] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', 's', 'v4', {true,{'v8', 'v4', 'v4', 'v4', }},{true,{'v8', 'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},},
			{{true,{'enemy','id', 'name', 'level', 'power', 'icon', 'headPicFrame', 'revengeNum', 'battleTime', 'rewardMassacre', 'rewardCoin', 'rewardExperience', 'guildName', 'massacreValue', {true,{'formation','instanceId', 'position', 'templateId', 'quality', }},{true,{'secondFormation','instanceId', 'position', 'templateId', 'quality', }},'secondPower', 'starHeroRanking', 'ladderGrade', }},}
		}
	end,
	[0x592a] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 's', 'b', 'v8', 'v4', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'power', 'icon', 'headPicFrame', 'level', 'vip', 'name', 'guildId', 'guildName', 'online', 'lastLoginTime', 'playerId', {true,{'mate','index', 'hp', 'maxHp', 'icon', }},}
		}
	end,
	[0x5914] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x7b07] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', },
			{'instanceId', 'price', }
		}
	end,
	[0x5151] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6006] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'result', 'instanceId', }
		}
	end,
	[0x1816] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x500D] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', {true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', }},'b', 'v4', 'v4', 'v4', 's', }},},
			{{true,{'results','time', {true,{'infos','playerId', 'name', 'profession', 'icon', 'headPicFrame', 'starHeroRanking', 'serverId', }},'sucess', 'challengePlayerCount', 'challengeGuardCount', 'id', 'robResource', }},}
		}
	end,
	[0x6025] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', },
			{'result', 'bible', }
		}
	end,
	[0x1923] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 'v8', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'id', 'type', 'resType', 'resId', 'number', 'consumeType', 'consumeId', 'consumeNumber', 'isLimited', 'consumeAdd', 'needVipLevel', 'beginTime', 'endTime', 'maxType', 'maxNum', 'vipMaxNumMap', 'oldPrice', 'limitType', 'isHot', 'timeType', 'orderNo', }
		}
	end,
	[0x5936] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v8', 'v8', 'v4', 's', 's', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'treasureDetails','playerName', 'treasureId', 'leftTimes', 'buriedTime', 'mapId', 'isHiddenName', 'dropItem', 'digName', 'serverName', 'rowId', 'colId', 'specialBox', }},}
		}
	end,
	[0x4513] = function()
		return {
			{"net.NetHelper", "receive"},
			{'tv4', 's', },
			{'id', 'name', }
		}
	end,
	[0x4526] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'winCount', 'boxes', }
		}
	end,
	[0x1021] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'fail', }
		}
	end,
	[0x7b04] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v8', },
			{'roleId', 'heartMid', }
		}
	end,
	[0x0F20] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', {false,{'v4', 'v4', }},{true,{'v4', 'v4', }},'s', 's', 's', 's', 'v4', }},'v4', 'v4', 's', },
			{'fighttype', 'angerSelf', 'angerEnemy', {true,{'rolelist','typeid', 'roleId', 'maxhp', 'posindex', 'level', 'attr', {false,{'spellId','skillId', 'level', }},{true,{'passiveskill','skillId', 'level', }},'name', 'immune', 'effectActive', 'effectPassive', 'anger', }},'myBattlearrayId', 'enemyBattlearrayId', 'suppress', }
		}
	end,
	[0x4435] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 's', 'v4', 'v4', 'v4', 'v4', }},'tv4', 'v4', },
			{{true,{'rankInfos','guildId', 'guildName', 'bannerId', 'serverName', 'score', 'winCount', 'lostCount', 'cityId', }},'battleQueue', 'updateCount', }
		}
	end,
	[0x7b02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v4', 'b', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'v4', }},},
			{'instanceId', 'itemId', 'practiceId', 'breachId', 'isXinfa', 'number', {true,{'gemInfo','pos', 'itemId', }},{true,{'concise','pos', 'level', }},{true,{'recast','pos', 'level', }},}
		}
	end,
	[0x1C00] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'b', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', 'tv4', },
			{{true,{'stateList','cardType', 'firstGet', 'freeTimes', 'cdTime', 'todayTimes', 'totalCount', }},'toltalCount', 'round', 'alreadyGet', }
		}
	end,
	[0x1606] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 'b', 'v8', 'v8', 'v8', }},},
			{{true,{'booklist','objID', 'resID', 'level', 'exp', 'lock', 'roleID', 'position', 'attrAdd', }},}
		}
	end,
	[0x6b03] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', },
			{{true,{'info','playerId', 'name', 'icon', 'frame', 'level', 'sycee', 'vipLevel', 'guildName', 'ranking', 'competence', 'starHeroRanking', 'ladderGrade', }},'ranking', 'lessIntegral', }
		}
	end,
	[0x4f01] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v8', 'v4', 'v8', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'v4', }},'s', 's', }},},
			{'type', {true,{'battlePetInfo','instanceId', 'templateId', 'trainerId', 'quality', 'star', 'formationType', {true,{'holeAttResponse','type', 'level', 'quality', }},'tameMessage', 'tameHole', }},}
		}
	end,
	[0x3906] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'redPoint', }
		}
	end,
	[0x1400] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'level', 'killcount', 'totalkillcount', }
		}
	end,
	[0x0e31] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', 'tv4', },
			{'all', 'module', }
		}
	end,
	[0x0F23] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{{true,{{true,{'v4', 'v4', 'v4', {true,{'v4', 'v4', }},{true,{'v4', 'v4', }},{true,{'v4', 'b', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', }},{false,{'v4', 'v4', }},}},{true,{'v4', 'v4', }},{true,{'v4', 'b', 'v4', 'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', }},'v4', 'v4', }},{true,{'v4', 'v4', 'v4', }},{true,{'v4', 'v4', 'v4', 'v4', }},'v4', }},'b', 'v4', },
			{{true,{'rounds',{true,{'action',{true,{'target','position', 'effectType', 'effectValue', {true,{'passiveEffect','type', 'value', }},{true,{'activeEffect','type', 'value', }},{true,{'newState','fromPos', 'stateTrigger', 'triggerId', 'stateId', 'stateLevel', 'result', }},{true,{'lostState','position', 'stateId', 'repeatNum', }},{true,{'stateCycle','position', 'stateId', 'effectType', 'effectValue', }},{false,{'deepHurt','type', 'value', }},}},{true,{'skill','skillId', 'level', }},{true,{'newState','fromPos', 'stateTrigger', 'triggerId', 'stateId', 'stateLevel', 'result', }},{true,{'lostState','position', 'stateId', 'repeatNum', }},{true,{'stateCycle','position', 'stateId', 'effectType', 'effectValue', }},'type', 'fromPos', }},{true,{'lostState','position', 'stateId', 'repeatNum', }},{true,{'stateCycle','position', 'stateId', 'effectType', 'effectValue', }},'roundIndex', }},'win', 'totle', }
		}
	end,
	[0x1D03] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v4', 'v4', },
			{'playerName', 'gemId', 'level', }
		}
	end,
	[0x5904] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x4705] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', {true,{'v4', 'v4', 'v4', 'v4', }},'v8', }},},
			{{false,{'recordList','playerId', 'playerName', {true,{'rewardList','resType', 'resId', 'number', 'isSpecial', }},'createTime', }},}
		}
	end,
	[0x4f02] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', },
			{'instanceId', 'quality', 'star', }
		}
	end,
	[0x6c02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'data','id', 'value', 'isBuy', }},}
		}
	end,
	[0x1802] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', },
			{'gangLevel', 'gangExp', 'myAllContribution', 'myTodayContribution', 'gangMoney', }
		}
	end,
	[0x1722] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'star','sectionId', 'star', 'passLimit', }},}
		}
	end,
	[0x4416] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', },
			{'type', 'guildId', }
		}
	end,
	[0x4431] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4426] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x6016] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', {true,{'v4', 'v4', }},}},},
			{{true,{'info','bibleId', {true,{'data','position', 'level', }},}},}
		}
	end,
	[0x5f03] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},},
			{{false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},}
		}
	end,
	[0x2902] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4703] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', {true,{'v4', 's', {true,{'v4', 'v4', 'v4', 'v4', }},'v8', }},},
			{'type', {true,{'recordList','playerId', 'playerName', {true,{'rewardList','resType', 'resId', 'number', 'isSpecial', }},'createTime', }},}
		}
	end,
	[0x4423] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x441b] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5401] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v8', {true,{'v4', 'v4', 'v4', 'v4', }},},
			{'roleId', 'todayCount', 'rewardDay', 'rewardTime', {true,{'info','roleId', 'roleNum', 'roleSycee', 'isGetReward', }},}
		}
	end,
	[0x6020] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},{true,{'v8', 'v4', 'v4', 'v4', 'tv4', {true,{'v4', 'v4', 'tv4', 'tv4', }},}},},
			{{true,{'info','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},{true,{'changeInfo','bibleId', 'stageId', 'useCount', 'reachId', 'useCountReachId', {true,{'bibleStageInfo','stage', 'isReplace', 'attIndex', 'value', }},}},}
		}
	end,
	[0x6a03] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v4', }},'v4', },
			{{false,{'data','instanceId', 'type', }},'type', }
		}
	end,
	[0x5933] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'s', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', }},},
			{{true,{'info','playerName', 'treasureId', 'leftTimes', 'buriedTime', 'rowId', 'colId', 'specialBox', }},}
		}
	end,
	[0x4420] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1308] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x4434] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 's', 's', 'v4', 'v4', 'v4', 'v4', }},'v8', },
			{{true,{'infos','guildId', 'guildName', 'bannerId', 'serverName', 'score', 'winCount', 'lostCount', 'cityId', }},'lastUpdateTime', }
		}
	end,
	[0x4203] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'count', }
		}
	end,
	[0x7506] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 's', 'v4', 'v4', {false,{'v4', 'v4', 'v4', }},'v4', }},},
			{{false,{'serverPush','playerId', 'playerName', 'serverName', 'serverId', 'rewardType', {false,{'reward','type', 'number', 'itemId', }},'rewardTime', }},}
		}
	end,
	[0x3e10] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'item','id', 'number', 'type', 'quality', }},}
		}
	end,
	[0x180D] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x7102] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'result', }
		}
	end,
	[0x3309] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'state', }
		}
	end,
	[0x3e04] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5e05] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 's', 'v8', 'v8', 'v4', 'tv4', 'v4', },
			{'playerId', 'playerName', 'createTime', 'endTime', 'state', 'helper', 'id', }
		}
	end,
	[0x4515] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 's', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', }},'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', {true,{'s', 'v4', 's', 'v4', 'b', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', }},},
			{{true,{'ranks','playerId', 'name', 'score', 'atkWin', 'atkLost', 'defWin', 'defLost', 'atkWinStreak', 'defWinStreak', 'serverName', }},'myRank', 'score', 'atkWin', 'atkLost', 'defWin', 'defLost', 'atkWinStreak', 'defWinStreak', 'atkFormation', 'defFromation', {true,{'replays','atkName', 'atkRank', 'defNam', 'defRank', 'atkWin', 'createTime', 'replayId', 'atkUseIcon', 'atkFrameId', 'defUseIcon', 'defFrameId', 'atkStarHeroRanking', 'defStarHeroRanking', }},}
		}
	end,
	[0x4b10] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', },
			{'status', }
		}
	end,
	[0x1D0C] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 's', 'v4', 'v4', 'v4', }},},
			{{true,{'rankingInfo','playerId', 'displayId', 'name', 'level', 'vipLevel', 'totalDamage', }},}
		}
	end,
	[0x1503] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v8', 'v4', 'v4', 'v8', },
			{'targetRoleID', 'targetRoleExp', 'targetRoleLev', 'transferRoleID', }
		}
	end,
	[0x7f30] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x5f02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v4', 's', 'v4', 's', 'v4', 'v4', {true,{'v4', 'v4', 'v4', {true,{'v4', 's', 'v4', 'v4', 's', 's', 'v4', 'v4', 's', 'v4', }},{true,{'v4', 's', 's', 's', 'v4', 'v4', }},}},}},},
			{{false,{'cardInfo','guildId', 'bannerId', 'serverId', 'serverName', 'score', 'quality', {true,{'partInfo','type', 'lastResTime', 'status', {true,{'player','playerId', 'playerName', 'useCoin', 'frameId', 'guildName', 'serverName', 'power', 'dieTime', 'formationBlood', 'type', }},{true,{'diePlayer','playerId', 'playerName', 'guildName', 'serverName', 'power', 'dieTime', }},}},}},}
		}
	end,
	[0x4429] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', },
			{'bannerId', }
		}
	end,
	[0x0e41] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4','s', 'v4', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v8', 's', 'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', },
			{'playerId', 'profession', 'sex','name', 'level', 'coin', 'exp', 'inspiration', 'sycee', 'vipLevel', 'errantry', 'beginnersGuide', 'totalRecharge', 'serverTime', 'openlist', 'registTime', 'properties', 'integral', 'eggScore', 'jingLu', 'climbStar', 'useIcon', 'headPicFrame', 'experience', 'lowHonor', 'seniorHonor', 'serdangTianXiangCoin', 'serdangTianJiCoin', 'starHeroRanking', 'ladderGrade', 'wisdom', 'tenchu', 'prestige', 'jingPo', 'windCloudCoin', }
		}
	end,
	[0x180C] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'isSuccess', }
		}
	end,
	[0x4d02] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', 'v4', }},},
			{{true,{'Selected','id', 'index', 'kind', }},}
		}
	end,
	[0x2076] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'tv4', },
			{'progress', 'drawAwards', }
		}
	end,
	[0x1905] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', },
			{'type', 'commodityId', 'num', }
		}
	end,
	[0x1815] = function()
		return {
			{"net.NetHelper", "receive"},
			{'s', 'v8', 'v4', 'v4', },
			{'buffStr', 'cdLeaveTime', 'buildLevel', 'status', }
		}
	end,
	[0x0F00] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', 'v4', 'v4', 'tv4', {false,{'v4', 'v4', }},{true,{'v4', 'v4', }},'s', 's', 's', 's', 'v4', }},'v4', 'v4', 'v4', 's', },
			{'fighttype', 'angerSelf', 'angerEnemy', {true,{'rolelist','typeid', 'roleId', 'maxhp', 'posindex', 'level', 'attr', {false,{'spellId','skillId', 'level', }},{true,{'passiveskill','skillId', 'level', }},'name', 'immune', 'effectActive', 'effectPassive', 'anger', }},'index', 'myBattlearrayId', 'enemyBattlearrayId', 'suppress', }
		}
	end,
	[0x1040] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4',{false,{'v8', 'v4', 'v4', 'v4', 's', 's', 'v4', 'v4', {true,{'v4', 'v4', }},'v4', 'v4', 'v4', {true,{'v4', 'v4', 'v4', }},'v4', 'v4', 'v4', }},{false,{'v8', 'v4', }},}},},
			{{true,{'changedList','type',{false,{'equipment','userid', 'id', 'level', 'quality', 'base_attr', 'extra_attr', 'grow', 'holeNum', {true,{'gem','pos', 'id', }},'star', 'starFailFix', 'refineLevel', {true,{'recast','quality', 'ratio', 'index', }},'stepExp', 'stepLevel', 'throughLevel', }},{false,{'item','id', 'num', }},}},}
		}
	end,
	[0x5101] = function()
		return {
			{"net.NetHelper", "receive"},
			{{false,{'v8', 'v8', 'v4', 'v4', 'v4', }},'v4', 'tv4', },
			{{false,{'role','roleId', 'startTime', 'coin', 'indexId', 'count', }},'operation', 'coin', }
		}
	end,
	[0x5163] = function()
		return {
			{"net.NetHelper", "receive"},
			{{true,{'v4', 'v4', {true,{'v8', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 'v4', 's', 's', 's', 's', 's', 'v4', }},{true,{'v4', 'v4', 'v8', 'v4', }},}},},
			{{true,{'team','fromId', 'useType', {true,{'roleDetails','instanceId', 'position', 'roleId', 'level', 'martialLevel', 'starlevel', 'power', 'hp', 'spell', 'attributes', 'immune', 'effectActive', 'effectPassive', 'quality', }},{true,{'assistant','position', 'roleId', 'instanceId', 'quality', }},}},}
		}
	end,
	[0x6009] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v8', 'v4', },
			{'result', 'instanceId', 'id', }
		}
	end,
	[0x6e19] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'tv4', },
			{'winCount', 'winStreak', 'boxes', }
		}
	end,
	[0x5931] = function()
		return {
			{"net.NetHelper", "receive"},
			{'v4', 'v4', 'v4', 'v4', 'v4', {true,{'s', 'v4', 'v4', 'v8', 'v4', 'v4', 'v4', }},'v4', },
			{'hasTreasures', 'remainingTimes', 'buriedTreasures', 'hasGotTreasures', 'goodsId', {true,{'buriedTreasuresInfo','playerName', 'treasureId', 'leftTimes', 'buriedTime', 'rowId', 'colId', 'specialBox', }},'number', }
		}
	end,
	[0x1a10] = function()
		return {
			{"net.NetHelper", "receive"},
			{},
			{}
		}
	end,
	[0x1303] = function()
		return {
			{"net.NetHelper", "receive"},
			{'b', },
			{'success', }
		}
	end,
}
return tblProto