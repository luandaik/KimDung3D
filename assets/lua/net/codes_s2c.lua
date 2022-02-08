local s2c = {}
--[[
	[1] = {--ServerGroupId
		[1] = 'int32':groupId
	}
--]]
s2c.SERVER_GROUP_ID = 0x6202

--[[
	[1] = {--EmployOtherInfoResult
		[1] = {--repeated HasEmployInfo
			[1] = 'int32':playerId	[佣兵主人id]
			[2] = 'int32':time	[已雇佣次数]
		},
	}
--]]
s2c.EMPLOY_OTHER_INFO_RESULT = 0x5103

--[[
	[1] = {--EmployRoleCountList
		[1] = {--repeated EmployRoleCount
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'int32':todayCount	[今日雇佣次数]
			[3] = 'int32':totalCount	[历史雇佣次数]
			[4] = 'int64':createTime	[第一次雇佣时间]
			[5] = 'int64':lastUpdate	[最后一次雇佣时间]
			[6] = 'int64':instanceId	[角色实例ID]
		},
	}
--]]
s2c.EMPLOY_ROLE_COUNT_LIST = 0x5110

--[[
	[1] = {--HeadPicFrameResult
		[1] = {--repeated HeadPicFrameUnlockedInfo
			[1] = 'int32':id
			[2] = 'int64':expireTime
			[3] = 'bool':firstGet
		},
		[2] = {--repeated HeadPicFrameLockedInfo
			[1] = 'int32':id
			[2] = 'int32':currentNum
		},
	}
--]]
s2c.HEAD_PIC_FRAME_RESULT = 0x0e94

--[[
	[1] = {--GemMosaicResult
		[1] = 'int32':result	[是否成功]
		[2] = {--EquipmentGemChanged
			[1] = 'int64':userid
			[2] = {--GemPos
				[1] = 'int32':pos	[ pos]
				[2] = 'int32':id	[ id]
			},
		},
	}
--]]
s2c.GEM_MOSAIC_RESULT = 0x1051

--[[
	[1] = {--BattlePetTameHoleInfoResponse
		[1] = 'int64':instanceId	[战宠Id]
		[2] = 'string':tameMessage	[驯驭信息 记录属性的等级  格式  1|2|1|15]
		[3] = 'string':tameHole	[驯驭孔位 记录孔位的穿属性  12|0|14|15 0表示没穿戴]
	}
--]]
s2c.BATTLE_PET_TAME_HOLE_INFO_RESPONSE = 0x4f09

--[[
	[1] = {--OpenDriveBeastInfo
		[1] = {--repeated Beast
			[1] = 'int32':count	[被驱赶的次数]
			[2] = 'int64':refreshTime	[年兽刷新的时间]
			[3] = 'string':toName	[被驱赶到玩家下的名字]
			[4] = 'int32':toPlayer	[赶往年兽玩家ID,若没有指向,为0]
			[5] = 'int32':round	[年兽回合数]
			[6] = 'int32':toIcon	[玩家头像]
			[7] = 'string':name	[被驱赶到玩家下的名字]
			[8] = 'int32':player	[刷新出年兽玩家ID]
			[9] = 'int32':icon	[玩家头像]
			[10] = 'int32':isEscape	[是否逃跑]
			[11] = 'int64':id	[年兽实例id]
		},
		[2] = 'int64':lastRefreshTime	[上一次刷出自己的年兽的时间]
		[3] = 'int32':leftRefreshMyTimes	[今日剩余刷新出自己的年兽次数]
		[4] = 'int32':leftRefreshOthersTimes	[今日剩余刷新他人年兽的次数]
		[5] = 'int32':leftRefreshBackTimes	[今日剩余被赶回的年兽次数]
		[6] = {--repeated DropMoney
			[1] = 'int32':index	[元宝下标]
			[2] = 'int32':gameMoney	[元宝数]
		},
	}
--]]
s2c.OPEN_DRIVE_BEAST_INFO = 0x6101

--[[
	[1] = {--AcupointLevelUpResult
		[1] = 'int64':instanceId
		[2] = {--AcupointInfo
			[1] = 'int32':position	[穴位位置]
			[2] = 'int32':level	[穴位等级]
			[3] = 'int32':breachLevel	[突破等级]
		},
	}
--]]
s2c.ACUPOINT_LEVEL_UP_RESULT = 0x1507

--[[
	[1] = {--AllFunctionState
		[1] = {--repeated FunctionState
			[1] = 'int32':functionId	[功能ID,客户端定义,服务器只做存储,无任何逻辑需求]
			[2] = 'bool':newMark	[状态标记,true:新状态,false:无]
		},
	}
--]]
s2c.ALL_FUNCTION_STATE = 0x7f20

--[[
	[1] = {--WoodManOwnProgressResult
		[1] = 'int32':zongjuli	[玩家当前距离]
		[2] = 'int32':isFirstFree	[玩家是否免费]
		[3] = 'int32':boxIndex	[开启到哪个宝箱]
		[4] = 'int32':round	[当前宝箱轮次]
		[5] = 'int64':actTime	[剩余时间]
		[6] = 'int32':historyBest	[历史最佳]
		[7] = 'int32':specialLength	[特殊宝箱领取距离]
	}
--]]
s2c.WOOD_MAN_OWN_PROGRESS_RESULT = 0x6307

--[[
	[1] = {--UpdateMakeCoin
		[1] = 'int32':coin	[当前的结交金币]
	}
--]]
s2c.UPDATE_MAKE_COIN = 0x4415

--[[
	[1] = {--LongMenBreakResetResponse
		[1] = {--LongMenBreakFloorInfo
			[1] = 'int32':floorId	[层id]
			[2] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[3] = 'int32':minedCount	[排雷次数]
			[4] = 'int32':reviveCount	[复活次数]
			[5] = 'int32':resetCount	[重置次数]
			[6] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
		[2] = 'repeated int32':befPointType
	}
--]]
s2c.LONG_MEN_BREAK_RESET_RESPONSE = 0x6906

--[[
	[1] = {--ArenaChallengeResult
		[1] = 'bool':win	[挑战是否胜利]
		[2] = 'int32':myRank	[当前排名]
	}
--]]
s2c.ARENA_CHALLENGE_RESULT = 0x1304

--[[
	[1] = {--AllTreasureInfo
		[1] = 'int32':hasBuriedTreasures	[所有玩家埋宝数量]
		[2] = 'int32':remainingTimes	[玩家剩余挖宝次数]
		[3] = 'int32':hasTreausre	[初始化玩家图标时,周围及当前位置是否有宝箱 	0是没有,1是有]
	}
--]]
s2c.ALL_TREASURE_INFO = 0x5930

--[[
	[1] = {--ShopGiftInfoList
		[1] = {--repeated ShopGiftInfo
			[1] = 'int32':id	[商店序号]
			[2] = 'int32':type	[礼包商城类型]
			[3] = 'int32':resType	[出售道具的资源类型]
			[4] = 'int32':resId	[出售道具的ID]
			[5] = 'int32':number	[单次购买数量]
			[6] = 'int32':consumeType	[购买道具的资源类型]
			[7] = 'int32':consumeId	[购买道具的ID]
			[8] = 'int32':consumeNumber	[花费值]
			[9] = 'int32':isLimited	[是否有出售限制]
			[10] = 'int32':consumeAdd	[每次购买递增价格值]
			[11] = 'int32':needVipLevel	[购买所需的vip等级]
			[12] = 'int64':beginTime	[上架时间]
			[13] = 'int64':endTime	[下架时间]
			[14] = 'int32':maxType	[最大值类型]
			[15] = 'int32':maxNum	[出售上限值]
			[16] = 'string':vipMaxNumMap	[各VIP等级下可购买数量]
			[17] = 'int32':oldPrice	[原价]
			[18] = 'int32':limitType	[限制类型]
			[19] = 'int32':isHot	[是否热卖]
			[20] = 'int32':timeType	[限时类型]
			[21] = 'int32':orderNo	[排序值]
		},
		[2] = 'int32':type	[操作类型]
	}
--]]
s2c.SHOP_GIFT_INFO_LIST = 0x1924

--[[
	[1] = {--PerdayResetProperties
		[1] = 'int32':chatFree	[免费聊天次数]
		[2] = 'int32':chapterSweepFree	[免费扫荡次数]
		[3] = 'int64':lastUpdate	[最后更新时间,时间轴]
		[4] = 'int32':crossFreeChat	[免费跨服聊天次数]
		[5] = 'int32':vipDeclaration	[免费vip宣言次数]
	}
--]]
s2c.PERDAY_RESET_PROPERTIES = 0x0e30

--[[
	[1] = {--MyInviteCode
		[1] = 'string':myCode	[自己的邀请码]
	}
--]]
s2c.MY_INVITE_CODE = 0x2600

--[[
	[1] = {--MartialSynthesisResult
		[1] = 'int32':martialId	[合成产出的武学]
	}
--]]
s2c.MARTIAL_SYNTHESIS_RESULT = 0x3404

--[[
	[1] = {--BuyCoinResult
		[1] = 'int32':consume	[消耗的元宝数量]
		[2] = 'int32':coin	[获得铜币数量]
		[3] = 'int32':mutil	[倍数]
	}
--]]
s2c.BUY_COIN_RESULT = 0x1920

--[[
	[1] = {--EquipOperation
		[1] = 'int64':roleId
		[2] = 'int64':equipment	[装备到身上的装备userid]
		[3] = 'int64':drop	[如果有替换下来的装备则发送卸下的装备userid]
	}
--]]
s2c.EQUIP_OPERATION = 0x1042

--[[
	[1] = {--EscortAgencyUpdateQualityResponse
		[1] = 'int32':guildId	[帮派id]
		[2] = 'int32':quality	[镖车品质]
	}
--]]
s2c.ESCORT_AGENCY_UPDATE_QUALITY_RESPONSE = 0x5f07

--[[
	[1] = {--CrossGuildBattleMemberInfo
		[1] = {--repeated GuildBattleTeamInfo
			[1] = 'int32':eliteId	[精英编号]
			[2] = {--repeated GuildBattlePlayerInfo
				[1] = 'int32':playerId
				[2] = 'int32':power
				[3] = 'string':name
				[4] = 'int32':profession
				[5] = 'int32':headPicFrame	[头像框]
				[6] = 'int32':starHeroRanking	[名人堂排名]
				[7] = 'int32':ladderGrade	[天梯赛段位]
			},
			[3] = 'int32':id
		},
	}
--]]
s2c.CROSS_GUILD_BATTLE_MEMBER_INFO = 0x4441

--[[
	[1] = {--AllFormationData
		[1] = {--repeated FormationData
			[1] = 'int32':type	[类型 1单阵容攻击 2单阵容防守 3双阵容攻击1阵容 4双阵容攻击2阵容]
			[2] = 'repeated int64':formation	[ 阵容]
		},
	}
--]]
s2c.ALL_FORMATION_DATA = 0x6701

--[[
	[1] = {--ModifyEmployTeamFormationSuccess
	}
--]]
s2c.MODIFY_EMPLOY_TEAM_FORMATION_SUCCESS = 0x5162

--[[
	[1] = {--ReponseEquipDestiny
		[1] = 'int32':pos	[装备位置]
	}
--]]
s2c.REPONSE_EQUIP_DESTINY = 0x3f02

--[[
	[1] = {--GetBagMsg
		[1] = {--repeated EquipmentInfo
			[1] = 'int64':userid	[userid  唯一id]
			[2] = 'int32':id	[id]
			[3] = 'int32':level	[level]
			[4] = 'int32':quality	[品质]
			[5] = 'string':base_attr	[基本属性]
			[6] = 'string':extra_attr	[附加属性]
			[7] = 'int32':grow	[成长值]
			[8] = 'int32':holeNum	[宝石孔数]
			[9] = {--repeated GemPos
				[1] = 'int32':pos	[ pos]
				[2] = 'int32':id	[ id]
			},
			[10] = 'int32':star	[星级]
			[11] = 'int32':starFailFix	[升星失败率修正值]
			[12] = 'int32':refineLevel	[精炼等级]
			[13] = {--repeated Recast
				[1] = 'int32':quality
				[2] = 'int32':ratio
				[3] = 'int32':index
			},
			[14] = 'int32':stepExp
			[15] = 'int32':stepLevel
			[16] = 'int32':throughLevel
		},
		[2] = {--repeated ItemInfo
			[1] = 'int64':id	[ id]
			[2] = 'int32':num	[ num]
		},
		[3] = {--repeated BibleInfo
			[1] = 'int64':instanceId	[唯一id]
			[2] = 'int32':id	[模板id]
			[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
			[4] = 'int32':level	[重级]
			[5] = 'int32':breachLevel	[突破]
			[6] = {--repeated EssentialPos
				[1] = 'int32':pos	[ pos]
				[2] = 'int32':id	[精要模板id]
			},
			[7] = 'repeated int32':gemId	[ 天书宝石]
			[8] = {--BibleComprehendInfo
				[1] = 'int64':bibleId	[天书id]
				[2] = 'int32':stageId	[阶段id]
				[3] = 'int32':useCount	[参悟丹使用次数]
				[4] = 'int32':reachId	[达成的id]
				[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
				[6] = {--repeated BibleStageInfo
					[1] = 'int32':stage	[阶段id]
					[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
					[3] = 'repeated int32':attIndex	[属性下标]
					[4] = 'repeated int32':value	[属性值]
				},
			},
		},
		[4] = {--repeated BibleKeyInfo
			[1] = 'int64':id	[ 秘钥实例id]
			[2] = 'int32':template_id	[ 模板id]
			[3] = 'int32':level	[升阶等级]
		},
	}
--]]
s2c.GET_BAG = 0x1000

--[[
	[1] = {--GemUnMosaicResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':userid
		[3] = 'int32':pos
	}
--]]
s2c.GEM_UN_MOSAIC_RESULT = 0x1052

--[[
	[1] = {--UpdateDemandSucess
	}
--]]
s2c.UPDATE_DEMAND_SUCESS = 0x430e

--[[
	[1] = {--CopyTeamChatResponse
		[1] = {--repeated CopyTeamChatInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'string':name	[ 玩家名称]
			[3] = 'int32':useIcon	[ 头像]
			[4] = 'int32':frameId	[ 头像框]
			[5] = 'int32':starHeroRanking	[ 名人堂排名]
			[6] = 'int64':chatTime	[ 发言时间时间]
			[7] = 'int32':vipLevel	[ VIP等级]
			[8] = 'string':content	[ 消息内容]
			[9] = 'int32':level	[ 玩家等级]
			[10] = 'int32':quality	[说话角色的主角品质]
		},
	}
--]]
s2c.COPY_TEAM_CHAT_RESPONSE = 0x5923

--[[
	[1] = {--UpdateProvideSucess
	}
--]]
s2c.UPDATE_PROVIDE_SUCESS = 0x430f

--[[
	[1] = {--EscortAgencyTargetResponse
		[1] = 'int32':guildId	[帮派id]
		[2] = 'int32':targetId	[集火帮派id]
	}
--]]
s2c.ESCORT_AGENCY_TARGET_RESPONSE = 0x5f04

--[[
	[1] = {--BuyContractResult
	}
--]]
s2c.BUY_CONTRACT_RESULT = 0x2801

--[[
	[1] = {--PlayerLadderMessage
		[1] = 'int32':grade
		[2] = 'int32':star
		[3] = {--repeated PlayerLadderChallengersMessage
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':grade
			[4] = 'int32':star
			[5] = 'string':serverName
			[6] = 'int32':useIcon
			[7] = 'int32':power
			[8] = 'int32':state
			[9] = 'int32':level
		},
		[4] = 'int64':lastSeasonTime
		[5] = 'int32':stopBattleCount
		[6] = 'string':missionTypes	[任务类型完成情况]
		[7] = 'string':drowMissions	[领取过的奖励]
		[8] = {--LastSeasonGradeMessage
			[1] = 'int32':grade
			[2] = 'int32':star
			[3] = 'int32':rank
		},
		[9] = 'int32':status	[判断是否今日已经一键挑战,0:否,1:是]
	}
--]]
s2c.PLAYER_LADDER_MESSAGE = 0x7901

--[[
	[1] = {--ContestBetResponse
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.CONTEST_BET_RESPONSE = 0x6e11

--[[
	[1] = {--GangExitResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_EXIT_RESULT = 0x1809

--[[
	[1] = {--RefreshProtagonistSkillPointMsg
		[1] = 'int32':skill_point	[技能点数量]
	}
--]]
s2c.REFRESH_PROTAGONIST_SKILL_POINT = 0x1f04

--[[
	[1] = {--GetBookNotify
		[1] = 'string':playerName	[玩家名字]
		[2] = 'int32':bookId	[获得秘籍id]
	}
--]]
s2c.GET_BOOK_NOTIFY = 0x1d02

--[[
	[1] = {--AcupointBreachExtraRateBuyResult
		[1] = 'int32':baseRate	[基础概率]
		[2] = 'int32':extraRate	[额外购买的概率]
		[3] = 'int32':payCount	[额外购买的次数]
	}
--]]
s2c.ACUPOINT_BREACH_EXTRA_RATE_BUY_RESULT = 0x150b

--[[
	[1] = {--PeakRankingReponse
		[1] = {--repeated PeakRankingInfo
			[1] = 'int32':ranking	[ 排名]
			[2] = 'string':name	[ 玩家名字]
			[3] = 'string':guildName	[ 帮派名字]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':integral	[ 积分]
		},
		[2] = 'int32':myRanking	[ 我的排名]
		[3] = 'int32':myIntegral	[ 我的积分]
		[4] = 'int32':bestIntegral	[ 更好奖励的积分]
		[5] = 'int32':guildIntegral
	}
--]]
s2c.PEAK_RANKING_REPONSE = 0x7107

--[[
	[1] = {--UpdateHeroPuWatchsSucess
	}
--]]
s2c.UPDATE_HERO_PU_WATCHS_SUCESS = 0x3102

--[[
	[1] = {--BibleLevelUpResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':instanceId	[唯一id]
		[3] = 'int32':level	[当前重数]
	}
--]]
s2c.BIBLE_LEVEL_UP_RESULT = 0x6010

--[[
	[1] = {--MyMercenaryTeamDetails
		[1] = {--repeated MercenaryTeamRole
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':position	[位置,0~8]
		},
		[2] = {--repeated MercenaryTeamRole
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':position	[位置,0~8]
		},
		[3] = 'int64':startTime	[开始时间]
		[4] = 'int32':coin	[预计收入的铜币数量]
		[5] = 'int32':employCount	[被雇佣次数]
	}
--]]
s2c.MY_MERCENARY_TEAM_DETAILS = 0x5152

--[[
	[1] = {--EssentialMosaicResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':roleId	[成功则字段有效 角色实例id]
		[3] = 'int64':essential	[成功则字段有效 镶嵌的天书id]
		[4] = 'int32':itemId	[成功则字段有效 精要模板id]
		[5] = 'int32':pos	[成功则字段有效 镶嵌的位置]
	}
--]]
s2c.ESSENTIAL_MOSAIC_RESULT = 0x6004

--[[
	[1] = {--NotifySevenRankTaskStep
		[1] = 'int32':type	[类型]
		[2] = 'int32':currstep	[当前进度]
	}
--]]
s2c.NOTIFY_SEVEN_RANK_TASK_STEP = 0x3310

--[[
	[1] = {--EssentialMosaicAllResult
		[1] = {--repeated EssentialMosaicResult
			[1] = 'int32':result	[是否成功]
			[2] = 'int64':roleId	[成功则字段有效 角色实例id]
			[3] = 'int64':essential	[成功则字段有效 镶嵌的天书id]
			[4] = 'int32':itemId	[成功则字段有效 精要模板id]
			[5] = 'int32':pos	[成功则字段有效 镶嵌的位置]
		},
	}
--]]
s2c.ESSENTIAL_MOSAIC_ALL_RESULT = 0x6011

--[[
	[1] = {--UpdateAttrAddInfo
		[1] = 'int32':hp	[血量加成]
		[2] = 'int32':neigong	[内功加成]
		[3] = 'int32':waigong	[外功加成]
		[4] = 'int32':neifang	[内防加成]
		[5] = 'int32':waifang	[外防加成]
		[6] = 'int32':hurt	[冰火毒伤加成]
	}
--]]
s2c.UPDATE_ATTR_ADD_INFO = 0x1402

--[[
	[1] = {--BattlePetExchangeResponse
		[1] = 'repeated int64':removePetId	[要删除的战宠]
		[2] = {--repeated BattlePetInfo
			[1] = 'int64':instanceId	[战宠id]
			[2] = 'int32':templateId	[战宠模版id]
			[3] = 'int64':trainerId	[驯兽师id(0为没有)    //驯兽师id(0为没有)]
			[4] = 'int32':quality	[品质]
			[5] = 'int32':star	[星级]
			[6] = 'repeated int32':formationType	[阵容类型]
			[7] = {--repeated BattlePetHoleInfoResponse
				[1] = 'int32':type	[孔位类型]
				[2] = 'int32':level	[等级]
				[3] = 'int32':quality	[品质]
			},
			[8] = 'string':tameMessage	[驯驭信息 记录属性的等级  格式  1|2|1|15]
			[9] = 'string':tameHole	[驯驭孔位 记录孔位的穿属性  12|0|14|15 0表示没穿戴]
		},
	}
--]]
s2c.BATTLE_PET_EXCHANGE_RESPONSE = 0x4f06

--[[
	[1] = {--QueryRewardResult
		[1] = {--RewardInfo
			[1] = 'int32':type	[0:未知或者普通情况下显示提示的类型;1.豪杰榜;2铜人阵;3.天罡星等----]
			[2] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.QUERY_REWARD_RESULT = 0x7f01

--[[
	[1] = {--ReponseCrossBetRadioInfo
		[1] = 'int32':betRadio
	}
--]]
s2c.REPONSE_CROSS_BET_RADIO_INFO = 0x4525

--[[
	[1] = {--GetBloodyBoxResult
		[1] = {--repeated BloodyBoxInfo
			[1] = 'int32':index	[宝箱索引1开始  1-6    //宝箱索引1开始  1-6]
			[2] = 'int32':status	[状态(0一个未领过, 1至少领过一个)    //状态(0一个未领过, 1至少领过一个)]
			[3] = {--repeated BloodyBoxPrize
				[1] = 'int32':index	[宝箱索引]
				[2] = 'bool':bIsget	[是否领取]
				[3] = 'int32':type	[奖品类型]
				[4] = 'int32':itemId	[奖品id]
				[5] = 'int32':number	[数量]
			},
			[4] = 'int32':needResType	[购买需要的资源类型]
			[5] = 'int32':needResNum	[购买需要的资源数量]
		},
		[2] = 'int32':index	[奖励索引(宝箱内1--3,0表示剩余(除免费)全部)    //奖励索引(宝箱内1--3,0表示剩余(除免费)全部)]
		[3] = 'int32':getType	[获取类型(1-免费领取,2-购买)    //获取类型(1-免费领取,2-购买)]
	}
--]]
s2c.GET_BLOODY_BOX_RESULT = 0x3214

--[[
	[1] = {--ChallengeTimeList
		[1] = {--repeated ChallengeTime
			[1] = 'int32':type	[1-推图体力;2-群豪谱体力;3-爬塔体力; 4-技能点;5-摩诃衍1;6-摩诃衍2;7-摩诃衍3    //1-推图体力;2-群豪谱体力;3-爬塔体力; 4-技能点;5-摩诃衍1;6-摩诃衍2;7-摩诃衍3]
			[2] = 'int32':maxValue	[默认每日可挑战次数]
			[3] = 'int32':todayUse	[今日已经挑战次数]
			[4] = 'int32':currentValue	[今日剩余可挑战次数]
			[5] = 'int32':todayBuyTime	[每日已购买次数]
			[6] = 'int32':cooldownRemain	[下次恢复体力剩余时间]
			[7] = 'int32':waitTimeRemain	[剩余等待时间]
			[8] = 'int32':todayResetWait	[今日重置等待时间次数]
		},
	}
--]]
s2c.CHALLENGE_TIME_LIST = 0x2102

--[[
	[1] = {--RedPacketAttributeReponse
		[1] = 'int32':id	[ 红包ID]
		[2] = 'int64':startTime	[ 开始时间]
	}
--]]
s2c.RED_PACKET_ATTRIBUTE_REPONSE = 0x6b07

--[[
	[1] = {--DatiEndResponse
		[1] = 'int32':takeTime	[答题耗时]
		[2] = 'int32':trueCount	[答对数量]
	}
--]]
s2c.DATI_END_RESPONSE = 0x3b03

--[[
	[1] = {--UnapplySucess
	}
--]]
s2c.UNAPPLY_SUCESS = 0x5701

--[[
	[1] = {--GetActivityRewardSuccess
		[1] = 'int32':type	[活动类型]
		[2] = 'int32':rewardId	[奖励配置表的ID]
	}
--]]
s2c.GET_ACTIVITY_REWARD_SUCCESS = 0x3305

--[[
	[1] = {--LevelUpAgreeSucess
	}
--]]
s2c.LEVEL_UP_AGREE_SUCESS = 0x4604

--[[
	[1] = {--ResponseHeartExchange
	}
--]]
s2c.RESPONSE_HEART_EXCHANGE = 0x7b14

--[[
	[1] = {--ResponseBetInfo
		[1] = 'int32':betRadio	[ 押注信息 0押注上一届擂主 1押注这一届挑战者]
	}
--]]
s2c.RESPONSE_BET_INFO = 0x6e18

--[[
	[1] = {--BibleKeyMosaicResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':bible	[成功则字段有效 镶嵌的天书id]
		[3] = 'int64':keyId	[成功则字段有效 key实例id]
	}
--]]
s2c.BIBLE_KEY_MOSAIC_RESULT = 0x6024

--[[
	[1] = {--HeartMethodSynthesis
		[1] = 'int64':instanceId	[ 心法实例ID]
		[2] = 'int32':itemIed	[ 模板Id]
	}
--]]
s2c.HEART_METHOD_SYNTHESIS = 0x7b09

--[[
	[1] = {--RecommendFriendList
		[1] = {--repeated RecommendFriend
			[1] = {--FriendInfo
				[1] = 'int32':playerId	[玩家编号]
				[2] = 'string':name	[玩家名称]
				[3] = 'int32':vip	[vip等级]
				[4] = 'int32':power	[战斗力]
				[5] = 'int64':lastLoginTime	[最后登录时间]
				[6] = 'int32':profession	[职业]
				[7] = 'int32':level	[等级]
				[8] = 'bool':online
				[9] = 'int32':guildId
				[10] = 'string':guildName
				[11] = 'int32':minePower	[护矿战斗力]
				[12] = 'int32':icon	[头像]
				[13] = 'int32':headPicFrame	[头像边框]
				[14] = 'int32':starHeroRanking	[名人堂排名]
				[15] = 'int32':ladderGrade	[天梯赛段位]
			},
			[2] = 'bool':apply	[是否申请过]
		},
	}
--]]
s2c.RECOMMEND_FRIEND_LIST = 0x4302

--[[
	[1] = {--PraiseSucess
	}
--]]
s2c.PRAISE_SUCESS = 0x7407

--[[
	[1] = {--ChatReceive
		[1] = {--repeated ChatInfo
			[1] = 'int32':chatType	[聊天类型;1.公共,2.私聊;3.帮派;]
			[2] = 'string':content	[消息;]
			[3] = 'int32':playerId	[说话人的id]
			[4] = 'int32':roleId	[主角角色ID,卡牌ID]
			[5] = 'int32':quality	[说话角色的主角品质]
			[6] = 'string':name	[说话人的名字]
			[7] = 'int32':vipLevel	[VIP等级]
			[8] = 'int32':level	[玩家等级]
			[9] = 'int64':timestamp	[消息发送时间]
			[10] = 'int32':guildId	[公会编号]
			[11] = 'string':guildName	[公会名称]
			[12] = 'int32':competence	[公会职位 1会长 2副会长 3成员]
			[13] = 'repeated int32':invitationGuilds	[邀请过他的公会]
			[14] = 'int32':titleType	[称号类型]
			[15] = 'int32':guideType	[指导员类型]
			[16] = 'int32':icon	[头像]
			[17] = 'int32':headPicFrame	[头像边框]
			[18] = 'int32':serverId
			[19] = 'string':serverName
			[20] = 'int32':audioTime	[语音聊天时间]
			[21] = 'string':audioId	[语音聊天id]
			[22] = 'int32':starHeroRanking	[名人堂排名]
			[23] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.CHAT_RECEIVE = 0x1b02

--[[
	[1] = {--SpellLevelUpNotify
		[1] = 'int64':userid	[升级技能的角色实例ID]
		[2] = 'int32':oldLevel	[旧的技能ID,对应技能当前等级的唯一ID.为t_s_spell_level表格主键]
		[3] = 'int32':newLevel	[新的技能ID,对应技能当前等级的唯一ID.为t_s_spell_level表格主键]
		[4] = 'int32':skillId
	}
--]]
s2c.SPELL_LEVEL_UP_NOTIFY = 0x1520

--[[
	[1] = {--ResourceUpdateMsg
		[1] = {--repeated ResourceMsg
			[1] = 'int32':resource	[资源类型 1.铜币|2.元宝|3.真气|4.魂魄|5.铸铁|6.体力|7.经验|8.铸铁|9.星辰碎片|10.关卡体力|11.玩家等级]
			[2] = 'int64':num	[资源数量]
		},
	}
--]]
s2c.RESOURCE_UPDATE = 0x7f10

--[[
	[1] = {--ResetClimbResult
		[1] = 'int32':curId	[无量山当前最后一个可挑战的关卡层数]
	}
--]]
s2c.RESET_CLIMB_RESULT = 0x1700

--[[
	[1] = {--RondomBloodyBox
		[1] = {--BloodyBoxUpdateInfo
			[1] = 'int32':boxIndex	[对应宝箱的索引]
			[2] = {--BloodyBoxPrize
				[1] = 'int32':index	[宝箱索引]
				[2] = 'bool':bIsget	[是否领取]
				[3] = 'int32':type	[奖品类型]
				[4] = 'int32':itemId	[奖品id]
				[5] = 'int32':number	[数量]
			},
		},
	}
--]]
s2c.RONDOM_BLOODY_BOX = 0x3212

--[[
	[1] = {--GrouponInfoReponse
		[1] = {--repeated GrouponConfig
			[1] = 'int32':id	[商品信息id]
			[2] = 'string':goods	[商品数据(type,id,num)    //商品数据(type,id,num)]
			[3] = 'int32':price	[原价格]
			[4] = 'string':grouponPrice	[商品团购价格(num_pice;num_pice;num_pice)    //商品团购价格(num_pice;num_pice;num_pice)]
			[5] = 'int32':discount	[商品折扣]
			[6] = 'int32':count	[结算数量]
			[7] = 'int32':customerLimit	[个人限购数量]
			[8] = 'int32':beginTime	[上架时间]
			[9] = 'int32':endTime	[下架时间]
		},
		[2] = {--repeated GrouponInfo
			[1] = 'int32':id	[商品信息id]
			[2] = 'bool':isSettle	[是否结算]
			[3] = 'bool':isEnd	[是否轮次已完]
			[4] = 'int32':totalCount	[当前数量]
			[5] = {--GrouponPlayerData
				[1] = 'int32':playerId	[玩家名字]
				[2] = 'string':name	[玩家名字]
				[3] = 'string':guildName	[公会名字]
				[4] = 'int32':num	[玩家购买数量]
			},
			[6] = {--repeated GrouponPlayerData
				[1] = 'int32':playerId	[玩家名字]
				[2] = 'string':name	[玩家名字]
				[3] = 'string':guildName	[公会名字]
				[4] = 'int32':num	[玩家购买数量]
			},
		},
	}
--]]
s2c.GROUPON_INFO_REPONSE = 0x5c01

--[[
	[1] = {--BloodyWillResetNotify
	}
--]]
s2c.BLOODY_WILL_RESET_NOTIFY = 0x3221

--[[
	[1] = {--BuriedHistory
		[1] = {--repeated TreasuresRecordInfo
			[1] = 'string':playerName	[埋宝箱的玩家名称]
			[2] = 'int32':treasureId	[ 埋藏的宝物ID]
			[3] = 'int32':leftTimes	[ 该宝箱剩余可挖次数]
			[4] = 'int64':buriedTime	[埋宝箱时间(挖宝时间)    //埋宝箱时间(挖宝时间)]
			[5] = 'int64':mapId	[埋藏宝箱实例ID]
			[6] = 'int32':isHiddenName	[宝箱是否匿名]
			[7] = 'string':dropItem	[玩家获得的物品]
			[8] = 'string':digName	[挖宝箱的玩家名字]
			[9] = 'string':serverName	[挖宝箱玩家的服务器名字]
			[10] = 'int32':rowId	[所挖宝箱的横坐标]
			[11] = 'int32':colId	[所挖宝箱的纵坐标]
			[12] = 'int32':specialBox	[是否是无量宝箱]
		},
	}
--]]
s2c.BURIED_HISTORY = 0x5934

--[[
	[1] = {--PlayerSimpleInfo
		[1] = {--FriendInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':power	[战斗力]
			[5] = 'int64':lastLoginTime	[最后登录时间]
			[6] = 'int32':profession	[职业]
			[7] = 'int32':level	[等级]
			[8] = 'bool':online
			[9] = 'int32':guildId
			[10] = 'string':guildName
			[11] = 'int32':minePower	[护矿战斗力]
			[12] = 'int32':icon	[头像]
			[13] = 'int32':headPicFrame	[头像边框]
			[14] = 'int32':starHeroRanking	[名人堂排名]
			[15] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.PLAYER_SIMPLE_INFO = 0x0e98

--[[
	[1] = {--PrivateChatList
		[1] = 'repeated int32':playerId	[玩家列表]
	}
--]]
s2c.PRIVATE_CHAT_LIST = 0x1b05

--[[
	[1] = {--GainGuildActiveRedPacketInfo
		[1] = 'int32':smallStatus	[小忠义值红包状态,  0是未开启,1是开启未发,2是已发]
		[2] = 'int32':bigStatus	[大忠义值红包状态, 0是未开启,1是开启未发,2是已发]
		[3] = 'int32':secondlyProgress	[帮派忠义值]
	}
--]]
s2c.GAIN_GUILD_ACTIVE_RED_PACKET_INFO = 0x4445

--[[
	[1] = {--ObtainGemNotify
		[1] = 'string':playerName	[玩家名字]
		[2] = 'int32':templateId	[获得宝石id]
		[3] = 'int32':number	[数量]
		[4] = 'int32':operationType	[通过什么渠道获得]
	}
--]]
s2c.OBTAIN_GEM_NOTIFY = 0x1d50

--[[
	[1] = {--BloodyEnemyInfoList
		[1] = {--repeated BloodyEnemyInfo
			[1] = 'string':name	[npc名称]
			[2] = 'int32':section	[第几关(从1开始)    //第几关(从1开始)]
			[3] = 'int32':anger	[怒气]
			[4] = 'int32':power	[npc总战力]
			[5] = {--repeated BloodyEnemyRole
				[1] = 'int32':profession	[角色职业]
				[2] = 'int32':lv	[角色等级]
				[3] = 'int32':index	[战阵索引(从0开始,-1表示未上阵)    //战阵索引(从0开始,-1表示未上阵)]
				[4] = 'int32':maxHp	[最大血量]
				[5] = 'int32':currHp	[当前血量]
				[6] = 'int32':quality	[角色品质]
				[7] = 'int32':forgingQuality	[角色最高炼体品质]
			},
			[6] = 'int32':icon	[头像]
			[7] = 'int32':headPicFrame	[头像边框]
			[8] = 'int32':playerId
			[9] = 'int32':starHeroRanking	[名人堂排名]
		},
	}
--]]
s2c.BLOODY_ENEMY_INFO_LIST = 0x3208

--[[
	[1] = {--BibleResolveResponse
		[1] = 'int64':instanceId	[成功时有效 实例id]
	}
--]]
s2c.BIBLE_RESOLVE_RESPONSE = 0x6029

--[[
	[1] = {--ResponseGoldenReward
		[1] = 'int32':id	[ID]
		[2] = {--repeated GoldenRewardInfo
			[1] = 'int32':type	[活动类型]
			[2] = 'int32':radio	[系数]
			[3] = {--repeated itemReward
				[1] = 'int32':itemId	[物品id]
				[2] = 'int32':type	[物品类型]
				[3] = 'int32':number	[数量]
			},
		},
	}
--]]
s2c.RESPONSE_GOLDEN_REWARD = 0x7c03

--[[
	[1] = {--BloodyBox
		[1] = 'int32':section	[关卡号(从1开始)    //关卡号(从1开始)]
		[2] = {--repeated BloodyBoxItem
			[1] = 'int32':rewardId	[奖励ID]
			[2] = 'int32':getType	[获取类型(1-免费领取,2-购买)    //获取类型(1-免费领取,2-购买)]
			[3] = 'int32':status	[状态(0-未处理,1-已处理)    //状态(0-未处理,1-已处理)]
		},
		[3] = 'int32':status	[状态(宝箱内的所有奖励都已领取表示处理完毕:0-未完成处理,1-已完成处理)    //状态(宝箱内的所有奖励都已领取表示处理完毕:0-未完成处理,1-已完成处理)]
	}
--]]
s2c.BLOODY_BOX = 0x3211

--[[
	[1] = {--GangGetBuffResult
		[1] = 'bool':isSuccess	[true or false]
		[2] = 'string':buffStr	[ 领取buff结果,"1_125|2_125"]
	}
--]]
s2c.GANG_GET_BUFF_RESULT = 0x1817

--[[
	[1] = {--EmployTeamCountList
		[1] = {--repeated EmployTeamCount
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'int32':todayCount	[今日雇佣次数]
			[3] = 'int32':totalCount	[历史雇佣次数]
			[4] = 'int64':createTime	[第一次雇佣时间]
			[5] = 'int64':lastUpdate	[最后一次雇佣时间]
		},
	}
--]]
s2c.EMPLOY_TEAM_COUNT_LIST = 0x5164

--[[
	[1] = {--WulinEnemiesChallengeInfo
		[1] = 'int32':playerId
		[2] = 'string':name
		[3] = 'int64':hurt
	}
--]]
s2c.WULIN_ENEMIES_CHALLENGE_INFO = 0x7803

--[[
	[1] = {--NorthCaveSweepResult
		[1] = {--repeated NorthCaveSweepResultItem
			[1] = 'int32':exp	[增加团队经验]
			[2] = 'int32':oldLevel	[原先团队等级]
			[3] = 'int32':currentLevel	[当前团队等级]
			[4] = 'int32':coin	[获得的金币数量]
			[5] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[6] = 'int32':id	[关卡Id]
		},
		[2] = 'int32':nextId	[下一关ID]
		[3] = 'int32':tokens	[无量山钻数量]
	}
--]]
s2c.NORTH_CAVE_SWEEP_RESULT = 0x4910

--[[
	[1] = {--RefreshColorEggResponse
		[1] = 'string':ColorEggSpecialReward	[彩蛋特殊奖励(类型,id,数量&刷新消耗元宝数)    //彩蛋特殊奖励(类型,id,数量&刷新消耗元宝数)]
		[2] = 'int32':clearRewardState	[是否清空彩蛋普通奖励获得状态(0:不清空 1:清空)    //是否清空彩蛋普通奖励获得状态(0:不清空 1:清空)]
	}
--]]
s2c.REFRESH_COLOR_EGG_RESPONSE = 0x4708

--[[
	[1] = {--GetHeroDuelRankResponse
		[1] = 'int32':rankGroup	[排行分组]
		[2] = {--repeated HeroDuelTopPlayerRank
			[1] = 'int32':rank	[名]
			[2] = 'string':playerName	[玩家昵称]
			[3] = 'int32':playerLevel	[玩家等级]
			[4] = 'int32':useIcon	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[5] = 'int32':fightPower	[战力]
			[6] = 'int32':playerScore	[积分]
			[7] = 'string':serverName	[服务器名称]
			[8] = 'string':guildName	[帮派名称]
			[9] = 'int32':playerGroup	[玩家分组(1东华.2江南.3西川.4朔北)    //玩家分组(1东华.2江南.3西川.4朔北)]
			[10] = 'int32':playerId	[玩家id]
		},
		[3] = {--repeated HeroDuelOtherRank
			[1] = 'int32':beginRank	[起始排名]
			[2] = 'int32':endRank	[结束排名]
			[3] = 'int32':playerRank	[玩家排名]
			[4] = 'string':playerName	[玩家名称]
			[5] = 'int32':minScore	[当前阶段最低积分]
			[6] = 'int32':playerId	[玩家id]
			[7] = 'int32':playerScore	[玩家积分]
		},
		[4] = 'int32':myScore	[我的积分]
		[5] = 'int32':myRank	[我的排名]
	}
--]]
s2c.GET_HERO_DUEL_RANK_RESPONSE = 0x6f04

--[[
	[1] = {--ContestRedPacketResponse
		[1] = 'int64':id	[ 红包ID]
		[2] = 'int32':serverId	[ 服务器ID]
		[3] = 'string':name	[ 玩家昵称]
		[4] = 'int32':sycee	[ 领取的元宝数]
	}
--]]
s2c.CONTEST_RED_PACKET_RESPONSE = 0x6e14

--[[
	[1] = {--SendRedPoint
		[1] = 'int32':digTreasure	[是否拥有挖宝次数    0是没有,1是有]
		[2] = 'int32':buriedTreasure	[是否有宝箱可以埋 	0是没有,1是有]
	}
--]]
s2c.SEND_RED_POINT = 0x5939

--[[
	[1] = {--FightResultMsg
		[1] = 'int32':result	[0:失败   成功:1-3星    //0:失败   成功:1-3星]
		[2] = {--ExpReward
			[1] = 'int32':typeid
			[2] = 'int32':oldExp
			[3] = 'int32':oldLev
			[4] = 'int32':currExp
			[5] = 'int32':currLev
			[6] = 'int32':addExp
		},
		[3] = {--repeated ExpReward
			[1] = 'int32':typeid
			[2] = 'int32':oldExp
			[3] = 'int32':oldLev
			[4] = 'int32':currExp
			[5] = 'int32':currLev
			[6] = 'int32':addExp
		},
		[4] = {--repeated ItemReward
			[1] = 'int32':type	[1物品,2卡牌,]
			[2] = 'int32':itemid
			[3] = 'int32':num
		},
		[5] = {--repeated ResourceReward
			[1] = 'int32':type	[1铜币,2元宝, 3悟性点, 4群豪谱积分]
			[2] = 'int32':num
		},
		[6] = 'int32':rank	[群豪谱排名]
		[7] = 'int32':climblev	[无量山层数]
		[8] = {--ChampionsInfo
			[1] = 'int32':atkWinStreak	[进攻连胜]
			[2] = 'int32':atkMaxWinStreak	[进攻最大连胜]
			[3] = 'int32':defWinStreak	[防守连胜]
			[4] = 'int32':defMaxWinSteak	[防守最大连胜]
			[5] = 'int32':score	[积分]
			[6] = 'repeated int64':atkFormation	[攻击阵容]
			[7] = 'repeated int64':defFormation	[防守阵容]
			[8] = 'int32':atkWinCount	[进攻胜利次数]
			[9] = 'int32':atkLostCount	[进攻失败次数]
			[10] = 'int32':defWinCount	[防守胜利次数]
			[11] = 'int32':defLostCount	[防守失败次数]
			[12] = 'int32':betWinCount	[押注胜利次数]
		},
		[9] = 'int32':achievement	[风云录成绩(出手次数)    //风云录成绩(出手次数)]
		[10] = 'int64':challengeTime	[风云录(挑战时间)    //风云录(挑战时间)]
		[11] = 'int64':worldHurt	[伏魔录伤害]
	}
--]]
s2c.FIGHT_RESULT = 0x0f02

--[[
	[1] = {--UnequipBibleResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':drop	[成功则字段有效卸除的天书]
	}
--]]
s2c.UNEQUIP_BIBLE_RESULT = 0x6002

--[[
	[1] = {--LoginResult
		[1] = 'int32':statusCode	[状态码]
		[2] = 'bool':empty	[是否没有任何已经创建好的角色,在没有任何角色需要客户端跳转到创建角色流程]
	}
--]]
s2c.LOGIN_RESULT = 0x0d00

--[[
	[1] = {--BuyBackBuyReponse
		[1] = {--repeated BuyBackDataHistory
			[1] = 'int32':id	[商品id]
			[2] = 'int32':type	[类型(0:购买历史 1:获赠历史)    //类型(0:购买历史 1:获赠历史)]
			[3] = 'int64':time	[时间]
		},
		[2] = {--BuyBackData
			[1] = 'int32':id	[商品信息id]
			[2] = 'int32':current	[玩家当前购买数量]
		},
		[3] = 'int32':consumeNum	[消耗的元宝数]
	}
--]]
s2c.BUY_BACK_BUY_REPONSE = 0x5b02

--[[
	[1] = {--SignerInfoResponse
		[1] = 'int32':progress	[当前签到天数]
		[2] = 'int64':signTime	[签到时间]
		[3] = 'int32':type	[类型 45]
	}
--]]
s2c.SIGNER_INFO_RESPONSE = 0x7e05

--[[
	[1] = {--OpenAssistantGridSucess
	}
--]]
s2c.OPEN_ASSISTANT_GRID_SUCESS = 0x4602

--[[
	[1] = {--BloodyCurrSectionUpdate
		[1] = 'int32':currSection	[已过关最大关卡号]
		[2] = {--repeated BloodyEnemySimpleInfo
			[1] = 'string':name	[npc名称]
			[2] = 'int32':section	[第几关(从1开始)    //第几关(从1开始)]
			[3] = 'int32':star	[战斗星级]
			[4] = 'int32':roleId	[代表角色的ID]
		},
	}
--]]
s2c.BLOODY_CURR_SECTION_UPDATE = 0x3210

--[[
	[1] = {--ActivitiesInfoResponse
		[1] = {--repeated ActivityDetil
			[1] = 'int32':type	[天降好礼:102,整点在线:44]
			[2] = 'int64':startTime	[开启时间]
			[3] = 'int64':endTime	[结束时间]
		},
	}
--]]
s2c.ACTIVITIES_INFO_RESPONSE = 0x7e06

--[[
	[1] = {--CancelApplySucess
	}
--]]
s2c.CANCEL_APPLY_SUCESS = 0x440b

--[[
	[1] = {--ClimbChallengeResult
		[1] = 'bool':win	[挑战结果,是否胜利]
		[2] = 'int32':curId	[无量山当前最后一个可挑战的关卡层数]
	}
--]]
s2c.CLIMB_CHALLENGE_RESULT = 0x1701

--[[
	[1] = {--UpdateAssistantRoleSucess
	}
--]]
s2c.UPDATE_ASSISTANT_ROLE_SUCESS = 0x4603

--[[
	[1] = {--BookBagMsg
		[1] = {--repeated BookItem
			[1] = 'int64':objID	[实例id]
			[2] = 'int32':resID	[模板id]
			[3] = 'int32':level	[等级]
			[4] = 'int32':exp	[经验]
			[5] = 'bool':lock	[是否锁定]
			[6] = 'int64':roleID	[角色id]
			[7] = 'int64':position	[装配位置]
			[8] = 'int64':attrAdd	[属性加成]
		},
	}
--]]
s2c.BOOK_BAG = 0x1604

--[[
	[1] = {--SacrificePickupSuccessNotify
		[1] = 'int32':index	[拾取的目标索引,0表示全部拾取]
	}
--]]
s2c.SACRIFICE_PICKUP_SUCCESS_NOTIFY = 0x3e03

--[[
	[1] = {--MailStateChangedList
		[1] = {--repeated MailStateChanged
			[1] = 'int32':id	[邮件ID]
			[2] = 'int32':status	[状态:0.未读;1.已读;2.已领取;3.删除]
		},
	}
--]]
s2c.MAIL_STATE_CHANGED_LIST = 0x1d21

--[[
	[1] = {--BetByTypeSuccessNotify
		[1] = 'int32':type	[赌石类型,1.试刀;2.切割;4.打磨;8.精工;16.雕琢]
	}
--]]
s2c.BET_BY_TYPE_SUCCESS_NOTIFY = 0x5800

--[[
	[1] = {--GangCancelAppointSecondMasterResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_CANCEL_APPOINT_SECOND_MASTER_RESULT = 0x180e

--[[
	[1] = {--MineRemindMsg
		[1] = {--repeated MineRemind
			[1] = 'int32':status	[状态 -1 未解锁0未开采 1开采中2待收获    //状态 -1 未解锁0未开采 1开采中2待收获]
			[2] = 'int64':endTime	[采矿结束时间]
		},
	}
--]]
s2c.MINE_REMIND = 0x5011

--[[
	[1] = {--GainAssistantRoleSucess
	}
--]]
s2c.GAIN_ASSISTANT_ROLE_SUCESS = 0x4310

--[[
	[1] = {--EssentialUnMosaicResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':bible	[成功则字段有效 卸下的天书实例id]
		[3] = 'int32':pos	[卸下的天书所在位置]
	}
--]]
s2c.ESSENTIAL_UN_MOSAIC_RESULT = 0x6005

--[[
	[1] = {--ArenaBalanceTrailerNotify
		[1] = {--repeated ArenaBalanceInfo
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'int32':displayId	[显示的职业类型ID,可能为主角职业ID或者战力最高的职业ID]
			[3] = 'string':name	[昵称]
			[4] = 'int32':level	[等级]
			[5] = 'int32':vipLevel	[vip等级]
		},
	}
--]]
s2c.ARENA_BALANCE_TRAILER_NOTIFY = 0x1d0b

--[[
	[1] = {--UseProtagonistSkillResult
		[1] = {--repeated ProtagonistSkillUseInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':pos	[技能的位置]
		},
	}
--]]
s2c.USE_PROTAGONIST_SKILL_RESULT = 0x1f06

--[[
	[1] = {--DatiRankInfoResponse
		[1] = 'int32':myTakeTime	[我的耗时]
		[2] = 'int32':myTrueCount	[我的答对个数]
		[3] = 'int32':myRank	[我的排名]
		[4] = 'int32':myDatiTotalCount	[我的答题总数]
		[5] = {--repeated DatiRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':takeTime	[耗时]
			[4] = 'int32':trueCount	[答对个数]
			[5] = 'int32':datiTotalCount	[答题总数]
			[6] = 'int32':rank
		},
	}
--]]
s2c.DATI_RANK_INFO_RESPONSE = 0x3b00

--[[
	[1] = {--AllCityInfo
		[1] = {--repeated CrossGuildInfo
			[1] = 'int32':guildId	[公会编号]
			[2] = 'string':guildName	[公会名称]
			[3] = 'string':bannerId	[公会旗帜]
			[4] = 'string':serverName	[服务器名称]
			[5] = 'int32':score	[积分]
			[6] = 'int32':winCount	[胜场]
			[7] = 'int32':lostCount	[负场]
			[8] = 'int32':cityId
		},
	}
--]]
s2c.ALL_CITY_INFO = 0x4440

--[[
	[1] = {--LimitHotInfoResponse
		[1] = {--repeated LimitHotConfig
			[1] = 'int32':id	[商品信息id]
			[2] = 'string':goods	[商品数据(type,id,num)    //商品数据(type,id,num)]
			[3] = 'int32':price	[原价格]
			[4] = 'int32':currentPrice	[现价格]
			[5] = 'int32':customerLimit	[个人限购数量]
			[6] = 'int32':goodsLimit	[商品限购数量]
			[7] = 'int32':discount	[商品折扣]
			[8] = 'int32':beginTime	[上架时间]
			[9] = 'int32':endTime	[下架时间]
		},
		[2] = {--repeated LimitHotDataInfo
			[1] = 'int32':id	[商品信息id]
			[2] = 'int32':current	[玩家当前购买数量]
			[3] = 'int32':serverCurrent	[服务器当前当前购买数量]
		},
	}
--]]
s2c.LIMIT_HOT_INFO_RESPONSE = 0x5a01

--[[
	[1] = {--ClimbCarbonList
		[1] = {--repeated CarbonInfo
			[1] = 'int32':index	[副本索引]
			[2] = 'int32':leftTimes	[ 剩余挑战次数]
			[3] = 'bool':isEnable	[是否可挑战,true:可挑战 false:不可挑战;]
			[4] = 'int64':coolTime	[ 挑战冷却时间(毫秒)    // 挑战冷却时间(毫秒)]
		},
	}
--]]
s2c.CLIMB_CARBON_LIST = 0x1704

--[[
	[1] = {--GuildBossStageResponse
		[1] = 'int32':stage	[阶段id]
	}
--]]
s2c.GUILD_BOSS_STAGE_RESPONSE = 0x4b02

--[[
	[1] = {--HeroPuWatchs
		[1] = 'string':val
	}
--]]
s2c.HERO_PU_WATCHS = 0x3101

--[[
	[1] = {--PreviousCrossInfoResp
		[1] = 'int64':lastOpenTime
		[2] = 'string':name
		[3] = 'int32':power
		[4] = 'int32':useCoin
		[5] = 'int32':framId
		[6] = 'string':serverName
		[7] = 'string':formation
		[8] = 'int32':myRank
		[9] = 'int32':serverUseCoin
		[10] = 'int32':serverFramId
		[11] = 'string':serverPlayerName
		[12] = 'string':serverServerName
		[13] = 'int32':serverRank
		[14] = 'int32':serverPower
		[15] = 'int32':serverStarHeroRanking
		[16] = 'int32':ladderGrade	[天梯赛段位]
	}
--]]
s2c.PREVIOUS_CROSS_INFO_RESP = 0x4520

--[[
	[1] = {--GetContractDailyRewardResult
		[1] = 'int32':id	[协约ID]
	}
--]]
s2c.GET_CONTRACT_DAILY_REWARD_RESULT = 0x2802

--[[
	[1] = {--GuildGiveRankResponse
		[1] = 'int32':myRanking	[我的排名,0表示未入榜]
		[2] = 'int32':myErrantry	[我的侠义值]
		[3] = 'string':myGuildName	[我帮派名称]
		[4] = 'string':myName	[我的名称]
		[5] = 'int32':myUseCoin	[头像]
		[6] = 'int32':myFrameId	[头像框]
		[7] = {--repeated GuildGiveRankData
			[1] = 'int32':guildId	[帮派名称]
			[2] = 'string':guildName	[帮派名字]
			[3] = 'int32':playerId	[玩家id]
			[4] = 'string':playerName	[玩家名字]
			[5] = 'int32':useCoin	[头像]
			[6] = 'int32':frameId	[头像框]
			[7] = 'int32':rank	[排名]
			[8] = 'int32':errantry	[侠义值]
		},
	}
--]]
s2c.GUILD_GIVE_RANK_RESPONSE = 0x4c04

--[[
	[1] = {--GuildBossAttackRankResponse
		[1] = 'int32':myPlayerId	[我的玩家id,0表示未入榜]
		[2] = 'int32':myRanking	[我的最佳排名]
		[3] = 'int32':myAttackCount	[我的攻击次数]
		[4] = {--repeated GuildBossAttackRankData
			[1] = 'int32':playerId	[玩家id]
			[2] = 'string':playerName	[服务器名字]
			[3] = 'int32':attackCount	[攻击次数]
			[4] = 'int32':rank	[排名]
		},
	}
--]]
s2c.GUILD_BOSS_ATTACK_RANK_RESPONSE = 0x4b11

--[[
	[1] = {--LadderSweepReponse
		[1] = {--repeated LadderInfo
			[1] = 'string':name
			[2] = 'int32':power
			[3] = 'bool':isWin	[0:输 ---1:胜利]
			[4] = 'int32':index	[位置]
			[5] = {--repeated DropItems
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.金币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.LADDER_SWEEP_REPONSE = 0x7908

--[[
	[1] = {--ChallengeNorthCaveResult
		[1] = 'int32':score	[挑战结果,几个星]
		[2] = 'int32':nextId	[下一关ID]
		[3] = 'int32':tokens	[剩余无量山钻数量,代币]
	}
--]]
s2c.CHALLENGE_NORTH_CAVE_RESULT = 0x4901

--[[
	[1] = {--EnterGame
		[1] = 'string':resVersion	[需要匹配的资源版本号]
	}
--]]
s2c.ENTER_GAME = 0x0e42

--[[
	[1] = {--HeroRankTop1OnlineNotifyMsg
		[1] = 'int32':playerId	[英雄榜第一名ID]
		[2] = 'string':name	[英雄榜第一名名称]
	}
--]]
s2c.HERO_RANK_TOP1_ONLINE_NOTIFY = 0x1d0f

--[[
	[1] = {--ContestTeamGrandResponse
		[1] = {--TeamGrandType(enum)
			'v4':TeamGrandType
		},
		[2] = 'string':msg	[消息 用,隔开]
	}
--]]
s2c.CONTEST_TEAM_GRAND_RESPONSE = 0x6e10

--[[
	[1] = {--WoodManSpecialRewardResult
		[1] = 'int32':success	[1yes 2no]
	}
--]]
s2c.WOOD_MAN_SPECIAL_REWARD_RESULT = 0x6312

--[[
	[1] = {--OpenHomeReponse
		[1] = 'int32':level	[ 等级]
		[2] = 'int32':exp	[ 经验]
		[3] = 'int32':praiseCount	[点赞次数]
		[4] = 'repeated int32':praiseFriends	[被点赞过的玩家]
		[5] = 'int32':drawCount	[领取奖励的次数]
		[6] = {--repeated HomeEventMsg
			[1] = 'int32':eventId
			[2] = 'repeated int32':players
			[3] = 'int32':totleCount
			[4] = 'int32':count
			[5] = 'int32':state
			[6] = 'string':args
			[7] = 'int64':time	[剩余时间]
		},
		[7] = 'int32':eventOpenCount
	}
--]]
s2c.OPEN_HOME_REPONSE = 0x7400

--[[
	[1] = {--ResetResponse
		[1] = 'int32':freeCount	[是否有免费次数]
	}
--]]
s2c.RESET_RESPONSE = 0x7505

--[[
	[1] = {--ExtraAwayContent
		[1] = {--repeated TreasureBoxContent
			[1] = 'int32':index	[移除的宝箱索引.1--n    //移除的宝箱索引.1--n]
			[2] = 'int32':resType	[资源类型]
			[3] = 'int32':resId	[资源ID]
			[4] = 'int32':number	[数量]
		},
	}
--]]
s2c.EXTRA_AWAY_CONTENT = 0x2206

--[[
	[1] = {--ChapterStatusDataResponse
		[1] = 'int32':chapterId	[ 章节ID]
		[2] = {--repeated CopyStatusData
			[1] = 'int32':copyId	[ 关卡ID]
			[2] = 'int32':pass	[ 0未通过 1战斗中 2已通过]
			[3] = {--repeated MonsterStatusData
				[1] = 'int32':index	[ 索引]
				[2] = 'int32':hp	[ 血量]
				[3] = 'int32':maxHp	[ 最大血量]
			},
			[4] = 'string':killName	[ 击杀者]
		},
		[3] = {--repeated XiaKeHpData
			[1] = 'int64':instanceId	[ 侠客唯一标识ID]
			[2] = 'int32':hp	[ 当前血量]
		},
	}
--]]
s2c.CHAPTER_STATUS_DATA_RESPONSE = 0x5924

--[[
	[1] = {--ContestTeamChatResponse
		[1] = {--repeated TeamChatInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'string':name	[ 玩家名称]
			[3] = 'int32':useIcon	[ 头像]
			[4] = 'int32':frameId	[ 头像框]
			[5] = 'int32':starHeroRanking	[ 名人堂排名]
			[6] = 'int64':chatTime	[ 发言时间时间]
			[7] = 'int32':vipLevel	[ VIP等级]
			[8] = 'string':content	[ 消息内容]
			[9] = 'int32':level	[ 玩家等级]
			[10] = 'int32':quality	[说话角色的主角品质]
			[11] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.CONTEST_TEAM_CHAT_RESPONSE = 0x6e07

--[[
	[1] = {--UsedBuyCoinCount
		[1] = 'int32':count	[已经购买铜币的次数]
	}
--]]
s2c.USED_BUY_COIN_COUNT = 0x1921

--[[
	[1] = {--DrawDropGoods
	}
--]]
s2c.DRAW_DROP_GOODS = 0x6111

--[[
	[1] = {--LotteryResponse
		[1] = {--CopyTeamItemData
			[1] = 'int32':type	[ 资源类型]
			[2] = 'int32':itemId	[ ID]
			[3] = 'int32':number	[ 数量]
		},
		[2] = {--repeated CopyTeamItemData
			[1] = 'int32':type	[ 资源类型]
			[2] = 'int32':itemId	[ ID]
			[3] = 'int32':number	[ 数量]
		},
	}
--]]
s2c.LOTTERY_RESPONSE = 0x5926

--[[
	[1] = {--BibleNoteDate
		[1] = {--repeated BibleNoteConfig
			[1] = 'int64':bibleId	[天书id]
			[2] = 'int32':noteChapterId	[注解章节id]
			[3] = 'int32':noteFloorId	[注解层数id]
			[4] = 'int64':BibleKeyId	[天书秘钥id]
		},
	}
--]]
s2c.BIBLE_NOTE_DATE = 0x6028

--[[
	[1] = {--BibleGemResult
		[1] = 'int64':bibleId	[镶嵌的天书id]
		[2] = 'int32':result	[ 0成功 1失败]
		[3] = {--BibleAllGemInfo
			[1] = 'int64':bibleId	[镶嵌的天书id]
			[2] = {--repeated BibleGemInfo
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':itemId	[ 宝石ID]
			},
		},
	}
--]]
s2c.BIBLE_GEM_RESULT = 0x6012

--[[
	[1] = {--DigHistory
		[1] = {--repeated TreasuresRecordInfo
			[1] = 'string':playerName	[埋宝箱的玩家名称]
			[2] = 'int32':treasureId	[ 埋藏的宝物ID]
			[3] = 'int32':leftTimes	[ 该宝箱剩余可挖次数]
			[4] = 'int64':buriedTime	[埋宝箱时间(挖宝时间)    //埋宝箱时间(挖宝时间)]
			[5] = 'int64':mapId	[埋藏宝箱实例ID]
			[6] = 'int32':isHiddenName	[宝箱是否匿名]
			[7] = 'string':dropItem	[玩家获得的物品]
			[8] = 'string':digName	[挖宝箱的玩家名字]
			[9] = 'string':serverName	[挖宝箱玩家的服务器名字]
			[10] = 'int32':rowId	[所挖宝箱的横坐标]
			[11] = 'int32':colId	[所挖宝箱的纵坐标]
			[12] = 'int32':specialBox	[是否是无量宝箱]
		},
	}
--]]
s2c.DIG_HISTORY = 0x5935

--[[
	[1] = {--SingleResReponse
		[1] = {--ResYesterdayData
			[1] = 'int32':id	[ 模板ID]
			[2] = 'int32':value	[ 数值]
			[3] = 'int32':isBuy	[ 0未购买 1已购买]
		},
	}
--]]
s2c.SINGLE_RES_REPONSE = 0x6c01

--[[
	[1] = {--MyContestTeamResponse
		[1] = {--ContestTeamInfo
			[1] = 'int64':id	[ 队伍唯一标识]
			[2] = 'string':name	[ 队伍名称]
			[3] = 'int32':type	[ 0随机匹配 1自定义队伍]
			[4] = 'int32':leader	[ 队长ID]
			[5] = {--repeated TeamMemberInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家名称]
				[3] = 'int32':power	[ 战斗力]
				[4] = 'int32':useIcon	[ 头像]
				[5] = 'int32':frameId	[ 头像框]
				[6] = 'int32':starHeroRanking	[ 名人堂排名]
				[7] = 'int64':loginTime	[ 最近登录时间]
				[8] = 'int32':position	[ 位置 1头阵 2中坚 3后翼]
				[9] = 'int32':vipLevel	[ VIP等级]
				[10] = 'int32':level	[ 玩家等级]
				[11] = 'int32':inspireNum	[ 鼓舞次数]
				[12] = 'int32':inspireSycee	[ 鼓舞元宝花费数]
				[13] = 'int32':ladderGrade	[天梯赛段位]
			},
			[6] = 'int32':serverId	[ 服务器ID]
			[7] = 'string':serverName	[ 服务器名字]
		},
		[2] = 'repeated int32':playerId	[ 邀请过的玩家ID]
		[3] = 'int32':signUp	[ 报名 0未报名 1已报名]
		[4] = 'int32':bet	[ 押注信息 0押注上一届擂主 1押注这一届挑战者]
		[5] = 'int64':leiZhuTeamId	[ 上届擂主]
	}
--]]
s2c.MY_CONTEST_TEAM_RESPONSE = 0x6e01

--[[
	[1] = {--MyLadderInfo
		[1] = 'int32':grade
		[2] = 'int32':star
	}
--]]
s2c.MY_LADDER_INFO = 0x7907

--[[
	[1] = {--EscortAgencyResponse
		[1] = 'int32':targetId	[集火目标]
		[2] = 'int32':attGuildId	[攻击目标]
		[3] = 'int32':isEscort	[自己是否报名(0否, 1是)    //自己是否报名(0否, 1是)]
		[4] = 'int32':defBattleResult	[战斗结果(1:失败,2:获胜 3:未参加战斗)    //战斗结果(1:失败,2:获胜 3:未参加战斗)]
		[5] = 'int32':attBattleResult	[战斗结果(1:失败,2:获胜 3:未参加战斗)    //战斗结果(1:失败,2:获胜 3:未参加战斗)]
		[6] = 'int32':updateTime	[刷新时间]
		[7] = 'int32':resetTime	[上一次休整时间]
		[8] = {--repeated CardInfo
			[1] = 'int32':guildId	[帮会id]
			[2] = 'string':bannerId	[帮会旗帜id]
			[3] = 'int32':serverId	[服务器id]
			[4] = 'string':serverName	[服务器名字]
			[5] = 'int32':score	[积分]
			[6] = 'int32':quality	[品质]
			[7] = {--repeated PartInfo
				[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
				[2] = 'int32':lastResTime	[最近一次复活时间]
				[3] = 'int32':status	[状态 0:完好 1:损毁]
				[4] = {--repeated PlayerData
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'int32':useCoin	[玩家头像]
					[4] = 'int32':frameId	[玩家头像框]
					[5] = 'string':guildName	[帮会名称]
					[6] = 'string':serverName	[服务器名称]
					[7] = 'int32':power	[战力]
					[8] = 'int32':dieTime	[最近一次死亡时间]
					[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
					[10] = 'int32':type	[类型 0:防守方 1:攻击方]
				},
				[5] = {--repeated DiePlayer
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'string':guildName	[帮会名称]
					[4] = 'string':serverName	[服务器名称]
					[5] = 'int32':power	[战力]
					[6] = 'int32':dieTime	[死亡时间]
				},
			},
		},
		[9] = {--repeated CardRankInfo
			[1] = 'int32':myGuildId	[我的入榜工会id0表示未入榜]
			[2] = 'string':bannerId	[帮派旗帜]
			[3] = 'int32':lastScore	[最低入榜排积分]
			[4] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
			[5] = 'string':myGuildName	[工会名称]
			[6] = {--repeated CardRank
				[1] = {--CardInfo
					[1] = 'int32':guildId	[帮会id]
					[2] = 'string':bannerId	[帮会旗帜id]
					[3] = 'int32':serverId	[服务器id]
					[4] = 'string':serverName	[服务器名字]
					[5] = 'int32':score	[积分]
					[6] = 'int32':quality	[品质]
					[7] = {--repeated PartInfo
						[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
						[2] = 'int32':lastResTime	[最近一次复活时间]
						[3] = 'int32':status	[状态 0:完好 1:损毁]
						[4] = {--repeated PlayerData
							[1] = 'int32':playerId	[玩家id]
							[2] = 'string':playerName	[玩家名称]
							[3] = 'int32':useCoin	[玩家头像]
							[4] = 'int32':frameId	[玩家头像框]
							[5] = 'string':guildName	[帮会名称]
							[6] = 'string':serverName	[服务器名称]
							[7] = 'int32':power	[战力]
							[8] = 'int32':dieTime	[最近一次死亡时间]
							[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
							[10] = 'int32':type	[类型 0:防守方 1:攻击方]
						},
						[5] = {--repeated DiePlayer
							[1] = 'int32':playerId	[玩家id]
							[2] = 'string':playerName	[玩家名称]
							[3] = 'string':guildName	[帮会名称]
							[4] = 'string':serverName	[服务器名称]
							[5] = 'int32':power	[战力]
							[6] = 'int32':dieTime	[死亡时间]
						},
					},
				},
				[2] = 'string':guildName	[帮派名字]
				[3] = 'string':serverName	[服务器名字]
				[4] = 'int32':serverId	[服务器id]
				[5] = 'int32':rank	[排名]
			},
		},
		[10] = {--repeated KillRankInfo
			[1] = 'int32':myPlayerId	[我的id0表示未入榜]
			[2] = 'int32':useCoin	[头像]
			[3] = 'int32':frameId	[头像框]
			[4] = 'int32':lastScore	[最低入榜排积分]
			[5] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
			[6] = 'string':myPlayerName	[玩家名称]
			[7] = 'string':guildName	[帮派名称]
			[8] = {--repeated KillRank
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':useCoin	[头像]
				[3] = 'int32':frameId	[头像框]
				[4] = 'string':serverName	[服务器名称]
				[5] = 'int32':serverId	[服务器id]
				[6] = 'string':playerName	[玩家名称]
				[7] = 'string':guildName	[帮派名称]
				[8] = 'int32':power	[战力]
				[9] = 'int32':killCount	[击杀数量]
				[10] = 'int32':rank	[排行]
			},
		},
		[11] = {--repeated TargetRankInfo
			[1] = {--repeated TargetRank
				[1] = {--CardInfo
					[1] = 'int32':guildId	[帮会id]
					[2] = 'string':bannerId	[帮会旗帜id]
					[3] = 'int32':serverId	[服务器id]
					[4] = 'string':serverName	[服务器名字]
					[5] = 'int32':score	[积分]
					[6] = 'int32':quality	[品质]
					[7] = {--repeated PartInfo
						[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
						[2] = 'int32':lastResTime	[最近一次复活时间]
						[3] = 'int32':status	[状态 0:完好 1:损毁]
						[4] = {--repeated PlayerData
							[1] = 'int32':playerId	[玩家id]
							[2] = 'string':playerName	[玩家名称]
							[3] = 'int32':useCoin	[玩家头像]
							[4] = 'int32':frameId	[玩家头像框]
							[5] = 'string':guildName	[帮会名称]
							[6] = 'string':serverName	[服务器名称]
							[7] = 'int32':power	[战力]
							[8] = 'int32':dieTime	[最近一次死亡时间]
							[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
							[10] = 'int32':type	[类型 0:防守方 1:攻击方]
						},
						[5] = {--repeated DiePlayer
							[1] = 'int32':playerId	[玩家id]
							[2] = 'string':playerName	[玩家名称]
							[3] = 'string':guildName	[帮会名称]
							[4] = 'string':serverName	[服务器名称]
							[5] = 'int32':power	[战力]
							[6] = 'int32':dieTime	[死亡时间]
						},
					},
				},
				[2] = 'string':guildName	[帮派名字]
				[3] = 'string':serverName	[服务器名字]
				[4] = 'int32':serverId	[服务器id]
				[5] = 'int32':killCount	[击杀数量]
				[6] = 'int32':time	[时间]
				[7] = 'int32':rank	[排名]
			},
		},
	}
--]]
s2c.ESCORT_AGENCY_RESPONSE = 0x5f01

--[[
	[1] = {--ReConnectComplete
		[1] = 'string':resVersion	[需要匹配的资源版本号]
	}
--]]
s2c.RE_CONNECT_COMPLETE = 0x0d11

--[[
	[1] = {--MyNewInviteCodeInfo
		[1] = 'int32':myCode	[自己的邀请码]
		[2] = 'bool':invited	[自己是否验证过别人的邀请码]
		[3] = 'bool':invitedAward	[是否已领受邀奖]
		[4] = 'int32':inviteCount	[邀请好友次数]
		[5] = 'string':getRewardRecord	[邀请领奖记录,格式:id_达到条件次数_已领次数&id_次数...]
	}
--]]
s2c.MY_NEW_INVITE_CODE_INFO = 0x2604

--[[
	[1] = {--sendInvocatoryDayReward
		[1] = 'int32':success	[通知客户端领取成功 1表示成功]
	}
--]]
s2c.SEND_INVOCATORY_DAY_REWARD = 0x5403

--[[
	[1] = {--OtherContestTeamResponse
		[1] = {--ContestTeamInfo
			[1] = 'int64':id	[ 队伍唯一标识]
			[2] = 'string':name	[ 队伍名称]
			[3] = 'int32':type	[ 0随机匹配 1自定义队伍]
			[4] = 'int32':leader	[ 队长ID]
			[5] = {--repeated TeamMemberInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家名称]
				[3] = 'int32':power	[ 战斗力]
				[4] = 'int32':useIcon	[ 头像]
				[5] = 'int32':frameId	[ 头像框]
				[6] = 'int32':starHeroRanking	[ 名人堂排名]
				[7] = 'int64':loginTime	[ 最近登录时间]
				[8] = 'int32':position	[ 位置 1头阵 2中坚 3后翼]
				[9] = 'int32':vipLevel	[ VIP等级]
				[10] = 'int32':level	[ 玩家等级]
				[11] = 'int32':inspireNum	[ 鼓舞次数]
				[12] = 'int32':inspireSycee	[ 鼓舞元宝花费数]
				[13] = 'int32':ladderGrade	[天梯赛段位]
			},
			[6] = 'int32':serverId	[ 服务器ID]
			[7] = 'string':serverName	[ 服务器名字]
		},
	}
--]]
s2c.OTHER_CONTEST_TEAM_RESPONSE = 0x6e17

--[[
	[1] = {--GainChatInfoResp
		[1] = {--repeated ChatInfo
			[1] = 'int32':chatType	[聊天类型;1.公共,2.私聊;3.帮派;]
			[2] = 'string':content	[消息;]
			[3] = 'int32':playerId	[说话人的id]
			[4] = 'int32':roleId	[主角角色ID,卡牌ID]
			[5] = 'int32':quality	[说话角色的主角品质]
			[6] = 'string':name	[说话人的名字]
			[7] = 'int32':vipLevel	[VIP等级]
			[8] = 'int32':level	[玩家等级]
			[9] = 'int64':timestamp	[消息发送时间]
			[10] = 'int32':guildId	[公会编号]
			[11] = 'string':guildName	[公会名称]
			[12] = 'int32':competence	[公会职位 1会长 2副会长 3成员]
			[13] = 'repeated int32':invitationGuilds	[邀请过他的公会]
			[14] = 'int32':titleType	[称号类型]
			[15] = 'int32':guideType	[指导员类型]
			[16] = 'int32':icon	[头像]
			[17] = 'int32':headPicFrame	[头像边框]
			[18] = 'int32':serverId
			[19] = 'string':serverName
			[20] = 'int32':audioTime	[语音聊天时间]
			[21] = 'string':audioId	[语音聊天id]
			[22] = 'int32':starHeroRanking	[名人堂排名]
			[23] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.GAIN_CHAT_INFO_RESP = 0x1b07

--[[
	[1] = {--ImpeachmentMsg
		[1] = 'string':opsName	[操作人姓名]
		[2] = 'string':impeachmentDesc	[弹劾描述]
	}
--]]
s2c.IMPEACHMENT = 0x4451

--[[
	[1] = {--GetBrokerageResult
	}
--]]
s2c.GET_BROKERAGE_RESULT = 0x5005

--[[
	[1] = {--ActivityInfo
		[1] = 'int32':id	[活动ID]
		[2] = 'string':name	[名称]
		[3] = 'string':title	[标题]
		[4] = 'int32':type	[活动类型:0.未知;1.登录;2.连续登录;3.在线奖励,持续在线时长;4.VIP等级;5.团队等级;6.累计充值金额;7.单笔充值金额;8.累计消耗,针对元宝]
		[5] = 'string':resetCron	[重置表达式,CronExpression表达]
		[6] = 'int32':status	[活动状态:0.活动强制无效,不显示该活动;;1.长期显示该活动 2.自动检测,过期则不显示]
		[7] = 'bool':history	[是否把历史记录也有效,默认无效.如果设置为true,那么历史记录会马上更新活动状态,例如:充值累计]
		[8] = 'string':icon	[活动图标]
		[9] = 'string':details	[活动详情,客户端支持的符文本格式表达式]
		[10] = 'string':reward	[奖励表达式,直接数据格式,根据不同的活动类型表达式可能不一样.如:200|1,1,100&1,2,100&1,3,100|1;400|1,3,100&1,3,100&1,3,100|3]
		[11] = 'string':beginTime	[开始日期,没有期限设置为null]
		[12] = 'string':endTime	[结束日期,没有期限设置为null]
		[13] = 'int32':showWeight	[显示权重(控制前端显示顺序)    //显示权重(控制前端显示顺序)]
		[14] = 'bool':crossServer	[是否跨服]
		[15] = 'bool':show	[是否显示]
		[16] = 'bool':limitStore	[是否限时商城]
	}
--]]
s2c.ACTIVITY_INFO = 0x2300

--[[
	[1] = {--GangStaticInfoMsg
		[1] = 'int32':gangId	[帮派ID]
		[2] = 'string':gangName	[帮派名称]
		[3] = 'int32':memberNum	[成员数量]
		[4] = 'int32':masterId	[帮主ID]
		[5] = 'string':masterName	[帮主名称]
		[6] = 'int32':myGangRole	[我的帮派职位 0:屌丝  1:副帮主 2:帮主]
		[7] = 'string':bulletin	[公告内容]
		[8] = 'string':buffStr	[buff加成属性, "1_125|2_125"]
	}
--]]
s2c.GANG_STATIC_INFO = 0x1801

--[[
	[1] = {--sendInvocatoryReward
		[1] = {--repeated InvocatoryInfo
			[1] = 'int32':roleId	[侠客模板id]
			[2] = 'int32':roleNum	[三个卡槽的侠客数量]
			[3] = 'int32':roleSycee	[三个卡槽的侠客花费]
			[4] = 'int32':isGetReward	[是否领取了祈愿奖励  0是未领取1是已经领取]
		},
		[2] = 'int32':indexId	[位置索引]
	}
--]]
s2c.SEND_INVOCATORY_REWARD = 0x5402

--[[
	[1] = {--DestinyDataInfo
		[1] = 'int64':instanceId	[唯一id]
		[2] = 'int32':templateId	[模板id]
		[3] = 'int64':roleId	[装备的角色id]
		[4] = 'int32':pos	[装备位置]
		[5] = 'int32':level	[等级]
		[6] = 'int32':stepExp	[经验]
		[7] = 'int32':quality	[品质]
		[8] = 'int32':type	[类型]
		[9] = 'int32':star	[星级]
		[10] = 'int32':starLevel	[等级]
	}
--]]
s2c.DESTINY_DATA_INFO = 0x3f06

--[[
	[1] = {--BattleRoundsMsg
		[1] = {--repeated BattleRound
			[1] = {--repeated BattleAction
				[1] = {--repeated ActionTargetInfo
					[1] = 'int32':position	[受击者位置]
					[2] = 'int32':effectType	[效果类型:1.普通攻击;2.暴击;3.躲避;4.治疗;5.净化;6.斗转星移;7.加状态]
					[3] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
					[4] = {--repeated TriggerEffect
						[1] = 'int32':type	[效果类型]
						[2] = 'int32':value	[效果值]
					},
					[5] = {--repeated TriggerEffect
						[1] = 'int32':type	[效果类型]
						[2] = 'int32':value	[效果值]
					},
					[6] = {--repeated NewStateInfo
						[1] = 'int32':fromPos	[状态由那个角色给与,0~17]
						[2] = 'bool':stateTrigger	[是否为状态触发,如果true则表示triggerId为状态ID,否则为技能ID]
						[3] = 'int32':triggerId	[产生状态的来源ID,可能是状态ID,或者技能ID,始终是fromPos的角色身上的技能或者状态]
						[4] = 'int32':stateId	[角色获得的状态ID]
						[5] = 'int32':stateLevel	[状态等级]
						[6] = 'int32':result	[给与状态结果,默认不需要填写,为了适配:1.抵抗;2.免疫等显示效果定义]
					},
					[7] = {--repeated LostStateInfo
						[1] = 'int32':position	[失去状态的角色位置.0~17]
						[2] = 'int32':stateId	[失去的状态ID]
						[3] = 'int32':repeatNum	[剩余层数,如果状态可以叠加则发送此字段,否则不需要发送.当层数为0时,表示状态彻底移除,否则减少层数为此字段的数值]
					},
					[8] = {--repeated StateCycleEffect
						[1] = 'int32':position	[角色位置.0~17]
						[2] = 'int32':stateId	[状态ID]
						[3] = 'int32':effectType	[状态效果类型:1.普通;2.暴击;3.免疫--]
						[4] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
					},
					[9] = {--DeepHurt
						[1] = 'int32':type	[加深类型,实际上是中毒.等状态类型,具体看代码或者让策划进行整理]
						[2] = 'int32':value	[效果值,10000表示100%好像是这样    //效果值,10000表示100%好像是这样]
					},
				},
				[2] = {--repeated SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[3] = {--repeated NewStateInfo
					[1] = 'int32':fromPos	[状态由那个角色给与,0~17]
					[2] = 'bool':stateTrigger	[是否为状态触发,如果true则表示triggerId为状态ID,否则为技能ID]
					[3] = 'int32':triggerId	[产生状态的来源ID,可能是状态ID,或者技能ID,始终是fromPos的角色身上的技能或者状态]
					[4] = 'int32':stateId	[角色获得的状态ID]
					[5] = 'int32':stateLevel	[状态等级]
					[6] = 'int32':result	[给与状态结果,默认不需要填写,为了适配:1.抵抗;2.免疫等显示效果定义]
				},
				[4] = {--repeated LostStateInfo
					[1] = 'int32':position	[失去状态的角色位置.0~17]
					[2] = 'int32':stateId	[失去的状态ID]
					[3] = 'int32':repeatNum	[剩余层数,如果状态可以叠加则发送此字段,否则不需要发送.当层数为0时,表示状态彻底移除,否则减少层数为此字段的数值]
				},
				[5] = {--repeated StateCycleEffect
					[1] = 'int32':position	[角色位置.0~17]
					[2] = 'int32':stateId	[状态ID]
					[3] = 'int32':effectType	[状态效果类型:1.普通;2.暴击;3.免疫--]
					[4] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
				},
				[6] = 'int32':type	[动作类型:1.主动释放大招;2.普通攻击;3.反击;4.触发被动技能--]
				[7] = 'int32':fromPos	[攻击者位置.0~17,左侧0~8,右侧9~17]
			},
			[2] = {--repeated LostStateInfo
				[1] = 'int32':position	[失去状态的角色位置.0~17]
				[2] = 'int32':stateId	[失去的状态ID]
				[3] = 'int32':repeatNum	[剩余层数,如果状态可以叠加则发送此字段,否则不需要发送.当层数为0时,表示状态彻底移除,否则减少层数为此字段的数值]
			},
			[3] = {--repeated StateCycleEffect
				[1] = 'int32':position	[角色位置.0~17]
				[2] = 'int32':stateId	[状态ID]
				[3] = 'int32':effectType	[状态效果类型:1.普通;2.暴击;3.免疫--]
				[4] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
			},
			[4] = 'int32':roundIndex	[回合索引,从1~N]
		},
		[2] = {--repeated BattleRoleLastHp
			[1] = 'int32':position	[位置]
			[2] = 'int32':currentHp	[剩余血量]
		},
		[3] = 'repeated int32':energy	[剩余怒气:左侧,右侧]
		[4] = 'bool':win	[战斗是否在客户端判断为胜利]
	}
--]]
s2c.BATTLE_ROUNDS = 0x0f21

--[[
	[1] = {--EmployTeamSuccess
		[1] = 'int32':useType	[使用类型,哪里使用,可以根据战斗类型进行定义或者阵形.系统类型进行定义]
		[2] = 'int32':fromId	[队伍来自那个玩家,玩家ID]
	}
--]]
s2c.EMPLOY_TEAM_SUCCESS = 0x5160

--[[
	[1] = {--ChangeProfessionResult
		[1] = {--RoleInfo
			[1] = 'int64':userid	[ 唯一id]
			[2] = 'int32':id	[ 卡牌的id]
			[3] = 'int32':level	[ 等级]
			[4] = 'int64':curexp	[ 当前经验]
			[5] = 'int32':quality	[品质]
			[6] = 'int32':starlevel	[星级]
			[7] = 'int32':starExp	[星级经验]
			[8] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[9] = {--repeated EquipmentInfo
				[1] = 'int64':userid	[userid  唯一id]
				[2] = 'int32':id	[id]
				[3] = 'int32':level	[level]
				[4] = 'int32':quality	[品质]
				[5] = 'string':base_attr	[基本属性]
				[6] = 'string':extra_attr	[附加属性]
				[7] = 'int32':grow	[成长值]
				[8] = 'int32':holeNum	[宝石孔数]
				[9] = {--repeated GemPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[ id]
				},
				[10] = 'int32':star	[星级]
				[11] = 'int32':starFailFix	[升星失败率修正值]
				[12] = 'int32':refineLevel	[精炼等级]
				[13] = {--repeated Recast
					[1] = 'int32':quality
					[2] = 'int32':ratio
					[3] = 'int32':index
				},
				[14] = 'int32':stepExp
				[15] = 'int32':stepLevel
				[16] = 'int32':throughLevel
			},
			[10] = {--repeated BibleInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':id	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':level	[重级]
				[5] = 'int32':breachLevel	[突破]
				[6] = {--repeated EssentialPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[精要模板id]
				},
				[7] = 'repeated int32':gemId	[ 天书宝石]
				[8] = {--BibleComprehendInfo
					[1] = 'int64':bibleId	[天书id]
					[2] = 'int32':stageId	[阶段id]
					[3] = 'int32':useCount	[参悟丹使用次数]
					[4] = 'int32':reachId	[达成的id]
					[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
					[6] = {--repeated BibleStageInfo
						[1] = 'int32':stage	[阶段id]
						[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
						[3] = 'repeated int32':attIndex	[属性下标]
						[4] = 'repeated int32':value	[属性值]
					},
				},
			},
			[11] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[12] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[13] = 'int32':skillStarLevel
			[14] = {--repeated HeartMethodEquipInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':itemId	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':practiceId	[x]
				[5] = 'int32':breachId	[突破]
				[6] = {--repeated HeartMethodGem
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':itemId	[ 宝石ID]
				},
				[7] = {--repeated HeartMethodConcise
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 凝练等级]
				},
				[8] = {--repeated HeartMethodRecast
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 重铸等级]
				},
			},
			[15] = {--repeated DestinyEquipDataInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':templateId	[模板id]
				[3] = 'int64':roleId	[装备的角色id]
				[4] = 'int32':pos	[装备位置]
				[5] = 'int32':level	[等级]
				[6] = 'int32':stepExp	[经验]
				[7] = 'int32':quality	[品质]
				[8] = 'int32':type
				[9] = 'int32':star	[星级]
				[10] = 'int32':starLevel	[等级]
			},
		},
	}
--]]
s2c.CHANGE_PROFESSION_RESULT = 0x5500

--[[
	[1] = {--BattlePetEquipFormationResponse
		[1] = 'int64':instanceId	[战宠id]
		[2] = 'int32':formationType	[阵容类型]
		[3] = 'int32':type	[1 装备 2 卸下]
	}
--]]
s2c.BATTLE_PET_EQUIP_FORMATION_RESPONSE = 0x4f04

--[[
	[1] = {--GetSettlementRewardInfoResponse
		[1] = 'int32':yesterdayRank	[昨日排名]
		[2] = 'int32':currentRank	[当前排名]
		[3] = 'repeated int32':rewardIds	[已领取奖励id]
	}
--]]
s2c.GET_SETTLEMENT_REWARD_INFO_RESPONSE = 0x6f0a

--[[
	[1] = {--ContestTeamInviteResponse
		[1] = 'repeated int32':playerId	[ 所有邀请成功的好友ID]
	}
--]]
s2c.CONTEST_TEAM_INVITE_RESPONSE = 0x6e04

--[[
	[1] = {--HeartMethodChange
		[1] = 'repeated int64':removeXinfa	[移除的心法id]
	}
--]]
s2c.HEART_METHOD_CHANGE = 0x7b10

--[[
	[1] = {--ChampionsBetSucess
	}
--]]
s2c.CHAMPIONS_BET_SUCESS = 0x4512

--[[
	[1] = {--BloodyEnemySimpleInfoList
		[1] = 'int32':currSection	[当前关卡]
		[2] = {--repeated BloodyEnemySimpleInfo
			[1] = 'string':name	[npc名称]
			[2] = 'int32':section	[第几关(从1开始)    //第几关(从1开始)]
			[3] = 'int32':star	[战斗星级]
			[4] = 'int32':roleId	[代表角色的ID]
		},
	}
--]]
s2c.BLOODY_ENEMY_SIMPLE_INFO_LIST = 0x3207

--[[
	[1] = {--ActivityProgressList
		[1] = {--repeated ActivityProgress
			[1] = 'int32':id	[活动ID]
			[2] = 'int32':progress	[进度]
			[3] = 'string':extend	[进度扩展字段,单笔充值等复杂的进度记录]
			[4] = 'string':got	[已经领取的奖励表达式,与reward对应.如:1,0,1,2,0]
			[5] = 'string':lastUpdate	[最后更新时间]
			[6] = 'int32':resetRemaining	[下次重置剩余时间,如果活动信息中resetCron为null或者空字符串则忽略此字段]
		},
	}
--]]
s2c.ACTIVITY_PROGRESS_LIST = 0x2303

--[[
	[1] = {--ContestFinalsResponse
		[1] = {--repeated TeamBattleLogInfo
			[1] = {--ContestTeamInfo
				[1] = 'int64':id	[ 队伍唯一标识]
				[2] = 'string':name	[ 队伍名称]
				[3] = 'int32':type	[ 0随机匹配 1自定义队伍]
				[4] = 'int32':leader	[ 队长ID]
				[5] = {--repeated TeamMemberInfo
					[1] = 'int32':playerId	[ 玩家ID]
					[2] = 'string':name	[ 玩家名称]
					[3] = 'int32':power	[ 战斗力]
					[4] = 'int32':useIcon	[ 头像]
					[5] = 'int32':frameId	[ 头像框]
					[6] = 'int32':starHeroRanking	[ 名人堂排名]
					[7] = 'int64':loginTime	[ 最近登录时间]
					[8] = 'int32':position	[ 位置 1头阵 2中坚 3后翼]
					[9] = 'int32':vipLevel	[ VIP等级]
					[10] = 'int32':level	[ 玩家等级]
					[11] = 'int32':inspireNum	[ 鼓舞次数]
					[12] = 'int32':inspireSycee	[ 鼓舞元宝花费数]
					[13] = 'int32':ladderGrade	[天梯赛段位]
				},
				[6] = 'int32':serverId	[ 服务器ID]
				[7] = 'string':serverName	[ 服务器名字]
			},
			[2] = {--ContestTeamInfo
				[1] = 'int64':id	[ 队伍唯一标识]
				[2] = 'string':name	[ 队伍名称]
				[3] = 'int32':type	[ 0随机匹配 1自定义队伍]
				[4] = 'int32':leader	[ 队长ID]
				[5] = {--repeated TeamMemberInfo
					[1] = 'int32':playerId	[ 玩家ID]
					[2] = 'string':name	[ 玩家名称]
					[3] = 'int32':power	[ 战斗力]
					[4] = 'int32':useIcon	[ 头像]
					[5] = 'int32':frameId	[ 头像框]
					[6] = 'int32':starHeroRanking	[ 名人堂排名]
					[7] = 'int64':loginTime	[ 最近登录时间]
					[8] = 'int32':position	[ 位置 1头阵 2中坚 3后翼]
					[9] = 'int32':vipLevel	[ VIP等级]
					[10] = 'int32':level	[ 玩家等级]
					[11] = 'int32':inspireNum	[ 鼓舞次数]
					[12] = 'int32':inspireSycee	[ 鼓舞元宝花费数]
					[13] = 'int32':ladderGrade	[天梯赛段位]
				},
				[6] = 'int32':serverId	[ 服务器ID]
				[7] = 'string':serverName	[ 服务器名字]
			},
			[3] = 'repeated int32':result	[ 三场胜负关系 0表示攻击方胜利 1表示防守方胜利]
			[4] = 'repeated int32':replayId	[ 三场战斗的录像ID]
			[5] = 'int64':createTime	[ 录像时间]
		},
		[2] = {--repeated TeamRankingInfo
			[1] = 'string':name	[ 队伍名称]
			[2] = 'int32':integral	[ 积分]
			[3] = 'int32':ranking	[ 排名]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':serverId	[ 服务器ID]
			[6] = 'int64':id	[ 队伍唯一标识]
		},
		[3] = 'int32':integral	[ 我的积分]
		[4] = 'int32':ranking	[ 我的排行]
		[5] = 'int32':leizhuCount	[ 擂主次数]
		[6] = 'int32':first	[ 是否是第一界]
	}
--]]
s2c.CONTEST_FINALS_RESPONSE = 0x6e12

--[[
	[1] = {--SettingSaveConfigResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.SETTING_SAVE_CONFIG_RESULT = 0x1e01

--[[
	[1] = {--GuildBattleReplayInfos
		[1] = {--repeated GuildBattleTeamInfo
			[1] = 'int32':eliteId	[精英编号]
			[2] = {--repeated GuildBattlePlayerInfo
				[1] = 'int32':playerId
				[2] = 'int32':power
				[3] = 'string':name
				[4] = 'int32':profession
				[5] = 'int32':headPicFrame	[头像框]
				[6] = 'int32':starHeroRanking	[名人堂排名]
				[7] = 'int32':ladderGrade	[天梯赛段位]
			},
			[3] = 'int32':id
		},
		[2] = {--repeated GuildBattleReplayInfo
			[1] = 'int32':roundId
			[2] = 'int32':index
			[3] = 'int32':scene
			[4] = 'int32':team
			[5] = 'int32':atkPlayerId
			[6] = 'int32':defPlayerId
			[7] = 'int32':winPlayerId
			[8] = 'int32':replayId
		},
	}
--]]
s2c.GUILD_BATTLE_REPLAY_INFOS = 0x5705

--[[
	[1] = {--RechargeTicketInfoResponse
		[1] = {--repeated RechargeTicketInfo
			[1] = 'int64':instanceId	[物品实例id]
			[2] = 'int32':templateId	[物品模版id]
			[3] = 'int32':createTime	[创建时间]
			[4] = 'int32':endTime	[结束时间]
		},
	}
--]]
s2c.RECHARGE_TICKET_INFO_RESPONSE = 0x7701

--[[
	[1] = {--GangRefleshExchangeListResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_REFLESH_EXCHANGE_LIST_RESULT = 0x1812

--[[
	[1] = {--VIPTrust
		[1] = 'int32':staus	[1:是认证用户,0:不是]
	}
--]]
s2c.VIPTRUST = 0x1a21

--[[
	[1] = {--EverQuestRankList
		[1] = {--repeated RankPlayerInfo
			[1] = 'string':name	[名字]
			[2] = 'int32':rolenum	[上阵人数]
			[3] = 'int32':viplevel	[vip等级]
			[4] = 'int32':level	[等级]
			[5] = 'int32':questnum	[闯关数量]
			[6] = 'int32':playerid	[id]
		},
	}
--]]
s2c.EVER_QUEST_RANK_LIST = 0x1404

--[[
	[1] = {--CurrentState
		[1] = 'int32':state
	}
--]]
s2c.CURRENT_STATE = 0x4519

--[[
	[1] = {--RecruitInfo
		[1] = {--repeated RecruitRoleInfo
			[1] = 'int32':roleId	[角色id]
			[2] = 'int32':x	[角色x坐标]
			[3] = 'int32':y	[角色y坐标]
			[4] = 'int32':scale	[图片缩放度 百分数]
			[5] = 'bool':flipX	[是否翻转]
			[6] = {--repeated RecruitSayInfo
				[1] = 'string':txt	[说话内容]
				[2] = 'int32':delayF	[话前等待 毫秒]
				[3] = 'int32':delayB	[话后等待 毫秒]
				[4] = 'int32':index	[顺序]
			},
		},
	}
--]]
s2c.RECRUIT_INFO = 0x6201

--[[
	[1] = {--TimeZone
		[1] = 'int32':zone
	}
--]]
s2c.TIME_ZONE = 0x0d22

--[[
	[1] = {--OpenServiceActivityStatus
		[1] = 'int32':type	[类型:0表示全部]
		[2] = 'int32':status	[状态:1.未开始;2.进行中;3已结束]
		[3] = 'string':startTime	[开始时间:yyyy-MM-dd HH:mm:ss    //开始时间:yyyy-MM-dd HH:mm:ss]
		[4] = 'string':endTime	[结束时间:yyyy-MM-dd HH:mm:ss    //结束时间:yyyy-MM-dd HH:mm:ss]
	}
--]]
s2c.OPEN_SERVICE_ACTIVITY_STATUS = 0x3300

--[[
	[1] = {--EquipPracticeResult
		[1] = 'int64':equipment	[装备userid]
		[2] = 'string':extra_attr	[附加属性]
	}
--]]
s2c.EQUIP_PRACTICE_RESULT = 0x1023

--[[
	[1] = {--AccessRecords
		[1] = {--repeated AccessRecordsStr
			[1] = 'int32':type
			[2] = 'string':recordstr	[逗号隔开 1点赞 玩家名 2事件 玩家名,事件编号]
		},
	}
--]]
s2c.ACCESS_RECORDS = 0x7410

--[[
	[1] = {--GetProtagonistSkillMsg
		[1] = {--repeated ProtagonistSkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
		[2] = {--repeated ProtagonistSkillUseInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':pos	[技能的位置]
		},
		[3] = 'int32':skill_point	[技能点数量]
	}
--]]
s2c.GET_PROTAGONIST_SKILL = 0x1f01

--[[
	[1] = {--AdventureRevenge
	}
--]]
s2c.ADVENTURE_REVENGE = 0x5906

--[[
	[1] = {--HeartMethodPractice
		[1] = 'int64':instanceId	[ 心法实例ID]
		[2] = 'int32':id	[ 心法修炼后id]
	}
--]]
s2c.HEART_METHOD_PRACTICE = 0x7b06

--[[
	[1] = {--RepeatSystemMessageList
		[1] = {--repeated RepeatSystemMessage
			[1] = 'int32':messageId	[消息id]
			[2] = 'string':content	[系统推送内容]
			[3] = 'int32':intervalTime	[间隔时间]
			[4] = 'int64':beginTime	[开始时间]
			[5] = 'int64':endTime	[结束时间]
			[6] = 'int32':repeatTime	[重复次数]
			[7] = 'int32':priority	[权重]
		},
	}
--]]
s2c.REPEAT_SYSTEM_MESSAGE_LIST = 0x1d61

--[[
	[1] = {--ActivityBattleDrop
		[1] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
	}
--]]
s2c.ACTIVITY_BATTLE_DROP = 0x2309

--[[
	[1] = {--GainGuildInvitationReult
		[1] = {--repeated GuildInvitationInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':profession	[职业]
			[5] = 'int32':level	[等级]
			[6] = 'int32':guildId	[公会编号]
			[7] = 'string':guildName	[公会名称]
			[8] = 'int64':createTime	[创建时间]
			[9] = 'int32':quality
			[10] = 'int32':icon	[头像]
			[11] = 'int32':headPicFrame	[头像边框]
			[12] = 'int32':starHeroRanking	[名人堂排名]
			[13] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.GAIN_GUILD_INVITATION_REULT = 0x4412

--[[
	[1] = {--ResetWaitTimeSuccess
		[1] = 'int32':type	[1-推图体力;2-群豪谱体力;3-爬塔体力; 4-江湖宝藏体力; 5-技能点    //1-推图体力;2-群豪谱体力;3-爬塔体力; 4-江湖宝藏体力; 5-技能点]
	}
--]]
s2c.RESET_WAIT_TIME_SUCCESS = 0x2105

--[[
	[1] = {--FightReplayMsg
		[1] = {--FightBeginMsg
			[1] = 'int32':fighttype
			[2] = 'int32':angerSelf
			[3] = 'int32':angerEnemy
			[4] = {--repeated FightRole
				[1] = 'int32':typeid	[角色类型:1.玩家拥有角色;2.NPC]
				[2] = 'int32':roleId	[卡牌角色id,npc为t_s_npc_instance表格配置的ID,其他为t_s_role表格id]
				[3] = 'int32':maxhp	[最大满血量]
				[4] = 'int32':posindex	[位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35    //位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35]
				[5] = 'int32':level	[等级]
				[6] = 'repeated int32':attr	[属性]
				[7] = {--SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[8] = {--repeated SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[9] = 'string':name	[角色名称,只有主角才发送]
				[10] = 'string':immune	[免疫属性]
				[11] = 'string':effectActive	[效果影响主动]
				[12] = 'string':effectPassive	[效果影响被动]
				[13] = 'int32':anger	[角色怒气]
			},
			[5] = 'int32':index	[战斗场次]
			[6] = 'int32':myBattlearrayId	[ 我的阵法模板ID]
			[7] = 'int32':enemyBattlearrayId	[ 对方的阵法模板ID]
			[8] = 'string':suppress	[战力压制比(左方_右方)    //战力压制比(左方_右方)]
		},
		[2] = {--FightDataMsg
			[1] = 'int32':fighttype	[战斗类型.1:推图;2:铜人阵;3:豪杰榜;4:天罡星]
			[2] = 'bool':win	[战斗是否在客户端判断为胜利]
			[3] = {--repeated FightAction
				[1] = 'bool':bManualAction	[是否主动技能]
				[2] = 'int32':roundIndex	[当前回合]
				[3] = 'int32':attackerpos	[攻击者位置]
				[4] = 'int32':skillid	[技能id]
				[5] = 'int32':skillLevel	[技能id]
				[6] = 'bool':bBackAttack	[是否反击]
				[7] = {--repeated TargetInfo
					[1] = 'int32':targetpos	[受击者位置]
					[2] = 'int32':effect	[受击效果]
					[3] = 'int32':hurt	[受击伤害]
					[4] = 'int32':triggerBufferID	[触发bufferID]
					[5] = 'int32':triggerBufferLevel	[触发bufferID]
					[6] = 'int32':passiveEffect	[被动效果类型]
					[7] = 'int32':passiveEffectValue	[被动效果值]
					[8] = 'int32':activeEffect	[主动效果类型]
					[9] = 'int32':activeEffectValue	[主动效果值]
				},
				[8] = {--repeated StateInfo
					[1] = 'int32':frompos	[状态产生自谁行为发起者还是目标]
					[2] = 'int32':targetpos	[获得状态的目标]
					[3] = 'int32':stateId	[触发的状态ID,触发了哪个状态.始终是frompos对应角色身上的状态列表中的状态]
					[4] = 'int32':skillId	[状态时由哪个技能触发的.始终是frompos对应角色身上的技能]
					[5] = 'int32':skillLevel	[状态时由哪个技能触发的.始终是frompos对应角色身上的技能]
					[6] = 'int32':bufferId	[targetpos的角色获得的状态ID]
					[7] = 'int32':bufferLevel	[targetpos的角色获得的状态ID]
				},
				[9] = 'int32':triggerType	[触发技能类型]
			},
			[4] = {--repeated LiveRole
				[1] = 'int32':posindex	[位置]
				[2] = 'int32':currhp	[剩余血量]
				[3] = 'int32':anger
			},
			[5] = 'int32':angerSelf	[己方怒气]
			[6] = 'int32':angerEnemy	[对方怒气]
			[7] = {--repeated RoleHurtCount
				[1] = 'int32':posindex	[位置]
				[2] = 'int32':hurt	[伤害计算]
			},
		},
		[3] = 'int32':rank	[群豪谱排名]
	}
--]]
s2c.FIGHT_REPLAY = 0x0f04

--[[
	[1] = {--GetDining
		[1] = 'string':lastTime	[最后用膳时间,表达式:2015-09-05 12:08:23    //最后用膳时间,表达式:2015-09-05 12:08:23]
		[2] = {--repeated DietInfo
			[1] = 'int32':type	[类型:1:午餐;2:晚餐;3:夜宵]
			[2] = 'int32':status	[状态:1:准备中;2:就绪;3:已经使用;4:超时]
		},
	}
--]]
s2c.GET_DINING = 0x2501

--[[
	[1] = {--QimenInjectMsgResult
	}
--]]
s2c.QIMEN_INJECT_MSG_RESULT = 0x5201

--[[
	[1] = {--ApplyReturnGiftSucess
	}
--]]
s2c.APPLY_RETURN_GIFT_SUCESS = 0x5324

--[[
	[1] = {--AllEquipmentGemSoltNumberChanged
		[1] = 'int32':max	[默认开放的宝石孔个数]
	}
--]]
s2c.ALL_EQUIPMENT_GEM_SOLT_NUMBER_CHANGED = 0x1055

--[[
	[1] = {--DeleteApply
		[1] = 'int32':playerId	[被删除的申请编号 0为全部删除]
	}
--]]
s2c.DELETE_APPLY = 0x4404

--[[
	[1] = {--GuildBattleWarInfos
		[1] = {--repeated GuildBattleWarInfo
			[1] = 'int32':round
			[2] = 'int32':index
			[3] = 'int32':atkGuildId
			[4] = 'string':atkGuildName
			[5] = 'string':atkBannerId
			[6] = 'int32':winGuildId
			[7] = 'int32':defGuildId
			[8] = 'string':defGuildName
			[9] = 'string':defBannerId
			[10] = 'int32':atkPeakAddition	[论剑峰属性加层 万分比]
			[11] = 'int32':defPeakAddition	[论剑峰属性加层 万分比]
		},
	}
--]]
s2c.GUILD_BATTLE_WAR_INFOS = 0x5704

--[[
	[1] = {--ApplyGuildInfoList
		[1] = {--repeated ApplyGuildInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':power	[战斗力]
			[5] = 'int64':lastLoginTime	[最后登录时间]
			[6] = 'int32':profession	[职业]
			[7] = 'int32':level	[等级]
			[8] = 'int64':applyTime	[最后申请时间]
			[9] = 'int32':icon	[头像]
			[10] = 'int32':headPicFrame	[头像边框]
			[11] = 'int32':starHeroRanking	[名人堂排名]
			[12] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.APPLY_GUILD_INFO_LIST = 0x440a

--[[
	[1] = {--RefreshYabiaoResult
	}
--]]
s2c.REFRESH_YABIAO_RESULT = 0x3001

--[[
	[1] = {--ArenaRankTop1OnlineNotifyMsg
		[1] = 'int32':playerId	[英雄榜第一名ID]
		[2] = 'string':name	[英雄榜第一名名称]
	}
--]]
s2c.ARENA_RANK_TOP1_ONLINE_NOTIFY = 0x1d30

--[[
	[1] = {--EmploySingleRoleRelease
		[1] = 'int32':playerId	[雇佣的角色属于哪个玩家]
		[2] = 'int64':instanceId	[角色实例ID]
		[3] = 'int32':useType	[使用类型,客户端定义,这里可以是战斗类型]
	}
--]]
s2c.EMPLOY_SINGLE_ROLE_RELEASE = 0x5121

--[[
	[1] = {--UpdateCustomSkillSucess
	}
--]]
s2c.UPDATE_CUSTOM_SKILL_SUCESS = 0x0f2b

--[[
	[1] = {--TreasureBag
		[1] = {--repeated HoldTreasure
			[1] = 'int64':id	[玩家宝箱背包的宝箱ID]
			[2] = 'int32':treasureId	[宝箱的类型ID]
			[3] = 'int64':getTime	[获取时间]
		},
	}
--]]
s2c.TREASURE_BAG = 0x5937

--[[
	[1] = {--LastRankInfoMsg
		[1] = {--repeated CrossGuildRankInfoMsg
			[1] = 'int32':guildId
			[2] = 'string':guildName
			[3] = 'string':bannerId
			[4] = 'int32':serverId
			[5] = 'string':serverName
		},
		[2] = {--repeated CrossMemberRankInfoMsg
			[1] = 'string':playerName
			[2] = 'int32':useCoin
			[3] = 'int32':frameId
			[4] = 'int32':starHeroRanking
		},
		[3] = {--CrossGuildRankInfoMsg
			[1] = 'int32':guildId
			[2] = 'string':guildName
			[3] = 'string':bannerId
			[4] = 'int32':serverId
			[5] = 'string':serverName
		},
		[4] = 'int32':myRank
		[5] = 'int32':serverRank
		[6] = 'int64':lastOpenTime
	}
--]]
s2c.LAST_RANK_INFO = 0x443e

--[[
	[1] = {--ClearYabiaoCDNotify
	}
--]]
s2c.CLEAR_YABIAO_CDNOTIFY = 0x3004

--[[
	[1] = {--YabiaoMsg
		[1] = {--repeated YabiaoInfo
			[1] = 'int32':id	[	镖车ID]
			[2] = 'int64':startTime	[开始时间]
			[3] = 'int64':endTime	[ 今日剩余押镖次数]
			[4] = 'int32':status	[押镖状态:0.空闲;1.正在押镖;2.押镖完成可以领取奖励]
			[5] = 'int64':leftFreeRefreshTime	[今日剩余免费刷新次数]
			[6] = 'int64':leftYabiaoTime	[ 今日剩余押镖次数]
			[7] = 'int32':nextRefreshCostSysee	[下次刷新花费元宝]
		},
	}
--]]
s2c.YABIAO = 0x3000

--[[
	[1] = {--XiaKeHereditary
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.XIA_KE_HEREDITARY = 0x6501

--[[
	[1] = {--NewPrivateChatMessage
		[1] = 'int32':playerId	[私聊的玩家]
	}
--]]
s2c.NEW_PRIVATE_CHAT_MESSAGE = 0x1b06

--[[
	[1] = {--XieKeExchangeEquip
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.XIE_KE_EXCHANGE_EQUIP = 0x6500

--[[
	[1] = {--UpdateIconNotify
		[1] = 'repeated int32':newIcon	[更新的新头像]
	}
--]]
s2c.UPDATE_ICON_NOTIFY = 0x0e93

--[[
	[1] = {--WulinRewardBocx
		[1] = 'int32':status	[是否领取,0:已经领取;1:未领取]
	}
--]]
s2c.WULIN_REWARD_BOCX = 0x7807

--[[
	[1] = {--CreateGuildMsg
		[1] = {--GuildInfo
			[1] = 'int32':guildId	[公会编号]
			[2] = 'int32':exp	[经验]
			[3] = 'string':name	[名称]
			[4] = 'int32':memberCount	[成员数量]
			[5] = 'string':presidentName	[会长名称]
			[6] = 'int32':power	[总战斗力]
			[7] = 'string':declaration	[宣言]
			[8] = 'int32':level	[等级]
			[9] = 'string':notice	[公告]
			[10] = 'int32':boom	[繁荣度]
			[11] = 'int32':state	[状态 0正常 1正在禅让 2 正在解散 3正在弹劾]
			[12] = 'int32':operateId	[操作人编号]
			[13] = 'int64':operateTime	[操作结束时间]
			[14] = 'bool':apply
			[15] = 'string':bannerId	[帮派旗帜]
		},
	}
--]]
s2c.CREATE_GUILD = 0x4401

--[[
	[1] = {--DrawMakePlayerAwardReult
	}
--]]
s2c.DRAW_MAKE_PLAYER_AWARD_REULT = 0x4410

--[[
	[1] = {--GetRecallTaskRewardResult
		[1] = 'repeated int32':taskid	[已领取成就列表]
	}
--]]
s2c.GET_RECALL_TASK_REWARD_RESULT = 0x5301

--[[
	[1] = {--UnableToChallenge
		[1] = 'int32':type	[ 类型 20.杀戮21.复仇22.挑战排行榜]
	}
--]]
s2c.UNABLE_TO_CHALLENGE = 0x5913

--[[
	[1] = {--MHYPassInfoList
		[1] = {--repeated MHYPassInfoMsg
			[1] = 'int32':id	[关卡ID]
			[2] = 'int32':star	[获得的星数1~3.没有通关的不发送]
		},
	}
--]]
s2c.MHYPASS_INFO_LIST = 0x1721

--[[
	[1] = {--TaskListMsg
		[1] = {--repeated TaskInfo
			[1] = 'int32':taskid	[成就id]
			[2] = 'int32':state	[状态 0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[3] = 'int32':currstep	[当前进度]
			[4] = 'int32':totalstep	[总进度]
		},
	}
--]]
s2c.TASK_LIST = 0x2001

--[[
	[1] = {--WulinEnemiesInfo
		[1] = 'int32':level
		[2] = 'int64':hp
		[3] = {--repeated WulinEnemiesRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int64':hurt
			[4] = 'int32':challengeCount
			[5] = 'int64':lastHurt
			[6] = 'int32':replayId
		},
		[4] = 'int64':lastChallengeTime
		[5] = {--WulinEnemiesRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int64':hurt
			[4] = 'int32':challengeCount
			[5] = 'int64':lastHurt
			[6] = 'int32':replayId
		},
		[6] = 'int32':myRank
	}
--]]
s2c.WULIN_ENEMIES_INFO = 0x7801

--[[
	[1] = {--TeamDataReponse
		[1] = {--repeated CopyTeamInfo
			[1] = 'int64':teamId	[ 队伍唯一标识]
			[2] = 'int64':createTime	[ 创建时间]
			[3] = 'int32':chapterId	[ 章节ID]
			[4] = 'int32':leader	[ 队长ID]
			[5] = {--repeated CopyTeamMemberInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家名称]
				[3] = 'int32':power	[ 战斗力]
				[4] = 'int32':useIcon	[ 头像]
				[5] = 'int32':frameId	[ 头像框]
				[6] = 'int32':starHeroRanking	[ 名人堂排名]
				[7] = 'int32':vipLevel	[ VIP等级]
				[8] = 'int32':level	[ 玩家等级]
				[9] = 'int32':ready	[ 准备 0未准备 1准备]
				[10] = 'repeated int32':passCopy	[ 通关关卡]
				[11] = 'int32':hosting	[ 0未托管 1托管]
				[12] = 'int32':battleCopyId	[ 战斗的副本]
				[13] = 'int64':loginTime	[ 登录时间]
				[14] = 'int32':serverId	[服务器ID]
				[15] = 'int32':isAssist	[是否是助战角色]
			},
			[6] = 'int32':minLevel	[ 最小等级]
			[7] = 'int32':maxLevel	[ 最大等级]
			[8] = 'int32':show	[ 0对所有人展示 1仅对帮派成员和好友展示]
			[9] = 'repeated int32':passCopy	[ 通关关卡]
		},
	}
--]]
s2c.TEAM_DATA_REPONSE = 0x5920

--[[
	[1] = {--MercenaryTeamOutlineListMsg
		[1] = {--repeated MercenaryTeamOutlineMsg
			[1] = 'int32':playerId	[发布佣兵信息的玩家ID]
			[2] = 'int32':power	[战力]
			[3] = 'string':playerName	[佣兵主人名字]
			[4] = {--repeated MercenaryRoleOutline
				[1] = 'int64':instanceId	[角色实例id]
				[2] = 'int32':roleId	[角色id]
				[3] = 'int32':level	[等级]
				[4] = 'int32':starLevel	[星级]
				[5] = 'int32':martialLevel	[秘籍重数]
				[6] = 'int32':position	[上阵位置]
				[7] = 'int32':quality	[品质,角色可以升品了]
				[8] = 'int32':forgingQuality	[角色最高炼体品质]
			},
			[5] = 'int32':relation	[关系 二进制 00 表示没关系 01表示好友 10表示帮派 11表示好友和帮派]
			[6] = {--repeated AssistantDetails
				[1] = 'int32':position	[位置]
				[2] = 'int32':roleId	[卡牌类型,职业,如:段誉.乔峰]
				[3] = 'int64':instanceId	[实例ID]
				[4] = 'int32':quality	[品质,角色可以升品了]
			},
		},
	}
--]]
s2c.MERCENARY_TEAM_OUTLINE_LIST = 0x5150

--[[
	[1] = {--BossData
		[1] = {--repeated BossDataInfo
			[1] = 'int32':bossId	[bossId]
			[2] = 'int32':dayOfWeek	[周几开放,0表示任意,其他按照位运算进行设定.1:周日;2:周一;4:周二;8:周三;16:周四;32:周五;64:周六.周一和周二开放为:1+2=3    //周几开放,0表示任意,其他按照位运算进行设定.1:周日;2:周一;4:周二;8:周三;16:周四;32:周五;64:周六.周一和周二开放为:1+2=3]
			[3] = 'string':openTime	[开放时间,如果为NULL或者0表示永久开放]
			[4] = 'string':endTime	[结束时间,如果为NULL或者0表示永久开放.如果open_time为NULL或者0,忽略此字段]
			[5] = 'string':settlementTime	[结算时间]
		},
	}
--]]
s2c.BOSS_DATA = 0x4206

--[[
	[1] = {--WorldBossInfo
		[1] = 'int32':id	[BOSS配置ID类型]
		[2] = 'int64':total	[当日伤害总量]
		[3] = 'int64':best	[当日单次最高伤害]
		[4] = 'int32':todayTimes	[当日已经使用的挑战次数]
		[5] = 'int32':todayPayTimes	[当日已经使用的付费挑战次数]
		[6] = 'int32':totalTimes	[累计使用过的挑战次数]
		[7] = 'int32':totalPayTimes	[累计使用过的付费挑战次数]
		[8] = 'int64':lastUpdate	[最后一次更新信息的系统时间]
		[9] = 'int64':lastReward	[最后一次奖励时间]
	}
--]]
s2c.WORLD_BOSS_INFO = 0x4201

--[[
	[1] = {--ContestInvitationInfoResult
		[1] = {--repeated ContestInvitationInfo
			[1] = 'int32':playerId	[ 队长编号]
			[2] = 'string':name	[ 队长名称]
			[3] = 'int32':vip	[ 队长vip等级]
			[4] = 'int32':level	[ 队长等级]
			[5] = 'int64':teamId	[ 队伍编号]
			[6] = 'string':teamName	[ 队伍名称]
			[7] = 'int64':createTime	[ 私聊消息创建时间]
			[8] = 'int32':icon	[ 头像]
			[9] = 'int32':headPicFrame	[ 头像边框]
			[10] = 'int32':starHeroRanking	[ 名人堂排名]
			[11] = 'int32':quality	[说话角色的主角品质]
			[12] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.CONTEST_INVITATION_INFO_RESULT = 0x6e15

--[[
	[1] = {--WorldBossInfoList
		[1] = {--repeated WorldBossInfo
			[1] = 'int32':id	[BOSS配置ID类型]
			[2] = 'int64':total	[当日伤害总量]
			[3] = 'int64':best	[当日单次最高伤害]
			[4] = 'int32':todayTimes	[当日已经使用的挑战次数]
			[5] = 'int32':todayPayTimes	[当日已经使用的付费挑战次数]
			[6] = 'int32':totalTimes	[累计使用过的挑战次数]
			[7] = 'int32':totalPayTimes	[累计使用过的付费挑战次数]
			[8] = 'int64':lastUpdate	[最后一次更新信息的系统时间]
			[9] = 'int64':lastReward	[最后一次奖励时间]
		},
	}
--]]
s2c.WORLD_BOSS_INFO_LIST = 0x4202

--[[
	[1] = {--CrossChampionsWarInfos
		[1] = {--repeated WarInfo
			[1] = 'int32':round	[轮次]
			[2] = 'int32':index	[索引]
			[3] = 'int32':atkPlayerId	[攻击玩家编号]
			[4] = 'int32':defPlayerId	[防守玩家编号]
			[5] = 'int32':winPlayerId	[胜利的玩家]
			[6] = 'repeated int32':replayId	[ 录像编号]
			[7] = 'string':atkPlayerName	[攻击玩家名]
			[8] = 'string':defPlayerName	[防守玩家名]
			[9] = 'int32':betPlayerId	[押注的玩家编号]
			[10] = 'int32':coin	[押注金额]
			[11] = 'int32':atkPower	[攻击玩家战斗力]
			[12] = 'int32':defPower	[防守玩家战斗力]
			[13] = 'repeated int64':atkFormation
			[14] = 'repeated int64':defFormation
			[15] = 'int32':atkIcon	[攻击玩家头像]
			[16] = 'int32':defIcon	[防守玩家头像]
			[17] = 'int32':atkHeadPicFrame	[攻击玩家头像边框]
			[18] = 'int32':defHeadPicFrame	[防守玩家头像边框]
			[19] = 'string':atkServerName
			[20] = 'string':defServerName
			[21] = 'int32':atkWinRound
			[22] = 'int32':defWinRound
			[23] = 'int32':atkPeakAddition	[论剑峰属性加层 万分比]
			[24] = 'int32':defPeakAddition	[论剑峰属性加层 万分比]
			[25] = 'int32':atkStarHeroRanking	[名人堂排名]
			[26] = 'int32':defStarHeroRanking	[名人堂排名]
		},
	}
--]]
s2c.CROSS_CHAMPIONS_WAR_INFOS = 0x4517

--[[
	[1] = {--SingleMartialUpdate
		[1] = 'int64':roleId	[角色id]
		[2] = {--MartialInfo
			[1] = 'int32':id	[武学id]
			[2] = 'int32':position	[装备位置]
			[3] = 'int32':enchantLevel	[附魔等级]
			[4] = 'int32':enchantProgress	[附魔当前经验进度]
		},
	}
--]]
s2c.SINGLE_MARTIAL_UPDATE = 0x3405

--[[
	[1] = {--WorldBossRank
		[1] = {--repeated WorldBossRankPlayer
			[1] = 'int32':playerId
			[2] = 'string':name
		},
	}
--]]
s2c.WORLD_BOSS_RANK = 0x4204

--[[
	[1] = {--ChallengeTime
		[1] = 'int32':type	[1-推图体力;2-群豪谱体力;3-爬塔体力; 4-技能点;5-摩诃衍1;6-摩诃衍2;7-摩诃衍3    //1-推图体力;2-群豪谱体力;3-爬塔体力; 4-技能点;5-摩诃衍1;6-摩诃衍2;7-摩诃衍3]
		[2] = 'int32':maxValue	[默认每日可挑战次数]
		[3] = 'int32':todayUse	[今日已经挑战次数]
		[4] = 'int32':currentValue	[今日剩余可挑战次数]
		[5] = 'int32':todayBuyTime	[每日已购买次数]
		[6] = 'int32':cooldownRemain	[下次恢复体力剩余时间]
		[7] = 'int32':waitTimeRemain	[剩余等待时间]
		[8] = 'int32':todayResetWait	[今日重置等待时间次数]
	}
--]]
s2c.CHALLENGE_TIME = 0x2101

--[[
	[1] = {--GoldEggResult
		[1] = 'int32':type	[1银蛋2金蛋3彩蛋]
		[2] = {--repeated GoldEggReward
			[1] = 'int32':resType	[资源类型]
			[2] = 'int32':resId	[资源ID]
			[3] = 'int32':number	[资源个数]
			[4] = 'int32':isSpecial	[是否特殊奖]
		},
		[3] = 'int32':score	[玩家当前积分]
		[4] = 'int32':count	[彩蛋剩余抽取次数]
	}
--]]
s2c.GOLD_EGG_RESULT = 0x4702

--[[
	[1] = {--CrossWorldBossRank
		[1] = {--repeated CrossWorldBossRankInfo
			[1] = 'int32':serverId
			[2] = 'int32':playerId
			[3] = 'string':name
			[4] = 'int32':dieCount
			[5] = 'int32':useCoin
		},
	}
--]]
s2c.CROSS_WORLD_BOSS_RANK = 0x4205

--[[
	[1] = {--WoodManExtraReward
		[1] = 'int32':success	[1yes 2no]
		[2] = 'int32':boxIndex	[开启到哪个宝箱]
		[3] = 'int32':round	[当前宝箱轮次]
	}
--]]
s2c.WOOD_MAN_EXTRA_REWARD = 0x6310

--[[
	[1] = {--FreshWoodManRankResult
		[1] = {--WoodManRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
		[2] = {--repeated WoodManRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
	}
--]]
s2c.FRESH_WOOD_MAN_RANK_RESULT = 0x6311

--[[
	[1] = {--NewFriend
		[1] = {--Friend
			[1] = {--FriendInfo
				[1] = 'int32':playerId	[玩家编号]
				[2] = 'string':name	[玩家名称]
				[3] = 'int32':vip	[vip等级]
				[4] = 'int32':power	[战斗力]
				[5] = 'int64':lastLoginTime	[最后登录时间]
				[6] = 'int32':profession	[职业]
				[7] = 'int32':level	[等级]
				[8] = 'bool':online
				[9] = 'int32':guildId
				[10] = 'string':guildName
				[11] = 'int32':minePower	[护矿战斗力]
				[12] = 'int32':icon	[头像]
				[13] = 'int32':headPicFrame	[头像边框]
				[14] = 'int32':starHeroRanking	[名人堂排名]
				[15] = 'int32':ladderGrade	[天梯赛段位]
			},
			[2] = 'bool':give	[是否有赠送礼物]
			[3] = 'bool':assistantGive	[是否有助战礼物]
		},
	}
--]]
s2c.NEW_FRIEND = 0x4309

--[[
	[1] = {--WoodManResult
		[1] = 'int32':juli	[玩家本次前进的距离]
		[2] = 'int32':boxNum	[撞了多少宝箱]
		[3] = {--repeated WoodManRewardConfig
			[1] = 'int32':resType	[奖励资源类型]
			[2] = 'int32':resId	[奖励资源ID]
			[3] = 'int32':number	[奖励资源个数]
		},
	}
--]]
s2c.WOOD_MAN_RESULT = 0x6308

--[[
	[1] = {--WoodManHistoryResult
		[1] = 'int32':type	[1个人历史2玩家历史]
		[2] = {--repeated WoodManHistory
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家名]
			[3] = {--repeated WoodManRewardConfig
				[1] = 'int32':resType	[奖励资源类型]
				[2] = 'int32':resId	[奖励资源ID]
				[3] = 'int32':number	[奖励资源个数]
			},
			[4] = 'int64':createTime	[记录时间]
		},
	}
--]]
s2c.WOOD_MAN_HISTORY_RESULT = 0x6309

--[[
	[1] = {--WoodManRewardConfigResult
		[1] = 'string':consumeSycee	[消耗元宝数量 10|100|300]
		[2] = 'string':consumeGoods	[代替元宝的消耗道具id xxx|xxx|xxx]
		[3] = 'string':boxCount	[距离可以循环领取的宝箱   5|20|50|100|200]
		[4] = {--repeated WoodManRewardConfig
			[1] = 'int32':resType	[奖励资源类型]
			[2] = 'int32':resId	[奖励资源ID]
			[3] = 'int32':number	[奖励资源个数]
		},
		[5] = {--repeated WoodManBoxRewardConfig
			[1] = 'int32':count	[对应距离]
			[2] = {--repeated WoodManRewardConfig
				[1] = 'int32':resType	[奖励资源类型]
				[2] = 'int32':resId	[奖励资源ID]
				[3] = 'int32':number	[奖励资源个数]
			},
		},
		[6] = {--repeated WoodManSpecialRewardConfig
			[1] = 'int32':length	[特殊宝箱位置距离]
			[2] = 'int32':index	[奖励标识id  用于玩家选择同一距离的奖励]
			[3] = {--repeated WoodManRewardConfig
				[1] = 'int32':resType	[奖励资源类型]
				[2] = 'int32':resId	[奖励资源ID]
				[3] = 'int32':number	[奖励资源个数]
			},
		},
	}
--]]
s2c.WOOD_MAN_REWARD_CONFIG_RESULT = 0x6306

--[[
	[1] = {--RoleSpellEnableNotify
		[1] = 'int64':userId	[开放技能的角色实例ID]
		[2] = {--repeated SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
		[3] = {--repeated SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
	}
--]]
s2c.ROLE_SPELL_ENABLE_NOTIFY = 0x0e0e

--[[
	[1] = {--GangMemberListMsg
		[1] = {--repeated MemberItem
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家昵称]
			[3] = 'int32':playerLevel	[玩家等级]
			[4] = 'int32':generalId	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[5] = 'int32':fightPower	[战力]
			[6] = 'int32':allContribution	[总贡献值]
			[7] = 'int32':todayContribution	[今日贡献值]
			[8] = 'int32':role	[职位 0:帮主  1:副帮主 2:屌丝]
			[9] = 'bool':isOnline	[是否在线]
		},
	}
--]]
s2c.GANG_MEMBER_LIST = 0x1803

--[[
	[1] = {--SendRankingList
		[1] = {--repeated CrossWindCloudRecordRankInfo
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家名字]
			[3] = 'string':serverName	[服务器名字]
			[4] = 'string':guildName	[帮派名字]
			[5] = 'int32':achievement	[玩家成绩]
			[6] = 'string':formation	[玩家阵容]
			[7] = 'int64':challengeTime	[挑战时间]
			[8] = 'int32':ranking	[排名]
			[9] = 'int32':replayId	[录像id]
			[10] = 'int32':useIcon	[玩家头像]
			[11] = 'int32':level	[玩家等级]
			[12] = 'int32':joinRanks	[参加排行榜的数量]
		},
		[2] = {--MyWindCloudRecordInfo
			[1] = 'int32':rankType	[排行榜类型	1:普攻排行榜   2:技能排行榜   3:神技排行榜]
			[2] = 'int32':myRanking	[我的排名]
			[3] = 'int32':myAchievement	[我的成绩]
			[4] = 'int64':challengeTime	[挑战时间]
		},
		[3] = {--LastBestInfo
			[1] = 'int32':serverId	[服务器ID]
			[2] = 'string':serverName	[服务器名字]
			[3] = 'string':playerName	[玩家名字]
			[4] = 'string':guildName	[帮派名字]
			[5] = 'string':formation	[阵容信息]
			[6] = 'int64':startTime	[开始时间]
			[7] = 'int64':endTime	[结束时间]
			[8] = 'int64':updateTime	[上届信息更新时间]
			[9] = 'int32':groupId	[跨服分组ID]
			[10] = 'string':stage	[boss信息]
			[11] = 'int32':playerId	[玩家ID]
			[12] = 'repeated int32':templateId	[npcId]
		},
		[4] = {--repeated CrossWindCloudRecordRankInfo
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家名字]
			[3] = 'string':serverName	[服务器名字]
			[4] = 'string':guildName	[帮派名字]
			[5] = 'int32':achievement	[玩家成绩]
			[6] = 'string':formation	[玩家阵容]
			[7] = 'int64':challengeTime	[挑战时间]
			[8] = 'int32':ranking	[排名]
			[9] = 'int32':replayId	[录像id]
			[10] = 'int32':useIcon	[玩家头像]
			[11] = 'int32':level	[玩家等级]
			[12] = 'int32':joinRanks	[参加排行榜的数量]
		},
	}
--]]
s2c.SEND_RANKING_LIST = 0x2d09

--[[
	[1] = {--MultipleOutputListNotify
		[1] = {--repeated MultipleOutputNotify
			[1] = 'int32':type	[倍数的类型  1 = 经验,2 = 道具]
			[2] = 'int32':multiple	[倍数值(/100)不支持小数    //倍数值(/100)不支持小数]
			[3] = 'int64':endTime	[结束时间]
		},
	}
--]]
s2c.MULTIPLE_OUTPUT_LIST_NOTIFY = 0x0e32

--[[
	[1] = {--AllMartialList
		[1] = {--repeated RoleMartialList
			[1] = 'int64':roleId	[角色id]
			[2] = 'int32':martialLevel	[角色武学等级]
			[3] = {--repeated MartialInfo
				[1] = 'int32':id	[武学id]
				[2] = 'int32':position	[装备位置]
				[3] = 'int32':enchantLevel	[附魔等级]
				[4] = 'int32':enchantProgress	[附魔当前经验进度]
			},
		},
	}
--]]
s2c.ALL_MARTIAL_LIST = 0x3406

--[[
	[1] = {--WindRecordWarsideConfigResult
		[1] = 'int32':rankType	[副本类型]
		[2] = 'string':formation	[阵容信息]
	}
--]]
s2c.WIND_RECORD_WARSIDE_CONFIG_RESULT = 0x2d06

--[[
	[1] = {--RemovePartner
		[1] = 'int64':userId	[角色唯一ID,实例id]
	}
--]]
s2c.REMOVE_PARTNER = 0x0e61

--[[
	[1] = {--BeforeSendGuildActiveRedPacket
		[1] = 'int32':type	[发送活跃红包类型]
	}
--]]
s2c.BEFORE_SEND_GUILD_ACTIVE_RED_PACKET = 0x4447

--[[
	[1] = {--UpdateState
		[1] = 'int32':startOrClose	[0是关,1是开]
	}
--]]
s2c.UPDATE_STATE = 0x2d11

--[[
	[1] = {--ItemSellResult
		[1] = 'int32':result	[是否成功]
	}
--]]
s2c.ITEM_SELL_RESULT = 0x1017

--[[
	[1] = {--PeakRevengeReponse
		[1] = {--PeakInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'int32':serverId	[ 服务器ID]
			[3] = 'string':name	[ 玩家名字]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':power	[ 战斗力]
			[6] = 'int32':pos	[ 位置]
			[7] = 'int32':layer	[ 层数]
			[8] = 'int32':useIcon	[ 正在使用的头像]
			[9] = 'int32':headPicFrame	[ 正在使用的头像框]
			[10] = 'string':guildName	[ 帮派名称]
			[11] = 'int32':starHeroRanking	[名人堂排名]
		},
	}
--]]
s2c.PEAK_REVENGE_REPONSE = 0x7105

--[[
	[1] = {--GuildBattleLastWinerInfo
		[1] = 'int32':maxGuildLevel
		[2] = 'int32':guildSize
		[3] = 'int64':openTime
		[4] = 'int32':guildId
		[5] = 'string':guildName
		[6] = 'string':bannerId
		[7] = 'repeated int32':professions
		[8] = 'int32':myRank
		[9] = 'string':names
		[10] = 'int32':starHeroRanking
	}
--]]
s2c.GUILD_BATTLE_LAST_WINER_INFO = 0x5707

--[[
	[1] = {--BuyCount
	}
--]]
s2c.BUY_COUNT = 0x2d08

--[[
	[1] = {--DanFangRedPoint
		[1] = 'int32':state	[0显示红点,1不显示]
	}
--]]
s2c.DAN_FANG_RED_POINT = 0x5e06

--[[
	[1] = {--GangExpelMemberResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_EXPEL_MEMBER_RESULT = 0x1807

--[[
	[1] = {--RequestChallengeCopy
		[1] = 'int32':startOrClose	[0是不能进去,1是可以进去]
	}
--]]
s2c.REQUEST_CHALLENGE_COPY = 0x2d12

--[[
	[1] = {--RoleFateListResult
		[1] = {--repeated RoleFateInfo
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':roleFateId	[角色缘分id]
			[3] = 'int64':endTime	[使用结束时间]
			[4] = 'bool':forever	[是否永久有效]
		},
	}
--]]
s2c.ROLE_FATE_LIST_RESULT = 0x5600

--[[
	[1] = {--GetHeroDuelLastResponse
		[1] = {--LastGuildChampion
			[1] = 'string':serverName	[服务器名称]
			[2] = 'string':guildName	[公会名称]
			[3] = 'string':bannerId	[帮派旗帜]
		},
		[2] = {--LastPersonalChampion
			[1] = 'string':serverName	[服务器名称]
			[2] = 'string':name	[玩家名称]
			[3] = {--repeated HeroDuelChampionRole
				[1] = 'int32':index	[位置]
				[2] = 'int32':roleId	[角色id]
				[3] = 'repeated int32':suitNum	[套装属性]
			},
		},
		[3] = {--LastCurrentChampion
			[1] = 'string':name	[玩家名称]
			[2] = 'int32':useIcon	[玩家头像]
			[3] = 'int32':rank	[玩家排名]
			[4] = 'int32':power	[玩家战力]
		},
		[4] = 'bool':open	[是否开启]
		[5] = 'int32':number	[赛季编号(0未开始,1第一个赛季,2第二个赛季)    //赛季编号(0未开始,1第一个赛季,2第二个赛季)]
	}
--]]
s2c.GET_HERO_DUEL_LAST_RESPONSE = 0x6f01

--[[
	[1] = {--OpenWindCloudRecord
		[1] = {--repeated BestRankInfo
			[1] = 'int32':rankType	[副本类型]
			[2] = 'string':bestFormation	[各排行榜最佳阵容信息]
		},
		[2] = {--repeated MyWindCloudRecordInfo
			[1] = 'int32':rankType	[排行榜类型	1:普攻排行榜   2:技能排行榜   3:神技排行榜]
			[2] = 'int32':myRanking	[我的排名]
			[3] = 'int32':myAchievement	[我的成绩]
			[4] = 'int64':challengeTime	[挑战时间]
		},
		[3] = 'int32':copyId	[今日开启的副本ID]
		[4] = 'int32':refreshCount	[剩余刷新挑战次数]
		[5] = 'string':formation	[阵容信息]
		[6] = 'repeated int32':npcList	[NPC英雄池]
		[7] = 'int32':challengeCount	[剩余挑战次数]
		[8] = {--repeated TopTen
			[1] = 'int32':rankType	[排行榜类型]
			[2] = {--repeated CrossWindCloudRecordRankInfo
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':playerName	[玩家名字]
				[3] = 'string':serverName	[服务器名字]
				[4] = 'string':guildName	[帮派名字]
				[5] = 'int32':achievement	[玩家成绩]
				[6] = 'string':formation	[玩家阵容]
				[7] = 'int64':challengeTime	[挑战时间]
				[8] = 'int32':ranking	[排名]
				[9] = 'int32':replayId	[录像id]
				[10] = 'int32':useIcon	[玩家头像]
				[11] = 'int32':level	[玩家等级]
				[12] = 'int32':joinRanks	[参加排行榜的数量]
			},
		},
		[9] = 'string':isPass	[是否通过3个关卡   1是通过,0是未通过]
		[10] = 'string':stage	[boss信息]
	}
--]]
s2c.OPEN_WIND_CLOUD_RECORD = 0x2d00

--[[
	[1] = {--GainLastBestInfo
		[1] = {--LastBestInfo
			[1] = 'int32':serverId	[服务器ID]
			[2] = 'string':serverName	[服务器名字]
			[3] = 'string':playerName	[玩家名字]
			[4] = 'string':guildName	[帮派名字]
			[5] = 'string':formation	[阵容信息]
			[6] = 'int64':startTime	[开始时间]
			[7] = 'int64':endTime	[结束时间]
			[8] = 'int64':updateTime	[上届信息更新时间]
			[9] = 'int32':groupId	[跨服分组ID]
			[10] = 'string':stage	[boss信息]
			[11] = 'int32':playerId	[玩家ID]
			[12] = 'repeated int32':templateId	[npcId]
		},
		[2] = 'int64':startTime	[活动开启时间]
	}
--]]
s2c.GAIN_LAST_BEST_INFO = 0x2d01

--[[
	[1] = {--ArenaRandListMsg
		[1] = 'int32':pageNumber	[总页数]
		[2] = 'int32':currentPage	[当前页索引]
		[3] = {--repeated ArenaPlayerItem
			[1] = 'int32':rank	[排行]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'string':playerName	[玩家昵称]
			[4] = 'int32':playerLevel	[玩家等级]
			[5] = 'int32':generalId	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[6] = 'int32':fightPower	[战力]
			[7] = 'int32':challengeTotalCount	[总挑战次数]
			[8] = 'int32':challengeWinCount	[胜利次数]
			[9] = 'int32':vipLevel	[VIP等级]
			[10] = 'int32':prevRank	[昨日排名]
			[11] = 'int32':bestRank	[最佳排名]
			[12] = 'int32':totalScore	[一共获得多少群豪谱积分]
			[13] = 'int32':activeChallenge	[主动挑战次数]
			[14] = 'int32':activeWin	[主动挑战胜利次数]
			[15] = 'int32':continuityWin	[当前连胜次数]
			[16] = 'int32':maxContinuityWin	[最大连胜次数]
			[17] = 'repeated int64':formation	[阵容]
		},
	}
--]]
s2c.ARENA_RAND_LIST = 0x1301

--[[
	[1] = {--SingleBibleGemReponse
		[1] = {--BibleAllGemInfo
			[1] = 'int64':bibleId	[镶嵌的天书id]
			[2] = {--repeated BibleGemInfo
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':itemId	[ 宝石ID]
			},
		},
		[2] = 'int32':star	[ 天书星级]
	}
--]]
s2c.SINGLE_BIBLE_GEM_REPONSE = 0x6018

--[[
	[1] = {--ReponseVipShop
		[1] = {--repeated VipShopDetils
			[1] = 'int32':goodId
			[2] = 'int32':number	[已购买次数]
			[3] = 'int32':discount	[折扣]
		},
		[2] = 'int32':vipScore	[我的贵宾积分]
	}
--]]
s2c.REPONSE_VIP_SHOP = 0x4a01

--[[
	[1] = {--MartialLevelUpNotify
		[1] = 'int64':roleId	[角色id]
		[2] = 'int32':martialLevel	[武学等级]
	}
--]]
s2c.MARTIAL_LEVEL_UP_NOTIFY = 0x3403

--[[
	[1] = {--VipRuleInfoResponse
		[1] = 'repeated int32':type	[ 类型]
		[2] = 'repeated int32':useCount	[ 使用用过的次数]
	}
--]]
s2c.VIP_RULE_INFO_RESPONSE = 0x7300

--[[
	[1] = {--RobMineSuccessMsg
	}
--]]
s2c.ROB_MINE_SUCCESS = 0x5012

--[[
	[1] = {--WarMatixConfResult
		[1] = 'int32':fromPos	[起始位置.上阵则为0]
		[2] = 'int32':toPos	[目标位置.下阵则为0]
		[3] = 'int64':userId	[角色gameId]
	}
--]]
s2c.WAR_MATIX_CONF_RESULT = 0x0e20

--[[
	[1] = {--LeadingRoleSpellList
		[1] = {--repeated LeadingRoleSpell
			[1] = {--SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[2] = 'bool':choice	[是否选中]
			[3] = 'int32':sid	[法术的种类ID,一种法术有多个等级,但是统一法术SID一致]
		},
	}
--]]
s2c.LEADING_ROLE_SPELL_LIST = 0x0e0d

--[[
	[1] = {--GetBookResultMsg
		[1] = 'int32':bookpos	[ pos为0拾取所有]
	}
--]]
s2c.GET_BOOK_RESULT = 0x1602

--[[
	[1] = {--LevelInfo
		[1] = 'int64':userId	[角色唯一ID,实例id]
		[2] = 'int32':templateId	[卡牌id]
		[3] = 'int32':currentLevel	[当前等级]
		[4] = 'int32':currentExp	[当前经验]
	}
--]]
s2c.LEVEL_INFO = 0x0e50

--[[
	[1] = {--RecommendFriend
		[1] = {--FriendInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':power	[战斗力]
			[5] = 'int64':lastLoginTime	[最后登录时间]
			[6] = 'int32':profession	[职业]
			[7] = 'int32':level	[等级]
			[8] = 'bool':online
			[9] = 'int32':guildId
			[10] = 'string':guildName
			[11] = 'int32':minePower	[护矿战斗力]
			[12] = 'int32':icon	[头像]
			[13] = 'int32':headPicFrame	[头像边框]
			[14] = 'int32':starHeroRanking	[名人堂排名]
			[15] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'bool':apply	[是否申请过]
	}
--]]
s2c.RECOMMEND_FRIEND = 0x430d

--[[
	[1] = {--UpdateGuildNameResult
		[1] = 'string':name
	}
--]]
s2c.UPDATE_GUILD_NAME_RESULT = 0x4428

--[[
	[1] = {--HeartMethodGemInfo
		[1] = 'int32':pos	[ 位置]
		[2] = 'int32':itemId	[ 宝石ID]
	}
--]]
s2c.HEART_METHOD_GEM_INFO = 0x7b11

--[[
	[1] = {--GagPlayerMsg
		[1] = 'int32':playerId	[被禁言玩家ID]
		[2] = 'string':name	[玩家名称]
		[3] = 'int64':time	[禁言时长,单位/秒]
	}
--]]
s2c.GAG_PLAYER = 0x1d31

--[[
	[1] = {--XiaKeForging
		[1] = {--repeated ForgingTheBody
			[1] = 'int64':roleId	[角色实例id]
			[2] = {--repeated ForgingData
				[1] = 'int32':acupoint	[穴位]
				[2] = 'int32':level	[等级]
			},
		},
	}
--]]
s2c.XIA_KE_FORGING = 0x6600

--[[
	[1] = {--RechargeTicketChangeResponse
		[1] = 'int32':type	[类型(1:添加 2:删除)    //类型(1:添加 2:删除)]
		[2] = {--repeated RechargeTicketInfo
			[1] = 'int64':instanceId	[物品实例id]
			[2] = 'int32':templateId	[物品模版id]
			[3] = 'int32':createTime	[创建时间]
			[4] = 'int32':endTime	[结束时间]
		},
	}
--]]
s2c.RECHARGE_TICKET_CHANGE_RESPONSE = 0x7702

--[[
	[1] = {--SelectSpellResult
		[1] = {--SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
		[2] = {--SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
	}
--]]
s2c.SELECT_SPELL_RESULT = 0x0e0c

--[[
	[1] = {--SingleRedPacketReponse
		[1] = {--RedPacketInfo
			[1] = 'int64':id	[ 红包唯一ID]
			[2] = 'int32':guildId	[ 帮派ID]
			[3] = {--PlayerShowInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家昵称]
				[3] = 'int32':icon	[ 玩家头像]
				[4] = 'int32':frame	[ 玩家头像框]
				[5] = 'int32':level	[ 玩家等级]
				[6] = 'int32':sycee	[ 玩家领取的元宝数量]
				[7] = 'int32':vipLevel	[ 玩家VIP等级]
				[8] = 'string':guildName	[ 帮派名称]
				[9] = 'int32':ranking	[ 排名]
				[10] = 'int32':competence	[ 公会职位 1会长 2副会长 3成员]
				[11] = 'int32':starHeroRanking	[名人堂排名]
				[12] = 'int32':ladderGrade	[天梯赛段位]
			},
			[4] = 'int32':redPacketId	[ 红包ID]
			[5] = 'int32':totalSycee	[ 红包总共的元宝数量]
			[6] = 'int32':surplusSycee	[ 红包的剩余元宝数量]
			[7] = 'int64':startTime	[ 红包的发放时间]
			[8] = 'int32':personNum	[ 红包可领取的人员数量]
			[9] = 'string':desc	[ 红包的发放描述]
			[10] = {--repeated PlayerShowInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家昵称]
				[3] = 'int32':icon	[ 玩家头像]
				[4] = 'int32':frame	[ 玩家头像框]
				[5] = 'int32':level	[ 玩家等级]
				[6] = 'int32':sycee	[ 玩家领取的元宝数量]
				[7] = 'int32':vipLevel	[ 玩家VIP等级]
				[8] = 'string':guildName	[ 帮派名称]
				[9] = 'int32':ranking	[ 排名]
				[10] = 'int32':competence	[ 公会职位 1会长 2副会长 3成员]
				[11] = 'int32':starHeroRanking	[名人堂排名]
				[12] = 'int32':ladderGrade	[天梯赛段位]
			},
			[11] = 'int32':type	[区分红包类型:0是普通红包,1是帮派活跃红包]
		},
	}
--]]
s2c.SINGLE_RED_PACKET_REPONSE = 0x6b06

--[[
	[1] = {--NotifyTaskStep
		[1] = 'int32':taskid	[成就id]
		[2] = 'int32':currstep	[当前进度]
	}
--]]
s2c.NOTIFY_TASK_STEP = 0x2005

--[[
	[1] = {--UpdatePlayerNameResult
		[1] = 'string':name
	}
--]]
s2c.UPDATE_PLAYER_NAME_RESULT = 0x0e11

--[[
	[1] = {--OtherPlayerDetails
		[1] = 'int32':playerId	[玩家id]
		[2] = 'int32':profession	[职业]
		[3] = 'string':name	[昵称]
		[4] = 'int32':level	[等级]
		[5] = 'int32':vipLevel	[vip等级]
		[6] = 'int32':power	[战力]
		[7] = {--repeated RoleDetails
			[1] = 'int32':id	[ 卡牌的id]
			[2] = 'int32':level	[ 等级]
			[3] = 'int64':curexp	[ 当前经验]
			[4] = 'int32':power	[战力]
			[5] = 'string':attributes	[属性字符串]
			[6] = 'int32':warIndex	[战阵位置信息]
			[7] = {--repeated SimpleRoleEquipment
				[1] = 'int32':id	[ id]
				[2] = 'int32':level	[ level]
				[3] = 'int32':quality	[品质]
				[4] = 'int32':refineLevel	[精炼等级]
				[5] = {--repeated GemPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[ id]
				},
				[6] = {--repeated Recast
					[1] = 'int32':quality
					[2] = 'int32':ratio
					[3] = 'int32':index
				},
				[7] = 'int32':stepExp
				[8] = 'int32':stepLevel
				[9] = 'int32':throughLevel
			},
			[8] = {--repeated SimpleBook
				[1] = 'int32':templateId	[ 秘籍模板ID]
				[2] = 'int32':level	[ 等级]
				[3] = 'int32':attribute	[属性值]
			},
			[9] = {--repeated SimpleMeridians
				[1] = 'int32':index	[ 经脉位置,1~N]
				[2] = 'int32':level	[ 等级]
				[3] = 'int32':attribute	[属性值]
			},
			[10] = 'int32':starlevel	[ 星级]
			[11] = 'repeated int32':fateIds	[ 拥有缘分]
			[12] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[13] = 'int32':quality	[品质]
			[14] = 'int32':martialLevel	[武学等级]
			[15] = {--repeated OtherMartialInfo
				[1] = 'int32':id	[武学id]
				[2] = 'int32':position	[装备位置]
				[3] = 'int32':enchantLevel	[附魔等级]
			},
			[16] = 'string':immune	[免疫概率]
			[17] = 'string':effectActive	[效果影响主动]
			[18] = 'string':effectPassive	[效果影响被动]
			[19] = {--repeated BibleInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':id	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':level	[重级]
				[5] = 'int32':breachLevel	[突破]
				[6] = {--repeated EssentialPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[精要模板id]
				},
				[7] = 'repeated int32':gemId	[ 天书宝石]
				[8] = {--BibleComprehendInfo
					[1] = 'int64':bibleId	[天书id]
					[2] = 'int32':stageId	[阶段id]
					[3] = 'int32':useCount	[参悟丹使用次数]
					[4] = 'int32':reachId	[达成的id]
					[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
					[6] = {--repeated BibleStageInfo
						[1] = 'int32':stage	[阶段id]
						[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
						[3] = 'repeated int32':attIndex	[属性下标]
						[4] = 'repeated int32':value	[属性值]
					},
				},
			},
			[20] = 'int32':forgingQuality	[角色最高炼体品质]
			[21] = 'int32':skillStarLevel
			[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
			[23] = {--repeated BiblePracticeData
				[1] = 'int32':position	[ 位置]
				[2] = 'int32':level	[ 等级]
			},
			[24] = 'bool':equipHide	[是否隐藏装备信息]
			[25] = {--repeated HeartMethodEquipInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':itemId	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':practiceId	[x]
				[5] = 'int32':breachId	[突破]
				[6] = {--repeated HeartMethodGem
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':itemId	[ 宝石ID]
				},
				[7] = {--repeated HeartMethodConcise
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 凝练等级]
				},
				[8] = {--repeated HeartMethodRecast
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 重铸等级]
				},
			},
		},
		[8] = {--repeated LeadingRoleSpell
			[1] = {--SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[2] = 'bool':choice	[是否选中]
			[3] = 'int32':sid	[法术的种类ID,一种法术有多个等级,但是统一法术SID一致]
		},
		[9] = 'int32':icon	[头像]
		[10] = 'int32':headPicFrame	[正在使用的头像框]
		[11] = 'int32':starHeroRanking	[名人堂排名]
		[12] = 'int32':ladderGrade	[天梯赛段位]
	}
--]]
s2c.OTHER_PLAYER_DETAILS = 0x0e71

--[[
	[1] = {--ChangeIconNotify
		[1] = 'int32':result	[更换头像结果通知,0为失败,其他为返回更换的头像ID]
	}
--]]
s2c.CHANGE_ICON_NOTIFY = 0x0e91

--[[
	[1] = {--ChampionsRank
		[1] = {--repeated ChampionsRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':score
		},
		[2] = 'int32':myRank
	}
--]]
s2c.CHAMPIONS_RANK = 0x4509

--[[
	[1] = {--HerotSoreBuySuccessNotify
		[1] = 'int32':commodityId	[购买商品的id]
		[2] = 'int32':num	[购买商品的个数]
	}
--]]
s2c.HEROT_SORE_BUY_SUCCESS_NOTIFY = 0x1906

--[[
	[1] = {--GuildGiveReceiveResponse
		[1] = 'int32':currentNum	[当前数量]
	}
--]]
s2c.GUILD_GIVE_RECEIVE_RESPONSE = 0x4c03

--[[
	[1] = {--GetCardRoleResultMsg
		[1] = {--repeated LuckDrawElementInfo
			[1] = 'int32':resType	[资源类型]
			[2] = 'int32':resId	[资源ID]
			[3] = 'int32':number	[资源个数]
		},
		[2] = {--GetRoleStateMsg
			[1] = 'int32':cardType	[ 1 最高得乙, 2 最高得甲 3 连抽十次]
			[2] = 'bool':firstGet	[ 是否首刷]
			[3] = 'int32':freeTimes	[ 可用免费次数]
			[4] = 'int32':cdTime	[ 剩余CD时间 单位秒]
			[5] = 'int32':todayTimes	[ 今日已用次数]
			[6] = 'int32':totalCount	[ 总招募次数]
		},
	}
--]]
s2c.GET_CARD_ROLE_RESULT = 0x1c01

--[[
	[1] = {--BibleComprehendReplaceReponse
		[1] = {--BibleComprehendInfo
			[1] = 'int64':bibleId	[天书id]
			[2] = 'int32':stageId	[阶段id]
			[3] = 'int32':useCount	[参悟丹使用次数]
			[4] = 'int32':reachId	[达成的id]
			[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
			[6] = {--repeated BibleStageInfo
				[1] = 'int32':stage	[阶段id]
				[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
				[3] = 'repeated int32':attIndex	[属性下标]
				[4] = 'repeated int32':value	[属性值]
			},
		},
	}
--]]
s2c.BIBLE_COMPREHEND_REPLACE_REPONSE = 0x6022

--[[
	[1] = {--CrossGuildBattleReplayInfos
		[1] = {--repeated CrossGuildBattleTeamInfo
			[1] = 'int32':eliteId	[精英编号]
			[2] = {--repeated CrossGuildMemberInfo
				[1] = 'string':name
				[2] = 'int32':useIcon
				[3] = 'int32':power
				[4] = 'int32':headPicFrame
				[5] = 'int32':playerId
				[6] = 'int32':starHeroRanking
				[7] = 'int32':ladderGrade	[天梯赛段位]
			},
			[3] = 'int32':id
		},
		[2] = {--repeated CrossGuildBattleReplayInfo
			[1] = 'int32':index
			[2] = 'int32':team
			[3] = 'int32':atkPlayerId
			[4] = 'int32':defPlayerId
			[5] = 'int32':winPlayerId
			[6] = 'int32':replayId
		},
		[3] = 'int32':warId
	}
--]]
s2c.CROSS_GUILD_BATTLE_REPLAY_INFOS = 0x4436

--[[
	[1] = {--GetEquipNotify
		[1] = 'string':playerName	[玩家名字]
		[2] = 'int32':equipId	[获得装备id]
		[3] = 'int32':number	[数量]
		[4] = 'int32':operationType	[通过什么渠道获得]
	}
--]]
s2c.GET_EQUIP_NOTIFY = 0x1d01

--[[
	[1] = {--HaveIconNotify
		[1] = 'repeated int32':icon	[拥有的头像数组]
	}
--]]
s2c.HAVE_ICON_NOTIFY = 0x0e92

--[[
	[1] = {--ObtainPartner
		[1] = {--RoleInfo
			[1] = 'int64':userid	[ 唯一id]
			[2] = 'int32':id	[ 卡牌的id]
			[3] = 'int32':level	[ 等级]
			[4] = 'int64':curexp	[ 当前经验]
			[5] = 'int32':quality	[品质]
			[6] = 'int32':starlevel	[星级]
			[7] = 'int32':starExp	[星级经验]
			[8] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[9] = {--repeated EquipmentInfo
				[1] = 'int64':userid	[userid  唯一id]
				[2] = 'int32':id	[id]
				[3] = 'int32':level	[level]
				[4] = 'int32':quality	[品质]
				[5] = 'string':base_attr	[基本属性]
				[6] = 'string':extra_attr	[附加属性]
				[7] = 'int32':grow	[成长值]
				[8] = 'int32':holeNum	[宝石孔数]
				[9] = {--repeated GemPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[ id]
				},
				[10] = 'int32':star	[星级]
				[11] = 'int32':starFailFix	[升星失败率修正值]
				[12] = 'int32':refineLevel	[精炼等级]
				[13] = {--repeated Recast
					[1] = 'int32':quality
					[2] = 'int32':ratio
					[3] = 'int32':index
				},
				[14] = 'int32':stepExp
				[15] = 'int32':stepLevel
				[16] = 'int32':throughLevel
			},
			[10] = {--repeated BibleInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':id	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':level	[重级]
				[5] = 'int32':breachLevel	[突破]
				[6] = {--repeated EssentialPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[精要模板id]
				},
				[7] = 'repeated int32':gemId	[ 天书宝石]
				[8] = {--BibleComprehendInfo
					[1] = 'int64':bibleId	[天书id]
					[2] = 'int32':stageId	[阶段id]
					[3] = 'int32':useCount	[参悟丹使用次数]
					[4] = 'int32':reachId	[达成的id]
					[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
					[6] = {--repeated BibleStageInfo
						[1] = 'int32':stage	[阶段id]
						[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
						[3] = 'repeated int32':attIndex	[属性下标]
						[4] = 'repeated int32':value	[属性值]
					},
				},
			},
			[11] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[12] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[13] = 'int32':skillStarLevel
			[14] = {--repeated HeartMethodEquipInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':itemId	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':practiceId	[x]
				[5] = 'int32':breachId	[突破]
				[6] = {--repeated HeartMethodGem
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':itemId	[ 宝石ID]
				},
				[7] = {--repeated HeartMethodConcise
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 凝练等级]
				},
				[8] = {--repeated HeartMethodRecast
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 重铸等级]
				},
			},
			[15] = {--repeated DestinyEquipDataInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':templateId	[模板id]
				[3] = 'int64':roleId	[装备的角色id]
				[4] = 'int32':pos	[装备位置]
				[5] = 'int32':level	[等级]
				[6] = 'int32':stepExp	[经验]
				[7] = 'int32':quality	[品质]
				[8] = 'int32':type
				[9] = 'int32':star	[星级]
				[10] = 'int32':starLevel	[等级]
			},
		},
	}
--]]
s2c.OBTAIN_PARTNER = 0x0e60

--[[
	[1] = {--MyInviteCodeInfo
		[1] = 'bool':invited	[自己是否被邀请过(验证过别人的邀请码)    //自己是否被邀请过(验证过别人的邀请码)]
		[2] = 'int32':inviteCount	[主动邀请次数]
		[3] = 'string':getRewardRecord	[已领取第n此奖励(形如:1,2,3,4,5,...表示已领取发送1,2,3,4,5次奖励)    //已领取第n此奖励(形如:1,2,3,4,5,...表示已领取发送1,2,3,4,5次奖励)]
	}
--]]
s2c.MY_INVITE_CODE_INFO = 0x2603

--[[
	[1] = {--PotentialPracticeExchangeResponse
		[1] = {--repeated XiaKePotentialPracticeInfo
			[1] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[2] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
		},
	}
--]]
s2c.POTENTIAL_PRACTICE_EXCHANGE_RESPONSE = 0x6802

--[[
	[1] = {--FriendAssistantInfoList
		[1] = {--repeated FriendAssistantInfo
			[1] = 'int32':friendId
			[2] = 'string':provideRoles
			[3] = 'int32':demandRole
			[4] = 'string':roleUseCount
		},
		[2] = 'string':usePlayers	[使用过的玩家]
		[3] = 'string':assistantPlayers	[助战过的玩家]
		[4] = 'string':roleUseCount	[侠客被使用过多少次 roleId_count_name|]
		[5] = 'string':provideRoles
		[6] = 'int32':demandRole
	}
--]]
s2c.FRIEND_ASSISTANT_INFO_LIST = 0x4312

--[[
	[1] = {--SevenDaysPrompt
		[1] = 'repeated int32':sevenPrompt
	}
--]]
s2c.SEVEN_DAYS_PROMPT = 0x2056

--[[
	[1] = {--RandomStore
		[1] = 'int32':type	[随机商店类型]
		[2] = {--repeated RandomCommodity
			[1] = 'int32':commodityId	[商品的id]
			[2] = 'int32':num	[已购买数量]
			[3] = 'bool':enabled	[此商品是否可以购买]
		},
		[3] = 'int64':nextAutoRefreshTime	[距离下次刷新所剩余的时间,单位/毫秒]
		[4] = 'int32':nextRefreshCost	[下次手动刷新花费元宝]
		[5] = 'int32':manualRefreshCount	[当日手动刷新次数,累计,到了某个特定时间点会重置]
		[6] = 'int64':opentime	[开启时间,单位/毫秒]
	}
--]]
s2c.RANDOM_STORE = 0x1902

--[[
	[1] = {--HeadPicFrameSetResult
		[1] = 'int32':code
	}
--]]
s2c.HEAD_PIC_FRAME_SET_RESULT = 0x0e96

--[[
	[1] = {--ClimbHomeInfo
		[1] = 'int32':curId	[当前关卡]
	}
--]]
s2c.CLIMB_HOME_INFO = 0x1702

--[[
	[1] = {--EscortAgencyStatusResponse
		[1] = 'int32':status	[当前活动状态0:活动关闭状态 1:报名阶段 2:开打阶段]
	}
--]]
s2c.ESCORT_AGENCY_STATUS_RESPONSE = 0x5f09

--[[
	[1] = {--SendGuildActivePoint
		[1] = 'int32':redPoint	[0是没有,1是有]
	}
--]]
s2c.SEND_GUILD_ACTIVE_POINT = 0x4444

--[[
	[1] = {--SacrificeItemCacheList
		[1] = {--repeated SacrificeItemDetails
			[1] = 'int32':index	[索引,1~N]
			[2] = 'int32':resType	[资源类型]
			[3] = 'int32':resId	[资源ID]
			[4] = 'int32':resNum	[资源数量]
			[5] = 'int64':createTime	[创建时间,单位/秒]
			[6] = 'int64':lastUpdate	[最后更新时间,单位/秒]
			[7] = 'int32':level	[天命等级]
			[8] = 'int32':exp	[天命经验]
		},
	}
--]]
s2c.SACRIFICE_ITEM_CACHE_LIST = 0x3e06

--[[
	[1] = {--ReponseCoumseDestiny
		[1] = 'repeated int64':instanceList	[消耗天命列表]
	}
--]]
s2c.REPONSE_COUMSE_DESTINY = 0x3f09

--[[
	[1] = {--FirstOnlinePrompt
		[1] = 'int32':type	[类型  1=vip宣言]
		[2] = 'int32':isPrompt	[是否需要红点提示]
	}
--]]
s2c.FIRST_ONLINE_PROMPT = 0x0e34

--[[
	[1] = {--SimpleRoleEquipment
		[1] = 'int32':id	[ id]
		[2] = 'int32':level	[ level]
		[3] = 'int32':quality	[品质]
		[4] = 'int32':refineLevel	[精炼等级]
		[5] = {--repeated GemPos
			[1] = 'int32':pos	[ pos]
			[2] = 'int32':id	[ id]
		},
		[6] = {--repeated Recast
			[1] = 'int32':quality
			[2] = 'int32':ratio
			[3] = 'int32':index
		},
		[7] = 'int32':stepExp
		[8] = 'int32':stepLevel
		[9] = 'int32':throughLevel
	}
--]]
s2c.SIMPLE_ROLE_EQUIPMENT = 0x0e72

--[[
	[1] = {--WarMatixConf
		[1] = 'int32':capacity	[战阵的人数上限]
		[2] = {--repeated RoleConfigure
			[1] = 'int64':userId
			[2] = 'int32':index
		},
	}
--]]
s2c.WAR_MATIX_CONF = 0x0e28

--[[
	[1] = {--BattlePetGetHoleResponse
		[1] = 'int64':instanceId	[战宠Id]
		[2] = 'string':hole	[驯化信息]
	}
--]]
s2c.BATTLE_PET_GET_HOLE_RESPONSE = 0x4f07

--[[
	[1] = {--ContestTeamRankingResponse
		[1] = {--repeated TeamRankingInfo
			[1] = 'string':name	[ 队伍名称]
			[2] = 'int32':integral	[ 积分]
			[3] = 'int32':ranking	[ 排名]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':serverId	[ 服务器ID]
			[6] = 'int64':id	[ 队伍唯一标识]
		},
		[2] = 'int32':integral	[ 我的积分]
		[3] = 'int32':ranking	[ 我的排行]
		[4] = 'int32':atkWin
		[5] = 'int32':atkLost
		[6] = 'int32':defWin
		[7] = 'int32':defLost
		[8] = 'int32':atkWinStreak
		[9] = 'int32':defWinStreak
		[10] = 'string':atkFormation
		[11] = 'string':defFromation
		[12] = {--repeated TeamBattleLogInfo
			[1] = {--ContestTeamInfo
				[1] = 'int64':id	[ 队伍唯一标识]
				[2] = 'string':name	[ 队伍名称]
				[3] = 'int32':type	[ 0随机匹配 1自定义队伍]
				[4] = 'int32':leader	[ 队长ID]
				[5] = {--repeated TeamMemberInfo
					[1] = 'int32':playerId	[ 玩家ID]
					[2] = 'string':name	[ 玩家名称]
					[3] = 'int32':power	[ 战斗力]
					[4] = 'int32':useIcon	[ 头像]
					[5] = 'int32':frameId	[ 头像框]
					[6] = 'int32':starHeroRanking	[ 名人堂排名]
					[7] = 'int64':loginTime	[ 最近登录时间]
					[8] = 'int32':position	[ 位置 1头阵 2中坚 3后翼]
					[9] = 'int32':vipLevel	[ VIP等级]
					[10] = 'int32':level	[ 玩家等级]
					[11] = 'int32':inspireNum	[ 鼓舞次数]
					[12] = 'int32':inspireSycee	[ 鼓舞元宝花费数]
					[13] = 'int32':ladderGrade	[天梯赛段位]
				},
				[6] = 'int32':serverId	[ 服务器ID]
				[7] = 'string':serverName	[ 服务器名字]
			},
			[2] = {--ContestTeamInfo
				[1] = 'int64':id	[ 队伍唯一标识]
				[2] = 'string':name	[ 队伍名称]
				[3] = 'int32':type	[ 0随机匹配 1自定义队伍]
				[4] = 'int32':leader	[ 队长ID]
				[5] = {--repeated TeamMemberInfo
					[1] = 'int32':playerId	[ 玩家ID]
					[2] = 'string':name	[ 玩家名称]
					[3] = 'int32':power	[ 战斗力]
					[4] = 'int32':useIcon	[ 头像]
					[5] = 'int32':frameId	[ 头像框]
					[6] = 'int32':starHeroRanking	[ 名人堂排名]
					[7] = 'int64':loginTime	[ 最近登录时间]
					[8] = 'int32':position	[ 位置 1头阵 2中坚 3后翼]
					[9] = 'int32':vipLevel	[ VIP等级]
					[10] = 'int32':level	[ 玩家等级]
					[11] = 'int32':inspireNum	[ 鼓舞次数]
					[12] = 'int32':inspireSycee	[ 鼓舞元宝花费数]
					[13] = 'int32':ladderGrade	[天梯赛段位]
				},
				[6] = 'int32':serverId	[ 服务器ID]
				[7] = 'string':serverName	[ 服务器名字]
			},
			[3] = 'repeated int32':result	[ 三场胜负关系 0表示攻击方胜利 1表示防守方胜利]
			[4] = 'repeated int32':replayId	[ 三场战斗的录像ID]
			[5] = 'int64':createTime	[ 录像时间]
		},
		[13] = 'int64':leizhu	[ 上一届擂主队伍ID]
	}
--]]
s2c.CONTEST_TEAM_RANKING_RESPONSE = 0x6e08

--[[
	[1] = {--KnightInfo
		[1] = 'int32':type	[武士类型]
		[2] = 'int32':level	[武士等级]
		[3] = 'int64':timeLeft	[剩余时间]
		[4] = 'int32':leaveTime	[剩餘挑戰次數]
	}
--]]
s2c.KNIGHT_INFO = 0x7a01

--[[
	[1] = {--UpdateRoleDetails
		[1] = 'int64':userid	[ 唯一id]
		[2] = {--repeated RoleDetails
			[1] = 'int32':id	[ 卡牌的id]
			[2] = 'int32':level	[ 等级]
			[3] = 'int64':curexp	[ 当前经验]
			[4] = 'int32':power	[战力]
			[5] = 'string':attributes	[属性字符串]
			[6] = 'int32':warIndex	[战阵位置信息]
			[7] = {--repeated SimpleRoleEquipment
				[1] = 'int32':id	[ id]
				[2] = 'int32':level	[ level]
				[3] = 'int32':quality	[品质]
				[4] = 'int32':refineLevel	[精炼等级]
				[5] = {--repeated GemPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[ id]
				},
				[6] = {--repeated Recast
					[1] = 'int32':quality
					[2] = 'int32':ratio
					[3] = 'int32':index
				},
				[7] = 'int32':stepExp
				[8] = 'int32':stepLevel
				[9] = 'int32':throughLevel
			},
			[8] = {--repeated SimpleBook
				[1] = 'int32':templateId	[ 秘籍模板ID]
				[2] = 'int32':level	[ 等级]
				[3] = 'int32':attribute	[属性值]
			},
			[9] = {--repeated SimpleMeridians
				[1] = 'int32':index	[ 经脉位置,1~N]
				[2] = 'int32':level	[ 等级]
				[3] = 'int32':attribute	[属性值]
			},
			[10] = 'int32':starlevel	[ 星级]
			[11] = 'repeated int32':fateIds	[ 拥有缘分]
			[12] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[13] = 'int32':quality	[品质]
			[14] = 'int32':martialLevel	[武学等级]
			[15] = {--repeated OtherMartialInfo
				[1] = 'int32':id	[武学id]
				[2] = 'int32':position	[装备位置]
				[3] = 'int32':enchantLevel	[附魔等级]
			},
			[16] = 'string':immune	[免疫概率]
			[17] = 'string':effectActive	[效果影响主动]
			[18] = 'string':effectPassive	[效果影响被动]
			[19] = {--repeated BibleInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':id	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':level	[重级]
				[5] = 'int32':breachLevel	[突破]
				[6] = {--repeated EssentialPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[精要模板id]
				},
				[7] = 'repeated int32':gemId	[ 天书宝石]
				[8] = {--BibleComprehendInfo
					[1] = 'int64':bibleId	[天书id]
					[2] = 'int32':stageId	[阶段id]
					[3] = 'int32':useCount	[参悟丹使用次数]
					[4] = 'int32':reachId	[达成的id]
					[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
					[6] = {--repeated BibleStageInfo
						[1] = 'int32':stage	[阶段id]
						[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
						[3] = 'repeated int32':attIndex	[属性下标]
						[4] = 'repeated int32':value	[属性值]
					},
				},
			},
			[20] = 'int32':forgingQuality	[角色最高炼体品质]
			[21] = 'int32':skillStarLevel
			[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
			[23] = {--repeated BiblePracticeData
				[1] = 'int32':position	[ 位置]
				[2] = 'int32':level	[ 等级]
			},
			[24] = 'bool':equipHide	[是否隐藏装备信息]
			[25] = {--repeated HeartMethodEquipInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':itemId	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':practiceId	[x]
				[5] = 'int32':breachId	[突破]
				[6] = {--repeated HeartMethodGem
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':itemId	[ 宝石ID]
				},
				[7] = {--repeated HeartMethodConcise
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 凝练等级]
				},
				[8] = {--repeated HeartMethodRecast
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 重铸等级]
				},
			},
		},
	}
--]]
s2c.UPDATE_ROLE_DETAILS = 0x0e9a

--[[
	[1] = {--EscortAgencyRestResponse
		[1] = 'int32':restTime	[上一次休整时间]
	}
--]]
s2c.ESCORT_AGENCY_REST_RESPONSE = 0x5f05

--[[
	[1] = {--PassChapterResponse
		[1] = 'int32':chapterId	[ 章节ID]
	}
--]]
s2c.PASS_CHAPTER_RESPONSE = 0x5927

--[[
	[1] = {--VisitMasterResultMsg
		[1] = 'repeated int32':booklist	[获得的秘籍模板id列表]
		[2] = 'int32':nextMaster	[下次拜访前辈 1-4    //下次拜访前辈 1-4]
		[3] = 'int32':callMasterCount	[召唤次数]
	}
--]]
s2c.VISIT_MASTER_RESULT = 0x1601

--[[
	[1] = {--BuyXiayiResult
		[1] = 'int32':consume	[消耗的元宝数量]
		[2] = 'int32':xiayi	[获得侠义数量]
	}
--]]
s2c.BUY_XIAYI_RESULT = 0x1931

--[[
	[1] = {--GetMyTGRewardResult
		[1] = 'bool':result	[ 是否领取成功 1.领取成功;2.你已经被人打下来了;]
		[2] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
	}
--]]
s2c.GET_MY_TGREWARD_RESULT = 0x1313

--[[
	[1] = {--TeamLevelChangeNotify
		[1] = 'int32':levelUp	[提升等级]
		[2] = 'int32':oldStamina	[提升等级之前的体力]
		[3] = 'int32':newStamina	[当前体力]
	}
--]]
s2c.TEAM_LEVEL_CHANGE_NOTIFY = 0x0e21

--[[
	[1] = {--RefineBreachResult
		[1] = 'int64':instanceId	[装备实例ID]
		[2] = 'int32':refineLevel	[装备精炼等级]
	}
--]]
s2c.REFINE_BREACH_RESULT = 0x1080

--[[
	[1] = {--OperateInvitationReult
	}
--]]
s2c.OPERATE_INVITATION_REULT = 0x4414

--[[
	[1] = {--GuildInvitationInfo
		[1] = 'int32':playerId	[玩家编号]
		[2] = 'string':name	[玩家名称]
		[3] = 'int32':vip	[vip等级]
		[4] = 'int32':profession	[职业]
		[5] = 'int32':level	[等级]
		[6] = 'int32':guildId	[公会编号]
		[7] = 'string':guildName	[公会名称]
		[8] = 'int64':createTime	[创建时间]
		[9] = 'int32':quality
		[10] = 'int32':icon	[头像]
		[11] = 'int32':headPicFrame	[头像边框]
		[12] = 'int32':starHeroRanking	[名人堂排名]
		[13] = 'int32':ladderGrade	[天梯赛段位]
	}
--]]
s2c.GUILD_INVITATION_INFO = 0x4417

--[[
	[1] = {--MultipleOutputNotify
		[1] = 'int32':type	[倍数的类型  1 = 经验,2 = 道具]
		[2] = 'int32':multiple	[倍数值(/100)不支持小数    //倍数值(/100)不支持小数]
		[3] = 'int64':endTime	[结束时间]
	}
--]]
s2c.MULTIPLE_OUTPUT_NOTIFY = 0x0e33

--[[
	[1] = {--RoleSpellDisabledNotify
		[1] = 'int64':userId	[升级技能的角色实例ID]
		[2] = {--repeated SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
		[3] = {--repeated SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
	}
--]]
s2c.ROLE_SPELL_DISABLED_NOTIFY = 0x0e0f

--[[
	[1] = {--DatiStartResponse
		[1] = 'int32':startTime	[开始时间]
		[2] = 'repeated int32':datiIds	[随机30道题]
	}
--]]
s2c.DATI_START_RESPONSE = 0x3b01

--[[
	[1] = {--ArenaPlayerListMsg
		[1] = {--repeated ArenaPlayerItem
			[1] = 'int32':rank	[排行]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'string':playerName	[玩家昵称]
			[4] = 'int32':playerLevel	[玩家等级]
			[5] = 'int32':generalId	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[6] = 'int32':fightPower	[战力]
			[7] = 'int32':challengeTotalCount	[总挑战次数]
			[8] = 'int32':challengeWinCount	[胜利次数]
			[9] = 'int32':vipLevel	[VIP等级]
			[10] = 'int32':prevRank	[昨日排名]
			[11] = 'int32':bestRank	[最佳排名]
			[12] = 'int32':totalScore	[一共获得多少群豪谱积分]
			[13] = 'int32':activeChallenge	[主动挑战次数]
			[14] = 'int32':activeWin	[主动挑战胜利次数]
			[15] = 'int32':continuityWin	[当前连胜次数]
			[16] = 'int32':maxContinuityWin	[最大连胜次数]
			[17] = 'repeated int64':formation	[阵容]
		},
	}
--]]
s2c.ARENA_PLAYER_LIST = 0x1300

--[[
	[1] = {--ExitGuild
	}
--]]
s2c.EXIT_GUILD = 0x4405

--[[
	[1] = {--GuildBattleState
		[1] = 'int32':state
	}
--]]
s2c.GUILD_BATTLE_STATE = 0x5706

--[[
	[1] = {--RefreshHeroPool
		[1] = 'repeated int32':templateId	[英雄池]
		[2] = 'int32':copyType	[副本类型]
	}
--]]
s2c.REFRESH_HERO_POOL = 0x2d05

--[[
	[1] = {--AutoMergeGemSuccess
		[1] = 'int32':maxLevel	[最高自动合成到什么等级]
		[2] = {--repeated GemChangeStruct
			[1] = 'int32':id	[宝石ID]
			[2] = 'int32':changeNum	[变更数量]
		},
	}
--]]
s2c.AUTO_MERGE_GEM_SUCCESS = 0x1056

--[[
	[1] = {--CheckSensitiveVocabularyResponse
		[1] = 'int32':result	[ 0正常 1错误]
	}
--]]
s2c.CHECK_SENSITIVE_VOCABULARY_RESPONSE = 0x0e9e

--[[
	[1] = {--FreshTreasureHuntCrossRankResult
		[1] = {--TreasureHuntRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
		[2] = {--repeated TreasureHuntRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
	}
--]]
s2c.FRESH_TREASURE_HUNT_CROSS_RANK_RESULT = 0x6305

--[[
	[1] = {--ExchangeResult
		[1] = 'string':code	[礼包码]
	}
--]]
s2c.EXCHANGE_RESULT = 0x3500

--[[
	[1] = {--BattlePetTrainerReplaceResponse
		[1] = 'int64':instanceId	[战宠id]
		[2] = 'int64':xiakeId	[侠客id]
	}
--]]
s2c.BATTLE_PET_TRAINER_REPLACE_RESPONSE = 0x4f03

--[[
	[1] = {--RushZoneInfos
		[1] = {--repeated RushZoneInfo
			[1] = 'int32':zoneId
			[2] = 'bool':pass
			[3] = 'bool':use
		},
	}
--]]
s2c.RUSH_ZONE_INFOS = 0x7601

--[[
	[1] = {--NorthCaveOneKeySweepSuccess
		[1] = 'int32':sweepCount	[扫荡的层数]
	}
--]]
s2c.NORTH_CAVE_ONE_KEY_SWEEP_SUCCESS = 0x4930

--[[
	[1] = {--YabiaoResult
	}
--]]
s2c.YABIAO_RESULT = 0x3002

--[[
	[1] = {--BibleComprehendReponse
		[1] = {--BibleComprehendInfo
			[1] = 'int64':bibleId	[天书id]
			[2] = 'int32':stageId	[阶段id]
			[3] = 'int32':useCount	[参悟丹使用次数]
			[4] = 'int32':reachId	[达成的id]
			[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
			[6] = {--repeated BibleStageInfo
				[1] = 'int32':stage	[阶段id]
				[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
				[3] = 'repeated int32':attIndex	[属性下标]
				[4] = 'repeated int32':value	[属性值]
			},
		},
	}
--]]
s2c.BIBLE_COMPREHEND_REPONSE = 0x6021

--[[
	[1] = {--ChallengeMiningPointResult
		[1] = 'bool':win	[ 是否挑战胜利]
	}
--]]
s2c.CHALLENGE_MINING_POINT_RESULT = 0x2200

--[[
	[1] = {--RefreshDigHistory
		[1] = {--repeated TreasuresRecordInfo
			[1] = 'string':playerName	[埋宝箱的玩家名称]
			[2] = 'int32':treasureId	[ 埋藏的宝物ID]
			[3] = 'int32':leftTimes	[ 该宝箱剩余可挖次数]
			[4] = 'int64':buriedTime	[埋宝箱时间(挖宝时间)    //埋宝箱时间(挖宝时间)]
			[5] = 'int64':mapId	[埋藏宝箱实例ID]
			[6] = 'int32':isHiddenName	[宝箱是否匿名]
			[7] = 'string':dropItem	[玩家获得的物品]
			[8] = 'string':digName	[挖宝箱的玩家名字]
			[9] = 'string':serverName	[挖宝箱玩家的服务器名字]
			[10] = 'int32':rowId	[所挖宝箱的横坐标]
			[11] = 'int32':colId	[所挖宝箱的纵坐标]
			[12] = 'int32':specialBox	[是否是无量宝箱]
		},
	}
--]]
s2c.REFRESH_DIG_HISTORY = 0x5938

--[[
	[1] = {--UpdateRoleTrainInfo
		[1] = 'int64':instanceId	[角色id]
		[2] = {--repeated AcupointInfo
			[1] = 'int32':position	[穴位位置]
			[2] = 'int32':level	[穴位等级]
			[3] = 'int32':breachLevel	[突破等级]
		},
	}
--]]
s2c.UPDATE_ROLE_TRAIN_INFO = 0x1501

--[[
	[1] = {--ReturnSocialNotify
		[1] = {--repeated GangNotifyInfo
			[1] = 'int64':time	[时间]
			[2] = 'string':playerName	[对方名字]
			[3] = 'int32':playerLev	[对方等级]
			[4] = 'int32':gangName	[帮派名字]
			[5] = 'int32':gangId	[帮派id]
			[6] = 'bool':apply	[true 申请加入 false帮主邀请加入]
		},
	}
--]]
s2c.RETURN_SOCIAL_NOTIFY = 0x1d07

--[[
	[1] = {--AllActivityRankList
		[1] = {--repeated ActivityRankList
			[1] = 'int32':type	[排行榜类型]
			[2] = {--repeated ActivityRankItem
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'int32':rankValue	[排行榜分数(数值)    //排行榜分数(数值)]
				[3] = 'string':name	[名称]
				[4] = 'string':otherDisplay	[其他显示信息表达式]
			},
		},
	}
--]]
s2c.ALL_ACTIVITY_RANK_LIST = 0x3304

--[[
	[1] = {--RereshDriveBeastInfo
		[1] = {--repeated Beast
			[1] = 'int32':count	[被驱赶的次数]
			[2] = 'int64':refreshTime	[年兽刷新的时间]
			[3] = 'string':toName	[被驱赶到玩家下的名字]
			[4] = 'int32':toPlayer	[赶往年兽玩家ID,若没有指向,为0]
			[5] = 'int32':round	[年兽回合数]
			[6] = 'int32':toIcon	[玩家头像]
			[7] = 'string':name	[被驱赶到玩家下的名字]
			[8] = 'int32':player	[刷新出年兽玩家ID]
			[9] = 'int32':icon	[玩家头像]
			[10] = 'int32':isEscape	[是否逃跑]
			[11] = 'int64':id	[年兽实例id]
		},
		[2] = 'int64':lastRefreshTime	[上一次刷出自己的年兽的时间]
		[3] = 'int32':leftRefreshMyTimes	[今日剩余刷新出自己的年兽次数]
		[4] = 'int32':leftRefreshOthersTimes	[今日剩余刷新他人年兽的次数]
		[5] = 'int32':leftRefreshBackTimes	[今日剩余被赶回的年兽次数]
		[6] = {--repeated DropMoney
			[1] = 'int32':index	[元宝下标]
			[2] = 'int32':gameMoney	[元宝数]
		},
	}
--]]
s2c.RERESH_DRIVE_BEAST_INFO = 0x6104

--[[
	[1] = {--GangExchangeResult
		[1] = 'bool':isSuccess	[true or false]
		[2] = {--RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
	}
--]]
s2c.GANG_EXCHANGE_RESULT = 0x1813

--[[
	[1] = {--TianJiLunOpenResponse
		[1] = 'int32':rewardType	[1:普通 2:特殊 3:特等]
		[2] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
		[3] = 'repeated int32':index	[ 奖励索引 'index[3]'    // 奖励索引 'index[3]']
	}
--]]
s2c.TIAN_JI_LUN_OPEN_RESPONSE = 0x7502

--[[
	[1] = {--UnapplyCrossSucess
	}
--]]
s2c.UNAPPLY_CROSS_SUCESS = 0x443b

--[[
	[1] = {--MiningPointList
		[1] = 'int32':type	[宝藏类型.1:连城宝藏;2:闯王宝藏;3:大清龙脉]
		[2] = {--repeated MiningPointInfo
			[1] = 'int32':index	[/位置 1--n    ///位置 1--n]
			[2] = 'bool':empty	[是否位置上没有角色,如果有则发送角色信息,否则角色信息不用发送]
			[3] = {--MiningPointProduct
				[1] = 'int32':resType	[资源类型]
				[2] = 'int32':resId	[资源ID]
				[3] = 'int32':number	[数量]
			},
			[4] = {--OtherPlayerBaseInfo
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':profession	[职业]
				[3] = {--Sex(enum)
					'v4':Sex
				},
				[4] = 'string':name	[昵称]
				[5] = 'int32':level	[等级]
				[6] = 'int32':power	[总战力]
			},
			[5] = 'int32':reaminTime	[剩余挖掘剩余时间,当挖掘点里有人时才有值]
		},
	}
--]]
s2c.MINING_POINT_LIST = 0x2201

--[[
	[1] = {--EquipHeartMethod
		[1] = 'int64':roleId	[ 角色唯一Id]
		[2] = 'int64':heartMid	[ 心法唯一ID]
		[3] = 'int64':dropMid	[ 替换下来的心法唯一id]
	}
--]]
s2c.EQUIP_HEART_METHOD = 0x7b03

--[[
	[1] = {--PeakBattleLogReponse
		[1] = {--repeated PeakBattleLogInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'int32':serverId	[ 服务器ID]
			[3] = 'string':name	[ 玩家名字]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':power	[ 战斗力]
			[6] = 'int32':pos	[ 位置]
			[7] = 'int32':layer	[ 层数]
			[8] = 'int32':type	[ 类型 0占领成功 1占领失败 2防守成功 3防守失败]
			[9] = 'int32':useIcon	[ 正在使用的头像]
			[10] = 'int32':headPicFrame	[ 正在使用的头像框]
			[11] = 'int64':battleTime	[ 战斗时间 毫秒值]
			[12] = 'int32':recordId	[ 录像ID]
			[13] = 'string':desc	[ 详情描述]
			[14] = 'int32':oldLayer	[ 战斗历史层数]
			[15] = 'int32':starHeroRanking	[名人堂排名]
		},
	}
--]]
s2c.PEAK_BATTLE_LOG_REPONSE = 0x7104

--[[
	[1] = {--HomeTurntableReponse
		[1] = 'int32':id	[ 获得道具的转盘ID]
	}
--]]
s2c.HOME_TURNTABLE_REPONSE = 0x7402

--[[
	[1] = {--FreshTreasureHuntRankResult
		[1] = {--TreasureHuntRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
		[2] = {--repeated TreasureHuntRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
	}
--]]
s2c.FRESH_TREASURE_HUNT_RANK_RESULT = 0x6304

--[[
	[1] = {--MissionListMsg
		[1] = {--repeated MissionItem
			[1] = 'int32':missionId	[关卡ID]
			[2] = 'int32':challengeCount	[今日挑战次数]
			[3] = {--StarLevel(enum)
				'v4':StarLevel
			},
			[4] = 'int32':resetCount	[重置次数]
			[5] = 'int32':state	[是否领取特殊奖励]
		},
		[2] = 'repeated int32':openBoxIdList	[所有章节中所有宝箱的状态]
		[3] = 'int32':useQuickPassTimes	[已使用免费扫荡次数]
		[4] = 'int32':useResetTimes	[使用重置次数]
	}
--]]
s2c.MISSION_LIST = 0x1200

--[[
	[1] = {--LongMenBreakRedResponse
		[1] = 'int32':challengeCount	[ 玩家龙门破挑战次数]
	}
--]]
s2c.LONG_MEN_BREAK_RED_RESPONSE = 0x6909

--[[
	[1] = {--ContestHistoryLeiZhuResponse
		[1] = {--LeiZhuInfo
			[1] = 'int32':number	[ 第几届]
			[2] = 'string':name	[ 队伍名称]
			[3] = 'string':serverName	[ 服务器名字]
			[4] = 'int32':serverId	[ 服务器ID]
			[5] = {--repeated LeiZhuMemberInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家名称]
				[3] = 'int32':useIcon	[ 头像]
				[4] = 'int32':frameId	[ 头像框]
				[5] = 'int32':starHeroRanking	[ 名人堂排名]
				[6] = 'int32':level	[ 玩家等级]
				[7] = 'int32':roleId	[ 最大战斗力侠客ID]
				[8] = 'int32':vipLevel	[ VIP等级]
				[9] = 'int32':redPacket	[ 发送红包个数]
			},
			[6] = 'int32':leaderId	[ 队长ID]
			[7] = 'int64':teamId	[ 队伍ID]
		},
		[2] = 'int64':lastTime	[ 上次活动开启时间]
		[3] = 'int32':myRank	[ 我的排名]
		[4] = 'int32':leizhuCount	[ 擂主次数]
	}
--]]
s2c.CONTEST_HISTORY_LEI_ZHU_RESPONSE = 0x6e00

--[[
	[1] = {--TreasureHuntHistoryList
		[1] = 'int32':type	[1个人历史2玩家历史]
		[2] = {--repeated TreasureHuntHistory
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家名]
			[3] = {--repeated TreasureHuntReward
				[1] = 'int32':resType	[资源类型]
				[2] = 'int32':resId	[资源ID]
				[3] = 'int32':number	[资源个数]
				[4] = 'int32':mulriple	[倍数]
			},
			[4] = 'int64':createTime	[记录时间]
		},
	}
--]]
s2c.TREASURE_HUNT_HISTORY_LIST = 0x6302

--[[
	[1] = {--WarMatixSizeUpdate
		[1] = 'int32':capacity	[战阵的人数上限]
	}
--]]
s2c.WAR_MATIX_SIZE_UPDATE = 0x0e27

--[[
	[1] = {--TreasureHuntResult
		[1] = 'repeated int32':index
		[2] = {--repeated TreasureHuntReward
			[1] = 'int32':resType	[资源类型]
			[2] = 'int32':resId	[资源ID]
			[3] = 'int32':number	[资源个数]
			[4] = 'int32':mulriple	[倍数]
		},
	}
--]]
s2c.TREASURE_HUNT_RESULT = 0x6301

--[[
	[1] = {--RedPacketReponse
		[1] = {--repeated RedPacketInfo
			[1] = 'int64':id	[ 红包唯一ID]
			[2] = 'int32':guildId	[ 帮派ID]
			[3] = {--PlayerShowInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家昵称]
				[3] = 'int32':icon	[ 玩家头像]
				[4] = 'int32':frame	[ 玩家头像框]
				[5] = 'int32':level	[ 玩家等级]
				[6] = 'int32':sycee	[ 玩家领取的元宝数量]
				[7] = 'int32':vipLevel	[ 玩家VIP等级]
				[8] = 'string':guildName	[ 帮派名称]
				[9] = 'int32':ranking	[ 排名]
				[10] = 'int32':competence	[ 公会职位 1会长 2副会长 3成员]
				[11] = 'int32':starHeroRanking	[名人堂排名]
				[12] = 'int32':ladderGrade	[天梯赛段位]
			},
			[4] = 'int32':redPacketId	[ 红包ID]
			[5] = 'int32':totalSycee	[ 红包总共的元宝数量]
			[6] = 'int32':surplusSycee	[ 红包的剩余元宝数量]
			[7] = 'int64':startTime	[ 红包的发放时间]
			[8] = 'int32':personNum	[ 红包可领取的人员数量]
			[9] = 'string':desc	[ 红包的发放描述]
			[10] = {--repeated PlayerShowInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家昵称]
				[3] = 'int32':icon	[ 玩家头像]
				[4] = 'int32':frame	[ 玩家头像框]
				[5] = 'int32':level	[ 玩家等级]
				[6] = 'int32':sycee	[ 玩家领取的元宝数量]
				[7] = 'int32':vipLevel	[ 玩家VIP等级]
				[8] = 'string':guildName	[ 帮派名称]
				[9] = 'int32':ranking	[ 排名]
				[10] = 'int32':competence	[ 公会职位 1会长 2副会长 3成员]
				[11] = 'int32':starHeroRanking	[名人堂排名]
				[12] = 'int32':ladderGrade	[天梯赛段位]
			},
			[11] = 'int32':type	[区分红包类型:0是普通红包,1是帮派活跃红包]
		},
	}
--]]
s2c.RED_PACKET_REPONSE = 0x6b05

--[[
	[1] = {--BloodyInspireResult
		[1] = 'int32':coinInspireCount	[金币鼓舞次数]
		[2] = 'int32':sysceeInspireCount	[元宝鼓舞次数]
	}
--]]
s2c.BLOODY_INSPIRE_RESULT = 0x3215

--[[
	[1] = {--RequestUnequipResult
		[1] = 'int32':statusCode	[状态码,0表示操作成功,在操作成功的情况下会收到0x1043指令]
	}
--]]
s2c.REQUEST_UNEQUIP_RESULT = 0x1012

--[[
	[1] = {--TreasureHuntExtraReward
		[1] = 'int32':success	[1yes 2no]
		[2] = 'int32':boxIndex	[开启到哪个宝箱]
		[3] = 'int32':round	[当前宝箱轮次]
	}
--]]
s2c.TREASURE_HUNT_EXTRA_REWARD = 0x6303

--[[
	[1] = {--FriendInfoList
		[1] = {--repeated Friend
			[1] = {--FriendInfo
				[1] = 'int32':playerId	[玩家编号]
				[2] = 'string':name	[玩家名称]
				[3] = 'int32':vip	[vip等级]
				[4] = 'int32':power	[战斗力]
				[5] = 'int64':lastLoginTime	[最后登录时间]
				[6] = 'int32':profession	[职业]
				[7] = 'int32':level	[等级]
				[8] = 'bool':online
				[9] = 'int32':guildId
				[10] = 'string':guildName
				[11] = 'int32':minePower	[护矿战斗力]
				[12] = 'int32':icon	[头像]
				[13] = 'int32':headPicFrame	[头像边框]
				[14] = 'int32':starHeroRanking	[名人堂排名]
				[15] = 'int32':ladderGrade	[天梯赛段位]
			},
			[2] = 'bool':give	[是否有赠送礼物]
			[3] = 'bool':assistantGive	[是否有助战礼物]
		},
		[2] = 'repeated int32':givePlayers
		[3] = 'repeated int32':drawPlayers
		[4] = 'repeated int32':drawAssistantPlayers
	}
--]]
s2c.FRIEND_INFO_LIST = 0x4300

--[[
	[1] = {--RefreshProtagonistSkillResult
		[1] = 'int32':skill_point	[重置获得技能点数量]
	}
--]]
s2c.REFRESH_PROTAGONIST_SKILL_RESULT = 0x1f05

--[[
	[1] = {--TianJiLunRank
		[1] = {--repeated TianJiLunRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':score
			[4] = 'int32':rank
		},
		[2] = 'int32':myRank
		[3] = 'int32':myScore
	}
--]]
s2c.TIAN_JI_LUN_RANK = 0x7503

--[[
	[1] = {--GuildZonePassInfo
		[1] = 'int32':myRank
		[2] = {--GuildZonePass
			[1] = 'int32':guildId	[公会编号]
			[2] = 'string':name	[名称]
			[3] = 'string':presidentName	[会长名称]
			[4] = 'int32':power	[总战斗力]
			[5] = 'int32':level	[等级]
			[6] = 'int64':passTime	[通过时间]
		},
		[3] = {--repeated GuildZonePass
			[1] = 'int32':guildId	[公会编号]
			[2] = 'string':name	[名称]
			[3] = 'string':presidentName	[会长名称]
			[4] = 'int32':power	[总战斗力]
			[5] = 'int32':level	[等级]
			[6] = 'int64':passTime	[通过时间]
		},
	}
--]]
s2c.GUILD_ZONE_PASS_INFO = 0x4082

--[[
	[1] = {--UnlockEquipmentHoleResult
		[1] = 'int32':result	[是否成功]
		[2] = {--EquipmentGemStatusChanged
			[1] = 'int64':userid
			[2] = 'int32':holeNum	[ 宝石孔数]
		},
	}
--]]
s2c.UNLOCK_EQUIPMENT_HOLE_RESULT = 0x1053

--[[
	[1] = {--GuildGiveAchievementResponse
		[1] = 'int32':templateId	[达成的成就]
	}
--]]
s2c.GUILD_GIVE_ACHIEVEMENT_RESPONSE = 0x4c06

--[[
	[1] = {--ArenaTopPlayerList
		[1] = {--repeated ArenaPlayerItem
			[1] = 'int32':rank	[排行]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'string':playerName	[玩家昵称]
			[4] = 'int32':playerLevel	[玩家等级]
			[5] = 'int32':generalId	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[6] = 'int32':fightPower	[战力]
			[7] = 'int32':challengeTotalCount	[总挑战次数]
			[8] = 'int32':challengeWinCount	[胜利次数]
			[9] = 'int32':vipLevel	[VIP等级]
			[10] = 'int32':prevRank	[昨日排名]
			[11] = 'int32':bestRank	[最佳排名]
			[12] = 'int32':totalScore	[一共获得多少群豪谱积分]
			[13] = 'int32':activeChallenge	[主动挑战次数]
			[14] = 'int32':activeWin	[主动挑战胜利次数]
			[15] = 'int32':continuityWin	[当前连胜次数]
			[16] = 'int32':maxContinuityWin	[最大连胜次数]
			[17] = 'repeated int64':formation	[阵容]
		},
	}
--]]
s2c.ARENA_TOP_PLAYER_LIST = 0x1306

--[[
	[1] = {--OneKeyMergeGoodsDone
		[1] = {--repeated OneKeyMergeGoodsItem
			[1] = 'int32':fragmentId	[碎片ID]
			[2] = 'int32':mergeId	[合成ID]
			[3] = 'int32':number	[合成个数]
		},
	}
--]]
s2c.ONE_KEY_MERGE_GOODS_DONE = 0x1065

--[[
	[1] = {--RoleTransferResult
		[1] = 'int64':userid	[角色实例id]
		[2] = 'int32':level	[星级]
		[3] = 'int32':curExp	[星级经验]
	}
--]]
s2c.ROLE_TRANSFER_RESULT = 0x1508

--[[
	[1] = {--OperateGuildSucess
	}
--]]
s2c.OPERATE_GUILD_SUCESS = 0x4409

--[[
	[1] = {--TianJiLunCoinResponse
		[1] = 'int32':type	[类型 1:蓝币  2:紫币]
		[2] = 'int32':freeCount	[剩余免费次数]
	}
--]]
s2c.TIAN_JI_LUN_COIN_RESPONSE = 0x7501

--[[
	[1] = {--DrawDailyMissionProgressAwardSucess
	}
--]]
s2c.DRAW_DAILY_MISSION_PROGRESS_AWARD_SUCESS = 0x2075

--[[
	[1] = {--WulinEnemiesState
		[1] = 'int32':state
	}
--]]
s2c.WULIN_ENEMIES_STATE = 0x7804

--[[
	[1] = {--GamblingItemCacheList
		[1] = {--repeated GamblingItemDetails
			[1] = 'int32':index	[索引,1~N]
			[2] = 'int32':resType	[资源类型]
			[3] = 'int32':resId	[资源ID]
			[4] = 'int32':resNum	[资源数量]
			[5] = 'int64':createTime	[创建时间,单位/秒]
			[6] = 'int64':lastUpdate	[最后更新时间,单位/秒]
		},
	}
--]]
s2c.GAMBLING_ITEM_CACHE_LIST = 0x5806

--[[
	[1] = {--RoleHermitResult
		[1] = 'bool':result	[ 是否成功]
	}
--]]
s2c.ROLE_HERMIT_RESULT = 0x1510

--[[
	[1] = {--ReturnSystemNotify
		[1] = {--repeated SystemNotifyInfo
			[1] = 'int32':id	[消息ID]
			[2] = 'int32':type	[消息类型.]
			[3] = 'bool':canGet	[是否可领取]
			[4] = 'int64':time	[创建时间]
			[5] = 'string':textTitle	[标题]
			[6] = 'string':textTitleSub	[副标题]
			[7] = 'string':textContect	[内容]
			[8] = 'int32':status	[状态:0.未读;1.已读;2.已领取;3.删除]
			[9] = {--repeated NotifyItemReward
				[1] = 'int32':type	[1物品,2卡牌,]
				[2] = 'int32':itemid
				[3] = 'int32':num
			},
			[10] = {--repeated NotifyResourceReward
				[1] = 'int32':type	[1铜币,2元宝]
				[2] = 'int32':num
			},
		},
	}
--]]
s2c.RETURN_SYSTEM_NOTIFY = 0x1d08

--[[
	[1] = {--NotifySevenDaysGoalTaskFinish
		[1] = 'int32':taskid	[成就id]
	}
--]]
s2c.NOTIFY_SEVEN_DAYS_GOAL_TASK_FINISH = 0x2053

--[[
	[1] = {--NewMailList
		[1] = {--repeated SystemNotifyInfo
			[1] = 'int32':id	[消息ID]
			[2] = 'int32':type	[消息类型.]
			[3] = 'bool':canGet	[是否可领取]
			[4] = 'int64':time	[创建时间]
			[5] = 'string':textTitle	[标题]
			[6] = 'string':textTitleSub	[副标题]
			[7] = 'string':textContect	[内容]
			[8] = 'int32':status	[状态:0.未读;1.已读;2.已领取;3.删除]
			[9] = {--repeated NotifyItemReward
				[1] = 'int32':type	[1物品,2卡牌,]
				[2] = 'int32':itemid
				[3] = 'int32':num
			},
			[10] = {--repeated NotifyResourceReward
				[1] = 'int32':type	[1铜币,2元宝]
				[2] = 'int32':num
			},
		},
	}
--]]
s2c.NEW_MAIL_LIST = 0x1d22

--[[
	[1] = {--PickSuccessNotify
	}
--]]
s2c.PICK_SUCCESS_NOTIFY = 0x5802

--[[
	[1] = {--LongMenBreakReviverResponse
		[1] = 'int32':ReviveCount	[复活次数]
	}
--]]
s2c.LONG_MEN_BREAK_REVIVER_RESPONSE = 0x6905

--[[
	[1] = {--BibleGemReponse
		[1] = {--repeated BibleAllGemInfo
			[1] = 'int64':bibleId	[镶嵌的天书id]
			[2] = {--repeated BibleGemInfo
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':itemId	[ 宝石ID]
			},
		},
	}
--]]
s2c.BIBLE_GEM_REPONSE = 0x6014

--[[
	[1] = {--NorthCaveChestGotMarkUpdate
		[1] = 'int32':chestGotMark	[箱子领取记录,位运算存储]
	}
--]]
s2c.NORTH_CAVE_CHEST_GOT_MARK_UPDATE = 0x4925

--[[
	[1] = {--ShopItemAlreadyBuyInfoList
		[1] = {--repeated ShopItemAlreadyBuyInfo
			[1] = 'int32':id	[ID]
			[2] = 'int32':number	[已经被购买了多少个]
		},
	}
--]]
s2c.SHOP_ITEM_ALREADY_BUY_INFO_LIST = 0x2060

--[[
	[1] = {--GetYabiaoRewardResult
	}
--]]
s2c.GET_YABIAO_REWARD_RESULT = 0x3003

--[[
	[1] = {--ContestStatusResponse
		[1] = 'int32':status	[ 王者擂台状态 0 --活动未开启 1 --活动报名阶段  2 --活动战斗阶段(积分赛) 3 --活动押注   4 --活动战斗阶段(总决赛) 5 --活动结束展示阶段    // 王者擂台状态 0 --活动未开启 1 --活动报名阶段  2 --活动战斗阶段(积分赛) 3 --活动押注   4 --活动战斗阶段(总决赛) 5 --活动结束展示阶段]
	}
--]]
s2c.CONTEST_STATUS_RESPONSE = 0x6e13

--[[
	[1] = {--GetSevenDaysGoalTaskRewardResult
		[1] = 'repeated int32':taskid	[已领取成就列表]
	}
--]]
s2c.GET_SEVEN_DAYS_GOAL_TASK_REWARD_RESULT = 0x2052

--[[
	[1] = {--MyGuildMemberInfo
		[1] = 'int32':guildId	[公会编号]
		[2] = 'int32':competence	[权限 1会长 2管理 3成员]
		[3] = 'int32':dedication	[贡献]
		[4] = 'int32':worship	[祭拜]
		[5] = 'int32':coin	[可领取的结交奖励]
		[6] = 'int32':applyCount	[申请次数]
		[7] = 'repeated int32':makePlayers	[结交过的人]
		[8] = 'repeated int32':drawTreasureChests	[领取过的宝箱]
		[9] = 'int64':lastOutTime	[最后退出时间]
		[10] = 'int32':voteStatus	[弹劾投票状态]
	}
--]]
s2c.MY_GUILD_MEMBER_INFO = 0x4400

--[[
	[1] = {--OpenHomeEventScuess
	}
--]]
s2c.OPEN_HOME_EVENT_SCUESS = 0x7409

--[[
	[1] = {--NotifyTaskFinish
		[1] = 'int32':taskid	[成就id]
	}
--]]
s2c.NOTIFY_TASK_FINISH = 0x2003

--[[
	[1] = {--ClearChallengeCDSucess
	}
--]]
s2c.CLEAR_CHALLENGE_CDSUCESS = 0x7806

--[[
	[1] = {--ChapterBoxOpen
		[1] = 'int32':boxId	[开启的宝箱ID]
	}
--]]
s2c.CHAPTER_BOX_OPEN = 0x1202

--[[
	[1] = {--FirstChangeNotify
		[1] = 'string':winerName	[赢者名字]
		[2] = 'string':loserName	[输者名字]
		[3] = 'bool':neili	[是否内力比拼]
		[4] = 'int32':rank	[胜利的人的最新排名]
	}
--]]
s2c.FIRST_CHANGE_NOTIFY = 0x1d04

--[[
	[1] = {--RecallTaskListMsg
		[1] = {--repeated TaskInfo
			[1] = 'int32':taskid	[成就id]
			[2] = 'int32':state	[状态 0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[3] = 'int32':currstep	[当前进度]
			[4] = 'int32':totalstep	[总进度]
		},
		[2] = 'int32':days	[开服天数]
	}
--]]
s2c.RECALL_TASK_LIST = 0x5300

--[[
	[1] = {--EquipLevelUpResult
		[1] = 'int32':result	[状态码,0表示成功,其他表示失败,且分别表示各自错误码]
		[2] = 'bool':success	[是否升级成功,升级操作正确完成也有可能失败.]
		[3] = {--EquipmentTemplateChanged
			[1] = 'int64':userid
			[2] = 'int32':oldTemplateId
			[3] = 'int32':newTemplateId
			[4] = {--EquipmentAttribute
				[1] = 'string':base_attr	[基本属性]
				[2] = 'string':extra_attr	[附加属性]
			},
		},
	}
--]]
s2c.EQUIP_LEVEL_UP_RESULT = 0x1054

--[[
	[1] = {--RecallReturnInfo
		[1] = 'int64':backTime	[回归时间,单位/秒]
		[2] = 'int32':rewardGot	[回归奖励领取标记字段,位运算标记]
		[3] = 'int32':fromPlayerId	[使用了那个玩家的召回邀请]
	}
--]]
s2c.RECALL_RETURN_INFO = 0x5350

--[[
	[1] = {--LoginSendInfo
		[1] = {--repeated ActivitiesInfo
			[1] = 'int32':activityId	[活动id]
			[2] = 'int32':status	[保底奖励状态   0是不可领,1是可领但未领,2是已领取]
		},
	}
--]]
s2c.LOGIN_SEND_INFO = 0x3800

--[[
	[1] = {--GuildPracticeInfos
		[1] = {--repeated PracticeInfo
			[1] = 'int32':attributeType
			[2] = 'int32':level
		},
	}
--]]
s2c.GUILD_PRACTICE_INFOS = 0x4422

--[[
	[1] = {--SaleBattleArrayReponse
		[1] = 'int64':instanceId	[ 阵法唯一ID]
	}
--]]
s2c.SALE_BATTLE_ARRAY_REPONSE = 0x6a06

--[[
	[1] = {--CrossGuildBattleWarInfosMsg
		[1] = {--repeated GuildBattleInfo
			[1] = 'int32':warId
			[2] = 'int32':atkGuildId
			[3] = 'int32':defGuildId
			[4] = 'int32':winGuildId
			[5] = 'int32':cityId
			[6] = 'int64':createTime
			[7] = 'int32':atkPeakAddition	[论剑峰属性加层 万分比]
			[8] = 'int32':defPeakAddition	[论剑峰属性加层 万分比]
		},
	}
--]]
s2c.CROSS_GUILD_BATTLE_WAR_INFOS = 0x4439

--[[
	[1] = {--ActivityProgress
		[1] = 'int32':id	[活动ID]
		[2] = 'int32':progress	[进度]
		[3] = 'string':extend	[进度扩展字段,单笔充值等复杂的进度记录]
		[4] = 'string':got	[已经领取的奖励表达式,与reward对应.如:1,0,1,2,0]
		[5] = 'string':lastUpdate	[最后更新时间]
		[6] = 'int32':resetRemaining	[下次重置剩余时间,如果活动信息中resetCron为null或者空字符串则忽略此字段]
	}
--]]
s2c.ACTIVITY_PROGRESS = 0x2302

--[[
	[1] = {--GuildBossDamageRankResponse
		[1] = 'int32':myPlayerId	[我的玩家id,0表示未入榜]
		[2] = 'int32':myRanking	[我的最佳排名]
		[3] = 'int64':myDamage	[我的伤害]
		[4] = {--repeated GuildBossDamageRankData
			[1] = 'int32':playerId	[玩家id]
			[2] = 'string':playerName	[服务器名字]
			[3] = 'int64':damage	[伤害]
			[4] = 'int32':rank	[排名]
		},
	}
--]]
s2c.GUILD_BOSS_DAMAGE_RANK_RESPONSE = 0x4b09

--[[
	[1] = {--ResetHeroAmbition
		[1] = 'int32':lastChallengeBoss	[玩家上一次挑战的bossId]
		[2] = {--repeated BossInfo
			[1] = 'int32':bossId	[bossId]
			[2] = 'int32':breakOut	[是否通过了此关卡  boss被干的次数]
		},
		[3] = 'int32':lastBrokenBoss	[玩家历史以来击破的最吊的boss]
		[4] = 'int32':freeChallengeCount	[已使用免费挑战次数]
		[5] = 'int32':buyChallengeCount	[已购买挑战次数]
		[6] = 'int32':challengeCount	[已挑战的次数]
	}
--]]
s2c.RESET_HERO_AMBITION = 0x3905

--[[
	[1] = {--BuyFundResponse
		[1] = 'int32':result	[ 0购买成功 1购买失败]
	}
--]]
s2c.BUY_FUND_RESPONSE = 0x2070

--[[
	[1] = {--RewardFundResponse
		[1] = 'int32':result	[ 0领取成功 1领取失败]
	}
--]]
s2c.REWARD_FUND_RESPONSE = 0x2071

--[[
	[1] = {--SendRankAward
	}
--]]
s2c.SEND_RANK_AWARD = 0x3307

--[[
	[1] = {--ApplyInviteCodeSuccess
	}
--]]
s2c.APPLY_INVITE_CODE_SUCCESS = 0x5323

--[[
	[1] = {--LockBookResultMsg
		[1] = 'int64':objID	[实例id]
		[2] = 'bool':lock	[是否锁定]
	}
--]]
s2c.LOCK_BOOK_RESULT = 0x1605

--[[
	[1] = {--DownStatusResponse
		[1] = 'int32':dropId	[礼包id]
	}
--]]
s2c.DOWN_STATUS_RESPONSE = 0x2073

--[[
	[1] = {--GetHeroDuelGuildRankResponse
		[1] = {--repeated HeroDuelGuildRank
			[1] = 'int32':rank	[排名]
			[2] = 'string':guildName	[帮派名称]
			[3] = 'string':leaderName	[会长名称]
			[4] = 'int32':guildLevel	[帮派等级]
			[5] = 'string':bannerId	[帮派旗帜]
			[6] = 'string':serverName	[服务器名称]
			[7] = 'int32':guildScore	[帮派积分]
			[8] = 'int32':guildId	[帮派id]
		},
		[2] = 'int32':myGuildScore	[我的帮派积分]
		[3] = 'int32':myGuildRank	[我的帮派排名]
	}
--]]
s2c.GET_HERO_DUEL_GUILD_RANK_RESPONSE = 0x6f05

--[[
	[1] = {--GoinDownLoadResponse
		[1] = 'repeated int32':ids	[ 已完成的任务ID集合]
	}
--]]
s2c.GOIN_DOWN_LOAD_RESPONSE = 0x2074

--[[
	[1] = {--CrossChampionsBetSucess
	}
--]]
s2c.CROSS_CHAMPIONS_BET_SUCESS = 0x4518

--[[
	[1] = {--ActivityRankList
		[1] = 'int32':type	[排行榜类型]
		[2] = {--repeated ActivityRankItem
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'int32':rankValue	[排行榜分数(数值)    //排行榜分数(数值)]
			[3] = 'string':name	[名称]
			[4] = 'string':otherDisplay	[其他显示信息表达式]
		},
	}
--]]
s2c.ACTIVITY_RANK_LIST = 0x3303

--[[
	[1] = {--HerotSoreExchangableIdList
		[1] = 'repeated int32':commodityId	[群豪谱积分商店可兑换商品ID]
	}
--]]
s2c.HEROT_SORE_EXCHANGABLE_ID_LIST = 0x1907

--[[
	[1] = {--GainLongMenTypeInfo
		[1] = 'repeated int32':pointTypes
	}
--]]
s2c.GAIN_LONG_MEN_TYPE_INFO = 0x6910

--[[
	[1] = {--NotifySevenDaysGoalTaskStep
		[1] = 'int32':taskid	[成就id]
		[2] = 'int32':currstep	[当前进度]
	}
--]]
s2c.NOTIFY_SEVEN_DAYS_GOAL_TASK_STEP = 0x2055

--[[
	[1] = {--HeadPicFrameRefreshResult
		[1] = {--repeated HeadPicFrameUnlockedInfo
			[1] = 'int32':id
			[2] = 'int64':expireTime
			[3] = 'bool':firstGet
		},
		[2] = {--repeated HeadPicFrameLockedInfo
			[1] = 'int32':id
			[2] = 'int32':currentNum
		},
	}
--]]
s2c.HEAD_PIC_FRAME_REFRESH_RESULT = 0x0e97

--[[
	[1] = {--GrouponBuyReponse
		[1] = {--repeated GrouponInfo
			[1] = 'int32':id	[商品信息id]
			[2] = 'bool':isSettle	[是否结算]
			[3] = 'bool':isEnd	[是否轮次已完]
			[4] = 'int32':totalCount	[当前数量]
			[5] = {--GrouponPlayerData
				[1] = 'int32':playerId	[玩家名字]
				[2] = 'string':name	[玩家名字]
				[3] = 'string':guildName	[公会名字]
				[4] = 'int32':num	[玩家购买数量]
			},
			[6] = {--repeated GrouponPlayerData
				[1] = 'int32':playerId	[玩家名字]
				[2] = 'string':name	[玩家名字]
				[3] = 'string':guildName	[公会名字]
				[4] = 'int32':num	[玩家购买数量]
			},
		},
	}
--]]
s2c.GROUPON_BUY_REPONSE = 0x5c02

--[[
	[1] = {--AdvertisePriority
		[1] = 'repeated int32':id	[宣传图id]
	}
--]]
s2c.ADVERTISE_PRIORITY = 0x6200

--[[
	[1] = {--GetMailRewardSuccess
	}
--]]
s2c.GET_MAIL_REWARD_SUCCESS = 0x1d24

--[[
	[1] = {--ItembatchUsedResult
		[1] = 'int32':itemId	[道具ID]
		[2] = 'int32':num	[道具数量]
	}
--]]
s2c.ITEMBATCH_USED_RESULT = 0x1061

--[[
	[1] = {--EmploySingleRoleList
		[1] = {--repeated EmploySingleRoleDetails
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':useType	[使用系统]
			[3] = 'int32':roleId	[ 卡牌的id]
			[4] = 'int32':level	[ 等级]
			[5] = 'int32':martialLevel	[ 武学等级]
			[6] = 'int32':starlevel	[ 星级]
			[7] = 'int32':power	[ 战力]
			[8] = 'int32':hp	[ 剩余HP]
			[9] = 'string':spell	[ 技能表达式:id_level|--]
			[10] = 'string':attributes	[ 属性字符串]
			[11] = 'string':immune	[ 免疫概率]
			[12] = 'string':effectActive	[ 效果影响主动]
			[13] = 'string':effectPassive	[ 效果影响被动]
			[14] = 'int32':state	[状态:1.正常状态;2.死亡;3.释放]
			[15] = 'int32':quality	[品质,角色可以升品了]
			[16] = 'string':name	[名称,主角名称,只有当角色为主角角色时才有值]
			[17] = 'int32':forgingQuality	[角色最高炼体品质]
		},
	}
--]]
s2c.EMPLOY_SINGLE_ROLE_LIST = 0x5111

--[[
	[1] = {--NotifyRecallTaskStep
		[1] = 'int32':taskid	[成就id]
		[2] = 'int32':currstep	[当前进度]
	}
--]]
s2c.NOTIFY_RECALL_TASK_STEP = 0x5304

--[[
	[1] = {--GetTaskRewardResult
		[1] = 'repeated int32':taskid	[已领取成就列表]
	}
--]]
s2c.GET_TASK_REWARD_RESULT = 0x2002

--[[
	[1] = {--RankListGuildPower
		[1] = {--repeated GuildRankInfo
			[1] = 'int32':guildId	[公会编号]
			[2] = 'int32':exp	[经验]
			[3] = 'string':name	[名称]
			[4] = 'int32':memberCount	[成员数量]
			[5] = 'string':presidentName	[会长名称]
			[6] = 'int32':power	[总战斗力]
			[7] = 'string':declaration	[宣言]
			[8] = 'int32':level
			[9] = 'bool':apply	[是否申请过]
		},
	}
--]]
s2c.RANK_LIST_GUILD_POWER = 0x4081

--[[
	[1] = {--NotifyNewSevenDaysGoalTask
		[1] = {--repeated TaskInfo
			[1] = 'int32':taskid	[成就id]
			[2] = 'int32':state	[状态 0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[3] = 'int32':currstep	[当前进度]
			[4] = 'int32':totalstep	[总进度]
		},
	}
--]]
s2c.NOTIFY_NEW_SEVEN_DAYS_GOAL_TASK = 0x2054

--[[
	[1] = {--StarHeroRewardReponse
		[1] = 'int32':id	[ 奖励序号]
	}
--]]
s2c.STAR_HERO_REWARD_REPONSE = 0x6d01

--[[
	[1] = {--StarHeroRankingReponse
		[1] = {--repeated StarHeroData
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'int32':serverId	[ 服务器ID]
			[3] = 'string':name	[ 玩家名字]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':power	[ 战斗力]
			[6] = 'int32':useIcon	[ 正在使用的头像]
			[7] = 'int32':headPicFrame	[ 正在使用的头像框]
			[8] = 'int32':ranking	[ 排名]
			[9] = 'int32':praise	[ 被点赞数量]
			[10] = 'int32':level	[ 等级]
			[11] = 'int32':roleId	[ 形象模板ID]
		},
		[2] = 'int32':isReward	[ 0 不能领奖励 1 可领]
		[3] = 'int32':myRank	[ 我的排名]
		[4] = 'repeated int32':praisePlayerId	[ 已点赞过的玩家ID]
	}
--]]
s2c.STAR_HERO_RANKING_REPONSE = 0x6d00

--[[
	[1] = {--StudyProtagonistSkillResult
	}
--]]
s2c.STUDY_PROTAGONIST_SKILL_RESULT = 0x1f02

--[[
	[1] = {--DatiAnswerResponse
		[1] = 'int32':trueResult	[正确结果id]
	}
--]]
s2c.DATI_ANSWER_RESPONSE = 0x3b02

--[[
	[1] = {--SensitiveWords
		[1] = 'string':words	[敏感词汇]
	}
--]]
s2c.SENSITIVE_WORDS = 0x1b03

--[[
	[1] = {--SerdangSweepReponse
		[1] = 'int32':floorId	[关卡Id]
		[2] = {--repeated SerdangSweepResultItem
			[1] = 'int32':exp	[增加团队经验]
			[2] = 'int32':oldLevel	[原先团队等级]
			[3] = 'int32':currentLevel	[当前团队等级]
			[4] = 'int32':coin	[获得的金币数量]
			[5] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.SERDANG_SWEEP_REPONSE = 0x7203

--[[
	[1] = {--GuildDanFangResponse
		[1] = {--DanFangDetials
			[1] = 'int32':playerId
			[2] = 'string':playerName
			[3] = 'int64':createTime
			[4] = 'int64':endTime
			[5] = 'int32':state	[是否领取 0未领取,1已领取]
			[6] = 'repeated int32':helper
			[7] = 'int32':id	[材料id]
		},
		[2] = {--repeated DanFangDetials
			[1] = 'int32':playerId
			[2] = 'string':playerName
			[3] = 'int64':createTime
			[4] = 'int64':endTime
			[5] = 'int32':state	[是否领取 0未领取,1已领取]
			[6] = 'repeated int32':helper
			[7] = 'int32':id	[材料id]
		},
	}
--]]
s2c.GUILD_DAN_FANG_RESPONSE = 0x5e01

--[[
	[1] = {--TianJiLunInfoResponse
		[1] = {--TianJiLunInfo
			[1] = 'int32':isCoin	[是否有投币(0:没有 1:蓝币 2:紫币)    //是否有投币(0:没有 1:蓝币 2:紫币)]
			[2] = 'int32':freeCount	[是否有免费次数]
		},
		[2] = {--repeated RewardPush
			[1] = 'int32':playerId	[玩家id]
			[2] = 'int32':rewardType	[1:普通 2:特殊 3:特等]
			[3] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
		[3] = {--repeated RewardServerPush
			[1] = 'int32':playerId	[玩家id]
			[2] = 'string':playerName	[玩家名称]
			[3] = 'string':serverName	[服务器名称]
			[4] = 'int32':serverId	[服务器名称]
			[5] = 'int32':rewardType	[1:普通 2:特殊 3:特等]
			[6] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[7] = 'int32':rewardTime	[获奖时间]
		},
		[4] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
		[5] = {--repeated ExtraReward
			[1] = 'int32':rewardType	[1:普通 2:特殊 3:特等]
			[2] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[3] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[4] = 'int32':index	[下标]
		},
		[6] = 'int32':jackpot	[ 奖池]
		[7] = 'string':coinInfo	[ 类型_倍率_积分|类型_倍率_积分 例: 1_1_20|2_3_30]
	}
--]]
s2c.TIAN_JI_LUN_INFO_RESPONSE = 0x7500

--[[
	[1] = {--RefreshProtagonistSkillInfoMsg
		[1] = {--repeated ProtagonistSkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
		[2] = 'int32':skill_point	[技能点数量]
	}
--]]
s2c.REFRESH_PROTAGONIST_SKILL_INFO = 0x1f03

--[[
	[1] = {--BloodyEnemyDetail
		[1] = 'int32':currSection	[当前已过最大关卡]
		[2] = 'int32':coinInspireCount	[金币鼓舞次数]
		[3] = 'int32':sysceeInspireCount	[元宝鼓舞次数]
		[4] = 'int32':dailyMaxInspireCount	[元宝鼓舞次数]
		[5] = 'int32':maxPass	[历史最高通关关卡数]
		[6] = 'int32':lastPass	[最后一次通关数]
		[7] = 'int32':sweepPass	[扫荡参考关卡数,重置的时候更新]
		[8] = 'int32':todaySweep	[今日扫荡次数]
		[9] = {--repeated BloodyEnemySimpleInfo
			[1] = 'string':name	[npc名称]
			[2] = 'int32':section	[第几关(从1开始)    //第几关(从1开始)]
			[3] = 'int32':star	[战斗星级]
			[4] = 'int32':roleId	[代表角色的ID]
		},
		[10] = {--repeated BloodyBoxInfo
			[1] = 'int32':index	[宝箱索引1开始  1-6    //宝箱索引1开始  1-6]
			[2] = 'int32':status	[状态(0一个未领过, 1至少领过一个)    //状态(0一个未领过, 1至少领过一个)]
			[3] = {--repeated BloodyBoxPrize
				[1] = 'int32':index	[宝箱索引]
				[2] = 'bool':bIsget	[是否领取]
				[3] = 'int32':type	[奖品类型]
				[4] = 'int32':itemId	[奖品id]
				[5] = 'int32':number	[数量]
			},
			[4] = 'int32':needResType	[购买需要的资源类型]
			[5] = 'int32':needResNum	[购买需要的资源数量]
		},
		[11] = 'int32':resetCount	[剩余重置次数]
	}
--]]
s2c.BLOODY_ENEMY_DETAIL = 0x3209

--[[
	[1] = {--SignResult
		[1] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
	}
--]]
s2c.SIGN_RESULT = 0x2702

--[[
	[1] = {--OpenBoxSucess
	}
--]]
s2c.OPEN_BOX_SUCESS = 0x4508

--[[
	[1] = {--MergeEquipmentResult
		[1] = 'int32':templateId	[模版ID,物品ID]
	}
--]]
s2c.MERGE_EQUIPMENT_RESULT = 0x1060

--[[
	[1] = {--SerdangInfoReponse
		[1] = {--SerdangInfo
			[1] = 'int32':playerId	[玩家id]
			[2] = 'int32':floorId	[玩家当前关卡id]
		},
		[2] = {--repeated FloorInfo
			[1] = 'int32':floorId	[层id]
			[2] = 'bool':isBox	[是否宝箱层]
			[3] = 'bool':isOpenBox	[是否宝箱层]
			[4] = 'bool':isHistoryReward	[是否历史得奖]
			[5] = 'bool':isSeasonReward	[是否本赛季得奖]
			[6] = {--Npc
				[1] = 'bool':isBoss	[是否boss阵容]
				[2] = {--NpcFormation
					[1] = 'int32':npcId	[队长id]
					[2] = 'repeated int32':roleId	[角色id]
					[3] = 'repeated int32':index	[位置]
				},
				[3] = 'string':playerName	[玩家名称]
				[4] = 'string':serverName	[服务器名字]
				[5] = 'int32':icon	[ 头像]
				[6] = 'int32':headPicFrame	[ 头像框]
			},
			[7] = 'string':boxPlayerName	[开启宝箱玩家名称]
			[8] = 'string':boxServerName	[开启宝箱服务器名字]
		},
		[3] = 'string':playerName	[上赛季最佳玩家名字]
		[4] = 'string':serverName	[上赛季最佳玩家服务器名字]
		[5] = 'int32':floorId	[上赛季最佳层数]
	}
--]]
s2c.SERDANG_INFO_REPONSE = 0x7201

--[[
	[1] = {--HeartMethodBreach
		[1] = 'int64':instanceId	[心法实例ID]
		[2] = 'int32':id	[ 心法突破后id]
	}
--]]
s2c.HEART_METHOD_BREACH = 0x7b05

--[[
	[1] = {--PlayerPracticeInfos
		[1] = {--repeated PlayerPracticeInfo
			[1] = 'int32':pos
			[2] = 'int64':instanceId
			[3] = 'int32':attributeType
			[4] = 'int64':practiceTime
		},
		[2] = {--repeated PartnerPracticeInfo
			[1] = 'int64':instanceId
			[2] = 'int32':attributeType
			[3] = 'int32':level
		},
	}
--]]
s2c.PLAYER_PRACTICE_INFOS = 0x4427

--[[
	[1] = {--EndPracticeSucess
	}
--]]
s2c.END_PRACTICE_SUCESS = 0x4425

--[[
	[1] = {--RandomMallWishResult
		[1] = 'int32':commodityId	[许愿商品的id]
	}
--]]
s2c.RANDOM_MALL_WISH_RESULT = 0x1910

--[[
	[1] = {--CountBuyCoinResult
		[1] = {--repeated BuyCoinResult
			[1] = 'int32':consume	[消耗的元宝数量]
			[2] = 'int32':coin	[获得铜币数量]
			[3] = 'int32':mutil	[倍数]
		},
	}
--]]
s2c.COUNT_BUY_COIN_RESULT = 0x1930

--[[
	[1] = {--MysteryShopList
		[1] = {--repeated MysteryShopInfo
			[1] = 'int32':id	[商品序号]
			[2] = 'int32':resType	[道具资源类型]
			[3] = 'int32':resId	[道具id]
			[4] = 'int32':resNumber	[道具数量]
			[5] = 'int32':consumeType	[消耗资源类型]
			[6] = 'int32':consumeId	[消耗资源id]
			[7] = 'int32':consumeNumber	[消耗资源数量]
		},
		[2] = {--repeated MysteryShopDiscount
			[1] = 'string':vipLevel	[vip等级区间(x_x)    //vip等级区间(x_x)]
			[2] = 'int32':discount	[折扣]
		},
		[3] = 'int64':beginTime	[开始时间]
		[4] = 'int64':endTime	[结束时间]
	}
--]]
s2c.MYSTERY_SHOP_LIST = 0x1925

--[[
	[1] = {--LongMenBreakBuyResult
		[1] = 'int32':state	[结果(0:成功)    //结果(0:成功)]
		[2] = 'int32':goodsId	[物品id]
	}
--]]
s2c.LONG_MEN_BREAK_BUY_RESULT = 0x1914

--[[
	[1] = {--AssistantInfo
		[1] = 'int32':openPos
		[2] = {--repeated AssistantRoleInfo
			[1] = 'int32':type
			[2] = 'repeated int64':roles
		},
		[3] = 'repeated int32':agreeLevels
		[4] = 'int32':friendRoleId
		[5] = 'int64':friendProvideTime
	}
--]]
s2c.ASSISTANT_INFO = 0x4601

--[[
	[1] = {--SummonPaladinResult
		[1] = 'int64':instanceId	[新获得的侠士的实例ID]
	}
--]]
s2c.SUMMON_PALADIN_RESULT = 0x0e90

--[[
	[1] = {--EmploySingleRoleListByUseType
		[1] = 'int32':useType	[使用类型,客户端定义]
		[2] = {--repeated EmploySingleRoleDetails
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':useType	[使用系统]
			[3] = 'int32':roleId	[ 卡牌的id]
			[4] = 'int32':level	[ 等级]
			[5] = 'int32':martialLevel	[ 武学等级]
			[6] = 'int32':starlevel	[ 星级]
			[7] = 'int32':power	[ 战力]
			[8] = 'int32':hp	[ 剩余HP]
			[9] = 'string':spell	[ 技能表达式:id_level|--]
			[10] = 'string':attributes	[ 属性字符串]
			[11] = 'string':immune	[ 免疫概率]
			[12] = 'string':effectActive	[ 效果影响主动]
			[13] = 'string':effectPassive	[ 效果影响被动]
			[14] = 'int32':state	[状态:1.正常状态;2.死亡;3.释放]
			[15] = 'int32':quality	[品质,角色可以升品了]
			[16] = 'string':name	[名称,主角名称,只有当角色为主角角色时才有值]
			[17] = 'int32':forgingQuality	[角色最高炼体品质]
		},
	}
--]]
s2c.EMPLOY_SINGLE_ROLE_LIST_BY_USE_TYPE = 0x5112

--[[
	[1] = {--BuySuccessNotify
		[1] = 'int32':commodityId	[商品 id]
		[2] = 'int32':num	[商品个数]
	}
--]]
s2c.BUY_SUCCESS_NOTIFY = 0x1900

--[[
	[1] = {--SwapChatPlayer
		[1] = {--repeated ChatInfo
			[1] = 'int32':chatType	[聊天类型;1.公共,2.私聊;3.帮派;]
			[2] = 'string':content	[消息;]
			[3] = 'int32':playerId	[说话人的id]
			[4] = 'int32':roleId	[主角角色ID,卡牌ID]
			[5] = 'int32':quality	[说话角色的主角品质]
			[6] = 'string':name	[说话人的名字]
			[7] = 'int32':vipLevel	[VIP等级]
			[8] = 'int32':level	[玩家等级]
			[9] = 'int64':timestamp	[消息发送时间]
			[10] = 'int32':guildId	[公会编号]
			[11] = 'string':guildName	[公会名称]
			[12] = 'int32':competence	[公会职位 1会长 2副会长 3成员]
			[13] = 'repeated int32':invitationGuilds	[邀请过他的公会]
			[14] = 'int32':titleType	[称号类型]
			[15] = 'int32':guideType	[指导员类型]
			[16] = 'int32':icon	[头像]
			[17] = 'int32':headPicFrame	[头像边框]
			[18] = 'int32':serverId
			[19] = 'string':serverName
			[20] = 'int32':audioTime	[语音聊天时间]
			[21] = 'string':audioId	[语音聊天id]
			[22] = 'int32':starHeroRanking	[名人堂排名]
			[23] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.SWAP_CHAT_PLAYER = 0x1b04

--[[
	[1] = {--GuildGiveResponse
		[1] = {--GuildGiveInfo
			[1] = 'int32':type	[类型]
			[2] = 'int32':templateId	[模版id(当是我的需求的时候,为0则代表没有)    //模版id(当是我的需求的时候,为0则代表没有)]
			[3] = 'int32':playerId	[id]
			[4] = 'string':playerName	[名字]
			[5] = 'int32':currentNum	[当前数量]
			[6] = 'int32':limitNum	[最大数量]
			[7] = 'int32':receiveNum	[可领数量]
			[8] = 'int32':updateTime	[发布时间]
		},
		[2] = {--repeated GuildGiveInfo
			[1] = 'int32':type	[类型]
			[2] = 'int32':templateId	[模版id(当是我的需求的时候,为0则代表没有)    //模版id(当是我的需求的时候,为0则代表没有)]
			[3] = 'int32':playerId	[id]
			[4] = 'string':playerName	[名字]
			[5] = 'int32':currentNum	[当前数量]
			[6] = 'int32':limitNum	[最大数量]
			[7] = 'int32':receiveNum	[可领数量]
			[8] = 'int32':updateTime	[发布时间]
		},
	}
--]]
s2c.GUILD_GIVE_RESPONSE = 0x4c01

--[[
	[1] = {--LangBlessedConfigResponse
		[1] = {--repeated LangBlessedConfigItem
			[1] = 'int32':id	[id]
			[2] = 'int32':goodId	[物品ID]
			[3] = 'int32':type	[类型]
			[4] = 'int32':num	[数量]
			[5] = 'int32':kind	[类型 1精品 2珍品]
		},
		[2] = {--repeated LangBlessedSeleteds
			[1] = 'int32':id
			[2] = 'int32':index
			[3] = 'int32':kind	[选项类型 1精品 2珍品]
		},
	}
--]]
s2c.LANG_BLESSED_CONFIG_RESPONSE = 0x4d01

--[[
	[1] = {--UsedXiayiBuyCount
		[1] = 'int32':count	[已购买次数]
	}
--]]
s2c.USED_XIAYI_BUY_COUNT = 0x1932

--[[
	[1] = {--AllRandomStore
		[1] = {--repeated RandomStore
			[1] = 'int32':type	[随机商店类型]
			[2] = {--repeated RandomCommodity
				[1] = 'int32':commodityId	[商品的id]
				[2] = 'int32':num	[已购买数量]
				[3] = 'bool':enabled	[此商品是否可以购买]
			},
			[3] = 'int64':nextAutoRefreshTime	[距离下次刷新所剩余的时间,单位/毫秒]
			[4] = 'int32':nextRefreshCost	[下次手动刷新花费元宝]
			[5] = 'int32':manualRefreshCount	[当日手动刷新次数,累计,到了某个特定时间点会重置]
			[6] = 'int64':opentime	[开启时间,单位/毫秒]
		},
	}
--]]
s2c.ALL_RANDOM_STORE = 0x1904

--[[
	[1] = {--ReceivePowerRewardReponse
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.RECEIVE_POWER_REWARD_REPONSE = 0x2306

--[[
	[1] = {--NorthCaveAttributeInfo
		[1] = 'int32':index	[索引,1~N]
		[2] = 'repeated int32':option	[选项,属性ID,对应t_s_north_cave_extra_attr]
		[3] = 'int32':choice	[选中的属性ID,如果没有则为0]
		[4] = 'bool':skip	[是否跳过选择]
	}
--]]
s2c.NORTH_CAVE_ATTRIBUTE_INFO = 0x4922

--[[
	[1] = {--DrawVIPScoreSucess
		[1] = 'int64':time	[vip签到时间]
	}
--]]
s2c.DRAW_VIPSCORE_SUCESS = 0x0e9b

--[[
	[1] = {--NorthCaveAttributeChoiceSuccess
		[1] = {--NorthCaveAttributeInfo
			[1] = 'int32':index	[索引,1~N]
			[2] = 'repeated int32':option	[选项,属性ID,对应t_s_north_cave_extra_attr]
			[3] = 'int32':choice	[选中的属性ID,如果没有则为0]
			[4] = 'bool':skip	[是否跳过选择]
		},
	}
--]]
s2c.NORTH_CAVE_ATTRIBUTE_CHOICE_SUCCESS = 0x4920

--[[
	[1] = {--MailStateChanged
		[1] = 'int32':id	[邮件ID]
		[2] = 'int32':status	[状态:0.未读;1.已读;2.已领取;3.删除]
	}
--]]
s2c.MAIL_STATE_CHANGED = 0x1d20

--[[
	[1] = {--SendHistory
		[1] = {--repeated Records
			[1] = 'string':itmes	[掉落的物品]
			[2] = 'int64':dropTime	[掉落的时间]
		},
	}
--]]
s2c.SEND_HISTORY = 0x6112

--[[
	[1] = {--KnightRankList
		[1] = {--repeated KnightRankInfo
			[1] = 'int32':playerId
			[2] = 'int32':rank	[排名]
			[3] = 'int32':routLevel	[击破等级]
			[4] = 'string':name	[玩家名]
			[5] = 'int32':headPicFrame	[头像框]
			[6] = 'int32':icon	[头像]
		},
	}
--]]
s2c.KNIGHT_RANK_LIST = 0x7a02

--[[
	[1] = {--RewardInfo
		[1] = 'int32':type	[0:未知或者普通情况下显示提示的类型;1.豪杰榜;2铜人阵;3.天罡星等----]
		[2] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
	}
--]]
s2c.REWARD_INFO = 0x7f02

--[[
	[1] = {--LangBlessedPrayResponse
		[1] = {--repeated LangBlessedSeleteds
			[1] = 'int32':id
			[2] = 'int32':index
			[3] = 'int32':kind	[选项类型 1精品 2珍品]
		},
	}
--]]
s2c.LANG_BLESSED_PRAY_RESPONSE = 0x4d03

--[[
	[1] = {--MysteryShopBuyResult
		[1] = 'int32':state	[结果(0:成功)    //结果(0:成功)]
	}
--]]
s2c.MYSTERY_SHOP_BUY_RESULT = 0x1912

--[[
	[1] = {--RandomMallOpen
		[1] = 'int32':type	[随机商店类型]
		[2] = 'int64':opentime	[开启时间,单位/毫秒]
	}
--]]
s2c.RANDOM_MALL_OPEN = 0x1908

--[[
	[1] = {--RealNameResult
		[1] = 'int32':AntiaddictionCode	[实名状态 0是实名并且成年1是未成年2是未实名]
		[2] = 'int32':IncomeCode	[收益状态 3是正常收益4收益减半5零收益]
		[3] = 'int64':GameTime	[游戏时间]
		[4] = 'int32':getReward	[是否领取了实名奖励 1是0否]
	}
--]]
s2c.REAL_NAME_RESULT = 0x1e03

--[[
	[1] = {--FightRerort
		[1] = 'int32':packetIndex
		[2] = {--repeated FightAction
			[1] = 'bool':bManualAction	[是否主动技能]
			[2] = 'int32':roundIndex	[当前回合]
			[3] = 'int32':attackerpos	[攻击者位置]
			[4] = 'int32':skillid	[技能id]
			[5] = 'int32':skillLevel	[技能id]
			[6] = 'bool':bBackAttack	[是否反击]
			[7] = {--repeated TargetInfo
				[1] = 'int32':targetpos	[受击者位置]
				[2] = 'int32':effect	[受击效果]
				[3] = 'int32':hurt	[受击伤害]
				[4] = 'int32':triggerBufferID	[触发bufferID]
				[5] = 'int32':triggerBufferLevel	[触发bufferID]
				[6] = 'int32':passiveEffect	[被动效果类型]
				[7] = 'int32':passiveEffectValue	[被动效果值]
				[8] = 'int32':activeEffect	[主动效果类型]
				[9] = 'int32':activeEffectValue	[主动效果值]
			},
			[8] = {--repeated StateInfo
				[1] = 'int32':frompos	[状态产生自谁行为发起者还是目标]
				[2] = 'int32':targetpos	[获得状态的目标]
				[3] = 'int32':stateId	[触发的状态ID,触发了哪个状态.始终是frompos对应角色身上的状态列表中的状态]
				[4] = 'int32':skillId	[状态时由哪个技能触发的.始终是frompos对应角色身上的技能]
				[5] = 'int32':skillLevel	[状态时由哪个技能触发的.始终是frompos对应角色身上的技能]
				[6] = 'int32':bufferId	[targetpos的角色获得的状态ID]
				[7] = 'int32':bufferLevel	[targetpos的角色获得的状态ID]
			},
			[9] = 'int32':triggerType	[触发技能类型]
		},
	}
--]]
s2c.FIGHT_RERORT = 0x0f25

--[[
	[1] = {--SettingConfig
		[1] = 'bool':openMusic	[是否打开音乐 true or flase]
		[2] = 'bool':openVolume	[是否打开音效 true or flase]
		[3] = 'bool':openChat	[是否打开聊天 true or flase]
		[4] = 'bool':vipVisible	[是否显示VIP]
		[5] = 'bool':ladderGradeVisible	[是否显示段位]
	}
--]]
s2c.SETTING_CONFIG = 0x1e00

--[[
	[1] = {--QualificationInfos
		[1] = {--repeated CrossChampionsPlayerInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':power
			[4] = 'string':guildName
		},
		[2] = 'int32':myRank
		[3] = 'string':atkFormation
		[4] = 'string':defFromation
	}
--]]
s2c.QUALIFICATION_INFOS = 0x4514

--[[
	[1] = {--RoleStarUpResult
		[1] = 'int64':userid	[角色实例id]
		[2] = 'int32':starlevel	[星级]
		[3] = 'int32':starExp	[星级经验]
	}
--]]
s2c.ROLE_STAR_UP_RESULT = 0x1504

--[[
	[1] = {--OneKeyEnchantSuccess
		[1] = 'int64':roleId	[角色id]
		[2] = 'int32':position	[武学装备位置]
		[3] = 'int32':martialId	[武学id]
		[4] = 'int32':costType	[花费资源类型]
		[5] = 'int32':costValue	[花费资源数量]
	}
--]]
s2c.ONE_KEY_ENCHANT_SUCCESS = 0x3407

--[[
	[1] = {--GuardRecordListResult
		[1] = {--repeated GuardRecord
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':employerPlayerName	[雇佣者玩家名]
			[3] = 'string':robPlayerName	[打劫者玩家名]
			[4] = 'int32':brokerrage	[雇佣佣金]
			[5] = 'int32':extraBrokerrage	[额外佣金]
			[6] = 'int64':recordTime	[记录时间]
			[7] = 'int32':robServerId	[劫矿者服务器ID]
		},
	}
--]]
s2c.GUARD_RECORD_LIST_RESULT = 0x5006

--[[
	[1] = {--KnightShareSingleInfo
		[1] = 'int32':sharePlayerId	[分享玩家ID]
		[2] = {--KnightInfo
			[1] = 'int32':type	[武士类型]
			[2] = 'int32':level	[武士等级]
			[3] = 'int64':timeLeft	[剩余时间]
			[4] = 'int32':leaveTime	[剩餘挑戰次數]
		},
		[3] = 'int32':knightState	[武士状态 0 可挑战 1 挑战中 2 已挑战]
		[4] = {--KnightFightPlayerInfo
			[1] = 'string':name	[玩家名]
			[2] = 'int32':icon	[头像]
		},
		[5] = 'int64':leaveHp	[剩餘血量]
		[6] = 'int64':maxHp	[最大血量]
		[7] = 'int64':instanceId	[武士实例ID]
		[8] = 'string':sharePlayerName	[分享者名字]
		[9] = 'repeated int32':eachHp	[每个NPC血量]
		[10] = 'repeated int32':eachMaxHp	[每个NPC最大血量]
		[11] = {--ChatInfo
			[1] = 'int32':chatType	[聊天类型;1.公共,2.私聊;3.帮派;]
			[2] = 'string':content	[消息;]
			[3] = 'int32':playerId	[说话人的id]
			[4] = 'int32':roleId	[主角角色ID,卡牌ID]
			[5] = 'int32':quality	[说话角色的主角品质]
			[6] = 'string':name	[说话人的名字]
			[7] = 'int32':vipLevel	[VIP等级]
			[8] = 'int32':level	[玩家等级]
			[9] = 'int64':timestamp	[消息发送时间]
			[10] = 'int32':guildId	[公会编号]
			[11] = 'string':guildName	[公会名称]
			[12] = 'int32':competence	[公会职位 1会长 2副会长 3成员]
			[13] = 'repeated int32':invitationGuilds	[邀请过他的公会]
			[14] = 'int32':titleType	[称号类型]
			[15] = 'int32':guideType	[指导员类型]
			[16] = 'int32':icon	[头像]
			[17] = 'int32':headPicFrame	[头像边框]
			[18] = 'int32':serverId
			[19] = 'string':serverName
			[20] = 'int32':audioTime	[语音聊天时间]
			[21] = 'string':audioId	[语音聊天id]
			[22] = 'int32':starHeroRanking	[名人堂排名]
			[23] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.KNIGHT_SHARE_SINGLE_INFO = 0x7a05

--[[
	[1] = {--RankingListTopPower
		[1] = {--repeated RankInfoTopPower
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'int32':power	[战力]
			[4] = 'string':name	[昵称]
			[5] = 'int32':level	[等级]
			[6] = 'int32':vipLevel	[VIP等级]
			[7] = 'int32':goodNum	[赞次数]
			[8] = {--repeated RankInfoFormation
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
			},
			[9] = 'int32':profession	[头像]
			[10] = 'int32':headPicFrame	[头像边框]
			[11] = 'int32':starHeroRanking	[名人堂排名]
			[12] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':lastPower	[最低入榜排名战力]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':myBestValue	[我的最佳成绩,用户跟lastValue比较]
		[5] = 'int32':praiseCount	[我自己拥有的赞数量]
	}
--]]
s2c.RANKING_LIST_TOP_POWER = 0x4000

--[[
	[1] = {--SettingSendBugResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.SETTING_SEND_BUG_RESULT = 0x1e02

--[[
	[1] = {--EquipmentBuildResult
		[1] = 'int64':userId	[产出装备的实例id]
	}
--]]
s2c.EQUIPMENT_BUILD_RESULT = 0x1013

--[[
	[1] = {--OpenServiceActivityStatusList
		[1] = {--repeated OpenServiceActivityStatus
			[1] = 'int32':type	[类型:0表示全部]
			[2] = 'int32':status	[状态:1.未开始;2.进行中;3已结束]
			[3] = 'string':startTime	[开始时间:yyyy-MM-dd HH:mm:ss    //开始时间:yyyy-MM-dd HH:mm:ss]
			[4] = 'string':endTime	[结束时间:yyyy-MM-dd HH:mm:ss    //结束时间:yyyy-MM-dd HH:mm:ss]
		},
	}
--]]
s2c.OPEN_SERVICE_ACTIVITY_STATUS_LIST = 0x3301

--[[
	[1] = {--ServerSwitchInfoResult
		[1] = {--repeated ServerSwitchInfo
			[1] = 'int32':switchType	[switchType]
			[2] = 'bool':open	[开启状态,true:开启,false:关闭]
			[3] = 'int64':beginTime	[开始时间]
			[4] = 'int64':endTime	[结束时间]
		},
	}
--]]
s2c.SERVER_SWITCH_INFO_RESULT = 0x3600

--[[
	[1] = {--EncouragingSucess
	}
--]]
s2c.ENCOURAGING_SUCESS = 0x4504

--[[
	[1] = {--RankListGuildIncBoom
		[1] = {--repeated GuildRankIncBoomInfo
			[1] = 'int32':guildId
			[2] = 'string':name
			[3] = 'int32':incBoom
		},
		[2] = 'int32':myGuildRank
		[3] = 'int32':incBoom
	}
--]]
s2c.RANK_LIST_GUILD_INC_BOOM = 0x4084

--[[
	[1] = {--SerdangRankReponse
		[1] = {--repeated RankInfo
			[1] = 'int32':playerId	[玩家信息]
			[2] = 'string':playerName	[玩家信息]
			[3] = 'int32':icon	[头像]
			[4] = 'int32':headPicFrame	[头像框]
			[5] = 'int32':power	[战力]
			[6] = 'int32':level	[玩家等级]
			[7] = 'int32':rank	[排行]
			[8] = 'int32':serverId	[服务器id]
			[9] = 'string':serverName	[服务器名称]
			[10] = 'int32':floorId	[层id]
			[11] = {--repeated Formation
				[1] = 'int32':position	[阵形位置,0~8]
				[2] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[3] = 'int32':quality	[品质]
			},
			[12] = 'int32':starHeroRanking	[名人堂排名]
		},
		[2] = 'int32':minValue	[ 最低入榜排名]
		[3] = 'int32':myRanking	[ 我的最佳排名,0表示未入榜]
		[4] = 'int32':floorId	[ 玩家自己当前层id]
	}
--]]
s2c.SERDANG_RANK_REPONSE = 0x7206

--[[
	[1] = {--ApplyGuildSucess
		[1] = 'repeated int32':guildIds	[申请成功的公会编号]
	}
--]]
s2c.APPLY_GUILD_SUCESS = 0x4402

--[[
	[1] = {--SerdangChallengeReponse
		[1] = 'int32':curId	[当前层id]
		[2] = 'int32':challengeCount	[剩余挑战次数]
	}
--]]
s2c.SERDANG_CHALLENGE_REPONSE = 0x7202

--[[
	[1] = {--SerdangBuyChallengeCountReponse
	}
--]]
s2c.SERDANG_BUY_CHALLENGE_COUNT_REPONSE = 0x7205

--[[
	[1] = {--FreshEggCrossRankResult
		[1] = {--EggRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
		[2] = {--repeated EggRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
	}
--]]
s2c.FRESH_EGG_CROSS_RANK_RESULT = 0x4706

--[[
	[1] = {--SendGuildInvitationReult
	}
--]]
s2c.SEND_GUILD_INVITATION_REULT = 0x4413

--[[
	[1] = {--SerdangBoxReponse
		[1] = 'int32':floorId	[层id]
		[2] = 'bool':isOpenBox	[是否开启]
		[3] = 'string':boxPlayerName	[开启宝箱玩家名称]
		[4] = 'string':boxServerName	[开启宝箱服务器名字]
	}
--]]
s2c.SERDANG_BOX_REPONSE = 0x7207

--[[
	[1] = {--GangInviteMrmberResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_INVITE_MRMBER_RESULT = 0x1805

--[[
	[1] = {--NetChatProps
	}
--]]
s2c.NET_CHAT_PROPS = 0x1b08

--[[
	[1] = {--GuildDynamicInfo
		[1] = {--repeated GuildDynamic
			[1] = {--GuildDynamicType(enum)
				'v4':GuildDynamicType
			},
			[2] = 'string':mess
		},
	}
--]]
s2c.GUILD_DYNAMIC_INFO = 0x4419

--[[
	[1] = {--SerdangSeasonInfoReponse
		[1] = 'int64':startTime	[赛季开始时间]
		[2] = 'int64':endTime	[赛季结束时间]
		[3] = 'bool':isPassCave	[玩家是否通过北窟20层]
		[4] = 'bool':champions	[本服是否完成跨服战]
	}
--]]
s2c.SERDANG_SEASON_INFO_REPONSE = 0x7200

--[[
	[1] = {--UnUseProtagonistSkillResult
		[1] = 'repeated int32':posList	[卸下的位置pos]
	}
--]]
s2c.UN_USE_PROTAGONIST_SKILL_RESULT = 0x1f07

--[[
	[1] = {--ResponseLastDestiny
		[1] = 'int32':destinyList
	}
--]]
s2c.RESPONSE_LAST_DESTINY = 0x3e09

--[[
	[1] = {--OpenHeroAmbition
		[1] = 'int32':lastChallengeBoss	[玩家上一次挑战的bossId]
		[2] = {--repeated BossInfo
			[1] = 'int32':bossId	[bossId]
			[2] = 'int32':breakOut	[是否通过了此关卡  boss被干的次数]
		},
		[3] = 'int32':lastBrokenBoss	[玩家历史以来击破的最吊的boss]
		[4] = 'int32':freeChallengeCount	[已使用免费挑战次数]
		[5] = 'int32':buyChallengeCount	[已购买挑战次数]
		[6] = 'int32':challengeCount	[已挑战的次数]
		[7] = 'int32':leftChallengeCount	[昨天剩余的购买次数(不变值)    //昨天剩余的购买次数(不变值)]
	}
--]]
s2c.OPEN_HERO_AMBITION = 0x3900

--[[
	[1] = {--GuildBattleCurrentState
		[1] = 'int32':state	[当前状态]
	}
--]]
s2c.GUILD_BATTLE_CURRENT_STATE = 0x4438

--[[
	[1] = {--MyPraiseInfo
		[1] = 'int32':totalCount	[总使用次数]
		[2] = 'int32':todayCount	[今日使用次数]
		[3] = 'int32':remaining	[今日剩余使用次数]
		[4] = 'int64':lastUpdate	[最后更新时间]
		[5] = 'repeated int32':targetId	[今日已经点赞过的玩家ID]
	}
--]]
s2c.MY_PRAISE_INFO = 0x4070

--[[
	[1] = {--GetRoleStateMsg
		[1] = 'int32':cardType	[ 1 最高得乙, 2 最高得甲 3 连抽十次]
		[2] = 'bool':firstGet	[ 是否首刷]
		[3] = 'int32':freeTimes	[ 可用免费次数]
		[4] = 'int32':cdTime	[ 剩余CD时间 单位秒]
		[5] = 'int32':todayTimes	[ 今日已用次数]
		[6] = 'int32':totalCount	[ 总招募次数]
	}
--]]
s2c.GET_ROLE_STATE = 0x1c02

--[[
	[1] = {--SacrificePickSuccessNotify
	}
--]]
s2c.SACRIFICE_PICK_SUCCESS_NOTIFY = 0x3e02

--[[
	[1] = {--SacrificeItemDetails
		[1] = 'int32':index	[索引,1~N]
		[2] = 'int32':resType	[资源类型]
		[3] = 'int32':resId	[资源ID]
		[4] = 'int32':resNum	[资源数量]
		[5] = 'int64':createTime	[创建时间,单位/秒]
		[6] = 'int64':lastUpdate	[最后更新时间,单位/秒]
		[7] = 'int32':level	[天命等级]
		[8] = 'int32':exp	[天命经验]
	}
--]]
s2c.SACRIFICE_ITEM_DETAILS = 0x3e05

--[[
	[1] = {--DrawBloodyBoxResult
		[1] = {--BloodyBoxUpdateInfo
			[1] = 'int32':boxIndex	[对应宝箱的索引]
			[2] = {--BloodyBoxPrize
				[1] = 'int32':index	[宝箱索引]
				[2] = 'bool':bIsget	[是否领取]
				[3] = 'int32':type	[奖品类型]
				[4] = 'int32':itemId	[奖品id]
				[5] = 'int32':number	[数量]
			},
		},
	}
--]]
s2c.DRAW_BLOODY_BOX_RESULT = 0x3213

--[[
	[1] = {--GuildStatInfoReult
		[1] = 'int32':secondlyProgress	[忠义堂进度]
		[2] = 'string':lastPlayerName
		[3] = 'int32':worshipCount	[祭拜次数]
	}
--]]
s2c.GUILD_STAT_INFO_REULT = 0x440c

--[[
	[1] = {--BibleKeyLevelUpReponse
		[1] = 'int32':result	[是否成功]
		[2] = {--repeated BibleKeyData
			[1] = 'int64':id	[ 秘钥实例id]
			[2] = 'int32':template_id	[ 模板id]
			[3] = 'int32':level	[ 等级]
			[4] = 'int64':bibleId	[天书实例id]
		},
	}
--]]
s2c.BIBLE_KEY_LEVEL_UP_REPONSE = 0x6027

--[[
	[1] = {--BatchBetAutoSuccessNotify
		[1] = 'int32':count	[自动赌石次数.0表示服务器控制]
	}
--]]
s2c.BATCH_BET_AUTO_SUCCESS_NOTIFY = 0x5801

--[[
	[1] = {--SevenDaysGoalTaskListMsg
		[1] = {--repeated TaskInfo
			[1] = 'int32':taskid	[成就id]
			[2] = 'int32':state	[状态 0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[3] = 'int32':currstep	[当前进度]
			[4] = 'int32':totalstep	[总进度]
		},
		[2] = 'int32':days	[开服天数]
	}
--]]
s2c.SEVEN_DAYS_GOAL_TASK_LIST = 0x2051

--[[
	[1] = {--RechargeInfo
		[1] = 'int32':totalRecharge	[总充值]
		[2] = 'int32':vipLevel	[当前vip等级]
	}
--]]
s2c.RECHARGE_INFO = 0x1a03

--[[
	[1] = {--GotActivityRewardResult
		[1] = 'int32':id	[活动ID]
		[2] = 'int32':index	[奖励索引,从1开始,第几个奖励]
	}
--]]
s2c.GOT_ACTIVITY_REWARD_RESULT = 0x2304

--[[
	[1] = {--DrawBeastMoney
		[1] = 'int32':draw	[返回信息]
	}
--]]
s2c.DRAW_BEAST_MONEY = 0x6103

--[[
	[1] = {--UpdateChallengeTimes
		[1] = 'int32':challengeTimes	[已经挑战次数]
		[2] = 'int32':remainChallengeTimes	[剩余挑战次数]
	}
--]]
s2c.UPDATE_CHALLENGE_TIMES = 0x1405

--[[
	[1] = {--BloodyWarMatixConf
		[1] = 'int32':capacity	[战阵的人数上限]
		[2] = {--repeated BloodyRoleStation
			[1] = 'int64':roleId	[角色ID]
			[2] = 'int32':index	[战阵索引(从0开始,-1表示未上阵)    //战阵索引(从0开始,-1表示未上阵)]
			[3] = 'int32':currHp	[剩余血量]
			[4] = 'int32':maxHp	[最大血量]
		},
	}
--]]
s2c.BLOODY_WAR_MATIX_CONF = 0x3200

--[[
	[1] = {--PayRecordList
		[1] = {--repeated PayRecordItem
			[1] = 'int32':id	[商品id]
			[2] = 'int32':buyTimes	[商品购买次数,未购买则为0]
		},
	}
--]]
s2c.PAY_RECORD_LIST = 0x1a04

--[[
	[1] = {--RankingListWuLiang
		[1] = {--repeated RankInfoWuLiang
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'int32':value	[层数]
			[4] = 'string':name	[昵称]
			[5] = 'int32':level	[等级]
			[6] = 'int32':vipLevel	[VIP等级]
			[7] = 'int32':goodNum	[赞次数]
			[8] = 'int32':power	[战力]
			[9] = {--repeated RankInfoFormation
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
			},
			[10] = 'int32':profession	[头像]
			[11] = 'int32':headPicFrame	[头像边框]
			[12] = 'int32':starHeroRanking	[名人堂排名]
			[13] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':lastValue	[最低入榜层数]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':myBestValue	[我的最佳成绩,用户跟lastValue比较]
		[5] = 'int32':praiseCount	[我自己拥有的赞数量]
	}
--]]
s2c.RANKING_LIST_WU_LIANG = 0x4002

--[[
	[1] = {--GetRebateConvertInfoResponse
		[1] = 'int32':rank	[我的排名]
		[2] = {--repeated RebateConvertInfo
			[1] = 'int32':convertId	[兑换id]
			[2] = 'int32':countNum	[已兑换次数]
		},
	}
--]]
s2c.GET_REBATE_CONVERT_INFO_RESPONSE = 0x6f0c

--[[
	[1] = {--SacrificeByTypeSuccessNotify
		[1] = 'int32':type	[赌石类型,1.试刀;2.切割;4.打磨;8.精工;16.雕琢]
	}
--]]
s2c.SACRIFICE_BY_TYPE_SUCCESS_NOTIFY = 0x3e00

--[[
	[1] = {--SingleBattleArrayReponse
		[1] = {--BattleArrayInfo
			[1] = 'int64':instanceId	[ 阵法唯一ID]
			[2] = 'int32':itemId	[ 道具ID]
			[3] = 'int32':level	[ 强化等级]
			[4] = 'int32':exp	[ 强化经验值]
			[5] = 'int32':star	[ 星级]
			[6] = 'int32':freeNum	[ 免费易位次数]
			[7] = 'repeated int32':position	[ 阵位位置]
			[8] = 'repeated int32':deduceExp
			[9] = 'repeated int32':researchLevel	[深研等级]
			[10] = 'repeated int32':researchRadio	[当前深研进度,发送的是万分比]
			[11] = 'repeated int32':nextRadio	[下级深研进度,发送的是万分比]
		},
		[2] = 'int32':type	[ 1强化 2升星 3易位 4合成 5推演 6合成 7深研]
	}
--]]
s2c.SINGLE_BATTLE_ARRAY_REPONSE = 0x6a01

--[[
	[1] = {--ResponseLingQiTime
		[1] = 'int64':lastGetTime	[上次领取时间]
	}
--]]
s2c.RESPONSE_LING_QI_TIME = 0x3e08

--[[
	[1] = {--RushSweepItems
		[1] = {--repeated CheckpointItems
			[1] = {--repeated BossItem
				[1] = 'int32':type
				[2] = 'int32':itemId
				[3] = 'int32':number
			},
		},
	}
--]]
s2c.RUSH_SWEEP_ITEMS = 0x7607

--[[
	[1] = {--GridElement
		[1] = 'int32':point
		[2] = 'int32':state
		[3] = 'int32':type
		[4] = 'int32':assId
	}
--]]
s2c.GRID_ELEMENT = 0x7604

--[[
	[1] = {--RushCheckPointInfo
		[1] = 'int32':checkpointId
		[2] = 'string':openPoints	["格子_状态|格子_状态|格子_状态"]
		[3] = {--repeated PointElement
			[1] = 'int32':point
			[2] = 'int32':elementId
		},
		[4] = 'string':organ	[attr]
		[5] = 'string':roleState	["id_blood|id_blood"]
	}
--]]
s2c.RUSH_CHECK_POINT_INFO = 0x7602

--[[
	[1] = {--BloodyWarMatixCapacity
		[1] = 'int32':capacity	[战阵的人数上限]
	}
--]]
s2c.BLOODY_WAR_MATIX_CAPACITY = 0x3205

--[[
	[1] = {--GiveUpRushSucess
	}
--]]
s2c.GIVE_UP_RUSH_SUCESS = 0x7605

--[[
	[1] = {--BloodySweepResult
		[1] = {--repeated BloodySweepResultItem
			[1] = 'int32':sectionId	[关卡ID]
			[2] = 'int32':exp	[增加团队经验]
			[3] = 'int32':oldLevel	[原先团队等级]
			[4] = 'int32':currentLevel	[当前团队等级]
			[5] = 'int32':coin	[获得的金币数量]
			[6] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.BLOODY_SWEEP_RESULT = 0x3230

--[[
	[1] = {--ReponseStarLevelDestiny
		[1] = 'int32':star	[星级]
		[2] = 'int32':starLevel	[等级]
		[3] = 'int64':instanceId	[唯一id]
	}
--]]
s2c.REPONSE_STAR_LEVEL_DESTINY = 0x3f08

--[[
	[1] = {--ProvideFriendAssistantSucess
		[1] = 'repeated int32':friendIds	[成功的角色]
	}
--]]
s2c.PROVIDE_FRIEND_ASSISTANT_SUCESS = 0x4311

--[[
	[1] = {--DrawHomeAwardScuess
	}
--]]
s2c.DRAW_HOME_AWARD_SCUESS = 0x7408

--[[
	[1] = {--LongMenBreakStartResponse
	}
--]]
s2c.LONG_MEN_BREAK_START_RESPONSE = 0x6901

--[[
	[1] = {--RolePracticeResult
		[1] = 'int64':userid	[角色实例id]
		[2] = 'int32':starLevel	[角色星级,修炼完成后的新星级,实际上总是+1    //角色星级,修炼完成后的新星级,实际上总是+1]
	}
--]]
s2c.ROLE_PRACTICE_RESULT = 0x1509

--[[
	[1] = {--KnightShareInfo
		[1] = 'int32':leaveTime	[剩余挑战次数]
		[2] = {--repeated KnightShareSingleInfo
			[1] = 'int32':sharePlayerId	[分享玩家ID]
			[2] = {--KnightInfo
				[1] = 'int32':type	[武士类型]
				[2] = 'int32':level	[武士等级]
				[3] = 'int64':timeLeft	[剩余时间]
				[4] = 'int32':leaveTime	[剩餘挑戰次數]
			},
			[3] = 'int32':knightState	[武士状态 0 可挑战 1 挑战中 2 已挑战]
			[4] = {--KnightFightPlayerInfo
				[1] = 'string':name	[玩家名]
				[2] = 'int32':icon	[头像]
			},
			[5] = 'int64':leaveHp	[剩餘血量]
			[6] = 'int64':maxHp	[最大血量]
			[7] = 'int64':instanceId	[武士实例ID]
			[8] = 'string':sharePlayerName	[分享者名字]
			[9] = 'repeated int32':eachHp	[每个NPC血量]
			[10] = 'repeated int32':eachMaxHp	[每个NPC最大血量]
			[11] = {--ChatInfo
				[1] = 'int32':chatType	[聊天类型;1.公共,2.私聊;3.帮派;]
				[2] = 'string':content	[消息;]
				[3] = 'int32':playerId	[说话人的id]
				[4] = 'int32':roleId	[主角角色ID,卡牌ID]
				[5] = 'int32':quality	[说话角色的主角品质]
				[6] = 'string':name	[说话人的名字]
				[7] = 'int32':vipLevel	[VIP等级]
				[8] = 'int32':level	[玩家等级]
				[9] = 'int64':timestamp	[消息发送时间]
				[10] = 'int32':guildId	[公会编号]
				[11] = 'string':guildName	[公会名称]
				[12] = 'int32':competence	[公会职位 1会长 2副会长 3成员]
				[13] = 'repeated int32':invitationGuilds	[邀请过他的公会]
				[14] = 'int32':titleType	[称号类型]
				[15] = 'int32':guideType	[指导员类型]
				[16] = 'int32':icon	[头像]
				[17] = 'int32':headPicFrame	[头像边框]
				[18] = 'int32':serverId
				[19] = 'string':serverName
				[20] = 'int32':audioTime	[语音聊天时间]
				[21] = 'string':audioId	[语音聊天id]
				[22] = 'int32':starHeroRanking	[名人堂排名]
				[23] = 'int32':ladderGrade	[天梯赛段位]
			},
		},
	}
--]]
s2c.KNIGHT_SHARE_INFO = 0x7a04

--[[
	[1] = {--UpdateAllRoleTrainInfo
		[1] = {--repeated UpdateRoleTrainInfo
			[1] = 'int64':instanceId	[角色id]
			[2] = {--repeated AcupointInfo
				[1] = 'int32':position	[穴位位置]
				[2] = 'int32':level	[穴位等级]
				[3] = 'int32':breachLevel	[突破等级]
			},
		},
		[2] = 'int64':lastTime	[最后一次突破时间]
		[3] = 'int32':totalRate	[突破成功概率]
		[4] = 'int32':waitRemain	[概率提升,倒计时剩余时间]
	}
--]]
s2c.UPDATE_ALL_ROLE_TRAIN_INFO = 0x1500

--[[
	[1] = {--RebateConvertRewardResponse
		[1] = 'int32':convertId	[兑换id]
		[2] = 'int32':number	[剩余兑换次数]
	}
--]]
s2c.REBATE_CONVERT_REWARD_RESPONSE = 0x6f0d

--[[
	[1] = {--OpenServiceActivityRewardRecord
		[1] = 'int32':logonDayCount	[登录天数]
		[2] = 'int32':logonReward	[登录奖励领取记录,位运算,低位到高位,每一位表示一个奖励是否领取,0为未领取,领取后为1]
		[3] = 'int32':onlineRewardCount	[当日在线奖励领取次数,取值0-n    //当日在线奖励领取次数,取值0-n]
		[4] = 'string':onlineRewardLastGetTime	[当日最后一次领取奖励的系统时间:yyyy-MM-dd HH:mm:ss    //当日最后一次领取奖励的系统时间:yyyy-MM-dd HH:mm:ss]
		[5] = 'int32':onlineRewardRemainingTimes	[在线奖励剩余等待时间,0表示可以领取]
		[6] = 'int32':teamLevelReward	[团队等级奖励领取记录,位运算,低位到高位,每一位表示一个奖励是否领取,0为未领取,领取后为1]
	}
--]]
s2c.OPEN_SERVICE_ACTIVITY_REWARD_RECORD = 0x3302

--[[
	[1] = {--MyBeRecalledInviteList
		[1] = {--repeated RecallInviteStruct
			[1] = 'int32':playerId	[玩家Id,发起邀请的玩家ID]
			[2] = 'int32':recalledId	[被召回的目标玩家ID]
			[3] = 'int64':luanchTime	[发起召回的系统时间,单位毫秒]
			[4] = 'string':inviteCode	[邀请码,由服务器生成]
		},
	}
--]]
s2c.MY_BE_RECALLED_INVITE_LIST = 0x5321

--[[
	[1] = {--TianJiLunBonusPoolResponse
		[1] = 'int32':jackpot
	}
--]]
s2c.TIAN_JI_LUN_BONUS_POOL_RESPONSE = 0x7504

--[[
	[1] = {--ArenaHomeInfo
		[1] = 'int32':myRank	[当前排名]
		[2] = 'int32':fightPower	[战力]
		[3] = 'int32':challengeTotalCount	[总挑战次数]
		[4] = 'int32':challengeWinCount	[胜利次数]
		[5] = 'int32':bestRank	[最佳排名]
		[6] = 'int32':activeChallenge	[主动挑战次数]
		[7] = 'int32':activeWin	[主动挑战胜利次数]
		[8] = 'int32':continuityWin	[当前连胜次数]
		[9] = 'int32':maxContinuityWin	[最大连胜次数]
	}
--]]
s2c.ARENA_HOME_INFO = 0x1305

--[[
	[1] = {--GamblingItemDetails
		[1] = 'int32':index	[索引,1~N]
		[2] = 'int32':resType	[资源类型]
		[3] = 'int32':resId	[资源ID]
		[4] = 'int32':resNum	[资源数量]
		[5] = 'int64':createTime	[创建时间,单位/秒]
		[6] = 'int64':lastUpdate	[最后更新时间,单位/秒]
	}
--]]
s2c.GAMBLING_ITEM_DETAILS = 0x5805

--[[
	[1] = {--RoleRebirthResult
		[1] = 'int64':userid	[角色实例id]
	}
--]]
s2c.ROLE_REBIRTH_RESULT = 0x1511

--[[
	[1] = {--MountBookResultMsg
		[1] = 'int64':bookObjID	[book实例id]
		[2] = 'int64':roleID	[角色id]
		[3] = 'int32':position	[位置]
	}
--]]
s2c.MOUNT_BOOK_RESULT = 0x1607

--[[
	[1] = {--AcupointBreachResult
		[1] = 'int64':instanceId	[角色实例ID]
		[2] = 'bool':success	[是否成功]
		[3] = {--AcupointInfo
			[1] = 'int32':position	[穴位位置]
			[2] = 'int32':level	[穴位等级]
			[3] = 'int32':breachLevel	[突破等级]
		},
		[4] = 'int64':lastTime	[最后一次突破时间]
		[5] = 'int32':totalRate	[突破成功概率]
		[6] = 'int32':waitRemain	[概率提升,倒计时剩余时间]
	}
--]]
s2c.ACUPOINT_BREACH_RESULT = 0x150a

--[[
	[1] = {--RealNameRewardResult
		[1] = 'int32':getReward	[是否领取了实名奖励 1是0否]
	}
--]]
s2c.REAL_NAME_REWARD_RESULT = 0x1e04

--[[
	[1] = {--TreasureHuntConfigMsg
		[1] = 'string':consumeSycee	[消耗元宝数量]
		[2] = 'int32':isFirstFree	[寻宝一次是否是每天第X次免费  1 1次免费次数  0 没有免费次数]
		[3] = 'string':consumeGoods	[消耗道具id]
		[4] = 'string':boxCount	[额外宝箱达到次数]
		[5] = 'int32':count	[寻宝次数]
		[6] = 'int32':boxIndex	[开启到哪个宝箱]
		[7] = 'int32':round	[当前宝箱轮次]
		[8] = 'int64':actTime	[剩余时间]
		[9] = 'string':scoreReward	[积分奖励"_"隔开]
		[10] = {--repeated TreasureHuntInfoConfig
			[1] = 'int32':id	[奖励id]
			[2] = 'int32':resType	[奖励资源类型]
			[3] = 'int32':resId	[奖励资源ID]
			[4] = 'int32':number	[奖励资源个数]
			[5] = 'int32':quality	[品质 0普通  1精品 2极品 3稀有]
			[6] = 'int32':mulriple	[倍数]
		},
		[11] = {--repeated TreasureHuntBoxConfig
			[1] = 'int32':count	[对应寻宝次数]
			[2] = {--repeated TreasureHuntReward
				[1] = 'int32':resType	[资源类型]
				[2] = 'int32':resId	[资源ID]
				[3] = 'int32':number	[资源个数]
				[4] = 'int32':mulriple	[倍数]
			},
		},
	}
--]]
s2c.TREASURE_HUNT_CONFIG = 0x6300

--[[
	[1] = {--GetHeroDuelMyReportResponse
		[1] = {--repeated HeroDuelMyBattleReport
			[1] = 'string':reportId	[录像ID]
			[2] = 'bool':win	[是否胜利]
			[3] = 'int64':time	[记录时间]
			[4] = 'int32':oldRank	[自己上次排名]
			[5] = 'int32':fromRank	[自己当次排名]
			[6] = 'string':serverName	[目标服务器名称]
			[7] = 'int32':targetGroup	[目标分组]
			[8] = 'string':targetName	[目标名字]
			[9] = 'int32':targetPower	[目标战力]
			[10] = 'string':targetGuildName	[目标帮派名称]
			[11] = 'bool':back	[是否可反击]
			[12] = 'int32':targetId	[目标id]
		},
	}
--]]
s2c.GET_HERO_DUEL_MY_REPORT_RESPONSE = 0x6f08

--[[
	[1] = {--ChatMsgResult
		[1] = 'int32':playerId	[如果是私聊,返回我聊天的人的id]
	}
--]]
s2c.CHAT_MSG_RESULT = 0x1b01

--[[
	[1] = {--MatchFateResult
	}
--]]
s2c.MATCH_FATE_RESULT = 0x5601

--[[
	[1] = {--NewGuildApply
	}
--]]
s2c.NEW_GUILD_APPLY = 0x4418

--[[
	[1] = {--OpenWorldBeast
		[1] = 'int32':blood	[年兽血量]
		[2] = 'int64':lastRefreshTime	[年兽被干掉的时间]
		[3] = {--repeated DropMoney
			[1] = 'int32':index	[元宝下标]
			[2] = 'int32':gameMoney	[元宝数]
		},
	}
--]]
s2c.OPEN_WORLD_BEAST = 0x6107

--[[
	[1] = {--AdventureMassacreRanking
		[1] = {--repeated MassacreInfo
			[1] = 'int32':playerId	[ ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':level	[ 等级]
			[4] = 'int32':power	[ 战斗力]
			[5] = 'int32':profession	[ 头像]
			[6] = 'int32':headPicFrame	[ 头像框]
			[7] = 'int32':massacreValue	[ 杀戮值]
			[8] = 'int32':ranking	[ 排名]
			[9] = {--repeated FormationInfo
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[4] = 'int32':quality	[品质]
			},
			[10] = {--repeated FormationInfo
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[4] = 'int32':quality	[品质]
			},
			[11] = 'int32':secondPower	[ 战斗力]
			[12] = 'int32':starHeroRanking	[名人堂排名]
			[13] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':lastValue	[ 最低入榜排名杀戮值]
		[3] = 'int32':myRanking	[ 我的最佳排名,0表示未入榜]
		[4] = 'int32':myBestValue	[ 我自己的杀戮值]
		[5] = 'repeated int32':challengeId	[ 已挑战过的玩家ID]
	}
--]]
s2c.ADVENTURE_MASSACRE_RANKING = 0x5908

--[[
	[1] = {--UpdateTotalAttrAddInfo
		[1] = 'int32':titleid	[称号id]
		[2] = 'int32':hp	[血量加成]
		[3] = 'int32':neigong	[内功加成]
		[4] = 'int32':waigong	[外功加成]
		[5] = 'int32':neifang	[内防加成]
		[6] = 'int32':waifang	[外防加成]
		[7] = 'int32':hurt	[冰火毒伤加成]
	}
--]]
s2c.UPDATE_TOTAL_ATTR_ADD_INFO = 0x1401

--[[
	[1] = {--RoleAuthenticateRespones
		[1] = 'int32':teamLevel	[团队等级]
		[2] = 'int32':xiaKeCount	[拥有侠客数]
		[3] = 'int32':equipCount	[神品装备数]
		[4] = 'string':serverName	[服务器名字]
		[5] = 'int32':power	[战力]
		[6] = 'int64':bestXiaKe	[最强侠客]
		[7] = 'int32':createTime	[角色创建时间]
		[8] = 'int32':redPacketCount	[发元宝红包的数量]
		[9] = 'int32':powerRank	[战力排名]
		[10] = 'int32':heroRank	[群号普排名]
	}
--]]
s2c.ROLE_AUTHENTICATE_RESPONES = 0x2a01

--[[
	[1] = {--GetRewardResult
		[1] = 'int32':statusCode	[0:正确,其他错误状态码]
		[2] = {--RewardInfo
			[1] = 'int32':type	[0:未知或者普通情况下显示提示的类型;1.豪杰榜;2铜人阵;3.天罡星等----]
			[2] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.GET_REWARD_RESULT = 0x7f00

--[[
	[1] = {--RankingListRecharge
		[1] = {--repeated RankInfoBigCompetInfo
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'string':name	[玩家昵称]
			[3] = 'int32':playerLevel	[玩家等级]
			[4] = 'int32':icon	[头像]
			[5] = 'int32':headPicFrame
			[6] = 'int32':playerId
			[7] = 'int32':curStep
		},
		[2] = 'int32':lastValue	[最低入榜层数]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':step
	}
--]]
s2c.RANKING_LIST_RECHARGE = 0x4086

--[[
	[1] = {--BattleArrayReponse
		[1] = {--repeated BattleArrayInfo
			[1] = 'int64':instanceId	[ 阵法唯一ID]
			[2] = 'int32':itemId	[ 道具ID]
			[3] = 'int32':level	[ 强化等级]
			[4] = 'int32':exp	[ 强化经验值]
			[5] = 'int32':star	[ 星级]
			[6] = 'int32':freeNum	[ 免费易位次数]
			[7] = 'repeated int32':position	[ 阵位位置]
			[8] = 'repeated int32':deduceExp
			[9] = 'repeated int32':researchLevel	[深研等级]
			[10] = 'repeated int32':researchRadio	[当前深研进度,发送的是万分比]
			[11] = 'repeated int32':nextRadio	[下级深研进度,发送的是万分比]
		},
	}
--]]
s2c.BATTLE_ARRAY_REPONSE = 0x6a00

--[[
	[1] = {--UpdateGuildInfoSucess
	}
--]]
s2c.UPDATE_GUILD_INFO_SUCESS = 0x4408

--[[
	[1] = {--LongMenBreakClearResponse
		[1] = 'int32':challengeCount	[ 玩家龙门破挑战次数]
	}
--]]
s2c.LONG_MEN_BREAK_CLEAR_RESPONSE = 0x6907

--[[
	[1] = {--PassBoss
		[1] = 'bool':lastBoss
		[2] = {--repeated BossItem
			[1] = 'int32':type
			[2] = 'int32':itemId
			[3] = 'int32':number
		},
	}
--]]
s2c.PASS_BOSS = 0x7606

--[[
	[1] = {--GetRoleMsg
		[1] = {--repeated RoleInfo
			[1] = 'int64':userid	[ 唯一id]
			[2] = 'int32':id	[ 卡牌的id]
			[3] = 'int32':level	[ 等级]
			[4] = 'int64':curexp	[ 当前经验]
			[5] = 'int32':quality	[品质]
			[6] = 'int32':starlevel	[星级]
			[7] = 'int32':starExp	[星级经验]
			[8] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[9] = {--repeated EquipmentInfo
				[1] = 'int64':userid	[userid  唯一id]
				[2] = 'int32':id	[id]
				[3] = 'int32':level	[level]
				[4] = 'int32':quality	[品质]
				[5] = 'string':base_attr	[基本属性]
				[6] = 'string':extra_attr	[附加属性]
				[7] = 'int32':grow	[成长值]
				[8] = 'int32':holeNum	[宝石孔数]
				[9] = {--repeated GemPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[ id]
				},
				[10] = 'int32':star	[星级]
				[11] = 'int32':starFailFix	[升星失败率修正值]
				[12] = 'int32':refineLevel	[精炼等级]
				[13] = {--repeated Recast
					[1] = 'int32':quality
					[2] = 'int32':ratio
					[3] = 'int32':index
				},
				[14] = 'int32':stepExp
				[15] = 'int32':stepLevel
				[16] = 'int32':throughLevel
			},
			[10] = {--repeated BibleInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':id	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':level	[重级]
				[5] = 'int32':breachLevel	[突破]
				[6] = {--repeated EssentialPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[精要模板id]
				},
				[7] = 'repeated int32':gemId	[ 天书宝石]
				[8] = {--BibleComprehendInfo
					[1] = 'int64':bibleId	[天书id]
					[2] = 'int32':stageId	[阶段id]
					[3] = 'int32':useCount	[参悟丹使用次数]
					[4] = 'int32':reachId	[达成的id]
					[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
					[6] = {--repeated BibleStageInfo
						[1] = 'int32':stage	[阶段id]
						[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
						[3] = 'repeated int32':attIndex	[属性下标]
						[4] = 'repeated int32':value	[属性值]
					},
				},
			},
			[11] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[12] = {--repeated PotentialPracticeInfo
				[1] = 'int64':roleId	[侠客id]
				[2] = 'int32':stage	[阶段]
				[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
				[4] = 'repeated int32':attIndex	[属性下标]
				[5] = 'repeated int32':value	[属性值]
				[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
			},
			[13] = 'int32':skillStarLevel
			[14] = {--repeated HeartMethodEquipInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':itemId	[模板id]
				[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
				[4] = 'int32':practiceId	[x]
				[5] = 'int32':breachId	[突破]
				[6] = {--repeated HeartMethodGem
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':itemId	[ 宝石ID]
				},
				[7] = {--repeated HeartMethodConcise
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 凝练等级]
				},
				[8] = {--repeated HeartMethodRecast
					[1] = 'int32':pos	[ 位置]
					[2] = 'int32':level	[ 重铸等级]
				},
			},
			[15] = {--repeated DestinyEquipDataInfo
				[1] = 'int64':instanceId	[唯一id]
				[2] = 'int32':templateId	[模板id]
				[3] = 'int64':roleId	[装备的角色id]
				[4] = 'int32':pos	[装备位置]
				[5] = 'int32':level	[等级]
				[6] = 'int32':stepExp	[经验]
				[7] = 'int32':quality	[品质]
				[8] = 'int32':type
				[9] = 'int32':star	[星级]
				[10] = 'int32':starLevel	[等级]
			},
		},
	}
--]]
s2c.GET_ROLE = 0x0e01

--[[
	[1] = {--DrawActivityReward
	}
--]]
s2c.DRAW_ACTIVITY_REWARD = 0x3801

--[[
	[1] = {--HeartMethodSell
		[1] = 'repeated int64':instanceId	[ 出售的心法唯一id]
	}
--]]
s2c.HEART_METHOD_SELL = 0x7b08

--[[
	[1] = {--RoleBreakthroughResult
		[1] = 'int64':userid	[角色实例id]
		[2] = 'int32':quality	[品质]
	}
--]]
s2c.ROLE_BREAKTHROUGH_RESULT = 0x1505

--[[
	[1] = {--AllHeartMethodInfo
		[1] = {--repeated HeartMethodInfo
			[1] = 'int64':instanceId	[ 心法id]
			[2] = 'int32':itemId	[ 模板id]
			[3] = 'int32':practiceId	[  修炼id]
			[4] = 'int32':breachId	[ 突破ID]
			[5] = 'bool':isXinfa	[ true 心法, false 心法碎片]
			[6] = 'int32':number	[数量]
			[7] = {--repeated HeartMethodGemInfo
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':itemId	[ 宝石ID]
			},
			[8] = {--repeated HeartMethodConciseInfo
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':level	[ 凝练等级]
			},
			[9] = {--repeated HeartMethodRecastInfo
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':level	[ 重铸等级]
			},
		},
	}
--]]
s2c.ALL_HEART_METHOD_INFO = 0x7b01

--[[
	[1] = {--UpdateRebateTurntable
		[1] = 'int32':number	[剩余抽奖次数]
	}
--]]
s2c.UPDATE_REBATE_TURNTABLE = 0x7d04

--[[
	[1] = {--FactionSwithList
		[1] = {--repeated FactionSwith
			[1] = 'int32':factionId	[ 运营活动ID;1御膳房; 2邀请码;3龙门镖局 ;4护驾 ;5月卡;]
			[2] = 'bool':isOpen	[是否开启]
		},
	}
--]]
s2c.FACTION_SWITH_LIST = 0x2503

--[[
	[1] = {--GuildGiveRecordResponse
		[1] = {--repeated GuildGiveRecordInfo
			[1] = 'int32':playerId	[玩家id]
			[2] = 'string':playerName	[玩家名字]
			[3] = 'int32':type	[类型]
			[4] = 'int32':templateId	[物品模版]
			[5] = 'int32':num	[数量]
			[6] = 'int32':time	[时间]
		},
	}
--]]
s2c.GUILD_GIVE_RECORD_RESPONSE = 0x4c05

--[[
	[1] = {--GetRebateTurntableRecordResponse
		[1] = {--repeated RebateTurntableRecord
			[1] = 'int32':type	[资源类型]
			[2] = 'int32':itemId	[资源id]
			[3] = 'int32':number	[资源数量]
			[4] = 'int64':gainTime	[获得时间]
		},
		[2] = 'bool':cover	[是否覆盖]
	}
--]]
s2c.GET_REBATE_TURNTABLE_RECORD_RESPONSE = 0x7d01

--[[
	[1] = {--WorshipReult
	}
--]]
s2c.WORSHIP_REULT = 0x440d

--[[
	[1] = {--AdventureEventFresh
		[1] = 'repeated int32':eventId	[奇遇事件id]
	}
--]]
s2c.ADVENTURE_EVENT_FRESH = 0x5916

--[[
	[1] = {--RankingListShenBing
		[1] = {--repeated RankInfoShenBing
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'int64':instanceId	[装备实例ID]
			[4] = 'int32':goodsId	[装备模版ID,卡牌ID,对应t_s_goods表格的id字段]
			[5] = 'int32':value	[战力]
			[6] = 'string':name	[玩家昵称]
			[7] = 'int32':playerLevel	[玩家等级]
			[8] = 'int32':vipLevel	[VIP等级]
			[9] = 'int32':goodNum	[赞次数]
			[10] = 'int32':intensifyLevel	[强化等级]
			[11] = 'int32':starLevel	[星级等级]
			[12] = 'int32':gemId	[镶嵌的宝石ID,对应t_s_goods表格ID字段]
			[13] = 'string':baseAttribute	[装备基础属性]
			[14] = 'string':extraAttribute	[装备附加属性]
			[15] = 'int32':profession	[头像]
			[16] = 'int32':headPicFrame	[头像边框]
			[17] = 'int32':starHeroRanking	[名人堂排名]
			[18] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':lastValue	[最低入榜层数]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':myBestValue	[我的最佳成绩,用户跟lastValue比较]
		[5] = 'int64':topInstanceId	[装备实例ID]
		[6] = 'int32':topGoodsId	[装备模版ID,卡牌ID,对应t_s_goods表格的id字段]
		[7] = 'int32':praiseCount	[我自己拥有的赞数量]
	}
--]]
s2c.RANKING_LIST_SHEN_BING = 0x4004

--[[
	[1] = {--FreshEggRankResult
		[1] = {--EggRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
		[2] = {--repeated EggRankInfo
			[1] = 'int32':rank	[排行]
			[2] = 'string':name	[玩家名]
			[3] = 'int32':score	[积分]
			[4] = 'string':serverName	[服务器名称]
		},
	}
--]]
s2c.FRESH_EGG_RANK_RESULT = 0x4704

--[[
	[1] = {--EmployRoleCount
		[1] = 'int32':playerId	[玩家ID]
		[2] = 'int32':todayCount	[今日雇佣次数]
		[3] = 'int32':totalCount	[历史雇佣次数]
		[4] = 'int64':createTime	[第一次雇佣时间]
		[5] = 'int64':lastUpdate	[最后一次雇佣时间]
		[6] = 'int64':instanceId	[角色实例ID]
	}
--]]
s2c.EMPLOY_ROLE_COUNT = 0x5113

--[[
	[1] = {--SacrificeStateDetails
		[1] = 'int32':enableType	[激活的赌石按钮,位运算存储:1.试刀;2.切割;4.打磨;8.精工;16.雕琢]
		[2] = 'int32':betToday	[今日赌石次数]
		[3] = 'int32':betTotal	[总赌石次数]
		[4] = 'int64':lastUpdate	[最后赌石时间]
	}
--]]
s2c.SACRIFICE_STATE_DETAILS = 0x3e07

--[[
	[1] = {--ServerSwitchInfo
		[1] = 'int32':switchType	[switchType]
		[2] = 'bool':open	[开启状态,true:开启,false:关闭]
		[3] = 'int64':beginTime	[开始时间]
		[4] = 'int64':endTime	[结束时间]
	}
--]]
s2c.SERVER_SWITCH_INFO = 0x3601

--[[
	[1] = {--RankingListArena
		[1] = {--repeated RankInfoArena
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'int32':power	[战力]
			[4] = 'string':name	[昵称]
			[5] = 'int32':level	[等级]
			[6] = 'int32':vipLevel	[VIP等级]
			[7] = 'int32':totalChallenge	[总挑战次数]
			[8] = 'int32':totalWin	[总胜利次数]
			[9] = 'int32':goodNum	[赞次数]
			[10] = {--repeated RankInfoFormation
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
			},
			[11] = 'int32':profession	[头像]
			[12] = 'int32':headPicFrame	[头像边框]
			[13] = 'int32':starHeroRanking	[名人堂排名]
			[14] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':lastValue	[最低入榜单排名]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':myBestValue	[我的最佳成绩,用户跟lastValue比较]
		[5] = 'int32':praiseCount	[我自己拥有的赞数量]
	}
--]]
s2c.RANKING_LIST_ARENA = 0x4001

--[[
	[1] = {--RankListGuildLevel
		[1] = {--repeated GuildRankInfo
			[1] = 'int32':guildId	[公会编号]
			[2] = 'int32':exp	[经验]
			[3] = 'string':name	[名称]
			[4] = 'int32':memberCount	[成员数量]
			[5] = 'string':presidentName	[会长名称]
			[6] = 'int32':power	[总战斗力]
			[7] = 'string':declaration	[宣言]
			[8] = 'int32':level
			[9] = 'bool':apply	[是否申请过]
		},
	}
--]]
s2c.RANK_LIST_GUILD_LEVEL = 0x4080

--[[
	[1] = {--PraiseSuccess
		[1] = 'int32':targetId	[目标玩家ID]
	}
--]]
s2c.PRAISE_SUCCESS = 0x4060

--[[
	[1] = {--AdventureInterface
		[1] = {--repeated AdventurePlayerInfo
			[1] = 'int32':id	[ ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':level	[ 等级]
			[4] = 'int32':power	[ 战斗力]
			[5] = 'int32':icon	[ 头像]
			[6] = 'int32':headPicFrame	[ 头像框]
			[7] = 'string':guildName	[ 帮派名称]
			[8] = 'int32':massacreValue	[ 杀戮值]
			[9] = 'int32':rewardMassacre	[ 杀戮值奖励]
			[10] = 'int32':rewardCoin	[ 铜币奖励]
			[11] = 'int32':rewardExperience	[ 阅历奖励]
			[12] = {--repeated FormationInfo
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[4] = 'int32':quality	[品质]
			},
			[13] = {--repeated FormationInfo
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[4] = 'int32':quality	[品质]
			},
			[14] = 'int32':secondPower	[ 战斗力]
			[15] = 'int32':starHeroRanking	[名人堂排名]
			[16] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'repeated int32':eventId	[ 事件ID]
		[3] = 'int64':refresheventTime	[ 时间刷新时间]
		[4] = 'int64':refreshOpponentTime	[ 玩家刷新倒计时]
		[5] = 'int32':experience	[ 阅历]
	}
--]]
s2c.ADVENTURE_INTERFACE = 0x5900

--[[
	[1] = {--RecruitIntegralOutlineRankList
		[1] = 'int32':last	[最低入榜积分]
		[2] = 'int32':myIntegral	[我的积分,0表示未入榜]
		[3] = 'int32':myRanking	[我的排名,0表示未入榜,1~N]
		[4] = 'int32':betterRewardValue	[更好的奖励的积分,如果为0表示没有更好的了]
		[5] = 'int32':rewardId	[当前奖励ID]
		[6] = {--repeated RecruitIntegralOutline
			[1] = 'int32':rewardIndex	[奖励索引,1~N]
			[2] = 'int32':minIntegral	[最小积分]
			[3] = 'int32':maxIntegral	[最大积分]
		},
	}
--]]
s2c.RECRUIT_INTEGRAL_OUTLINE_RANK_LIST = 0x4011

--[[
	[1] = {--RankingListWorldBoss
		[1] = {--repeated RankInfoWorldBoss
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'int32':power	[战力]
			[4] = 'string':name	[昵称]
			[5] = 'int32':level	[等级]
			[6] = 'int32':vipLevel	[VIP等级]
			[7] = 'int32':goodNum	[赞次数]
			[8] = {--repeated RankInfoFormation
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
			},
			[9] = 'int64':totalDamage	[总伤害]
			[10] = 'int32':replayId	[录像编号]
			[11] = 'int32':profession	[头像]
			[12] = 'int32':headPicFrame	[头像边框]
			[13] = 'int32':starHeroRanking	[名人堂排名]
			[14] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int64':last	[最低入榜排名总伤害]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int64':myBestValue	[我的最佳成绩,用户跟lastValue比较]
		[5] = 'int32':praiseCount	[我自己拥有的赞数量]
		[6] = 'int32':betterRewardValue	[更好的奖励的总伤害,如果为0表示没有更好的了]
		[7] = 'int32':rewardId	[当前奖励ID]
	}
--]]
s2c.RANKING_LIST_WORLD_BOSS = 0x4005

--[[
	[1] = {--GuildInfo
		[1] = 'int32':guildId	[公会编号]
		[2] = 'int32':exp	[经验]
		[3] = 'string':name	[名称]
		[4] = 'int32':memberCount	[成员数量]
		[5] = 'string':presidentName	[会长名称]
		[6] = 'int32':power	[总战斗力]
		[7] = 'string':declaration	[宣言]
		[8] = 'int32':level	[等级]
		[9] = 'string':notice	[公告]
		[10] = 'int32':boom	[繁荣度]
		[11] = 'int32':state	[状态 0正常 1正在禅让 2 正在解散 3正在弹劾]
		[12] = 'int32':operateId	[操作人编号]
		[13] = 'int64':operateTime	[操作结束时间]
		[14] = 'bool':apply
		[15] = 'string':bannerId	[帮派旗帜]
	}
--]]
s2c.GUILD_INFO = 0x4406

--[[
	[1] = {--GuildCheckpointRankInfos
		[1] = {--repeated GuildCheckpointRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':level
			[4] = 'int32':profession
			[5] = 'int32':hurt
			[6] = 'int32':icon	[头像]
			[7] = 'int32':headPicFrame	[头像边框]
			[8] = 'int32':starHeroRanking	[名人堂排名]
			[9] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':totleHurt
	}
--]]
s2c.GUILD_CHECKPOINT_RANK_INFOS = 0x4083

--[[
	[1] = {--EventResetMsg
	}
--]]
s2c.EVENT_RESET = 0x7f11

--[[
	[1] = {--RebateTurntableResponse
		[1] = 'int32':index	[物品下标]
	}
--]]
s2c.REBATE_TURNTABLE_RESPONSE = 0x7d03

--[[
	[1] = {--Dining
		[1] = 'int32':power	[ 获得体力]
	}
--]]
s2c.DINING = 0x2502

--[[
	[1] = {--EscortingInfo
		[1] = 'int32':type	[护驾类型]
		[2] = 'int32':days	[当前已经护驾的天数]
		[3] = 'int32':times	[当天护驾次数]
		[4] = 'int32':remainWaitTime	[剩余等待时间,0表示可护驾]
	}
--]]
s2c.ESCORTING_INFO = 0x2901

--[[
	[1] = {--NotiveHeroDuelStatus
		[1] = 'int32':status	[0未开启,1开启,2结束]
		[2] = 'bool':box	[是否有宝箱奖励]
		[3] = 'bool':settlement	[是否有结算奖励]
	}
--]]
s2c.NOTIVE_HERO_DUEL_STATUS = 0x6f0e

--[[
	[1] = {--BattlePetFreeResponse
		[1] = 'repeated int64':instanceId	[战宠id]
	}
--]]
s2c.BATTLE_PET_FREE_RESPONSE = 0x4f05

--[[
	[1] = {--DriveBeast
		[1] = 'int32':index	[掉落的元宝下标]
		[2] = 'int32':isEscape	[是否逃跑  0是没有逃跑,1是刷到其他人那里去了,2是赶跑了]
	}
--]]
s2c.DRIVE_BEAST = 0x6102

--[[
	[1] = {--EmploySingleRoleSuccess
		[1] = 'int32':playerId	[雇佣的角色属于哪个玩家]
		[2] = 'int64':instanceId	[角色实例ID]
		[3] = 'int32':useType	[使用类型,客户端定义,这里可以是战斗类型]
	}
--]]
s2c.EMPLOY_SINGLE_ROLE_SUCCESS = 0x5120

--[[
	[1] = {--NotifyRecallTaskFinish
		[1] = 'int32':taskid	[成就id]
	}
--]]
s2c.NOTIFY_RECALL_TASK_FINISH = 0x5302

--[[
	[1] = {--QueryQimenMsgResult
		[1] = 'int32':id	[奇门编号]
		[2] = 'int32':breachLevel	[突破等级]
	}
--]]
s2c.QUERY_QIMEN_MSG_RESULT = 0x5200

--[[
	[1] = {--TianGangChallengeResult
		[1] = 'bool':win	[ 是否挑战胜利]
	}
--]]
s2c.TIAN_GANG_CHALLENGE_RESULT = 0x1310

--[[
	[1] = {--GetTGEnemyDetailsResult
		[1] = {--OtherPlayerDetails
			[1] = 'int32':playerId	[玩家id]
			[2] = 'int32':profession	[职业]
			[3] = 'string':name	[昵称]
			[4] = 'int32':level	[等级]
			[5] = 'int32':vipLevel	[vip等级]
			[6] = 'int32':power	[战力]
			[7] = {--repeated RoleDetails
				[1] = 'int32':id	[ 卡牌的id]
				[2] = 'int32':level	[ 等级]
				[3] = 'int64':curexp	[ 当前经验]
				[4] = 'int32':power	[战力]
				[5] = 'string':attributes	[属性字符串]
				[6] = 'int32':warIndex	[战阵位置信息]
				[7] = {--repeated SimpleRoleEquipment
					[1] = 'int32':id	[ id]
					[2] = 'int32':level	[ level]
					[3] = 'int32':quality	[品质]
					[4] = 'int32':refineLevel	[精炼等级]
					[5] = {--repeated GemPos
						[1] = 'int32':pos	[ pos]
						[2] = 'int32':id	[ id]
					},
					[6] = {--repeated Recast
						[1] = 'int32':quality
						[2] = 'int32':ratio
						[3] = 'int32':index
					},
					[7] = 'int32':stepExp
					[8] = 'int32':stepLevel
					[9] = 'int32':throughLevel
				},
				[8] = {--repeated SimpleBook
					[1] = 'int32':templateId	[ 秘籍模板ID]
					[2] = 'int32':level	[ 等级]
					[3] = 'int32':attribute	[属性值]
				},
				[9] = {--repeated SimpleMeridians
					[1] = 'int32':index	[ 经脉位置,1~N]
					[2] = 'int32':level	[ 等级]
					[3] = 'int32':attribute	[属性值]
				},
				[10] = 'int32':starlevel	[ 星级]
				[11] = 'repeated int32':fateIds	[ 拥有缘分]
				[12] = {--repeated SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[13] = 'int32':quality	[品质]
				[14] = 'int32':martialLevel	[武学等级]
				[15] = {--repeated OtherMartialInfo
					[1] = 'int32':id	[武学id]
					[2] = 'int32':position	[装备位置]
					[3] = 'int32':enchantLevel	[附魔等级]
				},
				[16] = 'string':immune	[免疫概率]
				[17] = 'string':effectActive	[效果影响主动]
				[18] = 'string':effectPassive	[效果影响被动]
				[19] = {--repeated BibleInfo
					[1] = 'int64':instanceId	[唯一id]
					[2] = 'int32':id	[模板id]
					[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
					[4] = 'int32':level	[重级]
					[5] = 'int32':breachLevel	[突破]
					[6] = {--repeated EssentialPos
						[1] = 'int32':pos	[ pos]
						[2] = 'int32':id	[精要模板id]
					},
					[7] = 'repeated int32':gemId	[ 天书宝石]
					[8] = {--BibleComprehendInfo
						[1] = 'int64':bibleId	[天书id]
						[2] = 'int32':stageId	[阶段id]
						[3] = 'int32':useCount	[参悟丹使用次数]
						[4] = 'int32':reachId	[达成的id]
						[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
						[6] = {--repeated BibleStageInfo
							[1] = 'int32':stage	[阶段id]
							[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
							[3] = 'repeated int32':attIndex	[属性下标]
							[4] = 'repeated int32':value	[属性值]
						},
					},
				},
				[20] = 'int32':forgingQuality	[角色最高炼体品质]
				[21] = 'int32':skillStarLevel
				[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
				[23] = {--repeated BiblePracticeData
					[1] = 'int32':position	[ 位置]
					[2] = 'int32':level	[ 等级]
				},
				[24] = 'bool':equipHide	[是否隐藏装备信息]
				[25] = {--repeated HeartMethodEquipInfo
					[1] = 'int64':instanceId	[唯一id]
					[2] = 'int32':itemId	[模板id]
					[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
					[4] = 'int32':practiceId	[x]
					[5] = 'int32':breachId	[突破]
					[6] = {--repeated HeartMethodGem
						[1] = 'int32':pos	[ 位置]
						[2] = 'int32':itemId	[ 宝石ID]
					},
					[7] = {--repeated HeartMethodConcise
						[1] = 'int32':pos	[ 位置]
						[2] = 'int32':level	[ 凝练等级]
					},
					[8] = {--repeated HeartMethodRecast
						[1] = 'int32':pos	[ 位置]
						[2] = 'int32':level	[ 重铸等级]
					},
				},
			},
			[8] = {--repeated LeadingRoleSpell
				[1] = {--SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[2] = 'bool':choice	[是否选中]
				[3] = 'int32':sid	[法术的种类ID,一种法术有多个等级,但是统一法术SID一致]
			},
			[9] = 'int32':icon	[头像]
			[10] = 'int32':headPicFrame	[正在使用的头像框]
			[11] = 'int32':starHeroRanking	[名人堂排名]
			[12] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':starshards	[可掠夺的星辰碎片数量]
	}
--]]
s2c.GET_TGENEMY_DETAILS_RESULT = 0x1315

--[[
	[1] = {--UpadteChampionsStatus
		[1] = 'int32':status	[状态 1没开始 2准备状态 3正在进行 4已结束]
	}
--]]
s2c.UPADTE_CHAMPIONS_STATUS = 0x4507

--[[
	[1] = {--GetMyTGTimeResult
		[1] = 'int32':times	[剩余次数]
	}
--]]
s2c.GET_MY_TGTIME_RESULT = 0x1314

--[[
	[1] = {--TianGangRankInfo
		[1] = 'int32':level	[/天罡等级;]
		[2] = {--repeated TianGangRankRoleInfo
			[1] = 'int32':rank	[/位置;]
			[2] = {--OtherPlayerBaseInfo
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':profession	[职业]
				[3] = {--Sex(enum)
					'v4':Sex
				},
				[4] = 'string':name	[昵称]
				[5] = 'int32':level	[等级]
				[6] = 'int32':power	[总战力]
			},
		},
	}
--]]
s2c.TIAN_GANG_RANK_INFO = 0x1311

--[[
	[1] = {--ExchangeRewardReponse
		[1] = {--repeated ExchangeInfo
			[1] = 'int32':exchangeId	[兑换条目id]
			[2] = 'int32':count	[活动兑换剩余次数]
		},
	}
--]]
s2c.EXCHANGE_REWARD_REPONSE = 0x7e03

--[[
	[1] = {--ArenaBestUpdate
		[1] = 'int32':oldRank	[旧的最佳排名]
		[2] = 'int32':currentRank	[当前最佳排名]
		[3] = 'int32':walk	[提升的名次]
		[4] = 'int32':sycee	[获得的元宝数量]
	}
--]]
s2c.ARENA_BEST_UPDATE = 0x1307

--[[
	[1] = {--SucessFriendExec
		[1] = 'repeated int32':playerIds	[成功的玩家编号]
		[2] = 'int32':type	[类型 1 :处理好友申请 2:赠送礼物 3:领取礼物 4:删除好友 5:新的礼物 6:有好友删除,7有新的助战礼物 , 8 领取助战礼物成功]
	}
--]]
s2c.SUCESS_FRIEND_EXEC = 0x4304

--[[
	[1] = {--GetMyTGRankResult
		[1] = 'bool':hasrank	[/是否有排名;]
		[2] = {--MyTGRankInfo
			[1] = 'int32':level	[/天罡等级;]
			[2] = 'int32':rank	[/天罡排名;]
			[3] = 'int32':reward	[/可领取多少次奖励;]
			[4] = 'int32':nexttime	[/获取下次奖励时间;]
		},
	}
--]]
s2c.GET_MY_TGRANK_RESULT = 0x1312

--[[
	[1] = {--ReportPlayerResult
	}
--]]
s2c.REPORT_PLAYER_RESULT = 0x7f31

--[[
	[1] = {--ApplySimpleInfo
		[1] = {--repeated SimpleCrossGuildInfo
			[1] = 'int32':count
			[2] = {--CrossGuildInfo
				[1] = 'int32':guildId	[公会编号]
				[2] = 'string':guildName	[公会名称]
				[3] = 'string':bannerId	[公会旗帜]
				[4] = 'string':serverName	[服务器名称]
				[5] = 'int32':score	[积分]
				[6] = 'int32':winCount	[胜场]
				[7] = 'int32':lostCount	[负场]
				[8] = 'int32':cityId
			},
		},
		[2] = 'int32':cityId
	}
--]]
s2c.APPLY_SIMPLE_INFO = 0x443f

--[[
	[1] = {--FormationPower
		[1] = 'int32':power
	}
--]]
s2c.FORMATION_POWER = 0x6702

--[[
	[1] = {--PotentialPracticeResponse
		[1] = {--PotentialPracticeInfo
			[1] = 'int64':roleId	[侠客id]
			[2] = 'int32':stage	[阶段]
			[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
			[4] = 'repeated int32':attIndex	[属性下标]
			[5] = 'repeated int32':value	[属性值]
			[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
		},
	}
--]]
s2c.POTENTIAL_PRACTICE_RESPONSE = 0x6800

--[[
	[1] = {--MonthCardMarkReponse
		[1] = 'repeated int32':mark	[ 0多倍未使用 1多倍已使用]
	}
--]]
s2c.MONTH_CARD_MARK_REPONSE = 0x0e9c

--[[
	[1] = {--RankingListE
		[1] = {--repeated RankInfoBigCompetInfo
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'string':name	[玩家昵称]
			[3] = 'int32':playerLevel	[玩家等级]
			[4] = 'int32':icon	[头像]
			[5] = 'int32':headPicFrame
			[6] = 'int32':playerId
			[7] = 'int32':curStep
		},
		[2] = 'int32':lastValue	[最低入榜层数]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':step
	}
--]]
s2c.RANKING_LIST_E = 0x4087

--[[
	[1] = {--PlayReplayArenaTopSuccess
		[1] = {--FightBeginMsg
			[1] = 'int32':fighttype
			[2] = 'int32':angerSelf
			[3] = 'int32':angerEnemy
			[4] = {--repeated FightRole
				[1] = 'int32':typeid	[角色类型:1.玩家拥有角色;2.NPC]
				[2] = 'int32':roleId	[卡牌角色id,npc为t_s_npc_instance表格配置的ID,其他为t_s_role表格id]
				[3] = 'int32':maxhp	[最大满血量]
				[4] = 'int32':posindex	[位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35    //位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35]
				[5] = 'int32':level	[等级]
				[6] = 'repeated int32':attr	[属性]
				[7] = {--SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[8] = {--repeated SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[9] = 'string':name	[角色名称,只有主角才发送]
				[10] = 'string':immune	[免疫属性]
				[11] = 'string':effectActive	[效果影响主动]
				[12] = 'string':effectPassive	[效果影响被动]
				[13] = 'int32':anger	[角色怒气]
			},
			[5] = 'int32':index	[战斗场次]
			[6] = 'int32':myBattlearrayId	[ 我的阵法模板ID]
			[7] = 'int32':enemyBattlearrayId	[ 对方的阵法模板ID]
			[8] = 'string':suppress	[战力压制比(左方_右方)    //战力压制比(左方_右方)]
		},
		[2] = {--FightDataMsg
			[1] = 'int32':fighttype	[战斗类型.1:推图;2:铜人阵;3:豪杰榜;4:天罡星]
			[2] = 'bool':win	[战斗是否在客户端判断为胜利]
			[3] = {--repeated FightAction
				[1] = 'bool':bManualAction	[是否主动技能]
				[2] = 'int32':roundIndex	[当前回合]
				[3] = 'int32':attackerpos	[攻击者位置]
				[4] = 'int32':skillid	[技能id]
				[5] = 'int32':skillLevel	[技能id]
				[6] = 'bool':bBackAttack	[是否反击]
				[7] = {--repeated TargetInfo
					[1] = 'int32':targetpos	[受击者位置]
					[2] = 'int32':effect	[受击效果]
					[3] = 'int32':hurt	[受击伤害]
					[4] = 'int32':triggerBufferID	[触发bufferID]
					[5] = 'int32':triggerBufferLevel	[触发bufferID]
					[6] = 'int32':passiveEffect	[被动效果类型]
					[7] = 'int32':passiveEffectValue	[被动效果值]
					[8] = 'int32':activeEffect	[主动效果类型]
					[9] = 'int32':activeEffectValue	[主动效果值]
				},
				[8] = {--repeated StateInfo
					[1] = 'int32':frompos	[状态产生自谁行为发起者还是目标]
					[2] = 'int32':targetpos	[获得状态的目标]
					[3] = 'int32':stateId	[触发的状态ID,触发了哪个状态.始终是frompos对应角色身上的状态列表中的状态]
					[4] = 'int32':skillId	[状态时由哪个技能触发的.始终是frompos对应角色身上的技能]
					[5] = 'int32':skillLevel	[状态时由哪个技能触发的.始终是frompos对应角色身上的技能]
					[6] = 'int32':bufferId	[targetpos的角色获得的状态ID]
					[7] = 'int32':bufferLevel	[targetpos的角色获得的状态ID]
				},
				[9] = 'int32':triggerType	[触发技能类型]
			},
			[4] = {--repeated LiveRole
				[1] = 'int32':posindex	[位置]
				[2] = 'int32':currhp	[剩余血量]
				[3] = 'int32':anger
			},
			[5] = 'int32':angerSelf	[己方怒气]
			[6] = 'int32':angerEnemy	[对方怒气]
			[7] = {--repeated RoleHurtCount
				[1] = 'int32':posindex	[位置]
				[2] = 'int32':hurt	[伤害计算]
			},
		},
		[3] = 'int32':rank	[群豪谱排名]
	}
--]]
s2c.PLAY_REPLAY_ARENA_TOP_SUCCESS = 0x1d41

--[[
	[1] = {--GetCardNotify
		[1] = 'string':playerName	[玩家名字]
		[2] = 'int32':cardId	[获得卡牌id]
	}
--]]
s2c.GET_CARD_NOTIFY = 0x1d00

--[[
	[1] = {--PotentialPracticeReplaceResponse
		[1] = {--repeated PotentialPracticeInfo
			[1] = 'int64':roleId	[侠客id]
			[2] = 'int32':stage	[阶段]
			[3] = 'int32':open	[是否开启(0:未开启 1:开启)    //是否开启(0:未开启 1:开启)]
			[4] = 'repeated int32':attIndex	[属性下标]
			[5] = 'repeated int32':value	[属性值]
			[6] = 'repeated int32':isLock	[是否锁住(0:未锁住 1:锁住)    //是否锁住(0:未锁住 1:锁住)]
		},
		[2] = 'repeated int32':isResetChange	[是否重置潜修数据]
	}
--]]
s2c.POTENTIAL_PRACTICE_REPLACE_RESPONSE = 0x6801

--[[
	[1] = {--HeroDuelRankScoreUpdate
		[1] = 'int32':myScore	[我的积分]
		[2] = 'int32':myRank	[我的排名]
	}
--]]
s2c.HERO_DUEL_RANK_SCORE_UPDATE = 0x6f11

--[[
	[1] = {--OpenPeakReponse
		[1] = 'int32':layer	[ 层数 层数为0的时候 为默认打开论剑峰]
		[2] = {--repeated PeakInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'int32':serverId	[ 服务器ID]
			[3] = 'string':name	[ 玩家名字]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':power	[ 战斗力]
			[6] = 'int32':pos	[ 位置]
			[7] = 'int32':layer	[ 层数]
			[8] = 'int32':useIcon	[ 正在使用的头像]
			[9] = 'int32':headPicFrame	[ 正在使用的头像框]
			[10] = 'string':guildName	[ 帮派名称]
			[11] = 'int32':starHeroRanking	[名人堂排名]
		},
		[3] = {--repeated GuildpeakInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'int32':serverId	[ 服务器ID]
			[3] = 'string':name	[ 玩家名字]
			[4] = 'int32':layer	[ 层数]
			[5] = 'int32':useIcon	[正在使用的头像]
			[6] = 'int32':headPicFrame	[正在使用的头像框]
			[7] = 'int32':starHeroRanking	[名人堂排名]
		},
		[4] = {--MyPeakInfo
			[1] = 'int32':serverId	[ 服务器ID]
			[2] = 'string':serverName	[ 服务器名字]
			[3] = 'int32':pos	[ 位置]
			[4] = 'int32':layer	[ 层数]
			[5] = 'int64':startTime	[ 占领开始时间 毫秒值]
			[6] = 'int32':challenge	[ 挑战次数]
			[7] = 'int64':settleTime	[ 结算时间]
			[8] = 'int64':unitedTime	[ 众志成城开始时间]
			[9] = 'int32':unitedTotalIntegral	[ 众志成城总积分]
			[10] = 'int32':unitedIntegral	[ 众志成城积分]
			[11] = 'int32':integral	[ 我的积分]
		},
		[5] = {--repeated UnitedInfo
			[1] = 'int32':layer	[ 众志成城层数]
			[2] = 'int64':unitedTime	[ 众志成城开始时间]
			[3] = 'int32':serverId	[ 服务器ID]
			[4] = 'string':serverName	[ 服务器名字]
		},
		[6] = 'int32':page	[ 页]
	}
--]]
s2c.OPEN_PEAK_REPONSE = 0x7100

--[[
	[1] = {--BibleNoteResult
		[1] = 'int32':result	[是否成功]
		[2] = {--BibleNoteConfig
			[1] = 'int64':bibleId	[天书id]
			[2] = 'int32':noteChapterId	[注解章节id]
			[3] = 'int32':noteFloorId	[注解层数id]
			[4] = 'int64':BibleKeyId	[天书秘钥id]
		},
	}
--]]
s2c.BIBLE_NOTE_RESULT = 0x6023

--[[
	[1] = {--MyActiveRecallInviteList
		[1] = {--repeated RecallInviteStruct
			[1] = 'int32':playerId	[玩家Id,发起邀请的玩家ID]
			[2] = 'int32':recalledId	[被召回的目标玩家ID]
			[3] = 'int64':luanchTime	[发起召回的系统时间,单位毫秒]
			[4] = 'string':inviteCode	[邀请码,由服务器生成]
		},
		[2] = 'repeated int32':playerIds	[回归过的好友]
	}
--]]
s2c.MY_ACTIVE_RECALL_INVITE_LIST = 0x5322

--[[
	[1] = {--ExcavateComplateNotifyMsg
		[1] = 'int32':type	[宝藏类型.1:连城宝藏;2:闯王宝藏;3:大清龙脉]
		[2] = 'int32':index	[挖掘点位置索引.1--n    //挖掘点位置索引.1--n]
		[3] = {--repeated MiningPointProduct
			[1] = 'int32':resType	[资源类型]
			[2] = 'int32':resId	[资源ID]
			[3] = 'int32':number	[数量]
		},
	}
--]]
s2c.EXCAVATE_COMPLATE_NOTIFY = 0x2207

--[[
	[1] = {--MyTeamReponse
		[1] = 'int32':status	[ 状态 0筹备状态 1战斗状态 2已经结束(抽奖)3无队伍    // 状态 0筹备状态 1战斗状态 2已经结束(抽奖)3无队伍]
		[2] = {--CopyTeamInfo
			[1] = 'int64':teamId	[ 队伍唯一标识]
			[2] = 'int64':createTime	[ 创建时间]
			[3] = 'int32':chapterId	[ 章节ID]
			[4] = 'int32':leader	[ 队长ID]
			[5] = {--repeated CopyTeamMemberInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家名称]
				[3] = 'int32':power	[ 战斗力]
				[4] = 'int32':useIcon	[ 头像]
				[5] = 'int32':frameId	[ 头像框]
				[6] = 'int32':starHeroRanking	[ 名人堂排名]
				[7] = 'int32':vipLevel	[ VIP等级]
				[8] = 'int32':level	[ 玩家等级]
				[9] = 'int32':ready	[ 准备 0未准备 1准备]
				[10] = 'repeated int32':passCopy	[ 通关关卡]
				[11] = 'int32':hosting	[ 0未托管 1托管]
				[12] = 'int32':battleCopyId	[ 战斗的副本]
				[13] = 'int64':loginTime	[ 登录时间]
				[14] = 'int32':serverId	[服务器ID]
				[15] = 'int32':isAssist	[是否是助战角色]
			},
			[6] = 'int32':minLevel	[ 最小等级]
			[7] = 'int32':maxLevel	[ 最大等级]
			[8] = 'int32':show	[ 0对所有人展示 1仅对帮派成员和好友展示]
			[9] = 'repeated int32':passCopy	[ 通关关卡]
		},
		[3] = 'string':quitMemName	[退出者名字]
	}
--]]
s2c.MY_TEAM_REPONSE = 0x5921

--[[
	[1] = {--PeakFallReponse
	}
--]]
s2c.PEAK_FALL_REPONSE = 0x7108

--[[
	[1] = {--GangAppointSecondMasterResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_APPOINT_SECOND_MASTER_RESULT = 0x1806

--[[
	[1] = {--BeforeReconnect
		[1] = 'int64':serverStartup	[服务器启动时间轴]
		[2] = 'int64':lastLogon	[最后一次走登录流程的时间轴]
	}
--]]
s2c.BEFORE_RECONNECT = 0x0d21

--[[
	[1] = {--GetVipRewardResult
	}
--]]
s2c.GET_VIP_REWARD_RESULT = 0x1a06

--[[
	[1] = {--EquipmentIntensifyResult
		[1] = 'int32':result	[是否成功]
		[2] = {--EquipmentLevelChanged
			[1] = 'int64':userid
			[2] = 'int32':levelUp	[提升的等级]
			[3] = {--EquipmentAttribute
				[1] = 'string':base_attr	[基本属性]
				[2] = 'string':extra_attr	[附加属性]
			},
		},
	}
--]]
s2c.EQUIPMENT_INTENSIFY_RESULT = 0x1014

--[[
	[1] = {--PeakRankingHistoryReponse
		[1] = {--RankingHistoryInfo
			[1] = 'string':serverName	[ 服务器名字]
			[2] = 'string':name	[ 名字]
			[3] = 'string':formation	[ 阵型]
			[4] = 'int32':icon	[ 头像]
			[5] = 'int32':headPicFrame	[ 正在使用的头像框]
			[6] = 'int32':power	[ 战斗力]
			[7] = 'int32':ranking	[ 排行]
			[8] = 'int32':starHeroRanking	[名人堂排名]
		},
		[2] = {--RankingHistoryInfo
			[1] = 'string':serverName	[ 服务器名字]
			[2] = 'string':name	[ 名字]
			[3] = 'string':formation	[ 阵型]
			[4] = 'int32':icon	[ 头像]
			[5] = 'int32':headPicFrame	[ 正在使用的头像框]
			[6] = 'int32':power	[ 战斗力]
			[7] = 'int32':ranking	[ 排行]
			[8] = 'int32':starHeroRanking	[名人堂排名]
		},
	}
--]]
s2c.PEAK_RANKING_HISTORY_REPONSE = 0x7109

--[[
	[1] = {--PeakIsOpenReponse
		[1] = 'int32':isOpen	[ 0开启 1关闭]
	}
--]]
s2c.PEAK_IS_OPEN_REPONSE = 0x7111

--[[
	[1] = {--InvocatoryMsg
		[1] = 'int32':roleId	[祈愿的侠客id]
		[2] = 'int32':todayCount	[今天祈愿次数]
		[3] = 'int32':rewardDay	[领取奖励天数累计]
		[4] = 'int64':rewardTime	[上次更新时间]
		[5] = {--repeated InvocatoryInfo
			[1] = 'int32':roleId	[侠客模板id]
			[2] = 'int32':roleNum	[三个卡槽的侠客数量]
			[3] = 'int32':roleSycee	[三个卡槽的侠客花费]
			[4] = 'int32':isGetReward	[是否领取了祈愿奖励  0是未领取1是已经领取]
		},
	}
--]]
s2c.INVOCATORY = 0x5400

--[[
	[1] = {--PeakGuildRanks
		[1] = {--repeated PeakGuildRank
			[1] = 'string':guildName
			[2] = 'string':serverName
			[3] = 'int32':integra
		},
		[2] = 'int32':myIntegra
		[3] = 'int32':myRank
	}
--]]
s2c.PEAK_GUILD_RANKS = 0x7112

--[[
	[1] = {--OccupiedPeakReponse
		[1] = {--PeakInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'int32':serverId	[ 服务器ID]
			[3] = 'string':name	[ 玩家名字]
			[4] = 'string':serverName	[ 服务器名字]
			[5] = 'int32':power	[ 战斗力]
			[6] = 'int32':pos	[ 位置]
			[7] = 'int32':layer	[ 层数]
			[8] = 'int32':useIcon	[ 正在使用的头像]
			[9] = 'int32':headPicFrame	[ 正在使用的头像框]
			[10] = 'string':guildName	[ 帮派名称]
			[11] = 'int32':starHeroRanking	[名人堂排名]
		},
		[2] = {--repeated PeakFormationInfo
			[1] = 'int64':instanceId	[ 实例ID]
			[2] = 'int32':position	[ 阵形位置,0~8]
			[3] = 'int32':templateId	[ 角色模版ID,对应配置表ID]
			[4] = 'int32':quality	[ 品质]
			[5] = 'int32':level	[ 等级]
		},
	}
--]]
s2c.OCCUPIED_PEAK_REPONSE = 0x7101

--[[
	[1] = {--AllEmployInfo
		[1] = {--repeated EmployOtherRoleInfo
			[1] = 'int64':instanceId	[角色实例id]
			[2] = 'int32':playerId	[佣兵主人id]
			[3] = 'string':name	[佣兵主人名字]
			[4] = 'int32':relation	[关系 二进制 00 表示没关系 01表示好友 10表示帮派 11表示好友和帮派]
			[5] = 'int32':roleId	[角色id]
			[6] = 'int32':level	[等级]
			[7] = 'int32':start	[星级]
			[8] = 'int32':martial	[秘籍重数]
			[9] = 'int32':power	[战斗力]
			[10] = 'int32':quality	[品质,角色可以升品了]
			[11] = 'int32':forgingQuality	[角色最高炼体品质]
		},
	}
--]]
s2c.ALL_EMPLOY_INFO = 0x5104

--[[
	[1] = {--LockedZoneSucess
	}
--]]
s2c.LOCKED_ZONE_SUCESS = 0x441d

--[[
	[1] = {--TargetBattleReponse
		[1] = 'int32':result	[ 0战斗中 1不在战斗中]
	}
--]]
s2c.TARGET_BATTLE_REPONSE = 0x7106

--[[
	[1] = {--EscortAgencyOneInfoResponse
		[1] = 'int32':type
		[2] = {--CardInfo
			[1] = 'int32':guildId	[帮会id]
			[2] = 'string':bannerId	[帮会旗帜id]
			[3] = 'int32':serverId	[服务器id]
			[4] = 'string':serverName	[服务器名字]
			[5] = 'int32':score	[积分]
			[6] = 'int32':quality	[品质]
			[7] = {--repeated PartInfo
				[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
				[2] = 'int32':lastResTime	[最近一次复活时间]
				[3] = 'int32':status	[状态 0:完好 1:损毁]
				[4] = {--repeated PlayerData
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'int32':useCoin	[玩家头像]
					[4] = 'int32':frameId	[玩家头像框]
					[5] = 'string':guildName	[帮会名称]
					[6] = 'string':serverName	[服务器名称]
					[7] = 'int32':power	[战力]
					[8] = 'int32':dieTime	[最近一次死亡时间]
					[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
					[10] = 'int32':type	[类型 0:防守方 1:攻击方]
				},
				[5] = {--repeated DiePlayer
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'string':guildName	[帮会名称]
					[4] = 'string':serverName	[服务器名称]
					[5] = 'int32':power	[战力]
					[6] = 'int32':dieTime	[死亡时间]
				},
			},
		},
	}
--]]
s2c.ESCORT_AGENCY_ONE_INFO_RESPONSE = 0x5f08

--[[
	[1] = {--ReponseExLoadDestiny
	}
--]]
s2c.REPONSE_EX_LOAD_DESTINY = 0x3f05

--[[
	[1] = {--RechargeChanged
		[1] = {--RechargeInfo
			[1] = 'int32':totalRecharge	[总充值]
			[2] = 'int32':vipLevel	[当前vip等级]
		},
		[2] = {--RechargeInfo
			[1] = 'int32':totalRecharge	[总充值]
			[2] = 'int32':vipLevel	[当前vip等级]
		},
		[3] = 'int32':sycee	[元宝变更数量]
	}
--]]
s2c.RECHARGE_CHANGED = 0x1a02

--[[
	[1] = {--GetGetRecruitChest
		[1] = 'int32':round	[当前回合]
		[2] = 'repeated int32':alreadyGet	[已经领取奖励ID]
	}
--]]
s2c.GET_GET_RECRUIT_CHEST = 0x1c04

--[[
	[1] = {--AdventureFormation
		[1] = 'repeated int64':formation	[ 阵容一]
		[2] = 'repeated int64':secondFormation	[ 阵容二]
	}
--]]
s2c.ADVENTURE_FORMATION = 0x5903

--[[
	[1] = {--PayComplete
		[1] = 'int32':id	[商品ID]
		[2] = 'bool':isFirstPay	[是否首充.true or false]
		[3] = 'bool':multiple	[是否触发倍数true or false]
		[4] = 'int32':numForRechargeTicket	[充值券兑换的元宝数量]
	}
--]]
s2c.PAY_COMPLETE = 0x1a01

--[[
	[1] = {--VIPInfomation
		[1] = 'string':QQ	[QQ号码]
		[2] = 'string':telphone	[手机号]
	}
--]]
s2c.VIPINFOMATION = 0x1a20

--[[
	[1] = {--UpdateMiningPointOwner
		[1] = {--repeated MiningPointInfo
			[1] = 'int32':index	[/位置 1--n    ///位置 1--n]
			[2] = 'bool':empty	[是否位置上没有角色,如果有则发送角色信息,否则角色信息不用发送]
			[3] = {--MiningPointProduct
				[1] = 'int32':resType	[资源类型]
				[2] = 'int32':resId	[资源ID]
				[3] = 'int32':number	[数量]
			},
			[4] = {--OtherPlayerBaseInfo
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':profession	[职业]
				[3] = {--Sex(enum)
					'v4':Sex
				},
				[4] = 'string':name	[昵称]
				[5] = 'int32':level	[等级]
				[6] = 'int32':power	[总战力]
			},
			[5] = 'int32':reaminTime	[剩余挖掘剩余时间,当挖掘点里有人时才有值]
		},
	}
--]]
s2c.UPDATE_MINING_POINT_OWNER = 0x2204

--[[
	[1] = {--DoubleRechargeInfoList
		[1] = {--repeated DoubleRechargeInfo
			[1] = 'int32':index	[充值的index]
			[2] = 'int32':multiple	[倍数  *100    //倍数  *100]
		},
	}
--]]
s2c.DOUBLE_RECHARGE_INFO_LIST = 0x1a12

--[[
	[1] = {--VipRewardList
		[1] = {--repeated VipRewardItem
			[1] = 'int32':id	[vipid]
			[2] = 'bool':isHaveGot	[是否已领取]
		},
	}
--]]
s2c.VIP_REWARD_LIST = 0x1a05

--[[
	[1] = {--ClimbPassedNotifyMsg
		[1] = 'string':name	[通关角色名]
		[2] = 'int32':gameLevel	[通关关卡,层数,1~n]
	}
--]]
s2c.CLIMB_PASSED_NOTIFY = 0x1d0e

--[[
	[1] = {--PayBillNo
		[1] = 'int32':id	[商品ID]
		[2] = 'string':billNo	[订单号]
		[3] = 'int32':price	[价格(单位 人民币元)    //价格(单位 人民币元)]
		[4] = 'string':goodName	[商品名称]
	}
--]]
s2c.PAY_BILL_NO = 0x1a00

--[[
	[1] = {--FirstRechargeState
		[1] = 'bool':enable	[是否可以领取首充,]
	}
--]]
s2c.FIRST_RECHARGE_STATE = 0x1a11

--[[
	[1] = {--ResetNorthCaveResult
	}
--]]
s2c.RESET_NORTH_CAVE_RESULT = 0x4900

--[[
	[1] = {--HeadPicFrameOpenResult
	}
--]]
s2c.HEAD_PIC_FRAME_OPEN_RESULT = 0x0e95

--[[
	[1] = {--MineFormationInfo
		[1] = {--repeated MyParatInfo
			[1] = 'int64':instanceId
			[2] = 'int32':currHp
		},
		[2] = {--repeated OtherPlayerInfo
			[1] = {--OtherPlayerDetails
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':profession	[职业]
				[3] = 'string':name	[昵称]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[vip等级]
				[6] = 'int32':power	[战力]
				[7] = {--repeated RoleDetails
					[1] = 'int32':id	[ 卡牌的id]
					[2] = 'int32':level	[ 等级]
					[3] = 'int64':curexp	[ 当前经验]
					[4] = 'int32':power	[战力]
					[5] = 'string':attributes	[属性字符串]
					[6] = 'int32':warIndex	[战阵位置信息]
					[7] = {--repeated SimpleRoleEquipment
						[1] = 'int32':id	[ id]
						[2] = 'int32':level	[ level]
						[3] = 'int32':quality	[品质]
						[4] = 'int32':refineLevel	[精炼等级]
						[5] = {--repeated GemPos
							[1] = 'int32':pos	[ pos]
							[2] = 'int32':id	[ id]
						},
						[6] = {--repeated Recast
							[1] = 'int32':quality
							[2] = 'int32':ratio
							[3] = 'int32':index
						},
						[7] = 'int32':stepExp
						[8] = 'int32':stepLevel
						[9] = 'int32':throughLevel
					},
					[8] = {--repeated SimpleBook
						[1] = 'int32':templateId	[ 秘籍模板ID]
						[2] = 'int32':level	[ 等级]
						[3] = 'int32':attribute	[属性值]
					},
					[9] = {--repeated SimpleMeridians
						[1] = 'int32':index	[ 经脉位置,1~N]
						[2] = 'int32':level	[ 等级]
						[3] = 'int32':attribute	[属性值]
					},
					[10] = 'int32':starlevel	[ 星级]
					[11] = 'repeated int32':fateIds	[ 拥有缘分]
					[12] = {--repeated SkillInfo
						[1] = 'int32':skillId	[技能的id]
						[2] = 'int32':level	[技能的等级]
					},
					[13] = 'int32':quality	[品质]
					[14] = 'int32':martialLevel	[武学等级]
					[15] = {--repeated OtherMartialInfo
						[1] = 'int32':id	[武学id]
						[2] = 'int32':position	[装备位置]
						[3] = 'int32':enchantLevel	[附魔等级]
					},
					[16] = 'string':immune	[免疫概率]
					[17] = 'string':effectActive	[效果影响主动]
					[18] = 'string':effectPassive	[效果影响被动]
					[19] = {--repeated BibleInfo
						[1] = 'int64':instanceId	[唯一id]
						[2] = 'int32':id	[模板id]
						[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
						[4] = 'int32':level	[重级]
						[5] = 'int32':breachLevel	[突破]
						[6] = {--repeated EssentialPos
							[1] = 'int32':pos	[ pos]
							[2] = 'int32':id	[精要模板id]
						},
						[7] = 'repeated int32':gemId	[ 天书宝石]
						[8] = {--BibleComprehendInfo
							[1] = 'int64':bibleId	[天书id]
							[2] = 'int32':stageId	[阶段id]
							[3] = 'int32':useCount	[参悟丹使用次数]
							[4] = 'int32':reachId	[达成的id]
							[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
							[6] = {--repeated BibleStageInfo
								[1] = 'int32':stage	[阶段id]
								[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
								[3] = 'repeated int32':attIndex	[属性下标]
								[4] = 'repeated int32':value	[属性值]
							},
						},
					},
					[20] = 'int32':forgingQuality	[角色最高炼体品质]
					[21] = 'int32':skillStarLevel
					[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
					[23] = {--repeated BiblePracticeData
						[1] = 'int32':position	[ 位置]
						[2] = 'int32':level	[ 等级]
					},
					[24] = 'bool':equipHide	[是否隐藏装备信息]
					[25] = {--repeated HeartMethodEquipInfo
						[1] = 'int64':instanceId	[唯一id]
						[2] = 'int32':itemId	[模板id]
						[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
						[4] = 'int32':practiceId	[x]
						[5] = 'int32':breachId	[突破]
						[6] = {--repeated HeartMethodGem
							[1] = 'int32':pos	[ 位置]
							[2] = 'int32':itemId	[ 宝石ID]
						},
						[7] = {--repeated HeartMethodConcise
							[1] = 'int32':pos	[ 位置]
							[2] = 'int32':level	[ 凝练等级]
						},
						[8] = {--repeated HeartMethodRecast
							[1] = 'int32':pos	[ 位置]
							[2] = 'int32':level	[ 重铸等级]
						},
					},
				},
				[8] = {--repeated LeadingRoleSpell
					[1] = {--SkillInfo
						[1] = 'int32':skillId	[技能的id]
						[2] = 'int32':level	[技能的等级]
					},
					[2] = 'bool':choice	[是否选中]
					[3] = 'int32':sid	[法术的种类ID,一种法术有多个等级,但是统一法术SID一致]
				},
				[9] = 'int32':icon	[头像]
				[10] = 'int32':headPicFrame	[正在使用的头像框]
				[11] = 'int32':starHeroRanking	[名人堂排名]
				[12] = 'int32':ladderGrade	[天梯赛段位]
			},
			[2] = {--repeated MineParatInfo
				[1] = 'int32':maxHp
				[2] = 'int32':currHp
				[3] = 'int32':index
			},
			[3] = 'int32':serverId
		},
	}
--]]
s2c.MINE_FORMATION_INFO = 0x5009

--[[
	[1] = {--GangApplyAddResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_APPLY_ADD_RESULT = 0x180b

--[[
	[1] = {--SendGuildMailSucess
	}
--]]
s2c.SEND_GUILD_MAIL_SUCESS = 0x4432

--[[
	[1] = {--CopyTeamInvitationInfoResponse
		[1] = {--repeated CopyTeamInvitationInfo
			[1] = 'int32':playerId	[ 队长编号]
			[2] = 'string':name	[ 队长名称]
			[3] = 'int32':vip	[ 队长vip等级]
			[4] = 'int32':level	[ 队长等级]
			[5] = 'int64':teamId	[ 队伍编号]
			[6] = 'int32':chapterId	[ 章节ID]
			[7] = 'int64':createTime	[ 私聊消息创建时间]
			[8] = 'int32':icon	[ 头像]
			[9] = 'int32':headPicFrame	[ 头像边框]
			[10] = 'int32':starHeroRanking	[ 名人堂排名]
			[11] = 'int32':quality	[ 说话角色的主角品质]
			[12] = 'int32':type	[ 0显示到私聊 1显示到江湖公屏]
			[13] = 'int32':serverId	[服务器ID]
			[14] = 'int32':isAssist	[是否为助战邀请]
		},
	}
--]]
s2c.COPY_TEAM_INVITATION_INFO_RESPONSE = 0x5928

--[[
	[1] = {--ApplySucess
		[1] = 'bool':sucess
	}
--]]
s2c.APPLY_SUCESS = 0x5700

--[[
	[1] = {--NorthCaveGameLevelListMsg
		[1] = {--repeated NorthCaveGameLevelStruct
			[1] = 'int32':sectionId	[关卡ID]
			[2] = 'int32':formationId	[npc阵形Id,对应t_s_north_cave_npc表格ID]
			[3] = 'repeated int32':options	[通关选项]
			[4] = 'int32':choice	[通关选项选中状态,根据位运算来进行存储]
			[5] = 'int32':score	[通关分数,星数]
		},
	}
--]]
s2c.NORTH_CAVE_GAME_LEVEL_LIST = 0x4903

--[[
	[1] = {--NorthCaveDetails
		[1] = 'int32':currentId	[当前关卡]
		[2] = {--repeated NorthCaveGameLevelStruct
			[1] = 'int32':sectionId	[关卡ID]
			[2] = 'int32':formationId	[npc阵形Id,对应t_s_north_cave_npc表格ID]
			[3] = 'repeated int32':options	[通关选项]
			[4] = 'int32':choice	[通关选项选中状态,根据位运算来进行存储]
			[5] = 'int32':score	[通关分数,星数]
		},
		[3] = {--repeated NorthCaveAttributeInfo
			[1] = 'int32':index	[索引,1~N]
			[2] = 'repeated int32':option	[选项,属性ID,对应t_s_north_cave_extra_attr]
			[3] = 'int32':choice	[选中的属性ID,如果没有则为0]
			[4] = 'bool':skip	[是否跳过选择]
		},
		[4] = 'int32':maxPassCount	[最大通关数]
		[5] = 'int32':maxSweepCount	[最大可扫荡关卡数量]
		[6] = 'int32':tokens	[剩余无量山钻数量,代币]
		[7] = 'int32':remainResetCount	[剩余重置次数]
		[8] = 'int32':chestGotMark	[箱子领取记录,位运算存储]
		[9] = 'bool':hasNotPass	[是否有未通关关卡]
	}
--]]
s2c.NORTH_CAVE_DETAILS = 0x4902

--[[
	[1] = {--NorthCaveChangeOptionSuccess
		[1] = 'int32':sectionId	[关卡ID]
		[2] = 'repeated int32':options	[通关选项]
	}
--]]
s2c.NORTH_CAVE_CHANGE_OPTION_SUCCESS = 0x4923

--[[
	[1] = {--NorthCaveAttributeList
		[1] = {--repeated NorthCaveAttributeInfo
			[1] = 'int32':index	[索引,1~N]
			[2] = 'repeated int32':option	[选项,属性ID,对应t_s_north_cave_extra_attr]
			[3] = 'int32':choice	[选中的属性ID,如果没有则为0]
			[4] = 'bool':skip	[是否跳过选择]
		},
	}
--]]
s2c.NORTH_CAVE_ATTRIBUTE_LIST = 0x4921

--[[
	[1] = {--BattleCustomSkill
		[1] = {--CustomSkillInfo
			[1] = 'int32':strategyType	[阵型]
			[2] = 'bool':isUse	[是否使用自定义]
			[3] = 'repeated int32':baseOrder	[常规顺序]
			[4] = {--repeated SpecialOrderInfo
				[1] = 'int32':roleId	[角色ID]
				[2] = 'bool':isCheckBox	[是否勾选]
				[3] = 'int32':specialOrderType
				[4] = 'int32':percentNum	[百分比数字]
			},
		},
		[2] = {--CustomSkillInfo
			[1] = 'int32':strategyType	[阵型]
			[2] = 'bool':isUse	[是否使用自定义]
			[3] = 'repeated int32':baseOrder	[常规顺序]
			[4] = {--repeated SpecialOrderInfo
				[1] = 'int32':roleId	[角色ID]
				[2] = 'bool':isCheckBox	[是否勾选]
				[3] = 'int32':specialOrderType
				[4] = 'int32':percentNum	[百分比数字]
			},
		},
	}
--]]
s2c.BATTLE_CUSTOM_SKILL = 0x0f2c

--[[
	[1] = {--RecallSuccessNotify
		[1] = 'int32':playerId	[被召回的目标玩家ID]
	}
--]]
s2c.RECALL_SUCCESS_NOTIFY = 0x5320

--[[
	[1] = {--CustomSkillStrategyInfo
		[1] = {--repeated CustomSkillInfo
			[1] = 'int32':strategyType	[阵型]
			[2] = 'bool':isUse	[是否使用自定义]
			[3] = 'repeated int32':baseOrder	[常规顺序]
			[4] = {--repeated SpecialOrderInfo
				[1] = 'int32':roleId	[角色ID]
				[2] = 'bool':isCheckBox	[是否勾选]
				[3] = 'int32':specialOrderType
				[4] = 'int32':percentNum	[百分比数字]
			},
		},
	}
--]]
s2c.CUSTOM_SKILL_STRATEGY_INFO = 0x0f2a

--[[
	[1] = {--ResetChallengeCountResult
		[1] = 'int32':missionId	[把关卡Id返回,关卡Id]
	}
--]]
s2c.RESET_CHALLENGE_COUNT_RESULT = 0x1203

--[[
	[1] = {--LangBlessedHistoryResponse
		[1] = {--repeated LangBlessedSingleRecord
			[1] = 'int64':time
			[2] = 'string':rewards
			[3] = 'string':playerName
		},
	}
--]]
s2c.LANG_BLESSED_HISTORY_RESPONSE = 0x4d04

--[[
	[1] = {--HeartMethodConciseInfo
		[1] = 'int32':pos	[ 位置]
		[2] = 'int32':level	[ 凝练等级]
	}
--]]
s2c.HEART_METHOD_CONCISE_INFO = 0x7b13

--[[
	[1] = {--BuyBackRewardReponse
		[1] = 'repeated int32':rewardId	[返现奖励配置id]
	}
--]]
s2c.BUY_BACK_REWARD_REPONSE = 0x5b03

--[[
	[1] = {--UpdateMissionMsg
		[1] = 'int32':missionId	[关卡ID]
		[2] = 'int32':challengeCount	[今日挑战次数]
		[3] = {--StarLevel(enum)
			'v4':StarLevel
		},
		[4] = 'int32':resetCount	[重置次数]
		[5] = 'int32':state	[是否领取特殊奖励]
	}
--]]
s2c.UPDATE_MISSION = 0x1201

--[[
	[1] = {--UpdateEliteSucess
		[1] = 'bool':sucess
	}
--]]
s2c.UPDATE_ELITE_SUCESS = 0x5702

--[[
	[1] = {--UnlockAllFunction
		[1] = 'repeated int64':infolist
	}
--]]
s2c.UNLOCK_ALL_FUNCTION = 0x1207

--[[
	[1] = {--DestinyDatas
		[1] = {--repeated DestinyDataInfo
			[1] = 'int64':instanceId	[唯一id]
			[2] = 'int32':templateId	[模板id]
			[3] = 'int64':roleId	[装备的角色id]
			[4] = 'int32':pos	[装备位置]
			[5] = 'int32':level	[等级]
			[6] = 'int32':stepExp	[经验]
			[7] = 'int32':quality	[品质]
			[8] = 'int32':type	[类型]
			[9] = 'int32':star	[星级]
			[10] = 'int32':starLevel	[等级]
		},
		[2] = 'bool':bend	[是否推送结束]
	}
--]]
s2c.DESTINY_DATAS = 0x3f10

--[[
	[1] = {--BattleResultMsg
		[1] = 'bool':win	[战斗是否在客户端判断为胜利]
		[2] = 'int32':result	[0:失败   成功:1-3星    //0:失败   成功:1-3星]
		[3] = 'string':atkName
		[4] = 'string':defName
		[5] = 'int32':atkProfession
		[6] = 'int32':defProfession
		[7] = 'int32':atkHurt
		[8] = 'int32':defHurt
		[9] = 'int32':atkIcon
		[10] = 'int32':defIcon
		[11] = 'int32':atkHeadPicFrame	[头像边框]
		[12] = 'int32':defHeadPicFrame	[头像边框]
		[13] = 'int32':atkStarHeroRanking	[名人堂排名]
		[14] = 'int32':defStarHeroRanking	[名人堂排名]
	}
--]]
s2c.BATTLE_RESULT = 0x0f22

--[[
	[1] = {--GetRebateTurntableResponse
		[1] = 'int32':type	[类型:1消费,2充值]
		[2] = 'int32':sycee	[总元宝数量]
		[3] = 'int32':value	[一次抽奖机会所需元宝]
		[4] = 'int32':number	[剩余抽奖次数]
		[5] = {--repeated RebateTurntableItem
			[1] = 'int32':index	[转盘物品下标]
			[2] = 'int32':type	[资源类型:1.物品;2.卡牌;3.金币...]
			[3] = 'int32':number	[数量]
			[4] = 'int32':itemId	[资源id]
			[5] = 'int32':kind	[角标:0无1精品2珍品]
		},
	}
--]]
s2c.GET_REBATE_TURNTABLE_RESPONSE = 0x7d02

--[[
	[1] = {--MyEmployInfo
		[1] = {--repeated EmployRoleInfo
			[1] = 'int64':roleId	[角色实例id]
			[2] = 'int64':startTime	[开始时间]
			[3] = 'int32':coin	[累计获得金钱]
			[4] = 'int32':indexId	[位置id]
			[5] = 'int32':count	[被雇佣次数]
		},
	}
--]]
s2c.MY_EMPLOY_INFO = 0x5100

--[[
	[1] = {--AutoWarMatixResult
	}
--]]
s2c.AUTO_WAR_MATIX_RESULT = 0x0e24

--[[
	[1] = {--GangTransferMasterResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_TRANSFER_MASTER_RESULT = 0x1808

--[[
	[1] = {--MineMsg
		[1] = 'int32':leftFreeRefreshTime	[今日剩余免费刷新次数]
		[2] = 'int32':hireTime	[ 今日已被雇佣次数]
		[3] = 'int32':brokerageTotal	[累计佣金]
		[4] = {--repeated MineInfo
			[1] = 'int32':type	[矿类型 0-未解锁;1-石矿;2-铜矿;3-金矿;4-玉矿    //矿类型 0-未解锁;1-石矿;2-铜矿;3-金矿;4-玉矿]
			[2] = 'int32':status	[挖矿状态:0未开采.1开采中.2待收获]
			[3] = 'int32':robStatus	[打劫状态:0未被打劫.1被打劫成功]
			[4] = 'int64':startTime	[挖矿开始时间]
			[5] = 'int64':endTime	[挖矿结束时间]
			[6] = 'repeated int64':formation	[挖矿阵型]
			[7] = {--OtherPlayerDetails
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':profession	[职业]
				[3] = 'string':name	[昵称]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[vip等级]
				[6] = 'int32':power	[战力]
				[7] = {--repeated RoleDetails
					[1] = 'int32':id	[ 卡牌的id]
					[2] = 'int32':level	[ 等级]
					[3] = 'int64':curexp	[ 当前经验]
					[4] = 'int32':power	[战力]
					[5] = 'string':attributes	[属性字符串]
					[6] = 'int32':warIndex	[战阵位置信息]
					[7] = {--repeated SimpleRoleEquipment
						[1] = 'int32':id	[ id]
						[2] = 'int32':level	[ level]
						[3] = 'int32':quality	[品质]
						[4] = 'int32':refineLevel	[精炼等级]
						[5] = {--repeated GemPos
							[1] = 'int32':pos	[ pos]
							[2] = 'int32':id	[ id]
						},
						[6] = {--repeated Recast
							[1] = 'int32':quality
							[2] = 'int32':ratio
							[3] = 'int32':index
						},
						[7] = 'int32':stepExp
						[8] = 'int32':stepLevel
						[9] = 'int32':throughLevel
					},
					[8] = {--repeated SimpleBook
						[1] = 'int32':templateId	[ 秘籍模板ID]
						[2] = 'int32':level	[ 等级]
						[3] = 'int32':attribute	[属性值]
					},
					[9] = {--repeated SimpleMeridians
						[1] = 'int32':index	[ 经脉位置,1~N]
						[2] = 'int32':level	[ 等级]
						[3] = 'int32':attribute	[属性值]
					},
					[10] = 'int32':starlevel	[ 星级]
					[11] = 'repeated int32':fateIds	[ 拥有缘分]
					[12] = {--repeated SkillInfo
						[1] = 'int32':skillId	[技能的id]
						[2] = 'int32':level	[技能的等级]
					},
					[13] = 'int32':quality	[品质]
					[14] = 'int32':martialLevel	[武学等级]
					[15] = {--repeated OtherMartialInfo
						[1] = 'int32':id	[武学id]
						[2] = 'int32':position	[装备位置]
						[3] = 'int32':enchantLevel	[附魔等级]
					},
					[16] = 'string':immune	[免疫概率]
					[17] = 'string':effectActive	[效果影响主动]
					[18] = 'string':effectPassive	[效果影响被动]
					[19] = {--repeated BibleInfo
						[1] = 'int64':instanceId	[唯一id]
						[2] = 'int32':id	[模板id]
						[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
						[4] = 'int32':level	[重级]
						[5] = 'int32':breachLevel	[突破]
						[6] = {--repeated EssentialPos
							[1] = 'int32':pos	[ pos]
							[2] = 'int32':id	[精要模板id]
						},
						[7] = 'repeated int32':gemId	[ 天书宝石]
						[8] = {--BibleComprehendInfo
							[1] = 'int64':bibleId	[天书id]
							[2] = 'int32':stageId	[阶段id]
							[3] = 'int32':useCount	[参悟丹使用次数]
							[4] = 'int32':reachId	[达成的id]
							[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
							[6] = {--repeated BibleStageInfo
								[1] = 'int32':stage	[阶段id]
								[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
								[3] = 'repeated int32':attIndex	[属性下标]
								[4] = 'repeated int32':value	[属性值]
							},
						},
					},
					[20] = 'int32':forgingQuality	[角色最高炼体品质]
					[21] = 'int32':skillStarLevel
					[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
					[23] = {--repeated BiblePracticeData
						[1] = 'int32':position	[ 位置]
						[2] = 'int32':level	[ 等级]
					},
					[24] = 'bool':equipHide	[是否隐藏装备信息]
					[25] = {--repeated HeartMethodEquipInfo
						[1] = 'int64':instanceId	[唯一id]
						[2] = 'int32':itemId	[模板id]
						[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
						[4] = 'int32':practiceId	[x]
						[5] = 'int32':breachId	[突破]
						[6] = {--repeated HeartMethodGem
							[1] = 'int32':pos	[ 位置]
							[2] = 'int32':itemId	[ 宝石ID]
						},
						[7] = {--repeated HeartMethodConcise
							[1] = 'int32':pos	[ 位置]
							[2] = 'int32':level	[ 凝练等级]
						},
						[8] = {--repeated HeartMethodRecast
							[1] = 'int32':pos	[ 位置]
							[2] = 'int32':level	[ 重铸等级]
						},
					},
				},
				[8] = {--repeated LeadingRoleSpell
					[1] = {--SkillInfo
						[1] = 'int32':skillId	[技能的id]
						[2] = 'int32':level	[技能的等级]
					},
					[2] = 'bool':choice	[是否选中]
					[3] = 'int32':sid	[法术的种类ID,一种法术有多个等级,但是统一法术SID一致]
				},
				[9] = 'int32':icon	[头像]
				[10] = 'int32':headPicFrame	[正在使用的头像框]
				[11] = 'int32':starHeroRanking	[名人堂排名]
				[12] = 'int32':ladderGrade	[天梯赛段位]
			},
			[8] = 'int32':power	[挖矿阵型战力]
			[9] = 'int32':playerId	[玩家编号]
			[10] = 'string':name	[玩家名称]
			[11] = 'int32':profession	[职业]
			[12] = {--RobPlayerInfo
				[1] = 'int32':playerId	[玩家编号]
				[2] = 'string':name	[玩家名称]
				[3] = 'int32':profession	[职业]
				[4] = 'int32':power	[战力]
				[5] = 'int64':battleId	[战斗id]
				[6] = 'int32':icon	[头像]
				[7] = 'int32':headPicFrame	[头像边框]
				[8] = 'int32':starHeroRanking	[名人堂排名]
				[9] = 'int32':serverId	[劫矿人服务器ID]
			},
			[13] = 'int32':id	[矿洞编号]
			[14] = 'string':robResource	[劫得资源]
			[15] = 'string':rewardResource	[奖励资源]
			[16] = 'int32':icon	[头像]
			[17] = 'int32':headPicFrame	[头像边框]
			[18] = 'int32':starHeroRanking	[名人堂排名]
			[19] = 'int32':mineServerId	[挖矿人服务器ID]
		},
	}
--]]
s2c.MINE = 0x5000

--[[
	[1] = {--EmployTeamCount
		[1] = 'int32':playerId	[玩家ID]
		[2] = 'int32':todayCount	[今日雇佣次数]
		[3] = 'int32':totalCount	[历史雇佣次数]
		[4] = 'int64':createTime	[第一次雇佣时间]
		[5] = 'int64':lastUpdate	[最后一次雇佣时间]
	}
--]]
s2c.EMPLOY_TEAM_COUNT = 0x5165

--[[
	[1] = {--EquipBibleResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':roleId	[角色实例id]
		[3] = 'int64':bible	[装备到身上的天书userid]
		[4] = 'int64':drop	[如果有替换下来的天书则发送卸下的天书userid]
	}
--]]
s2c.EQUIP_BIBLE_RESULT = 0x6001

--[[
	[1] = {--ResetChallengeMineResult
	}
--]]
s2c.RESET_CHALLENGE_MINE_RESULT = 0x500f

--[[
	[1] = {--GetMineRewardResult
	}
--]]
s2c.GET_MINE_REWARD_RESULT = 0x5003

--[[
	[1] = {--UnlockMineResult
	}
--]]
s2c.UNLOCK_MINE_RESULT = 0x5004

--[[
	[1] = {--GuardMineResult
	}
--]]
s2c.GUARD_MINE_RESULT = 0x5008

--[[
	[1] = {--RoleDetails
		[1] = 'int32':id	[ 卡牌的id]
		[2] = 'int32':level	[ 等级]
		[3] = 'int64':curexp	[ 当前经验]
		[4] = 'int32':power	[战力]
		[5] = 'string':attributes	[属性字符串]
		[6] = 'int32':warIndex	[战阵位置信息]
		[7] = {--repeated SimpleRoleEquipment
			[1] = 'int32':id	[ id]
			[2] = 'int32':level	[ level]
			[3] = 'int32':quality	[品质]
			[4] = 'int32':refineLevel	[精炼等级]
			[5] = {--repeated GemPos
				[1] = 'int32':pos	[ pos]
				[2] = 'int32':id	[ id]
			},
			[6] = {--repeated Recast
				[1] = 'int32':quality
				[2] = 'int32':ratio
				[3] = 'int32':index
			},
			[7] = 'int32':stepExp
			[8] = 'int32':stepLevel
			[9] = 'int32':throughLevel
		},
		[8] = {--repeated SimpleBook
			[1] = 'int32':templateId	[ 秘籍模板ID]
			[2] = 'int32':level	[ 等级]
			[3] = 'int32':attribute	[属性值]
		},
		[9] = {--repeated SimpleMeridians
			[1] = 'int32':index	[ 经脉位置,1~N]
			[2] = 'int32':level	[ 等级]
			[3] = 'int32':attribute	[属性值]
		},
		[10] = 'int32':starlevel	[ 星级]
		[11] = 'repeated int32':fateIds	[ 拥有缘分]
		[12] = {--repeated SkillInfo
			[1] = 'int32':skillId	[技能的id]
			[2] = 'int32':level	[技能的等级]
		},
		[13] = 'int32':quality	[品质]
		[14] = 'int32':martialLevel	[武学等级]
		[15] = {--repeated OtherMartialInfo
			[1] = 'int32':id	[武学id]
			[2] = 'int32':position	[装备位置]
			[3] = 'int32':enchantLevel	[附魔等级]
		},
		[16] = 'string':immune	[免疫概率]
		[17] = 'string':effectActive	[效果影响主动]
		[18] = 'string':effectPassive	[效果影响被动]
		[19] = {--repeated BibleInfo
			[1] = 'int64':instanceId	[唯一id]
			[2] = 'int32':id	[模板id]
			[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
			[4] = 'int32':level	[重级]
			[5] = 'int32':breachLevel	[突破]
			[6] = {--repeated EssentialPos
				[1] = 'int32':pos	[ pos]
				[2] = 'int32':id	[精要模板id]
			},
			[7] = 'repeated int32':gemId	[ 天书宝石]
			[8] = {--BibleComprehendInfo
				[1] = 'int64':bibleId	[天书id]
				[2] = 'int32':stageId	[阶段id]
				[3] = 'int32':useCount	[参悟丹使用次数]
				[4] = 'int32':reachId	[达成的id]
				[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
				[6] = {--repeated BibleStageInfo
					[1] = 'int32':stage	[阶段id]
					[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
					[3] = 'repeated int32':attIndex	[属性下标]
					[4] = 'repeated int32':value	[属性值]
				},
			},
		},
		[20] = 'int32':forgingQuality	[角色最高炼体品质]
		[21] = 'int32':skillStarLevel
		[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
		[23] = {--repeated BiblePracticeData
			[1] = 'int32':position	[ 位置]
			[2] = 'int32':level	[ 等级]
		},
		[24] = 'bool':equipHide	[是否隐藏装备信息]
		[25] = {--repeated HeartMethodEquipInfo
			[1] = 'int64':instanceId	[唯一id]
			[2] = 'int32':itemId	[模板id]
			[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
			[4] = 'int32':practiceId	[x]
			[5] = 'int32':breachId	[突破]
			[6] = {--repeated HeartMethodGem
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':itemId	[ 宝石ID]
			},
			[7] = {--repeated HeartMethodConcise
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':level	[ 凝练等级]
			},
			[8] = {--repeated HeartMethodRecast
				[1] = 'int32':pos	[ 位置]
				[2] = 'int32':level	[ 重铸等级]
			},
		},
	}
--]]
s2c.ROLE_DETAILS = 0x0e73

--[[
	[1] = {--ReceiveBoxRewardResponse
		[1] = 'int32':rewardId	[奖励id]
	}
--]]
s2c.RECEIVE_BOX_REWARD_RESPONSE = 0x6f09

--[[
	[1] = {--UnlockZoneSucess
	}
--]]
s2c.UNLOCK_ZONE_SUCESS = 0x441e

--[[
	[1] = {--RefreshMineResult
	}
--]]
s2c.REFRESH_MINE_RESULT = 0x5001

--[[
	[1] = {--GuardMinePlayerResult
		[1] = 'repeated int32':guardPlayerIds	[本周已被选择护矿的玩家id]
	}
--]]
s2c.GUARD_MINE_PLAYER_RESULT = 0x5010

--[[
	[1] = {--GoldEggInfo
		[1] = {--repeated GoldEggInfoConfig
			[1] = 'int32':type	[1银蛋2金蛋3彩蛋]
			[2] = 'int32':resType	[消耗资源类型]
			[3] = 'int32':resId	[消耗资源ID]
			[4] = 'int32':number	[消耗资源个数]
			[5] = 'int32':score	[积分]
			[6] = 'int32':freeTime	[免费次数]
			[7] = 'string':reward	[随机奖励配置 类型,id,数量&类型,id,数量]
		},
		[2] = 'string':ColorEggInfoReward	[彩蛋普通奖励(类型,id,数量&类型,id,数量)    //彩蛋普通奖励(类型,id,数量&类型,id,数量)]
		[3] = 'string':ColorEggSpecialReward	[彩蛋特殊奖励(类型,id,数量&刷新消耗元宝数)    //彩蛋特殊奖励(类型,id,数量&刷新消耗元宝数)]
	}
--]]
s2c.GOLD_EGG_INFO = 0x4701

--[[
	[1] = {--EssentialExplodeResult
		[1] = 'int32':result	[是否成功]
		[2] = 'string':itemId	[成功时有效 精要模板ids 逗号隔开]
	}
--]]
s2c.ESSENTIAL_EXPLODE_RESULT = 0x6007

--[[
	[1] = {--FreshMineListResult
		[1] = {--repeated FreshInfo
			[1] = 'int32':minePlayerId
			[2] = 'int32':guardPlayerId
			[3] = 'int32':mineIcon
			[4] = 'int32':guardIcon
			[5] = 'int32':mineHeadIcon
			[6] = 'int32':guardHeadIcon
			[7] = 'int32':power
			[8] = 'string':playerName
			[9] = 'int32':serverId
			[10] = 'int64':endTime
			[11] = 'int64':startTime
			[12] = 'int32':id
			[13] = 'int32':type
		},
	}
--]]
s2c.FRESH_MINE_LIST_RESULT = 0x5007

--[[
	[1] = {--BloodyResetSuccess
		[1] = 'int32':remainResetTime	[剩余重置次数]
	}
--]]
s2c.BLOODY_RESET_SUCCESS = 0x3220

--[[
	[1] = {--MineResult
	}
--]]
s2c.MINE_RESULT = 0x5002

--[[
	[1] = {--UnlockPlayerMineResult
	}
--]]
s2c.UNLOCK_PLAYER_MINE_RESULT = 0x500a

--[[
	[1] = {--RepeatSystemMessage
		[1] = 'int32':messageId	[消息id]
		[2] = 'string':content	[系统推送内容]
		[3] = 'int32':intervalTime	[间隔时间]
		[4] = 'int64':beginTime	[开始时间]
		[5] = 'int64':endTime	[结束时间]
		[6] = 'int32':repeatTime	[重复次数]
		[7] = 'int32':priority	[权重]
	}
--]]
s2c.REPEAT_SYSTEM_MESSAGE = 0x1d60

--[[
	[1] = {--NotifyMsg
		[1] = 'int32':type
		[2] = 'string':context
	}
--]]
s2c.NOTIFY = 0x1d33

--[[
	[1] = {--GuildBossResponse
		[1] = 'int32':battleTime	[最近一次战斗时间]
		[2] = {--GuildBossInfo
			[1] = 'int32':secondlyProgress	[忠义值]
			[2] = 'int32':status	[当前状态(0:未开启 1:展示阶段 2:触发了boss未开启 3:已开启)    //当前状态(0:未开启 1:展示阶段 2:触发了boss未开启 3:已开启)]
			[3] = 'int32':result	[最近一次演武击破结果(0:失败 1:成功)    //最近一次演武击破结果(0:失败 1:成功)]
			[4] = 'int32':triggerTime	[最近一次触发时间]
			[5] = 'int32':openTime	[最近一次开启时间(未开启则为0)    //最近一次开启时间(未开启则为0)]
			[6] = 'int32':endTime	[最近一次结束时间(如果从未开启或者本轮结束,并过了展示阶段,则为0)    //最近一次结束时间(如果从未开启或者本轮结束,并过了展示阶段,则为0)]
			[7] = 'int32':helpBattleTime	[最近一次助战时间]
			[8] = 'int32':passStage	[最高通关阶段]
			[9] = 'int32':stage	[最近一次开启阶段(没有选就为passStage)    //最近一次开启阶段(没有选就为passStage)]
			[10] = 'repeated int32':npcId	[npcid(3个小怪一个boss)    //npcid(3个小怪一个boss)]
		},
		[3] = {--repeated GuildBossNpcInfo
			[1] = 'int32':npcId	[npcid]
			[2] = 'string':currentBlood	[当前血量(npcId_当前血量,npcId_当前血量);    //当前血量(npcId_当前血量,npcId_当前血量);]
			[3] = 'int32':dieTime	[最近一次死亡时间]
			[4] = 'int32':dieCount	[死亡次数(被击破次数)    //死亡次数(被击破次数)]
			[5] = 'int32':bossBuff	[给boss加的buff(只有小怪里面才有值,boss则为0)    //给boss加的buff(只有小怪里面才有值,boss则为0)]
		},
	}
--]]
s2c.GUILD_BOSS_RESPONSE = 0x4b01

--[[
	[1] = {--UnequipOperation
		[1] = 'int64':roleId
		[2] = 'int64':equipment	[卸除的装备userid]
	}
--]]
s2c.UNEQUIP_OPERATION = 0x1043

--[[
	[1] = {--AnniversaryResponse
		[1] = {--repeated AnniversaryInfo
			[1] = 'int32':type	[活跃任务:41 狂欢任务:42 兑换任务:43]
			[2] = {--repeated MissionInfo
				[1] = 'int32':activityId	[活动ID]
				[2] = 'int32':progress	[任务进度]
				[3] = 'int32':status	[状态 0:未完成 1:已完成未领取 2:已领取]
				[4] = 'int32':missionType
			},
		},
	}
--]]
s2c.ANNIVERSARY_RESPONSE = 0x7e01

--[[
	[1] = {--ReturnFightNotify
		[1] = {--repeated FightNotifyInfo
			[1] = 'int32':reportId	[战报ID]
			[2] = 'int32':fightType	[战斗类型]
			[3] = 'bool':win	[是否胜利]
			[4] = 'int64':time	[时间]
			[5] = 'string':playerName	[对手名字]
			[6] = 'int32':playerLev	[对手等级]
			[7] = 'int32':playerPower	[对手战力]
			[8] = 'int32':myRankPos	[群豪谱被击败后自己排名]
			[9] = 'int32':reward	[天罡星被击败后奖励]
		},
	}
--]]
s2c.RETURN_FIGHT_NOTIFY = 0x1d06

--[[
	[1] = {--ApplyCrossSucess
		[1] = 'bool':sucess
	}
--]]
s2c.APPLY_CROSS_SUCESS = 0x443a

--[[
	[1] = {--MyChallenageArenaBattleReportList
		[1] = {--repeated ArenaTopBattleReportInfo
			[1] = 'int32':reportId	[战报ID]
			[2] = 'int32':fightType	[战斗类型]
			[3] = 'bool':win	[是否胜利]
			[4] = 'int64':time	[时间]
			[5] = 'int32':ranking	[被挑战者排名]
			[6] = 'int32':fromRank	[挑战者排名]
			[7] = 'int32':power	[挑战者战力]
			[8] = 'int32':targetPower	[被挑战者战力,0表示未知,以前老数据没有记录这个字段]
			[9] = {--ArenaTopBattleReportRole
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':name	[名字]
				[3] = 'int32':profession	[主角职业]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[VIP等级]
				[6] = 'int32':power	[战力]
				[7] = 'int32':serverId	[服务器ID]
			},
			[10] = {--ArenaTopBattleReportRole
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':name	[名字]
				[3] = 'int32':profession	[主角职业]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[VIP等级]
				[6] = 'int32':power	[战力]
				[7] = 'int32':serverId	[服务器ID]
			},
		},
	}
--]]
s2c.MY_CHALLENAGE_ARENA_BATTLE_REPORT_LIST = 0x1d42

--[[
	[1] = {--DelRepeatSystemMessage
		[1] = 'int32':messageId	[消息id]
	}
--]]
s2c.DEL_REPEAT_SYSTEM_MESSAGE = 0x1d63

--[[
	[1] = {--GangUpLevelExchangeResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_UP_LEVEL_EXCHANGE_RESULT = 0x1814

--[[
	[1] = {--SendRank
	}
--]]
s2c.SEND_RANK = 0x3308

--[[
	[1] = {--FriendApplyList
		[1] = {--repeated FriendInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':power	[战斗力]
			[5] = 'int64':lastLoginTime	[最后登录时间]
			[6] = 'int32':profession	[职业]
			[7] = 'int32':level	[等级]
			[8] = 'bool':online
			[9] = 'int32':guildId
			[10] = 'string':guildName
			[11] = 'int32':minePower	[护矿战斗力]
			[12] = 'int32':icon	[头像]
			[13] = 'int32':headPicFrame	[头像边框]
			[14] = 'int32':starHeroRanking	[名人堂排名]
			[15] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.FRIEND_APPLY_LIST = 0x4301

--[[
	[1] = {--BibleResetResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':bible	[成功时有效 天书id]
	}
--]]
s2c.BIBLE_RESET_RESULT = 0x6008

--[[
	[1] = {--SystemNoticeMessage
		[1] = 'string':content	[系统推送内容]
	}
--]]
s2c.SYSTEM_NOTICE_MESSAGE = 0x1d09

--[[
	[1] = {--MHYSweepResult
		[1] = 'int32':id	[目标关卡ID]
		[2] = {--repeated MHYSweepResultItem
			[1] = 'int32':exp	[增加团队经验]
			[2] = 'int32':oldLevel	[原先团队等级]
			[3] = 'int32':currentLevel	[当前团队等级]
			[4] = 'int32':coin	[获得的金币数量]
			[5] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.MHYSWEEP_RESULT = 0x1720

--[[
	[1] = {--OnlineToServerNotifyMsg
		[1] = 'int32':playerId	[玩家ID]
		[2] = 'string':name	[玩家名称]
		[3] = 'int32':type	[类型]
	}
--]]
s2c.ONLINE_TO_SERVER_NOTIFY = 0x1d70

--[[
	[1] = {--PeakBattleEndReponse
	}
--]]
s2c.PEAK_BATTLE_END_REPONSE = 0x7110

--[[
	[1] = {--ArenaTop5ChangedNotifyMsg
		[1] = 'string':oldName	[变更前原来的角色名]
		[2] = 'string':newName	[变更后的角色名]
		[3] = 'int32':ranking	[变更的排名]
	}
--]]
s2c.ARENA_TOP5_CHANGED_NOTIFY = 0x1d0d

--[[
	[1] = {--StartPracticeSucess
	}
--]]
s2c.START_PRACTICE_SUCESS = 0x4424

--[[
	[1] = {--GuildBossHelpResponse
		[1] = {--repeated HelpPlayerInfo
			[1] = 'int32':npcId	[npcid]
			[2] = 'int32':playerId	[玩家id]
			[3] = 'string':playerName	[玩家名字]
			[4] = 'int32':useCoin	[玩家头像]
			[5] = 'int32':frameId	[玩家头像框]
			[6] = 'int32':power	[战力]
		},
	}
--]]
s2c.GUILD_BOSS_HELP_RESPONSE = 0x4b04

--[[
	[1] = {--SingleBiblePracticeReponse
		[1] = {--BiblePracticeInfo
			[1] = 'int64':bibleId	[ 天书id]
			[2] = {--repeated BiblePracticeData
				[1] = 'int32':position	[ 位置]
				[2] = 'int32':level	[ 等级]
			},
		},
	}
--]]
s2c.SINGLE_BIBLE_PRACTICE_REPONSE = 0x6017

--[[
	[1] = {--UpdateFormationSucess
	}
--]]
s2c.UPDATE_FORMATION_SUCESS = 0x4505

--[[
	[1] = {--MergeAutoSuccessNotify
	}
--]]
s2c.MERGE_AUTO_SUCCESS_NOTIFY = 0x5804

--[[
	[1] = {--DeleteMailSuccess
	}
--]]
s2c.DELETE_MAIL_SUCCESS = 0x1d23

--[[
	[1] = {--ArenaBalanceNotify
		[1] = {--repeated ArenaBalanceInfo
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'int32':displayId	[显示的职业类型ID,可能为主角职业ID或者战力最高的职业ID]
			[3] = 'string':name	[昵称]
			[4] = 'int32':level	[等级]
			[5] = 'int32':vipLevel	[vip等级]
		},
	}
--]]
s2c.ARENA_BALANCE_NOTIFY = 0x1d0a

--[[
	[1] = {--AdventureBattleLog
		[1] = {--repeated BattleLogInfo
			[1] = 'int32':id	[ ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':level	[ 等级]
			[4] = 'int32':power	[ 战斗力]
			[5] = 'int32':icon	[ 头像]
			[6] = 'int32':headPicFrame	[ 头像框]
			[7] = 'int32':type	[ 状态 0成功杀戮 1杀戮失败2防守成功3防守失败4手刃仇人5复仇失败6防守成功7被报仇8成功挑战9挑战失败10防守成功11被挑战]
			[8] = 'int32':massacreValue	[ 杀戮值]
			[9] = 'int32':coin	[ 铜币]
			[10] = 'int32':experience	[ 阅历]
			[11] = 'int64':battleTime	[ 战斗时间 (分钟,直接显示)    // 战斗时间 (分钟,直接显示)]
			[12] = 'int32':firstRecordId	[ 第一场录像ID]
			[13] = 'int32':secondRecordId	[ 第二场录像ID]
			[14] = 'int32':starHeroRanking	[名人堂排名]
			[15] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.ADVENTURE_BATTLE_LOG = 0x5909

--[[
	[1] = {--ReturnNotifyNum
		[1] = 'int32':fightNotifyNum	[战斗]
		[2] = 'int32':socialNotifyNum	[社交]
		[3] = 'int32':systemNotifyNum	[系统]
	}
--]]
s2c.RETURN_NOTIFY_NUM = 0x1d05

--[[
	[1] = {--ResetZoneSucess
	}
--]]
s2c.RESET_ZONE_SUCESS = 0x441c

--[[
	[1] = {--EggFrenzyNoticeMessage
		[1] = 'string':playerName	[玩家名字]
		[2] = 'int32':type	[资源id]
		[3] = 'int32':id
		[4] = 'int32':num
		[5] = 'int32':eggType
	}
--]]
s2c.EGG_FRENZY_NOTICE_MESSAGE = 0x1d32

--[[
	[1] = {--AdventureEvent
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.ADVENTURE_EVENT = 0x5910

--[[
	[1] = {--EquipMartialResult
		[1] = 'int64':roleId	[角色id]
		[2] = 'int32':martialId	[武学id]
		[3] = 'int32':position	[武学装备位置]
	}
--]]
s2c.EQUIP_MARTIAL_RESULT = 0x3401

--[[
	[1] = {--ScoreRankInfos
		[1] = {--repeated ScoreRank
			[1] = 'string':name
			[2] = 'string':serverName
			[3] = 'int32':power
			[4] = 'int32':playerId
		},
		[2] = 'string':atkFormation
		[3] = 'string':defFromation
	}
--]]
s2c.SCORE_RANK_INFOS = 0x4516

--[[
	[1] = {--BuyTimeResult
		[1] = 'int32':battleType	[1-推图体力;2-群豪谱体力;3-爬塔体力; 4-技能点;5-摩诃衍1;6-摩诃衍2;7-摩诃衍3    //1-推图体力;2-群豪谱体力;3-爬塔体力; 4-技能点;5-摩诃衍1;6-摩诃衍2;7-摩诃衍3]
	}
--]]
s2c.BUY_TIME_RESULT = 0x2103

--[[
	[1] = {--RoleMartialList
		[1] = 'int64':roleId	[角色id]
		[2] = 'int32':martialLevel	[角色武学等级]
		[3] = {--repeated MartialInfo
			[1] = 'int32':id	[武学id]
			[2] = 'int32':position	[装备位置]
			[3] = 'int32':enchantLevel	[附魔等级]
			[4] = 'int32':enchantProgress	[附魔当前经验进度]
		},
	}
--]]
s2c.ROLE_MARTIAL_LIST = 0x3402

--[[
	[1] = {--ClimbSweepResult
		[1] = 'int32':id	[关卡Id,无量山层数]
		[2] = {--repeated ClimbSweepResultItem
			[1] = 'int32':exp	[增加团队经验]
			[2] = 'int32':oldLevel	[原先团队等级]
			[3] = 'int32':currentLevel	[当前团队等级]
			[4] = 'int32':coin	[获得的金币数量]
			[5] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
	}
--]]
s2c.CLIMB_SWEEP_RESULT = 0x1710

--[[
	[1] = {--GangDissolveResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_DISSOLVE_RESULT = 0x180a

--[[
	[1] = {--OneKeyEquipRefiningResult
		[1] = 'int64':equipment	[装备userid]
		[2] = 'string':lastExtra	[附加属性]
	}
--]]
s2c.ONE_KEY_EQUIP_REFINING_RESULT = 0x1081

--[[
	[1] = {--DestinyAllDataInfo
		[1] = {--repeated DestinyDataInfo
			[1] = 'int64':instanceId	[唯一id]
			[2] = 'int32':templateId	[模板id]
			[3] = 'int64':roleId	[装备的角色id]
			[4] = 'int32':pos	[装备位置]
			[5] = 'int32':level	[等级]
			[6] = 'int32':stepExp	[经验]
			[7] = 'int32':quality	[品质]
			[8] = 'int32':type	[类型]
			[9] = 'int32':star	[星级]
			[10] = 'int32':starLevel	[等级]
		},
	}
--]]
s2c.DESTINY_ALL_DATA_INFO = 0x3f01

--[[
	[1] = {--BattleArrayExchangeReponse
		[1] = 'int32':result	[ 0失败1成功]
		[2] = {--repeated BattleArrayItemInfo
			[1] = 'int32':type	[ 资源类型]
			[2] = 'int32':id	[ 资源ID]
			[3] = 'int32':number	[ 资源数量]
		},
	}
--]]
s2c.BATTLE_ARRAY_EXCHANGE_REPONSE = 0x6a07

--[[
	[1] = {--EquipmentTranslateSuccess
		[1] = 'int64':srcId	[源装备实例ID]
		[2] = 'int64':targetId	[目标装备实例ID]
	}
--]]
s2c.EQUIPMENT_TRANSLATE_SUCCESS = 0x1090

--[[
	[1] = {--GoldenCardInfo
		[1] = {--GoldenCardMsg
			[1] = 'int32':id	[ID]
			[2] = 'int64':startTime	[开始时间]
			[3] = 'int64':endTime	[ 结束时间]
			[4] = 'int64':lastGotRewardTime	[上次领奖时间]
			[5] = {--repeated GoldenRewardInfo
				[1] = 'int32':type	[活动类型]
				[2] = 'int32':radio	[系数]
				[3] = {--repeated itemReward
					[1] = 'int32':itemId	[物品id]
					[2] = 'int32':type	[物品类型]
					[3] = 'int32':number	[数量]
				},
			},
		},
	}
--]]
s2c.GOLDEN_CARD_INFO = 0x7c01

--[[
	[1] = {--TupuMsg
		[1] = 'string':equipStr	[ 拥有过的装备ID列表]
		[2] = 'string':roleStr	[ 拥有过的角色id列表]
		[3] = 'string':bibleStr	[ 拥有过的天书id列表]
		[4] = 'string':battleArrayStr	[ 拥有过的阵法id列表]
		[5] = 'string':bibleKeyStr	[ 拥有过的天书秘钥id列表]
		[6] = 'string':xinfaStr	[ 拥有过的心法列表]
	}
--]]
s2c.TUPU = 0x3100

--[[
	[1] = {--GuildBossHelpListResponse
		[1] = {--repeated HelpPlayerInfo
			[1] = 'int32':npcId	[npcid]
			[2] = 'int32':playerId	[玩家id]
			[3] = 'string':playerName	[玩家名字]
			[4] = 'int32':useCoin	[玩家头像]
			[5] = 'int32':frameId	[玩家头像框]
			[6] = 'int32':power	[战力]
		},
	}
--]]
s2c.GUILD_BOSS_HELP_LIST_RESPONSE = 0x4b08

--[[
	[1] = {--LongMenBreakPushRewardResponse
		[1] = 'int32':type	[ 类型(0:覆盖 1:更新推送)    // 类型(0:覆盖 1:更新推送)]
		[2] = {--repeated PushRewardInfo
			[1] = 'int32':playerId	[玩家id]
			[2] = 'string':playerName	[玩家名称]
			[3] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[4] = 'int32':floorId	[层id]
		},
	}
--]]
s2c.LONG_MEN_BREAK_PUSH_REWARD_RESPONSE = 0x6908

--[[
	[1] = {--GetHeroduelDetailsResponse
		[1] = 'int32':useIcon	[玩家头像]
		[2] = 'int32':headPicFrame	[头像框]
		[3] = 'int32':targetId	[玩家id]
		[4] = 'string':targetName	[玩家名字]
		[5] = 'int32':targetGroup	[玩家分组]
		[6] = 'int32':targetRank	[排名]
		[7] = 'int32':targetScore	[积分]
		[8] = 'int32':targetPower	[战力]
		[9] = {--repeated HeroDuelRoleInfo
			[1] = 'int32':position	[ 阵形位置,0~8]
			[2] = 'int32':templateId	[ 角色模版ID,对应配置表ID]
			[3] = 'int32':quality	[ 品质]
			[4] = 'int32':level	[等级]
			[5] = 'int32':forgingQuality	[角色最高炼体品质]
		},
	}
--]]
s2c.GET_HERODUEL_DETAILS_RESPONSE = 0x6f0f

--[[
	[1] = {--ContractInfo
		[1] = {--repeated ContractMsg
			[1] = 'int32':id	[	契约ID]
			[2] = 'int64':startTime	[开始时间]
			[3] = 'int64':endTime	[ 结束时间]
			[4] = 'int64':lastGotRewardTime	[上次领奖时间]
		},
		[2] = 'int64':lastGotCardRewardTime	[上次激活双月卡奖励领取时间]
	}
--]]
s2c.CONTRACT_INFO = 0x2800

--[[
	[1] = {--LongMenBreakInfoResponse
		[1] = {--LongMenBreakInfo
			[1] = 'int32':floorId	[层数id]
			[2] = 'int32':minedCount	[排雷次数]
			[3] = 'int32':reviveCount	[复活次数]
			[4] = 'int32':resetCount	[重置次数]
			[5] = 'int32':challengeCount	[挑战次数]
			[6] = 'int32':die	[是否死亡]
			[7] = 'int32':start	[是否开始]
			[8] = 'repeated int32':point	[开启下标]
		},
		[2] = {--repeated LongMenBreakFloorInfo
			[1] = 'int32':floorId	[层id]
			[2] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[3] = 'int32':minedCount	[排雷次数]
			[4] = 'int32':reviveCount	[复活次数]
			[5] = 'int32':resetCount	[重置次数]
			[6] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
		},
		[3] = {--repeated LongMenBreakConsumeInfo
			[1] = 'int32':type	[1:刷新  2:每日挑战 3:购买物品]
			[2] = 'string':value	[type为0时:只有一个整型表示消耗元宝数量    type为1时:xx_xx_xx_xx_xx type为2时:goodsId_xx(元宝)|goodsId_xx(元宝)    //type为0时:只有一个整型表示消耗元宝数量    type为1时:xx_xx_xx_xx_xx type为2时:goodsId_xx(元宝)|goodsId_xx(元宝)]
		},
	}
--]]
s2c.LONG_MEN_BREAK_INFO_RESPONSE = 0x6900

--[[
	[1] = {--LongMenBreakClickResponse
		[1] = 'int32':pointType
		[2] = 'repeated int32':pointTypes
	}
--]]
s2c.LONG_MEN_BREAK_CLICK_RESPONSE = 0x6902

--[[
	[1] = {--ReponseBreachDestiny
	}
--]]
s2c.REPONSE_BREACH_DESTINY = 0x3f04

--[[
	[1] = {--RefuseSuccessResponse
	}
--]]
s2c.REFUSE_SUCCESS_RESPONSE = 0x6e05

--[[
	[1] = {--LongMenBreakUseXuanJiJingResponse
		[1] = 'int32':index	[ 下标]
		[2] = 'int32':floorId	[ 层id]
	}
--]]
s2c.LONG_MEN_BREAK_USE_XUAN_JI_JING_RESPONSE = 0x6903

--[[
	[1] = {--AgreedApply
	}
--]]
s2c.AGREED_APPLY = 0x4403

--[[
	[1] = {--MyRedPacketReponse
		[1] = {--PlayerRedPacketInfo
			[1] = 'int32':integral	[ 红包积分]
			[2] = 'int32':currency	[ 红包代币]
		},
	}
--]]
s2c.MY_RED_PACKET_REPONSE = 0x6b04

--[[
	[1] = {--BuyBackInfoResponse
		[1] = {--repeated BuyBackConfig
			[1] = 'int32':id	[商品信息id]
			[2] = 'string':goods	[商品数据(type,id,num)    //商品数据(type,id,num)]
			[3] = 'int32':price	[原价格]
			[4] = 'int32':currentPrice	[现价格]
			[5] = 'int32':discount	[商品折扣]
			[6] = 'int32':customerLimit	[个人限购数量]
			[7] = 'int32':beginTime	[上架时间]
			[8] = 'int32':endTime	[下架时间]
		},
		[2] = {--repeated BuyBackRewardConfig
			[1] = 'int32':id	[配置id]
			[2] = 'int32':consumeNum	[消耗元宝]
			[3] = 'int32':rewardNum	[返现奖励的元宝]
		},
		[3] = {--repeated BuyBackDataHistory
			[1] = 'int32':id	[商品id]
			[2] = 'int32':type	[类型(0:购买历史 1:获赠历史)    //类型(0:购买历史 1:获赠历史)]
			[3] = 'int64':time	[时间]
		},
		[4] = {--repeated BuyBackData
			[1] = 'int32':id	[商品信息id]
			[2] = 'int32':current	[玩家当前购买数量]
		},
		[5] = 'int32':consumeNum	[消耗的元宝数]
		[6] = 'repeated int32':rewardId	[返现id]
		[7] = 'string':buyBack	[买几反几(num_num)    //买几反几(num_num)]
	}
--]]
s2c.BUY_BACK_INFO_RESPONSE = 0x5b01

--[[
	[1] = {--OpenWorshipBoxReult
	}
--]]
s2c.OPEN_WORSHIP_BOX_REULT = 0x440e

--[[
	[1] = {--QimenBreachMsgResult
	}
--]]
s2c.QIMEN_BREACH_MSG_RESULT = 0x5202

--[[
	[1] = {--RefreshWorldBeast
		[1] = 'int32':blood	[年兽血量]
		[2] = 'int64':lastRefreshTime	[年兽被干掉的时间]
	}
--]]
s2c.REFRESH_WORLD_BEAST = 0x6110

--[[
	[1] = {--CreatePlayerResult
		[1] = 'int32':statusCode	[状态码]
	}
--]]
s2c.CREATE_PLAYER_RESULT = 0x0d01

--[[
	[1] = {--GetSign
		[1] = 'int32':monthDay	[当天是本月第几天]
		[2] = 'bool':isSign	[是否已签到]
		[3] = 'int32':month	[当前月数]
		[4] = 'int32':monthDaySum	[当前月数总共天数]
	}
--]]
s2c.GET_SIGN = 0x2701

--[[
	[1] = {--Grand
		[1] = {--GrandType(enum)
			'v4':GrandType
		},
		[2] = 'string':msg	[消息 用,隔开]
	}
--]]
s2c.GRAND = 0x4506

--[[
	[1] = {--CrossGrand
		[1] = {--CrossGrandType(enum)
			'v4':CrossGrandType
		},
		[2] = 'string':msg	[消息 用,隔开]
	}
--]]
s2c.CROSS_GRAND = 0x4521

--[[
	[1] = {--EquipmentInfo
		[1] = 'int64':userid	[userid  唯一id]
		[2] = 'int32':id	[id]
		[3] = 'int32':level	[level]
		[4] = 'int32':quality	[品质]
		[5] = 'string':base_attr	[基本属性]
		[6] = 'string':extra_attr	[附加属性]
		[7] = 'int32':grow	[成长值]
		[8] = 'int32':holeNum	[宝石孔数]
		[9] = {--repeated GemPos
			[1] = 'int32':pos	[ pos]
			[2] = 'int32':id	[ id]
		},
		[10] = 'int32':star	[星级]
		[11] = 'int32':starFailFix	[升星失败率修正值]
		[12] = 'int32':refineLevel	[精炼等级]
		[13] = {--repeated Recast
			[1] = 'int32':quality
			[2] = 'int32':ratio
			[3] = 'int32':index
		},
		[14] = 'int32':stepExp
		[15] = 'int32':stepLevel
		[16] = 'int32':throughLevel
	}
--]]
s2c.EQUIPMENT_INFO = 0x100d

--[[
	[1] = {--HeartBeatResponse
		[1] = 'int32':playerId
	}
--]]
s2c.HEART_BEAT_RESPONSE = 0x0d23

--[[
	[1] = {--LimitHotBuyReponse
		[1] = {--LimitHotDataInfo
			[1] = 'int32':id	[商品信息id]
			[2] = 'int32':current	[玩家当前购买数量]
			[3] = 'int32':serverCurrent	[服务器当前当前购买数量]
		},
	}
--]]
s2c.LIMIT_HOT_BUY_REPONSE = 0x5a02

--[[
	[1] = {--TreasureBoxContent
		[1] = 'int32':index	[移除的宝箱索引.1--n    //移除的宝箱索引.1--n]
		[2] = 'int32':resType	[资源类型]
		[3] = 'int32':resId	[资源ID]
		[4] = 'int32':number	[数量]
	}
--]]
s2c.TREASURE_BOX_CONTENT = 0x2205

--[[
	[1] = {--GangUpLevelBuffResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_UP_LEVEL_BUFF_RESULT = 0x1818

--[[
	[1] = {--GetHasPurchased
		[1] = {--repeated HasPurchasedCommodity
			[1] = 'int32':commodityId	[购买商品的id]
			[2] = 'int32':num	[已购买数量]
		},
	}
--]]
s2c.GET_HAS_PURCHASED = 0x1901

--[[
	[1] = {--QuickPassResult
		[1] = 'int32':missionId	[关卡Id]
		[2] = 'int32':useQuickPassTimes	[已使用免费扫荡次数]
		[3] = 'int32':useResetTimes	[使用重置次数]
		[4] = 'int32':challengeCount	[今日挑战次数]
		[5] = {--repeated QuickPassResultItem
			[1] = {--repeated RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[2] = 'int32':addExp	[增加团队经验]
			[3] = 'int32':oldLev	[原先团队等级]
			[4] = 'int32':currLev	[当前团队等级]
			[5] = 'int32':addCoin	[增加金币]
		},
	}
--]]
s2c.QUICK_PASS_RESULT = 0x1204

--[[
	[1] = {--LadderRank
		[1] = {--repeated LadderRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':grade
			[4] = 'int32':star
			[5] = 'string':serverName
			[6] = 'int32':useIcon
			[7] = 'int32':power
			[8] = 'int32':headPicFrame
			[9] = 'int32':level
			[10] = 'int32':starHeroRanking
		},
		[2] = 'int32':grade
		[3] = 'int32':star
	}
--]]
s2c.LADDER_RANK = 0x7902

--[[
	[1] = {--ReponseUpEquipDestiny
	}
--]]
s2c.REPONSE_UP_EQUIP_DESTINY = 0x3f03

--[[
	[1] = {--shareKnight
	}
--]]
s2c.SHARE_KNIGHT = 0x7a07

--[[
	[1] = {--GangAddMemberListMsg
		[1] = {--repeated GangPlayerItem
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家昵称]
			[3] = 'int32':playerLevel	[玩家等级]
			[4] = 'int32':generalId	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[5] = 'int32':fightPower	[战力]
		},
	}
--]]
s2c.GANG_ADD_MEMBER_LIST = 0x1804

--[[
	[1] = {--UpdateCrossEliteSucess
		[1] = 'bool':sucess
	}
--]]
s2c.UPDATE_CROSS_ELITE_SUCESS = 0x443c

--[[
	[1] = {--RoleFateInfo
		[1] = 'int64':instanceId	[角色实例ID]
		[2] = 'int32':roleFateId	[角色缘分id]
		[3] = 'int64':endTime	[使用结束时间]
		[4] = 'bool':forever	[是否永久有效]
	}
--]]
s2c.ROLE_FATE_INFO = 0x5602

--[[
	[1] = {--RefreshHeroAmbitionInfo
		[1] = 'int32':freeChallengeCount	[已使用免费挑战次数]
		[2] = 'int32':buyChallengeCount	[已购买挑战次数]
	}
--]]
s2c.REFRESH_HERO_AMBITION_INFO = 0x3904

--[[
	[1] = {--GuildMemberInfoList
		[1] = {--repeated GuildMemberInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':power	[战斗力]
			[5] = 'int64':lastLoginTime	[最后登录时间]
			[6] = 'int32':profession	[职业]
			[7] = 'int32':level	[等级]
			[8] = 'int32':competence	[权限]
			[9] = 'int32':totleDedication	[总贡献]
			[10] = 'int32':todayDedication	[今日贡献]
			[11] = 'int32':makedCoubt	[被结交次数]
			[12] = 'bool':online
			[13] = 'int32':minePower	[护矿战斗力]
			[14] = 'int32':icon	[头像]
			[15] = 'int32':headPicFrame	[头像边框]
			[16] = 'int32':starHeroRanking	[名人堂排名]
			[17] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.GUILD_MEMBER_INFO_LIST = 0x4407

--[[
	[1] = {--MerceanryTeamOperationNotify
		[1] = 'int32':operation	[操作符,1.领取;2.归队]
		[2] = 'repeated int32':coin	[收入:派遣收入.雇佣收入]
	}
--]]
s2c.MERCEANRY_TEAM_OPERATION_NOTIFY = 0x5153

--[[
	[1] = {--ChangedStruct
		[1] = {--ChangedType(enum)
			'v4':ChangedType
		},
		[2] = {--EquipmentInfo
			[1] = 'int64':userid	[userid  唯一id]
			[2] = 'int32':id	[id]
			[3] = 'int32':level	[level]
			[4] = 'int32':quality	[品质]
			[5] = 'string':base_attr	[基本属性]
			[6] = 'string':extra_attr	[附加属性]
			[7] = 'int32':grow	[成长值]
			[8] = 'int32':holeNum	[宝石孔数]
			[9] = {--repeated GemPos
				[1] = 'int32':pos	[ pos]
				[2] = 'int32':id	[ id]
			},
			[10] = 'int32':star	[星级]
			[11] = 'int32':starFailFix	[升星失败率修正值]
			[12] = 'int32':refineLevel	[精炼等级]
			[13] = {--repeated Recast
				[1] = 'int32':quality
				[2] = 'int32':ratio
				[3] = 'int32':index
			},
			[14] = 'int32':stepExp
			[15] = 'int32':stepLevel
			[16] = 'int32':throughLevel
		},
		[3] = {--ItemInfo
			[1] = 'int64':id	[ id]
			[2] = 'int32':num	[ num]
		},
	}
--]]
s2c.CHANGED_STRUCT = 0x1041

--[[
	[1] = {--GemBulidResult
		[1] = 'int32':result	[是否成功]
		[2] = 'bool':success	[是否合成成功,当且仅当result为0时发送]
	}
--]]
s2c.GEM_BULID_RESULT = 0x1050

--[[
	[1] = {--EmployTeamDetails
		[1] = 'int32':fromId	[雇佣自哪个玩家,玩家ID]
		[2] = 'int32':useType	[使用类型,哪里使用,可以根据战斗类型进行定义或者阵形.系统类型进行定义]
		[3] = {--repeated EmployRoleDetails
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':position	[上阵位置]
			[3] = 'int32':roleId	[ 卡牌的id]
			[4] = 'int32':level	[ 等级]
			[5] = 'int32':martialLevel	[ 武学等级]
			[6] = 'int32':starlevel	[ 星级]
			[7] = 'int32':power	[ 战力]
			[8] = 'int32':hp	[ 剩余HP]
			[9] = 'string':spell	[ 技能表达式:id_level|--]
			[10] = 'string':attributes	[ 属性字符串]
			[11] = 'string':immune	[ 免疫概率]
			[12] = 'string':effectActive	[ 效果影响主动]
			[13] = 'string':effectPassive	[ 效果影响被动]
			[14] = 'int32':quality	[品质,角色可以升品了]
		},
		[4] = {--repeated AssistantDetails
			[1] = 'int32':position	[位置]
			[2] = 'int32':roleId	[卡牌类型,职业,如:段誉.乔峰]
			[3] = 'int64':instanceId	[实例ID]
			[4] = 'int32':quality	[品质,角色可以升品了]
		},
	}
--]]
s2c.EMPLOY_TEAM_DETAILS = 0x5161

--[[
	[1] = {--OneKeyEquipMartialResult
		[1] = 'int64':roleId	[角色id]
		[2] = {--repeated MartialInfo
			[1] = 'int32':id	[武学id]
			[2] = 'int32':position	[装备位置]
			[3] = 'int32':enchantLevel	[附魔等级]
			[4] = 'int32':enchantProgress	[附魔当前经验进度]
		},
	}
--]]
s2c.ONE_KEY_EQUIP_MARTIAL_RESULT = 0x3410

--[[
	[1] = {--RelogonNotifyMsg
	}
--]]
s2c.RELOGON_NOTIFY = 0x0dff

--[[
	[1] = {--GamblingStateDetails
		[1] = 'int32':enableType	[激活的赌石按钮,位运算存储:1.试刀;2.切割;4.打磨;8.精工;16.雕琢]
		[2] = 'int32':betToday	[今日赌石次数]
		[3] = 'int32':betTotal	[总赌石次数]
		[4] = 'int64':lastUpdate	[最后赌石时间]
	}
--]]
s2c.GAMBLING_STATE_DETAILS = 0x5807

--[[
	[1] = {--ServerInfoMsg
		[1] = 'int64':openTime	[开服时间]
	}
--]]
s2c.SERVER_INFO = 0x7f12

--[[
	[1] = {--EscortAgencyRankHistoryResponse
		[1] = {--CardRankInfo
			[1] = 'int32':myGuildId	[我的入榜工会id0表示未入榜]
			[2] = 'string':bannerId	[帮派旗帜]
			[3] = 'int32':lastScore	[最低入榜排积分]
			[4] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
			[5] = 'string':myGuildName	[工会名称]
			[6] = {--repeated CardRank
				[1] = {--CardInfo
					[1] = 'int32':guildId	[帮会id]
					[2] = 'string':bannerId	[帮会旗帜id]
					[3] = 'int32':serverId	[服务器id]
					[4] = 'string':serverName	[服务器名字]
					[5] = 'int32':score	[积分]
					[6] = 'int32':quality	[品质]
					[7] = {--repeated PartInfo
						[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
						[2] = 'int32':lastResTime	[最近一次复活时间]
						[3] = 'int32':status	[状态 0:完好 1:损毁]
						[4] = {--repeated PlayerData
							[1] = 'int32':playerId	[玩家id]
							[2] = 'string':playerName	[玩家名称]
							[3] = 'int32':useCoin	[玩家头像]
							[4] = 'int32':frameId	[玩家头像框]
							[5] = 'string':guildName	[帮会名称]
							[6] = 'string':serverName	[服务器名称]
							[7] = 'int32':power	[战力]
							[8] = 'int32':dieTime	[最近一次死亡时间]
							[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
							[10] = 'int32':type	[类型 0:防守方 1:攻击方]
						},
						[5] = {--repeated DiePlayer
							[1] = 'int32':playerId	[玩家id]
							[2] = 'string':playerName	[玩家名称]
							[3] = 'string':guildName	[帮会名称]
							[4] = 'string':serverName	[服务器名称]
							[5] = 'int32':power	[战力]
							[6] = 'int32':dieTime	[死亡时间]
						},
					},
				},
				[2] = 'string':guildName	[帮派名字]
				[3] = 'string':serverName	[服务器名字]
				[4] = 'int32':serverId	[服务器id]
				[5] = 'int32':rank	[排名]
			},
		},
		[2] = {--KillRankInfo
			[1] = 'int32':myPlayerId	[我的id0表示未入榜]
			[2] = 'int32':useCoin	[头像]
			[3] = 'int32':frameId	[头像框]
			[4] = 'int32':lastScore	[最低入榜排积分]
			[5] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
			[6] = 'string':myPlayerName	[玩家名称]
			[7] = 'string':guildName	[帮派名称]
			[8] = {--repeated KillRank
				[1] = 'int32':playerId	[玩家id]
				[2] = 'int32':useCoin	[头像]
				[3] = 'int32':frameId	[头像框]
				[4] = 'string':serverName	[服务器名称]
				[5] = 'int32':serverId	[服务器id]
				[6] = 'string':playerName	[玩家名称]
				[7] = 'string':guildName	[帮派名称]
				[8] = 'int32':power	[战力]
				[9] = 'int32':killCount	[击杀数量]
				[10] = 'int32':rank	[排行]
			},
		},
	}
--]]
s2c.ESCORT_AGENCY_RANK_HISTORY_RESPONSE = 0x5f10

--[[
	[1] = {--RequestEquipResult
		[1] = 'int32':statusCode	[状态码,0表示操作成功,在操作成功的情况下会收到0x1042指令]
	}
--]]
s2c.REQUEST_EQUIP_RESULT = 0x1011

--[[
	[1] = {--ArenaTopBattleReportList
		[1] = {--repeated ArenaTopBattleReportInfo
			[1] = 'int32':reportId	[战报ID]
			[2] = 'int32':fightType	[战斗类型]
			[3] = 'bool':win	[是否胜利]
			[4] = 'int64':time	[时间]
			[5] = 'int32':ranking	[被挑战者排名]
			[6] = 'int32':fromRank	[挑战者排名]
			[7] = 'int32':power	[挑战者战力]
			[8] = 'int32':targetPower	[被挑战者战力,0表示未知,以前老数据没有记录这个字段]
			[9] = {--ArenaTopBattleReportRole
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':name	[名字]
				[3] = 'int32':profession	[主角职业]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[VIP等级]
				[6] = 'int32':power	[战力]
				[7] = 'int32':serverId	[服务器ID]
			},
			[10] = {--ArenaTopBattleReportRole
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':name	[名字]
				[3] = 'int32':profession	[主角职业]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[VIP等级]
				[6] = 'int32':power	[战力]
				[7] = 'int32':serverId	[服务器ID]
			},
		},
	}
--]]
s2c.ARENA_TOP_BATTLE_REPORT_LIST = 0x1d40

--[[
	[1] = {--EquipmentStarUpResult
		[1] = {--EquipmentStarSuccess
			[1] = 'int64':equipment	[装备userid]
			[2] = 'int32':star	[星级]
			[3] = 'int32':grow	[成长值]
		},
		[2] = {--EquipmentStarFail
			[1] = 'int64':equipment	[装备userid]
			[2] = 'int32':fail	[失败补偿值]
		},
	}
--]]
s2c.EQUIPMENT_STAR_UP_RESULT = 0x1020

--[[
	[1] = {--LongMenBreakRefreshResponse
		[1] = {--repeated RewardItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
		},
	}
--]]
s2c.LONG_MEN_BREAK_REFRESH_RESPONSE = 0x6904

--[[
	[1] = {--GainChampionsWarInfoResponse
		[1] = {--repeated ChampionsWarInfo
			[1] = 'int32':round	[轮次]
			[2] = 'int32':index	[索引]
			[3] = 'int32':atkPlayerId	[攻击玩家编号]
			[4] = 'int32':defPlayerId	[防守玩家编号]
			[5] = 'int32':winPlayerId	[胜利的玩家]
			[6] = 'int32':replayId	[ 录像编号]
			[7] = 'string':atkPlayerName	[攻击玩家名]
			[8] = 'string':defPlayerName	[防守玩家名]
			[9] = 'int32':betPlayerId	[押注的玩家编号]
			[10] = 'int32':coin	[押注金额]
			[11] = 'int32':atkProfession	[攻击玩家职业]
			[12] = 'int32':defProfession	[防守玩家职业]
			[13] = 'int32':atkPower	[攻击玩家战斗力]
			[14] = 'int32':defPower	[防守玩家战斗力]
			[15] = 'repeated int64':atkFormation
			[16] = 'repeated int64':defFormation
			[17] = 'int32':atkIcon	[攻击玩家头像]
			[18] = 'int32':defIcon	[防守玩家头像]
			[19] = 'int32':atkHeadPicFrame	[攻击玩家头像边框]
			[20] = 'int32':defHeadPicFrame	[防守玩家头像边框]
			[21] = 'int32':atkPeakAddition	[论剑峰属性加层 万分比]
			[22] = 'int32':defPeakAddition	[论剑峰属性加层 万分比]
			[23] = 'int32':atkStarHeroRanking	[名人堂排名]
			[24] = 'int32':defStarHeroRanking	[名人堂排名]
		},
	}
--]]
s2c.GAIN_CHAMPIONS_WAR_INFO_RESPONSE = 0x4511

--[[
	[1] = {--GuildBossRankResponse
		[1] = 'int32':type	[类型(1:阶段榜 2:首次击破阶段榜)    //类型(1:阶段榜 2:首次击破阶段榜)]
		[2] = {--GuildBossRankInfo
			[1] = 'int32':myGuildId	[我的入榜工会id0表示未入榜]
			[2] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
			[3] = 'int32':myStage	[我的阶段]
			[4] = 'string':myGuildName	[工会名称]
			[5] = 'int32':myTime	[耗时]
			[6] = {--repeated GuildBossRank
				[1] = 'int32':guildId	[帮派名称]
				[2] = 'string':guildName	[帮派名字]
				[3] = 'string':serverName	[服务器名字]
				[4] = 'int32':serverId	[服务器id]
				[5] = 'int32':rank	[排名]
				[6] = 'int32':stage	[阶段]
				[7] = 'int32':time	[耗时]
			},
		},
	}
--]]
s2c.GUILD_BOSS_RANK_RESPONSE = 0x4b06

--[[
	[1] = {--EquipmentRefiningResult
		[1] = 'int64':equipment	[装备userid]
		[2] = 'string':extra_attr	[附加属性]
	}
--]]
s2c.EQUIPMENT_REFINING_RESULT = 0x1019

--[[
	[1] = {--FundData
		[1] = {--repeated FundInfo
			[1] = 'int32':fundId	[ 基金ID]
			[2] = 'int32':status	[ 0未购买 1已购买 2已领奖]
		},
	}
--]]
s2c.FUND_DATA = 0x2072

--[[
	[1] = {--DriveWorldBeast
		[1] = 'int32':blood	[年兽血量]
		[2] = 'int64':lastRefreshTime	[年兽被干掉的时间]
		[3] = {--repeated DropMoney
			[1] = 'int32':index	[元宝下标]
			[2] = 'int32':gameMoney	[元宝数]
		},
	}
--]]
s2c.DRIVE_WORLD_BEAST = 0x6108

--[[
	[1] = {--SendWorldBeastRank
		[1] = {--repeated DriveWorldBeastRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':score
			[4] = 'int32':rank
		},
		[2] = 'int32':myRank
		[3] = 'int32':myScore
	}
--]]
s2c.SEND_WORLD_BEAST_RANK = 0x6109

--[[
	[1] = {--AllBibleKeyReponse
		[1] = {--repeated BibleKeyData
			[1] = 'int64':id	[ 秘钥实例id]
			[2] = 'int32':template_id	[ 模板id]
			[3] = 'int32':level	[ 等级]
			[4] = 'int64':bibleId	[天书实例id]
		},
	}
--]]
s2c.ALL_BIBLE_KEY_REPONSE = 0x6026

--[[
	[1] = {--EmployTeamRelease
		[1] = 'int32':playerId	[雇佣的角色属于哪个玩家]
		[2] = 'int32':useType	[使用类型,客户端定义,这里可以是战斗类型]
	}
--]]
s2c.EMPLOY_TEAM_RELEASE = 0x5170

--[[
	[1] = {--LadderFormation
		[1] = 'int32':grade
		[2] = {--OtherPlayerDetails
			[1] = 'int32':playerId	[玩家id]
			[2] = 'int32':profession	[职业]
			[3] = 'string':name	[昵称]
			[4] = 'int32':level	[等级]
			[5] = 'int32':vipLevel	[vip等级]
			[6] = 'int32':power	[战力]
			[7] = {--repeated RoleDetails
				[1] = 'int32':id	[ 卡牌的id]
				[2] = 'int32':level	[ 等级]
				[3] = 'int64':curexp	[ 当前经验]
				[4] = 'int32':power	[战力]
				[5] = 'string':attributes	[属性字符串]
				[6] = 'int32':warIndex	[战阵位置信息]
				[7] = {--repeated SimpleRoleEquipment
					[1] = 'int32':id	[ id]
					[2] = 'int32':level	[ level]
					[3] = 'int32':quality	[品质]
					[4] = 'int32':refineLevel	[精炼等级]
					[5] = {--repeated GemPos
						[1] = 'int32':pos	[ pos]
						[2] = 'int32':id	[ id]
					},
					[6] = {--repeated Recast
						[1] = 'int32':quality
						[2] = 'int32':ratio
						[3] = 'int32':index
					},
					[7] = 'int32':stepExp
					[8] = 'int32':stepLevel
					[9] = 'int32':throughLevel
				},
				[8] = {--repeated SimpleBook
					[1] = 'int32':templateId	[ 秘籍模板ID]
					[2] = 'int32':level	[ 等级]
					[3] = 'int32':attribute	[属性值]
				},
				[9] = {--repeated SimpleMeridians
					[1] = 'int32':index	[ 经脉位置,1~N]
					[2] = 'int32':level	[ 等级]
					[3] = 'int32':attribute	[属性值]
				},
				[10] = 'int32':starlevel	[ 星级]
				[11] = 'repeated int32':fateIds	[ 拥有缘分]
				[12] = {--repeated SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[13] = 'int32':quality	[品质]
				[14] = 'int32':martialLevel	[武学等级]
				[15] = {--repeated OtherMartialInfo
					[1] = 'int32':id	[武学id]
					[2] = 'int32':position	[装备位置]
					[3] = 'int32':enchantLevel	[附魔等级]
				},
				[16] = 'string':immune	[免疫概率]
				[17] = 'string':effectActive	[效果影响主动]
				[18] = 'string':effectPassive	[效果影响被动]
				[19] = {--repeated BibleInfo
					[1] = 'int64':instanceId	[唯一id]
					[2] = 'int32':id	[模板id]
					[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
					[4] = 'int32':level	[重级]
					[5] = 'int32':breachLevel	[突破]
					[6] = {--repeated EssentialPos
						[1] = 'int32':pos	[ pos]
						[2] = 'int32':id	[精要模板id]
					},
					[7] = 'repeated int32':gemId	[ 天书宝石]
					[8] = {--BibleComprehendInfo
						[1] = 'int64':bibleId	[天书id]
						[2] = 'int32':stageId	[阶段id]
						[3] = 'int32':useCount	[参悟丹使用次数]
						[4] = 'int32':reachId	[达成的id]
						[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
						[6] = {--repeated BibleStageInfo
							[1] = 'int32':stage	[阶段id]
							[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
							[3] = 'repeated int32':attIndex	[属性下标]
							[4] = 'repeated int32':value	[属性值]
						},
					},
				},
				[20] = 'int32':forgingQuality	[角色最高炼体品质]
				[21] = 'int32':skillStarLevel
				[22] = 'int32':biblePracticeQuality	[ 天书研修的最高品质]
				[23] = {--repeated BiblePracticeData
					[1] = 'int32':position	[ 位置]
					[2] = 'int32':level	[ 等级]
				},
				[24] = 'bool':equipHide	[是否隐藏装备信息]
				[25] = {--repeated HeartMethodEquipInfo
					[1] = 'int64':instanceId	[唯一id]
					[2] = 'int32':itemId	[模板id]
					[3] = 'int64':roleId	[装备的角色id,0表示当前未装备]
					[4] = 'int32':practiceId	[x]
					[5] = 'int32':breachId	[突破]
					[6] = {--repeated HeartMethodGem
						[1] = 'int32':pos	[ 位置]
						[2] = 'int32':itemId	[ 宝石ID]
					},
					[7] = {--repeated HeartMethodConcise
						[1] = 'int32':pos	[ 位置]
						[2] = 'int32':level	[ 凝练等级]
					},
					[8] = {--repeated HeartMethodRecast
						[1] = 'int32':pos	[ 位置]
						[2] = 'int32':level	[ 重铸等级]
					},
				},
			},
			[8] = {--repeated LeadingRoleSpell
				[1] = {--SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[2] = 'bool':choice	[是否选中]
				[3] = 'int32':sid	[法术的种类ID,一种法术有多个等级,但是统一法术SID一致]
			},
			[9] = 'int32':icon	[头像]
			[10] = 'int32':headPicFrame	[正在使用的头像框]
			[11] = 'int32':starHeroRanking	[名人堂排名]
			[12] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.LADDER_FORMATION = 0x7906

--[[
	[1] = {--RefreshHeroDuelPlayersResponse
		[1] = 'int32':myGroup	[我的分组(1东华.2江南.3西川.4朔北)    //我的分组(1东华.2江南.3西川.4朔北)]
		[2] = 'int32':myRank	[我的排名]
		[3] = 'int32':myScore	[我的积分]
		[4] = {--repeated HeroDuelPlayer
			[1] = 'int32':rank	[排行]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'string':playerName	[玩家昵称]
			[4] = 'int32':playerLevel	[玩家等级]
			[5] = 'int32':useIcon	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[6] = 'int32':fightPower	[战力]
			[7] = 'string':serverName	[服务器名称]
			[8] = 'string':guildName	[帮派名称]
			[9] = 'int32':playerGroup	[玩家分组(1东华.2江南.3西川.4朔北)    //玩家分组(1东华.2江南.3西川.4朔北)]
			[10] = 'repeated int32':suitNum	[套装数量]
			[11] = 'string':bannerId	[帮派旗帜]
			[12] = 'int32':playerScore	[玩家积分]
		},
	}
--]]
s2c.REFRESH_HERO_DUEL_PLAYERS_RESPONSE = 0x6f03

--[[
	[1] = {--BibleGemUnResult
		[1] = 'int32':result	[ 0成功 1失败]
		[2] = 'int32':pos	[ 位置]
		[3] = 'int64':bibleId	[镶嵌的天书id]
	}
--]]
s2c.BIBLE_GEM_UN_RESULT = 0x6013

--[[
	[1] = {--GuildBossPushResponse
		[1] = 'int32':type	[类型(1:玩家造成伤害推送 2:助战伤害推送)    //类型(1:玩家造成伤害推送 2:助战伤害推送)]
		[2] = 'repeated int32':npcId	[npcId]
		[3] = 'repeated int32':hurt	[造成伤害]
		[4] = 'int32':playerId	[玩家Id]
		[5] = 'string':playerName	[玩家名字]
	}
--]]
s2c.GUILD_BOSS_PUSH_RESPONSE = 0x4b07

--[[
	[1] = {--EquipmentExplodeResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':userid
	}
--]]
s2c.EQUIPMENT_EXPLODE_RESULT = 0x1016

--[[
	[1] = {--UpdateEmployFormationNotify
		[1] = 'int32':type	[阵形类型,9.推图阵形]
		[2] = {--repeated MercenaryTeamRole
			[1] = 'int64':instanceId	[角色实例ID]
			[2] = 'int32':position	[位置,0~8]
		},
		[3] = {--repeated AssistantDetails
			[1] = 'int32':position	[位置]
			[2] = 'int32':roleId	[卡牌类型,职业,如:段誉.乔峰]
			[3] = 'int64':instanceId	[实例ID]
			[4] = 'int32':quality	[品质,角色可以升品了]
		},
		[4] = 'int64':employRole	[佣兵角色实例ID,阵上如果有佣兵角色,则为该佣兵角色的实例ID,否则为0]
	}
--]]
s2c.UPDATE_EMPLOY_FORMATION_NOTIFY = 0x5130

--[[
	[1] = {--usedInvocatoryGoodsResult
		[1] = 'int32':roleId	[祈愿的侠客id]
		[2] = 'int32':rewardDay	[领取奖励天数累计]
		[3] = {--repeated InvocatoryInfo
			[1] = 'int32':roleId	[侠客模板id]
			[2] = 'int32':roleNum	[三个卡槽的侠客数量]
			[3] = 'int32':roleSycee	[三个卡槽的侠客花费]
			[4] = 'int32':isGetReward	[是否领取了祈愿奖励  0是未领取1是已经领取]
		},
	}
--]]
s2c.USED_INVOCATORY_GOODS_RESULT = 0x5404

--[[
	[1] = {--UpdateGuildActiveRedPacket
		[1] = 'int32':smallStatus	[小忠义值红包状态,  0是未开启,1是开启未发,2是已发]
		[2] = 'int32':bigStatus	[大忠义值红包状态, 0是未开启,1是开启未发,2是已发]
		[3] = 'int32':secondlyProgress	[帮派忠义值]
	}
--]]
s2c.UPDATE_GUILD_ACTIVE_RED_PACKET = 0x4448

--[[
	[1] = {--NewNotice
	}
--]]
s2c.NEW_NOTICE = 0x4430

--[[
	[1] = {--OtherPlayerBaseInfo
		[1] = 'int32':playerId	[玩家id]
		[2] = 'int32':profession	[职业]
		[3] = {--Sex(enum)
			'v4':Sex
		},
		[4] = 'string':name	[昵称]
		[5] = 'int32':level	[等级]
		[6] = 'int32':power	[总战力]
	}
--]]
s2c.OTHER_PLAYER_BASE_INFO = 0x0e70

--[[
	[1] = {--VerifyInviteCodeResult
	}
--]]
s2c.VERIFY_INVITE_CODE_RESULT = 0x2601

--[[
	[1] = {--BigCompetAwardAll
		[1] = {--repeated BigCompetAward
			[1] = 'int32':type
			[2] = 'int32':step	[当前达到条件    1]
			[3] = 'int32':condition	[保底条件   格式    1;2;3   ;分割天数]
			[4] = 'int32':state	[保底 领取  0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[5] = 'string':reward_1	[结束时奖励     1,2001,12| 1,2001,12| 1,2001,12-1   |分割奖励    //结束时奖励     1,2001,12| 1,2001,12| 1,2001,12-1   |分割奖励]
			[6] = 'string':reward_2	[排行榜奖励     1,2001,12| 1,2001,12| 1,2001,12&1,2001,12 |分割奖励]
			[7] = 'string':reward_3	[保底奖励       1;2;3     ;分割天数]
		},
	}
--]]
s2c.BIG_COMPET_AWARD_ALL = 0x3306

--[[
	[1] = {--EmploySingleRoleDetails
		[1] = 'int64':instanceId	[角色实例ID]
		[2] = 'int32':useType	[使用系统]
		[3] = 'int32':roleId	[ 卡牌的id]
		[4] = 'int32':level	[ 等级]
		[5] = 'int32':martialLevel	[ 武学等级]
		[6] = 'int32':starlevel	[ 星级]
		[7] = 'int32':power	[ 战力]
		[8] = 'int32':hp	[ 剩余HP]
		[9] = 'string':spell	[ 技能表达式:id_level|--]
		[10] = 'string':attributes	[ 属性字符串]
		[11] = 'string':immune	[ 免疫概率]
		[12] = 'string':effectActive	[ 效果影响主动]
		[13] = 'string':effectPassive	[ 效果影响被动]
		[14] = 'int32':state	[状态:1.正常状态;2.死亡;3.释放]
		[15] = 'int32':quality	[品质,角色可以升品了]
		[16] = 'string':name	[名称,主角名称,只有当角色为主角角色时才有值]
		[17] = 'int32':forgingQuality	[角色最高炼体品质]
	}
--]]
s2c.EMPLOY_SINGLE_ROLE_DETAILS = 0x5114

--[[
	[1] = {--MyTreasureInfo
		[1] = 'string':treasureExpression	[玩家已经拥有的宝藏表达式.挖掘出来的宝藏列表]
		[2] = 'bool':hasMiningPoint	[是否占领了一个挖掘点]
		[3] = 'int32':remainTime	[挖掘宝藏剩余时间.仅在玩家占有一个挖掘点时才具有值]
		[4] = 'int32':type	[所持有的宝藏挖掘点所在的宝藏类型,1:连城宝藏;2:闯王宝藏;3:大清龙脉.仅在玩家占有一个挖掘点时才具有值]
		[5] = 'int32':index	[所占有的宝藏挖掘点的位置索引,1--n取值范围.仅在玩家占有一个挖掘点时才具有值    //所占有的宝藏挖掘点的位置索引,1--n取值范围.仅在玩家占有一个挖掘点时才具有值]
	}
--]]
s2c.MY_TREASURE_INFO = 0x2203

--[[
	[1] = {--FriendPraiseRanks
		[1] = {--repeated FriendPraiseRank
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[名称]
			[3] = 'int32':homeLevel	[家园等级]
			[4] = 'int32':praiseCount	[点赞次数]
			[5] = 'int32':icon	[头像]
			[6] = 'int32':headPicFrame	[头像边框]
			[7] = 'int32':exp
			[8] = {--repeated HomeEventMsg
				[1] = 'int32':eventId
				[2] = 'repeated int32':players
				[3] = 'int32':totleCount
				[4] = 'int32':count
				[5] = 'int32':state
				[6] = 'string':args
				[7] = 'int64':time	[剩余时间]
			},
		},
	}
--]]
s2c.FRIEND_PRAISE_RANKS = 0x7406

--[[
	[1] = {--PickupSuccessNotify
		[1] = 'int32':index	[拾取的目标索引,0表示全部拾取]
	}
--]]
s2c.PICKUP_SUCCESS_NOTIFY = 0x5803

--[[
	[1] = {--GuildZoneInfo
		[1] = {--repeated GuildZoneMsg
			[1] = 'int32':zoneId	[副本编号]
			[2] = 'int32':resetCount	[今日重置次数]
			[3] = 'int32':lockPlayerId	[锁定的玩家]
			[4] = 'int64':lockTime	[锁定的时间]
			[5] = {--repeated GuildCheckpointMsg
				[1] = 'int32':checkpointId	[关卡编号]
				[2] = 'bool':pass
				[3] = {--repeated GuildZoneNpcState
					[1] = 'int32':index	[索引]
					[2] = 'int32':hp	[血量]
					[3] = 'int32':maxHp
				},
			},
			[6] = 'bool':pass
			[7] = 'int64':bastPassTime	[最佳通关时间]
			[8] = 'string':lockPlayerName
			[9] = 'int32':profession
		},
		[2] = {--repeated PlayerGuildZoneMsg
			[1] = 'int32':zoneId	[副本编号]
			[2] = 'int32':challengeCount	[挑战次数]
			[3] = {--repeated PlayerGuildCheckpointMsg
				[1] = 'int32':checkpointId	[关卡编号]
				[2] = 'int32':hurt	[伤害]
			},
			[4] = 'repeated int32':dropAwards	[领取过的奖励]
		},
	}
--]]
s2c.GUILD_ZONE_INFO = 0x441a

--[[
	[1] = {--HomeLevelReponse
		[1] = 'int32':level	[ 等级]
	}
--]]
s2c.HOME_LEVEL_REPONSE = 0x7404

--[[
	[1] = {--UpdateHostingSucess
	}
--]]
s2c.UPDATE_HOSTING_SUCESS = 0x4522

--[[
	[1] = {--EscortAgencyAttackResponse
		[1] = {--CardInfo
			[1] = 'int32':guildId	[帮会id]
			[2] = 'string':bannerId	[帮会旗帜id]
			[3] = 'int32':serverId	[服务器id]
			[4] = 'string':serverName	[服务器名字]
			[5] = 'int32':score	[积分]
			[6] = 'int32':quality	[品质]
			[7] = {--repeated PartInfo
				[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
				[2] = 'int32':lastResTime	[最近一次复活时间]
				[3] = 'int32':status	[状态 0:完好 1:损毁]
				[4] = {--repeated PlayerData
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'int32':useCoin	[玩家头像]
					[4] = 'int32':frameId	[玩家头像框]
					[5] = 'string':guildName	[帮会名称]
					[6] = 'string':serverName	[服务器名称]
					[7] = 'int32':power	[战力]
					[8] = 'int32':dieTime	[最近一次死亡时间]
					[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
					[10] = 'int32':type	[类型 0:防守方 1:攻击方]
				},
				[5] = {--repeated DiePlayer
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'string':guildName	[帮会名称]
					[4] = 'string':serverName	[服务器名称]
					[5] = 'int32':power	[战力]
					[6] = 'int32':dieTime	[死亡时间]
				},
			},
		},
	}
--]]
s2c.ESCORT_AGENCY_ATTACK_RESPONSE = 0x5f06

--[[
	[1] = {--ApplyCrossChampionsSucess
	}
--]]
s2c.APPLY_CROSS_CHAMPIONS_SUCESS = 0x4523

--[[
	[1] = {--NewApply
		[1] = {--FriendInfo
			[1] = 'int32':playerId	[玩家编号]
			[2] = 'string':name	[玩家名称]
			[3] = 'int32':vip	[vip等级]
			[4] = 'int32':power	[战斗力]
			[5] = 'int64':lastLoginTime	[最后登录时间]
			[6] = 'int32':profession	[职业]
			[7] = 'int32':level	[等级]
			[8] = 'bool':online
			[9] = 'int32':guildId
			[10] = 'string':guildName
			[11] = 'int32':minePower	[护矿战斗力]
			[12] = 'int32':icon	[头像]
			[13] = 'int32':headPicFrame	[头像边框]
			[14] = 'int32':starHeroRanking	[名人堂排名]
			[15] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.NEW_APPLY = 0x4308

--[[
	[1] = {--AdventureChallengeResult
		[1] = 'int32':result	[ 0胜利 1失败]
		[2] = 'int32':playerId	[ 挑战的玩家ID]
		[3] = 'int32':type	[ 类型 20.杀戮21.复仇22.挑战排行榜]
	}
--]]
s2c.ADVENTURE_CHALLENGE_RESULT = 0x5912

--[[
	[1] = {--RankingListXiaKe
		[1] = {--repeated RankInfoXiaKe
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'int64':instanceId	[角色实例ID]
			[4] = 'int32':roleId	[角色模版ID,卡牌ID,对应t_s_role表格的id字段]
			[5] = 'int32':value	[战力]
			[6] = 'string':name	[玩家昵称]
			[7] = 'int32':playerLevel	[玩家等级]
			[8] = 'int32':vipLevel	[VIP等级]
			[9] = 'int32':goodNum	[赞次数]
			[10] = 'int32':roleLevel	[角色等级]
			[11] = 'int32':martialLevel	[角色武学等级]
			[12] = 'int32':starLevel	[角色星级]
			[13] = 'int32':quality	[角色品质]
			[14] = 'int32':profession	[头像]
			[15] = 'int32':headPicFrame	[头像边框]
			[16] = 'int32':starHeroRanking	[名人堂排名]
			[17] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':lastValue	[最低入榜层数]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':myBestValue	[我的最佳成绩,用户跟lastValue比较]
		[5] = 'int32':topRoleId	[最高战力卡牌ID,对应t_s_role表ID]
		[6] = 'int64':topInstanceId	[最高战力卡牌实例ID]
		[7] = 'int32':praiseCount	[我自己拥有的赞数量]
	}
--]]
s2c.RANKING_LIST_XIA_KE = 0x4003

--[[
	[1] = {--QualifyingInfoList
		[1] = {--repeated QualifyingInfo
			[1] = {--CrossGuildInfo
				[1] = 'int32':guildId	[公会编号]
				[2] = 'string':guildName	[公会名称]
				[3] = 'string':bannerId	[公会旗帜]
				[4] = 'string':serverName	[服务器名称]
				[5] = 'int32':score	[积分]
				[6] = 'int32':winCount	[胜场]
				[7] = 'int32':lostCount	[负场]
				[8] = 'int32':cityId
			},
			[2] = {--repeated CrossGuildMemberInfo
				[1] = 'string':name
				[2] = 'int32':useIcon
				[3] = 'int32':power
				[4] = 'int32':headPicFrame
				[5] = 'int32':playerId
				[6] = 'int32':starHeroRanking
				[7] = 'int32':ladderGrade	[天梯赛段位]
			},
		},
	}
--]]
s2c.QUALIFYING_INFO_LIST = 0x4433

--[[
	[1] = {--BattleArrayDataReponse
		[1] = {--repeated BattleArrayData
			[1] = 'int64':instanceId	[ 阵法唯一ID]
			[2] = 'int32':type	[ 阵容类型]
		},
	}
--]]
s2c.BATTLE_ARRAY_DATA_REPONSE = 0x6a02

--[[
	[1] = {--ColorEggDataResponse
		[1] = 'int32':count	[彩蛋剩余次数]
		[2] = 'int32':score	[玩家当前积分]
		[3] = {--repeated GoldEggReward
			[1] = 'int32':resType	[资源类型]
			[2] = 'int32':resId	[资源ID]
			[3] = 'int32':number	[资源个数]
			[4] = 'int32':isSpecial	[是否特殊奖]
		},
	}
--]]
s2c.COLOR_EGG_DATA_RESPONSE = 0x4707

--[[
	[1] = {--GangRankListMsg
		[1] = {--repeated GangItem
			[1] = 'int32':rank	[帮派排行]
			[2] = 'int32':gangId	[帮派ID]
			[3] = 'string':gangName	[帮派名称]
			[4] = 'int32':gangLevel	[帮派等级]
			[5] = 'int32':memberNum	[成员数量]
			[6] = 'int32':masterId	[帮主ID]
			[7] = 'string':masterName	[帮主名称]
			[8] = 'int32':applyStatus	[申请状态  0:正常  1:申请中]
		},
	}
--]]
s2c.GANG_RANK_LIST = 0x1800

--[[
	[1] = {--CompletedActivity
		[1] = 'repeated int32':activityId	[ 完成过的活动ID]
	}
--]]
s2c.COMPLETED_ACTIVITY = 0x2308

--[[
	[1] = {--ContestHistoryAllLeiZhuResponse
		[1] = {--repeated LeiZhuInfo
			[1] = 'int32':number	[ 第几届]
			[2] = 'string':name	[ 队伍名称]
			[3] = 'string':serverName	[ 服务器名字]
			[4] = 'int32':serverId	[ 服务器ID]
			[5] = {--repeated LeiZhuMemberInfo
				[1] = 'int32':playerId	[ 玩家ID]
				[2] = 'string':name	[ 玩家名称]
				[3] = 'int32':useIcon	[ 头像]
				[4] = 'int32':frameId	[ 头像框]
				[5] = 'int32':starHeroRanking	[ 名人堂排名]
				[6] = 'int32':level	[ 玩家等级]
				[7] = 'int32':roleId	[ 最大战斗力侠客ID]
				[8] = 'int32':vipLevel	[ VIP等级]
				[9] = 'int32':redPacket	[ 发送红包个数]
			},
			[6] = 'int32':leaderId	[ 队长ID]
			[7] = 'int64':teamId	[ 队伍ID]
		},
	}
--]]
s2c.CONTEST_HISTORY_ALL_LEI_ZHU_RESPONSE = 0x6e09

--[[
	[1] = {--ApplyFriendSucess
	}
--]]
s2c.APPLY_FRIEND_SUCESS = 0x4303

--[[
	[1] = {--BloodyWarMatixConfResult
		[1] = 'int32':fromPos	[起始位置.上阵则为0]
		[2] = 'int32':toPos	[目标位置.下阵则为0]
		[3] = 'int64':roleId	[角色roleId]
	}
--]]
s2c.BLOODY_WAR_MATIX_CONF_RESULT = 0x3206

--[[
	[1] = {--ExpChangedMsg
		[1] = 'int64':userId	[角色唯一ID,实例id]
		[2] = 'int32':currentExp	[当前经验]
	}
--]]
s2c.EXP_CHANGED = 0x0e51

--[[
	[1] = {--GetHeroDuelReportResponse
		[1] = {--repeated HeroDuelBattleReport
			[1] = 'string':reportId	[录像ID]
			[2] = 'bool':win	[是否胜利]
			[3] = 'int64':time	[记录时间]
			[4] = {--HeroDuelReportRole
				[1] = 'string':serverName	[服务器名称]
				[2] = 'int32':playerGroup	[分组]
				[3] = 'string':playerName	[名字]
				[4] = 'int32':playerPower	[战力]
				[5] = 'int32':playerRank	[排名]
				[6] = 'int32':playerScore	[积分]
				[7] = 'string':guildName	[帮派名称]
				[8] = 'int32':playerOldRank	[玩家旧排名]
			},
			[5] = {--HeroDuelReportRole
				[1] = 'string':serverName	[服务器名称]
				[2] = 'int32':playerGroup	[分组]
				[3] = 'string':playerName	[名字]
				[4] = 'int32':playerPower	[战力]
				[5] = 'int32':playerRank	[排名]
				[6] = 'int32':playerScore	[积分]
				[7] = 'string':guildName	[帮派名称]
				[8] = 'int32':playerOldRank	[玩家旧排名]
			},
			[6] = 'int32':serverId	[服务器id]
		},
	}
--]]
s2c.GET_HERO_DUEL_REPORT_RESPONSE = 0x6f07

--[[
	[1] = {--BeforeEnterGame
		[1] = 'int64':serverStartup	[服务器启动时间轴]
		[2] = 'int64':lastLogon	[最后一次走登录流程的时间轴]
	}
--]]
s2c.BEFORE_ENTER_GAME = 0x0d20

--[[
	[1] = {--SellBookResultMsg
		[1] = 'int32':bookpos
	}
--]]
s2c.SELL_BOOK_RESULT = 0x1603

--[[
	[1] = {--ReceiveSettlementRewardResponse
		[1] = 'int32':rewardId	[奖励id]
	}
--]]
s2c.RECEIVE_SETTLEMENT_REWARD_RESPONSE = 0x6f0b

--[[
	[1] = {--GangExchangeList
		[1] = 'int32':buildLevel	[建筑等级]
		[2] = 'int64':cdLeaveTime	[cd刷新剩余时间]
		[3] = 'int32':leaveRefleshNum	[剩余刷新次数]
		[4] = 'int32':dayRefleshNum	[每日刷新次数上限]
		[5] = {--repeated GangExchangeItem
			[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
			[2] = 'int32':number	[数量]
			[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			[4] = 'int32':price	[兑换消耗]
			[5] = 'int32':status	[兑换状态  0:今日已兑换  1:正常]
		},
	}
--]]
s2c.GANG_EXCHANGE_LIST = 0x1811

--[[
	[1] = {--NotifyNewRecallTask
		[1] = {--repeated TaskInfo
			[1] = 'int32':taskid	[成就id]
			[2] = 'int32':state	[状态 0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[3] = 'int32':currstep	[当前进度]
			[4] = 'int32':totalstep	[总进度]
		},
	}
--]]
s2c.NOTIFY_NEW_RECALL_TASK = 0x5303

--[[
	[1] = {--AdventureMassacre
		[1] = 'int32':massacre	[ 杀戮值]
		[2] = 'int32':coin	[ 铜币]
		[3] = 'int32':experience	[ 阅历]
		[4] = 'int32':ranking	[ 排名]
	}
--]]
s2c.ADVENTURE_MASSACRE = 0x5907

--[[
	[1] = {--RankingListLevel
		[1] = {--repeated RankInfoBigCompetInfo
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'string':name	[玩家昵称]
			[3] = 'int32':playerLevel	[玩家等级]
			[4] = 'int32':icon	[头像]
			[5] = 'int32':headPicFrame
			[6] = 'int32':playerId
			[7] = 'int32':curStep
		},
		[2] = 'int32':lastValue	[最低入榜层数]
		[3] = 'int32':myRanking	[我的最佳排名,0表示未入榜]
		[4] = 'int32':step
	}
--]]
s2c.RANKING_LIST_LEVEL = 0x4085

--[[
	[1] = {--MineBattleReportList
		[1] = {--repeated ArenaTopBattleReportInfo
			[1] = 'int32':reportId	[战报ID]
			[2] = 'int32':fightType	[战斗类型]
			[3] = 'bool':win	[是否胜利]
			[4] = 'int64':time	[时间]
			[5] = 'int32':ranking	[被挑战者排名]
			[6] = 'int32':fromRank	[挑战者排名]
			[7] = 'int32':power	[挑战者战力]
			[8] = 'int32':targetPower	[被挑战者战力,0表示未知,以前老数据没有记录这个字段]
			[9] = {--ArenaTopBattleReportRole
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':name	[名字]
				[3] = 'int32':profession	[主角职业]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[VIP等级]
				[6] = 'int32':power	[战力]
				[7] = 'int32':serverId	[服务器ID]
			},
			[10] = {--ArenaTopBattleReportRole
				[1] = 'int32':playerId	[玩家ID]
				[2] = 'string':name	[名字]
				[3] = 'int32':profession	[主角职业]
				[4] = 'int32':level	[等级]
				[5] = 'int32':vipLevel	[VIP等级]
				[6] = 'int32':power	[战力]
				[7] = 'int32':serverId	[服务器ID]
			},
		},
	}
--]]
s2c.MINE_BATTLE_REPORT_LIST = 0x500e

--[[
	[1] = {--GainChampionsInfo
		[1] = {--ChampionsInfo
			[1] = 'int32':atkWinStreak	[进攻连胜]
			[2] = 'int32':atkMaxWinStreak	[进攻最大连胜]
			[3] = 'int32':defWinStreak	[防守连胜]
			[4] = 'int32':defMaxWinSteak	[防守最大连胜]
			[5] = 'int32':score	[积分]
			[6] = 'repeated int64':atkFormation	[攻击阵容]
			[7] = 'repeated int64':defFormation	[防守阵容]
			[8] = 'int32':atkWinCount	[进攻胜利次数]
			[9] = 'int32':atkLostCount	[进攻失败次数]
			[10] = 'int32':defWinCount	[防守胜利次数]
			[11] = 'int32':defLostCount	[防守失败次数]
			[12] = 'int32':betWinCount	[押注胜利次数]
		},
		[2] = 'repeated int32':boxes	[当前领取的宝箱]
		[3] = 'int32':matchCount	[匹配次数]
		[4] = 'int64':lastMatchTime
		[5] = 'bool':hosting
	}
--]]
s2c.GAIN_CHAMPIONS_INFO = 0x4501

--[[
	[1] = {--BatchSacrificeAutoSuccessNotify
		[1] = 'int32':count	[自动赌石次数.0表示服务器控制]
	}
--]]
s2c.BATCH_SACRIFICE_AUTO_SUCCESS_NOTIFY = 0x3e01

--[[
	[1] = {--GuildDynamic
		[1] = {--GuildDynamicType(enum)
			'v4':GuildDynamicType
		},
		[2] = 'string':mess
	}
--]]
s2c.GUILD_DYNAMIC = 0x4411

--[[
	[1] = {--SendGuildActiveRedPacket
		[1] = 'int32':type	[红包类型]
		[2] = 'int32':sendStatus	[发送放出红包的红包状态]
	}
--]]
s2c.SEND_GUILD_ACTIVE_RED_PACKET = 0x4446

--[[
	[1] = {--GetHeroDuelInfoResponse
		[1] = 'int32':myGroup	[我的分组(1东华.2江南.3西川.4朔北)    //我的分组(1东华.2江南.3西川.4朔北)]
		[2] = 'int32':myRank	[我的排名]
		[3] = 'int32':myScore	[我的积分]
		[4] = 'int32':challengeNum	[已挑战次数]
		[5] = 'repeated int32':rewardIds	[已领取宝箱]
		[6] = {--repeated HeroDuelPlayer
			[1] = 'int32':rank	[排行]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'string':playerName	[玩家昵称]
			[4] = 'int32':playerLevel	[玩家等级]
			[5] = 'int32':useIcon	[显示头像(主角的ID)    //显示头像(主角的ID)]
			[6] = 'int32':fightPower	[战力]
			[7] = 'string':serverName	[服务器名称]
			[8] = 'string':guildName	[帮派名称]
			[9] = 'int32':playerGroup	[玩家分组(1东华.2江南.3西川.4朔北)    //玩家分组(1东华.2江南.3西川.4朔北)]
			[10] = 'repeated int32':suitNum	[套装数量]
			[11] = 'string':bannerId	[帮派旗帜]
			[12] = 'int32':playerScore	[玩家积分]
		},
		[7] = 'int64':endTime	[活动结束时间]
	}
--]]
s2c.GET_HERO_DUEL_INFO_RESPONSE = 0x6f02

--[[
	[1] = {--GangSendBulletinResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_SEND_BULLETIN_RESULT = 0x1810

--[[
	[1] = {--TongRenFightResultMsg
		[1] = 'int32':result	[0:失败   成功:1-5星    //0:失败   成功:1-5星]
		[2] = 'int32':killnum	[杀死数量]
		[3] = 'int32':bloodnum	[获得血滴数量]
	}
--]]
s2c.TONG_REN_FIGHT_RESULT = 0x0f03

--[[
	[1] = {--MakePlayerReult
	}
--]]
s2c.MAKE_PLAYER_REULT = 0x440f

--[[
	[1] = {--HeroDuelPowerUpdate
		[1] = 'int32':playerId	[玩家id]
		[2] = 'int32':power	[战力]
	}
--]]
s2c.HERO_DUEL_POWER_UPDATE = 0x6f12

--[[
	[1] = {--sendBeastRedPoint
		[1] = 'int32':have	[刷新红点 0是没有,1是有]
	}
--]]
s2c.SEND_BEAST_RED_POINT = 0x6106

--[[
	[1] = {--UpdatePowerReponse
		[1] = 'int32':power	[ 战斗力值]
	}
--]]
s2c.UPDATE_POWER_REPONSE = 0x2307

--[[
	[1] = {--NotifyNewTask
		[1] = {--repeated TaskInfo
			[1] = 'int32':taskid	[成就id]
			[2] = 'int32':state	[状态 0:未完成 1:已完成但未领取奖励  2:已完成并领取过奖励]
			[3] = 'int32':currstep	[当前进度]
			[4] = 'int32':totalstep	[总进度]
		},
	}
--]]
s2c.NOTIFY_NEW_TASK = 0x2004

--[[
	[1] = {--FormationResponse
	}
--]]
s2c.FORMATION_RESPONSE = 0x6700

--[[
	[1] = {--UnlockFunction
		[1] = 'int64':info
	}
--]]
s2c.UNLOCK_FUNCTION = 0x1206

--[[
	[1] = {--BibleExchangeReponse
		[1] = {--repeated BibleItemInfo
			[1] = 'int32':type	[ 资源类型]
			[2] = 'int32':id	[ 资源ID]
			[3] = 'int32':number	[ 资源数量]
		},
	}
--]]
s2c.BIBLE_EXCHANGE_REPONSE = 0x6019

--[[
	[1] = {--ActivityInfoList
		[1] = {--repeated ActivityInfo
			[1] = 'int32':id	[活动ID]
			[2] = 'string':name	[名称]
			[3] = 'string':title	[标题]
			[4] = 'int32':type	[活动类型:0.未知;1.登录;2.连续登录;3.在线奖励,持续在线时长;4.VIP等级;5.团队等级;6.累计充值金额;7.单笔充值金额;8.累计消耗,针对元宝]
			[5] = 'string':resetCron	[重置表达式,CronExpression表达]
			[6] = 'int32':status	[活动状态:0.活动强制无效,不显示该活动;;1.长期显示该活动 2.自动检测,过期则不显示]
			[7] = 'bool':history	[是否把历史记录也有效,默认无效.如果设置为true,那么历史记录会马上更新活动状态,例如:充值累计]
			[8] = 'string':icon	[活动图标]
			[9] = 'string':details	[活动详情,客户端支持的符文本格式表达式]
			[10] = 'string':reward	[奖励表达式,直接数据格式,根据不同的活动类型表达式可能不一样.如:200|1,1,100&1,2,100&1,3,100|1;400|1,3,100&1,3,100&1,3,100|3]
			[11] = 'string':beginTime	[开始日期,没有期限设置为null]
			[12] = 'string':endTime	[结束日期,没有期限设置为null]
			[13] = 'int32':showWeight	[显示权重(控制前端显示顺序)    //显示权重(控制前端显示顺序)]
			[14] = 'bool':crossServer	[是否跨服]
			[15] = 'bool':show	[是否显示]
			[16] = 'bool':limitStore	[是否限时商城]
		},
	}
--]]
s2c.ACTIVITY_INFO_LIST = 0x2301

--[[
	[1] = {--UpdateCitySucess
	}
--]]
s2c.UPDATE_CITY_SUCESS = 0x443d

--[[
	[1] = {--BuyStrength
	}
--]]
s2c.BUY_STRENGTH = 0x3902

--[[
	[1] = {--RecruitIntegralRankList
		[1] = 'int32':last	[最低入榜积分]
		[2] = 'int32':myIntegral	[我的积分,0表示未入榜]
		[3] = 'int32':myRanking	[我的排名,0表示未入榜,1~N]
		[4] = 'int32':betterRewardValue	[更好的奖励的积分,如果为0表示没有更好的了]
		[5] = 'int32':rewardId	[当前奖励ID]
		[6] = 'int32':praiseCount	[我自己拥有的赞数量]
		[7] = {--repeated RecruitIntegralInfo
			[1] = 'int32':ranking	[排名,1~N]
			[2] = 'int32':playerId	[玩家ID]
			[3] = 'string':name	[昵称]
			[4] = 'int32':level	[等级]
			[5] = 'int32':vipLevel	[VIP等级]
			[6] = 'int32':integral	[积分]
			[7] = 'int32':praiseCount	[被赞数量]
			[8] = 'int32':power	[战力]
			[9] = {--repeated RankInfoFormation
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
			},
			[10] = 'int32':profession	[头像]
			[11] = 'int32':headPicFrame	[头像边框]
			[12] = 'int32':starHeroRanking	[名人堂排名]
			[13] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.RECRUIT_INTEGRAL_RANK_LIST = 0x4010

--[[
	[1] = {--CityBattleSimpleInfo
		[1] = {--repeated BattleSimpleInfo
			[1] = 'int32':cityId
			[2] = {--repeated CrossGuildInfo
				[1] = 'int32':guildId	[公会编号]
				[2] = 'string':guildName	[公会名称]
				[3] = 'string':bannerId	[公会旗帜]
				[4] = 'string':serverName	[服务器名称]
				[5] = 'int32':score	[积分]
				[6] = 'int32':winCount	[胜场]
				[7] = 'int32':lostCount	[负场]
				[8] = 'int32':cityId
			},
		},
		[2] = 'int32':cityId
	}
--]]
s2c.CITY_BATTLE_SIMPLE_INFO = 0x4437

--[[
	[1] = {--DatiInfoResponse
		[1] = 'int32':status	[状态(0:未开始答题  1:开始)    //状态(0:未开始答题  1:开始)]
		[2] = 'int32':startTime	[开始时间]
		[3] = 'int32':trueCount	[答对题数]
		[4] = 'repeated int32':datiIds	[随机30道题]
		[5] = 'repeated int32':id	[已经作答的答案id]
	}
--]]
s2c.DATI_INFO_RESPONSE = 0x3b04

--[[
	[1] = {--ReponseBetRadioInfo
		[1] = 'int32':betRadio
	}
--]]
s2c.REPONSE_BET_RADIO_INFO = 0x4524

--[[
	[1] = {--ErrorCodeMsg
		[1] = 'int32':errorCode	[错误代号,全局唯一.在客户端需要实现多语言支持,通过错误代号能够映射到对应的错误提示信息]
		[2] = 'int32':cmdId	[出现错误的指令请求id,客户端请求服务器时的指令号]
	}
--]]
s2c.ERROR_CODE = 0x7fff

--[[
	[1] = {--BuriedTreasure
		[1] = 'int32':buriedTreasures	[所有玩家埋宝数]
	}
--]]
s2c.BURIED_TREASURE = 0x5932

--[[
	[1] = {--EquipmentSellResult
		[1] = 'int32':result	[是否成功]
		[2] = 'repeated int64':userid	[被出售物品实例ID]
	}
--]]
s2c.EQUIPMENT_SELL_RESULT = 0x1015

--[[
	[1] = {--NotJoin
	}
--]]
s2c.NOT_JOIN = 0x4510

--[[
	[1] = {--GuildBattleMemberInfo
		[1] = {--repeated GuildBattleTeamInfo
			[1] = 'int32':eliteId	[精英编号]
			[2] = {--repeated GuildBattlePlayerInfo
				[1] = 'int32':playerId
				[2] = 'int32':power
				[3] = 'string':name
				[4] = 'int32':profession
				[5] = 'int32':headPicFrame	[头像框]
				[6] = 'int32':starHeroRanking	[名人堂排名]
				[7] = 'int32':ladderGrade	[天梯赛段位]
			},
			[3] = 'int32':id
		},
	}
--]]
s2c.GUILD_BATTLE_MEMBER_INFO = 0x5703

--[[
	[1] = {--GuildZoneMsg
		[1] = 'int32':zoneId	[副本编号]
		[2] = 'int32':resetCount	[今日重置次数]
		[3] = 'int32':lockPlayerId	[锁定的玩家]
		[4] = 'int64':lockTime	[锁定的时间]
		[5] = {--repeated GuildCheckpointMsg
			[1] = 'int32':checkpointId	[关卡编号]
			[2] = 'bool':pass
			[3] = {--repeated GuildZoneNpcState
				[1] = 'int32':index	[索引]
				[2] = 'int32':hp	[血量]
				[3] = 'int32':maxHp
			},
		},
		[6] = 'bool':pass
		[7] = 'int64':bastPassTime	[最佳通关时间]
		[8] = 'string':lockPlayerName
		[9] = 'int32':profession
	}
--]]
s2c.GUILD_ZONE = 0x4421

--[[
	[1] = {--AdventureEnemy
		[1] = {--repeated AdventureEnemyInfo
			[1] = 'int32':id	[ ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':level	[ 等级]
			[4] = 'int32':power	[ 战斗力]
			[5] = 'int32':icon	[ 头像]
			[6] = 'int32':headPicFrame	[ 头像框]
			[7] = 'int32':revengeNum	[ 复仇次数]
			[8] = 'int64':battleTime	[ 上次战斗时间(分钟,直接显示)    // 上次战斗时间(分钟,直接显示)]
			[9] = 'int32':rewardMassacre	[ 杀戮值奖励]
			[10] = 'int32':rewardCoin	[ 铜币奖励]
			[11] = 'int32':rewardExperience	[ 阅历奖励]
			[12] = 'string':guildName	[ 帮派名称]
			[13] = 'int32':massacreValue	[ 杀戮值]
			[14] = {--repeated FormationInfo
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[4] = 'int32':quality	[品质]
			},
			[15] = {--repeated FormationInfo
				[1] = 'int64':instanceId	[实例ID]
				[2] = 'int32':position	[阵形位置,0~8]
				[3] = 'int32':templateId	[角色模版ID,对应配置表ID]
				[4] = 'int32':quality	[品质]
			},
			[16] = 'int32':secondPower	[ 战斗力]
			[17] = 'int32':starHeroRanking	[名人堂排名]
			[18] = 'int32':ladderGrade	[天梯赛段位]
		},
	}
--]]
s2c.ADVENTURE_ENEMY = 0x5905

--[[
	[1] = {--ResponseTeammateHp
		[1] = 'int32':power	[阵容战力]
		[2] = 'int32':icon	[玩家头像]
		[3] = 'int32':headPicFrame	[头像框]
		[4] = 'int32':level	[等级]
		[5] = 'int32':vip	[vip]
		[6] = 'string':name	[名字]
		[7] = 'int32':guildId	[帮派id]
		[8] = 'string':guildName	[帮派name]
		[9] = 'bool':online
		[10] = 'int64':lastLoginTime
		[11] = 'int32':playerId	[ ID]
		[12] = {--repeated TeammateXiakeData
			[1] = 'int32':index	[ 索引]
			[2] = 'int32':hp	[ 血量]
			[3] = 'int32':maxHp	[ 最大血量]
			[4] = 'int32':icon	[ 头像]
		},
	}
--]]
s2c.RESPONSE_TEAMMATE_HP = 0x592a

--[[
	[1] = {--ResetPlayerTime
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.RESET_PLAYER_TIME = 0x5914

--[[
	[1] = {--HeartMethodSellPrice
		[1] = 'int64':instanceId	[ 出售的心法唯一id]
		[2] = 'int32':price	[ 出售的价格]
	}
--]]
s2c.HEART_METHOD_SELL_PRICE = 0x7b07

--[[
	[1] = {--DispatchMercenaryTeamSuccess
	}
--]]
s2c.DISPATCH_MERCENARY_TEAM_SUCCESS = 0x5151

--[[
	[1] = {--BibleBreachResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':instanceId	[成功则字段有效 天书实例ID]
	}
--]]
s2c.BIBLE_BREACH_RESULT = 0x6006

--[[
	[1] = {--GangRefleshBuffInfoResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_REFLESH_BUFF_INFO_RESULT = 0x1816

--[[
	[1] = {--MineReplayResults
		[1] = {--repeated MineReplayResult
			[1] = 'int64':time
			[2] = {--repeated ReplayPlayerInfo
				[1] = 'int32':playerId	[玩家编号]
				[2] = 'string':name	[玩家名称]
				[3] = 'int32':profession	[职业]
				[4] = 'int32':icon	[头像]
				[5] = 'int32':headPicFrame	[头像边框]
				[6] = 'int32':starHeroRanking	[名人堂排名]
				[7] = 'int32':serverId
			},
			[3] = 'bool':sucess
			[4] = 'int32':challengePlayerCount
			[5] = 'int32':challengeGuardCount
			[6] = 'int32':id
			[7] = 'string':robResource
		},
	}
--]]
s2c.MINE_REPLAY_RESULTS = 0x500d

--[[
	[1] = {--BibleKeyUnMosaicResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':bible	[天书实例id]
	}
--]]
s2c.BIBLE_KEY_UN_MOSAIC_RESULT = 0x6025

--[[
	[1] = {--ShopGiftInfo
		[1] = 'int32':id	[商店序号]
		[2] = 'int32':type	[礼包商城类型]
		[3] = 'int32':resType	[出售道具的资源类型]
		[4] = 'int32':resId	[出售道具的ID]
		[5] = 'int32':number	[单次购买数量]
		[6] = 'int32':consumeType	[购买道具的资源类型]
		[7] = 'int32':consumeId	[购买道具的ID]
		[8] = 'int32':consumeNumber	[花费值]
		[9] = 'int32':isLimited	[是否有出售限制]
		[10] = 'int32':consumeAdd	[每次购买递增价格值]
		[11] = 'int32':needVipLevel	[购买所需的vip等级]
		[12] = 'int64':beginTime	[上架时间]
		[13] = 'int64':endTime	[下架时间]
		[14] = 'int32':maxType	[最大值类型]
		[15] = 'int32':maxNum	[出售上限值]
		[16] = 'string':vipMaxNumMap	[各VIP等级下可购买数量]
		[17] = 'int32':oldPrice	[原价]
		[18] = 'int32':limitType	[限制类型]
		[19] = 'int32':isHot	[是否热卖]
		[20] = 'int32':timeType	[限时类型]
		[21] = 'int32':orderNo	[排序值]
	}
--]]
s2c.SHOP_GIFT_INFO = 0x1923

--[[
	[1] = {--TreasureDetails
		[1] = {--repeated TreasuresRecordInfo
			[1] = 'string':playerName	[埋宝箱的玩家名称]
			[2] = 'int32':treasureId	[ 埋藏的宝物ID]
			[3] = 'int32':leftTimes	[ 该宝箱剩余可挖次数]
			[4] = 'int64':buriedTime	[埋宝箱时间(挖宝时间)    //埋宝箱时间(挖宝时间)]
			[5] = 'int64':mapId	[埋藏宝箱实例ID]
			[6] = 'int32':isHiddenName	[宝箱是否匿名]
			[7] = 'string':dropItem	[玩家获得的物品]
			[8] = 'string':digName	[挖宝箱的玩家名字]
			[9] = 'string':serverName	[挖宝箱玩家的服务器名字]
			[10] = 'int32':rowId	[所挖宝箱的横坐标]
			[11] = 'int32':colId	[所挖宝箱的纵坐标]
			[12] = 'int32':specialBox	[是否是无量宝箱]
		},
	}
--]]
s2c.TREASURE_DETAILS = 0x5936

--[[
	[1] = {--LastChampion
		[1] = 'repeated int32':id
		[2] = 'string':name
	}
--]]
s2c.LAST_CHAMPION = 0x4513

--[[
	[1] = {--ReponseBetWinCount
		[1] = 'int32':winCount
		[2] = 'int32':boxes	[当前领取的宝箱]
	}
--]]
s2c.REPONSE_BET_WIN_COUNT = 0x4526

--[[
	[1] = {--GetEquipmentStarUpFailResult
		[1] = 'int32':fail	[失败补偿值]
	}
--]]
s2c.GET_EQUIPMENT_STAR_UP_FAIL_RESULT = 0x1021

--[[
	[1] = {--UnEquipHeartMehod
		[1] = 'int64':roleId	[ 角色唯一Id]
		[2] = 'int64':heartMid	[ 心法唯一ID]
	}
--]]
s2c.UN_EQUIP_HEART_MEHOD = 0x7b04

--[[
	[1] = {--BattleStartMsg
		[1] = 'int32':fighttype
		[2] = 'int32':angerSelf
		[3] = 'int32':angerEnemy
		[4] = {--repeated FightRole
			[1] = 'int32':typeid	[角色类型:1.玩家拥有角色;2.NPC]
			[2] = 'int32':roleId	[卡牌角色id,npc为t_s_npc_instance表格配置的ID,其他为t_s_role表格id]
			[3] = 'int32':maxhp	[最大满血量]
			[4] = 'int32':posindex	[位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35    //位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35]
			[5] = 'int32':level	[等级]
			[6] = 'repeated int32':attr	[属性]
			[7] = {--SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[8] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[9] = 'string':name	[角色名称,只有主角才发送]
			[10] = 'string':immune	[免疫属性]
			[11] = 'string':effectActive	[效果影响主动]
			[12] = 'string':effectPassive	[效果影响被动]
			[13] = 'int32':anger	[角色怒气]
		},
		[5] = 'int32':myBattlearrayId	[ 我的阵法模板ID]
		[6] = 'int32':enemyBattlearrayId	[ 对方的阵法模板ID]
		[7] = 'string':suppress	[战力压制比(左方_右方)    //战力压制比(左方_右方)]
	}
--]]
s2c.BATTLE_START = 0x0f20

--[[
	[1] = {--CityBattleInfos
		[1] = {--repeated CrossGuildInfo
			[1] = 'int32':guildId	[公会编号]
			[2] = 'string':guildName	[公会名称]
			[3] = 'string':bannerId	[公会旗帜]
			[4] = 'string':serverName	[服务器名称]
			[5] = 'int32':score	[积分]
			[6] = 'int32':winCount	[胜场]
			[7] = 'int32':lostCount	[负场]
			[8] = 'int32':cityId
		},
		[2] = 'repeated int32':battleQueue
		[3] = 'int32':updateCount
	}
--]]
s2c.CITY_BATTLE_INFOS = 0x4435

--[[
	[1] = {--HeartMethodInfo
		[1] = 'int64':instanceId	[ 心法id]
		[2] = 'int32':itemId	[ 模板id]
		[3] = 'int32':practiceId	[  修炼id]
		[4] = 'int32':breachId	[ 突破ID]
		[5] = 'bool':isXinfa	[ true 心法, false 心法碎片]
		[6] = 'int32':number	[数量]
		[7] = {--repeated HeartMethodGemInfo
			[1] = 'int32':pos	[ 位置]
			[2] = 'int32':itemId	[ 宝石ID]
		},
		[8] = {--repeated HeartMethodConciseInfo
			[1] = 'int32':pos	[ 位置]
			[2] = 'int32':level	[ 凝练等级]
		},
		[9] = {--repeated HeartMethodRecastInfo
			[1] = 'int32':pos	[ 位置]
			[2] = 'int32':level	[ 重铸等级]
		},
	}
--]]
s2c.HEART_METHOD_INFO = 0x7b02

--[[
	[1] = {--GetCardRoleMsg
		[1] = {--repeated GetRoleStateMsg
			[1] = 'int32':cardType	[ 1 最高得乙, 2 最高得甲 3 连抽十次]
			[2] = 'bool':firstGet	[ 是否首刷]
			[3] = 'int32':freeTimes	[ 可用免费次数]
			[4] = 'int32':cdTime	[ 剩余CD时间 单位秒]
			[5] = 'int32':todayTimes	[ 今日已用次数]
			[6] = 'int32':totalCount	[ 总招募次数]
		},
		[2] = 'int32':toltalCount	[总招募次数]
		[3] = 'int32':round	[当前回合]
		[4] = 'repeated int32':alreadyGet	[已领取奖励ID]
	}
--]]
s2c.GET_CARD_ROLE = 0x1c00

--[[
	[1] = {--ComposeBookResultMsg
		[1] = {--repeated BookItem
			[1] = 'int64':objID	[实例id]
			[2] = 'int32':resID	[模板id]
			[3] = 'int32':level	[等级]
			[4] = 'int32':exp	[经验]
			[5] = 'bool':lock	[是否锁定]
			[6] = 'int64':roleID	[角色id]
			[7] = 'int64':position	[装配位置]
			[8] = 'int64':attrAdd	[属性加成]
		},
	}
--]]
s2c.COMPOSE_BOOK_RESULT = 0x1606

--[[
	[1] = {--RedPacketRankingReponse
		[1] = {--repeated PlayerShowInfo
			[1] = 'int32':playerId	[ 玩家ID]
			[2] = 'string':name	[ 玩家昵称]
			[3] = 'int32':icon	[ 玩家头像]
			[4] = 'int32':frame	[ 玩家头像框]
			[5] = 'int32':level	[ 玩家等级]
			[6] = 'int32':sycee	[ 玩家领取的元宝数量]
			[7] = 'int32':vipLevel	[ 玩家VIP等级]
			[8] = 'string':guildName	[ 帮派名称]
			[9] = 'int32':ranking	[ 排名]
			[10] = 'int32':competence	[ 公会职位 1会长 2副会长 3成员]
			[11] = 'int32':starHeroRanking	[名人堂排名]
			[12] = 'int32':ladderGrade	[天梯赛段位]
		},
		[2] = 'int32':ranking	[ 我的排名]
		[3] = 'int32':lessIntegral	[ 离入榜差多少积分]
	}
--]]
s2c.RED_PACKET_RANKING_REPONSE = 0x6b03

--[[
	[1] = {--BattlePetResponse
		[1] = 'int32':type	[1:所有列表 2:新添加的]
		[2] = {--repeated BattlePetInfo
			[1] = 'int64':instanceId	[战宠id]
			[2] = 'int32':templateId	[战宠模版id]
			[3] = 'int64':trainerId	[驯兽师id(0为没有)    //驯兽师id(0为没有)]
			[4] = 'int32':quality	[品质]
			[5] = 'int32':star	[星级]
			[6] = 'repeated int32':formationType	[阵容类型]
			[7] = {--repeated BattlePetHoleInfoResponse
				[1] = 'int32':type	[孔位类型]
				[2] = 'int32':level	[等级]
				[3] = 'int32':quality	[品质]
			},
			[8] = 'string':tameMessage	[驯驭信息 记录属性的等级  格式  1|2|1|15]
			[9] = 'string':tameHole	[驯驭孔位 记录孔位的穿属性  12|0|14|15 0表示没穿戴]
		},
	}
--]]
s2c.BATTLE_PET_RESPONSE = 0x4f01

--[[
	[1] = {--SendHeroAmbitionRedPoint
		[1] = 'int32':redPoint	[0是没有,1是有]
	}
--]]
s2c.SEND_HERO_AMBITION_RED_POINT = 0x3906

--[[
	[1] = {--UpdateQuestMsg
		[1] = 'int32':level	[当前所在关卡]
		[2] = 'int32':killcount	[血滴数]
		[3] = 'int32':totalkillcount	[总血滴数]
	}
--]]
s2c.UPDATE_QUEST = 0x1400

--[[
	[1] = {--ResetDailyNotify
		[1] = 'bool':all	[是否重置所有模块,如果为true则不需要判定module]
		[2] = 'repeated int32':module	[重置的模块ID]
	}
--]]
s2c.RESET_DAILY_NOTIFY = 0x0e31

--[[
	[1] = {--RoundsBattle
		[1] = {--repeated BattleRound
			[1] = {--repeated BattleAction
				[1] = {--repeated ActionTargetInfo
					[1] = 'int32':position	[受击者位置]
					[2] = 'int32':effectType	[效果类型:1.普通攻击;2.暴击;3.躲避;4.治疗;5.净化;6.斗转星移;7.加状态]
					[3] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
					[4] = {--repeated TriggerEffect
						[1] = 'int32':type	[效果类型]
						[2] = 'int32':value	[效果值]
					},
					[5] = {--repeated TriggerEffect
						[1] = 'int32':type	[效果类型]
						[2] = 'int32':value	[效果值]
					},
					[6] = {--repeated NewStateInfo
						[1] = 'int32':fromPos	[状态由那个角色给与,0~17]
						[2] = 'bool':stateTrigger	[是否为状态触发,如果true则表示triggerId为状态ID,否则为技能ID]
						[3] = 'int32':triggerId	[产生状态的来源ID,可能是状态ID,或者技能ID,始终是fromPos的角色身上的技能或者状态]
						[4] = 'int32':stateId	[角色获得的状态ID]
						[5] = 'int32':stateLevel	[状态等级]
						[6] = 'int32':result	[给与状态结果,默认不需要填写,为了适配:1.抵抗;2.免疫等显示效果定义]
					},
					[7] = {--repeated LostStateInfo
						[1] = 'int32':position	[失去状态的角色位置.0~17]
						[2] = 'int32':stateId	[失去的状态ID]
						[3] = 'int32':repeatNum	[剩余层数,如果状态可以叠加则发送此字段,否则不需要发送.当层数为0时,表示状态彻底移除,否则减少层数为此字段的数值]
					},
					[8] = {--repeated StateCycleEffect
						[1] = 'int32':position	[角色位置.0~17]
						[2] = 'int32':stateId	[状态ID]
						[3] = 'int32':effectType	[状态效果类型:1.普通;2.暴击;3.免疫--]
						[4] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
					},
					[9] = {--DeepHurt
						[1] = 'int32':type	[加深类型,实际上是中毒.等状态类型,具体看代码或者让策划进行整理]
						[2] = 'int32':value	[效果值,10000表示100%好像是这样    //效果值,10000表示100%好像是这样]
					},
				},
				[2] = {--repeated SkillInfo
					[1] = 'int32':skillId	[技能的id]
					[2] = 'int32':level	[技能的等级]
				},
				[3] = {--repeated NewStateInfo
					[1] = 'int32':fromPos	[状态由那个角色给与,0~17]
					[2] = 'bool':stateTrigger	[是否为状态触发,如果true则表示triggerId为状态ID,否则为技能ID]
					[3] = 'int32':triggerId	[产生状态的来源ID,可能是状态ID,或者技能ID,始终是fromPos的角色身上的技能或者状态]
					[4] = 'int32':stateId	[角色获得的状态ID]
					[5] = 'int32':stateLevel	[状态等级]
					[6] = 'int32':result	[给与状态结果,默认不需要填写,为了适配:1.抵抗;2.免疫等显示效果定义]
				},
				[4] = {--repeated LostStateInfo
					[1] = 'int32':position	[失去状态的角色位置.0~17]
					[2] = 'int32':stateId	[失去的状态ID]
					[3] = 'int32':repeatNum	[剩余层数,如果状态可以叠加则发送此字段,否则不需要发送.当层数为0时,表示状态彻底移除,否则减少层数为此字段的数值]
				},
				[5] = {--repeated StateCycleEffect
					[1] = 'int32':position	[角色位置.0~17]
					[2] = 'int32':stateId	[状态ID]
					[3] = 'int32':effectType	[状态效果类型:1.普通;2.暴击;3.免疫--]
					[4] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
				},
				[6] = 'int32':type	[动作类型:1.主动释放大招;2.普通攻击;3.反击;4.触发被动技能--]
				[7] = 'int32':fromPos	[攻击者位置.0~17,左侧0~8,右侧9~17]
			},
			[2] = {--repeated LostStateInfo
				[1] = 'int32':position	[失去状态的角色位置.0~17]
				[2] = 'int32':stateId	[失去的状态ID]
				[3] = 'int32':repeatNum	[剩余层数,如果状态可以叠加则发送此字段,否则不需要发送.当层数为0时,表示状态彻底移除,否则减少层数为此字段的数值]
			},
			[3] = {--repeated StateCycleEffect
				[1] = 'int32':position	[角色位置.0~17]
				[2] = 'int32':stateId	[状态ID]
				[3] = 'int32':effectType	[状态效果类型:1.普通;2.暴击;3.免疫--]
				[4] = 'int32':effectValue	[产生的影响值,对HP直接影响,负数为扣血,正数为加血]
			},
			[4] = 'int32':roundIndex	[回合索引,从1~N]
		},
		[2] = 'bool':win	[战斗是否在客户端判断为胜利]
		[3] = 'int32':totle
	}
--]]
s2c.ROUNDS_BATTLE = 0x0f23

--[[
	[1] = {--GemLevelUpNotify
		[1] = 'string':playerName	[玩家名字]
		[2] = 'int32':gemId	[获得宝石id]
		[3] = 'int32':level	[获得宝石等级]
	}
--]]
s2c.GEM_LEVEL_UP_NOTIFY = 0x1d03

--[[
	[1] = {--AdventureShopBuy
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.ADVENTURE_SHOP_BUY = 0x5904

--[[
	[1] = {--EggRecordShowList
		[1] = {--GoldEggRecord
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家名]
			[3] = {--repeated GoldEggReward
				[1] = 'int32':resType	[资源类型]
				[2] = 'int32':resId	[资源ID]
				[3] = 'int32':number	[资源个数]
				[4] = 'int32':isSpecial	[是否特殊奖]
			},
			[4] = 'int64':createTime	[记录时间]
		},
	}
--]]
s2c.EGG_RECORD_SHOW_LIST = 0x4705

--[[
	[1] = {--BattlePetUpResponse
		[1] = 'int64':instanceId	[战宠id]
		[2] = 'int32':quality	[品质]
		[3] = 'int32':star	[星级]
	}
--]]
s2c.BATTLE_PET_UP_RESPONSE = 0x4f02

--[[
	[1] = {--AllResReponse
		[1] = {--repeated ResYesterdayData
			[1] = 'int32':id	[ 模板ID]
			[2] = 'int32':value	[ 数值]
			[3] = 'int32':isBuy	[ 0未购买 1已购买]
		},
	}
--]]
s2c.ALL_RES_REPONSE = 0x6c02

--[[
	[1] = {--GangDynamicInfoMsg
		[1] = 'int32':gangLevel	[帮派等级]
		[2] = 'int32':gangExp	[帮派经验]
		[3] = 'int32':myAllContribution	[我的总贡献值]
		[4] = 'int32':myTodayContribution	[我的今日贡献值]
		[5] = 'int32':gangMoney	[帮派资金]
	}
--]]
s2c.GANG_DYNAMIC_INFO = 0x1802

--[[
	[1] = {--ClimbStarResp
		[1] = {--repeated ClimbStarMsg
			[1] = 'int32':sectionId	[无量山]
			[2] = 'int32':star
			[3] = 'int32':passLimit
		},
	}
--]]
s2c.CLIMB_STAR_RESP = 0x1722

--[[
	[1] = {--OptedGuild
		[1] = 'int32':type	[类型 1同意了申请 2被请离]
		[2] = 'int32':guildId	[公会编号]
	}
--]]
s2c.OPTED_GUILD = 0x4416

--[[
	[1] = {--ViewNoticeSucess
	}
--]]
s2c.VIEW_NOTICE_SUCESS = 0x4431

--[[
	[1] = {--InheritanceSucess
	}
--]]
s2c.INHERITANCE_SUCESS = 0x4426

--[[
	[1] = {--AllBiblePracticeReponse
		[1] = {--repeated BiblePracticeInfo
			[1] = 'int64':bibleId	[ 天书id]
			[2] = {--repeated BiblePracticeData
				[1] = 'int32':position	[ 位置]
				[2] = 'int32':level	[ 等级]
			},
		},
	}
--]]
s2c.ALL_BIBLE_PRACTICE_REPONSE = 0x6016

--[[
	[1] = {--EscortAgencyDeployResponse
		[1] = {--CardInfo
			[1] = 'int32':guildId	[帮会id]
			[2] = 'string':bannerId	[帮会旗帜id]
			[3] = 'int32':serverId	[服务器id]
			[4] = 'string':serverName	[服务器名字]
			[5] = 'int32':score	[积分]
			[6] = 'int32':quality	[品质]
			[7] = {--repeated PartInfo
				[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
				[2] = 'int32':lastResTime	[最近一次复活时间]
				[3] = 'int32':status	[状态 0:完好 1:损毁]
				[4] = {--repeated PlayerData
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'int32':useCoin	[玩家头像]
					[4] = 'int32':frameId	[玩家头像框]
					[5] = 'string':guildName	[帮会名称]
					[6] = 'string':serverName	[服务器名称]
					[7] = 'int32':power	[战力]
					[8] = 'int32':dieTime	[最近一次死亡时间]
					[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
					[10] = 'int32':type	[类型 0:防守方 1:攻击方]
				},
				[5] = {--repeated DiePlayer
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'string':guildName	[帮会名称]
					[4] = 'string':serverName	[服务器名称]
					[5] = 'int32':power	[战力]
					[6] = 'int32':dieTime	[死亡时间]
				},
			},
		},
	}
--]]
s2c.ESCORT_AGENCY_DEPLOY_RESPONSE = 0x5f03

--[[
	[1] = {--EscortingFinish
	}
--]]
s2c.ESCORTING_FINISH = 0x2902

--[[
	[1] = {--EggRecordList
		[1] = 'int32':type	[1个人历史2玩家历史]
		[2] = {--repeated GoldEggRecord
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'string':playerName	[玩家名]
			[3] = {--repeated GoldEggReward
				[1] = 'int32':resType	[资源类型]
				[2] = 'int32':resId	[资源ID]
				[3] = 'int32':number	[资源个数]
				[4] = 'int32':isSpecial	[是否特殊奖]
			},
			[4] = 'int64':createTime	[记录时间]
		},
	}
--]]
s2c.EGG_RECORD_LIST = 0x4703

--[[
	[1] = {--StudySucess
	}
--]]
s2c.STUDY_SUCESS = 0x4423

--[[
	[1] = {--OpenZoneSucess
	}
--]]
s2c.OPEN_ZONE_SUCESS = 0x441b

--[[
	[1] = {--showInvocatoryReward
		[1] = 'int32':roleId
		[2] = 'int32':todayCount
		[3] = 'int32':rewardDay
		[4] = 'int64':rewardTime
		[5] = {--repeated InvocatoryInfo
			[1] = 'int32':roleId	[侠客模板id]
			[2] = 'int32':roleNum	[三个卡槽的侠客数量]
			[3] = 'int32':roleSycee	[三个卡槽的侠客花费]
			[4] = 'int32':isGetReward	[是否领取了祈愿奖励  0是未领取1是已经领取]
		},
	}
--]]
s2c.SHOW_INVOCATORY_REWARD = 0x5401

--[[
	[1] = {--BibleComprehendInfoReponse
		[1] = {--repeated BibleComprehendInfo
			[1] = 'int64':bibleId	[天书id]
			[2] = 'int32':stageId	[阶段id]
			[3] = 'int32':useCount	[参悟丹使用次数]
			[4] = 'int32':reachId	[达成的id]
			[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
			[6] = {--repeated BibleStageInfo
				[1] = 'int32':stage	[阶段id]
				[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
				[3] = 'repeated int32':attIndex	[属性下标]
				[4] = 'repeated int32':value	[属性值]
			},
		},
		[2] = {--repeated BibleComprehendInfo
			[1] = 'int64':bibleId	[天书id]
			[2] = 'int32':stageId	[阶段id]
			[3] = 'int32':useCount	[参悟丹使用次数]
			[4] = 'int32':reachId	[达成的id]
			[5] = 'repeated int32':useCountReachId	[使用次数达到的id]
			[6] = {--repeated BibleStageInfo
				[1] = 'int32':stage	[阶段id]
				[2] = 'int32':isReplace	[是否替换过(0:没有 1:有)    //是否替换过(0:没有 1:有)]
				[3] = 'repeated int32':attIndex	[属性下标]
				[4] = 'repeated int32':value	[属性值]
			},
		},
	}
--]]
s2c.BIBLE_COMPREHEND_INFO_REPONSE = 0x6020

--[[
	[1] = {--SingleBattleArrayDataReponse
		[1] = {--BattleArrayData
			[1] = 'int64':instanceId	[ 阵法唯一ID]
			[2] = 'int32':type	[ 阵容类型]
		},
		[2] = 'int32':type	[1 装备 2 卸下 3 交换]
	}
--]]
s2c.SINGLE_BATTLE_ARRAY_DATA_REPONSE = 0x6a03

--[[
	[1] = {--HasBuried
		[1] = {--repeated BuriedTreasuresInfo
			[1] = 'string':playerName	[埋宝箱的玩家名称]
			[2] = 'int32':treasureId	[ 埋藏的宝物ID]
			[3] = 'int32':leftTimes	[ 该宝箱剩余可挖次数]
			[4] = 'int64':buriedTime	[埋宝箱时间]
			[5] = 'int32':rowId	[宝箱所在排数]
			[6] = 'int32':colId	[宝箱所在列数]
			[7] = 'int32':specialBox	[是否是无量宝箱]
		},
	}
--]]
s2c.HAS_BURIED = 0x5933

--[[
	[1] = {--DrawDpsAwardSucess
	}
--]]
s2c.DRAW_DPS_AWARD_SUCESS = 0x4420

--[[
	[1] = {--ResetArenaCDSuccess
	}
--]]
s2c.RESET_ARENA_CDSUCCESS = 0x1308

--[[
	[1] = {--CityInfo
		[1] = {--repeated CrossGuildInfo
			[1] = 'int32':guildId	[公会编号]
			[2] = 'string':guildName	[公会名称]
			[3] = 'string':bannerId	[公会旗帜]
			[4] = 'string':serverName	[服务器名称]
			[5] = 'int32':score	[积分]
			[6] = 'int32':winCount	[胜场]
			[7] = 'int32':lostCount	[负场]
			[8] = 'int32':cityId
		},
		[2] = 'int64':lastUpdateTime
	}
--]]
s2c.CITY_INFO = 0x4434

--[[
	[1] = {--GainBossDieResp
		[1] = 'int32':count
	}
--]]
s2c.GAIN_BOSS_DIE_RESP = 0x4203

--[[
	[1] = {--RewardPushResponse
		[1] = {--RewardServerPush
			[1] = 'int32':playerId	[玩家id]
			[2] = 'string':playerName	[玩家名称]
			[3] = 'string':serverName	[服务器名称]
			[4] = 'int32':serverId	[服务器名称]
			[5] = 'int32':rewardType	[1:普通 2:特殊 3:特等]
			[6] = {--RewardItem
				[1] = 'int32':type	[资源类型:1.物品;2.卡牌;3.铜币;等----]
				[2] = 'int32':number	[数量]
				[3] = 'int32':itemId	[资源id ,在非数值资源类型的情况下会发送,即有多种情况的时候会通过这个字段描述具体的id.当type为物品时表示物品id,为卡牌时表示卡牌id]
			},
			[7] = 'int32':rewardTime	[获奖时间]
		},
	}
--]]
s2c.REWARD_PUSH_RESPONSE = 0x7506

--[[
	[1] = {--ResponseRewardList
		[1] = {--repeated SacriDropItem
			[1] = 'int32':id
			[2] = 'int32':number
			[3] = 'int32':type
			[4] = 'int32':quality
		},
	}
--]]
s2c.RESPONSE_REWARD_LIST = 0x3e10

--[[
	[1] = {--GangCancelApplyAddResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_CANCEL_APPLY_ADD_RESULT = 0x180d

--[[
	[1] = {--AbandonPeakReponse
		[1] = 'int32':result	[ 0成功 1失败]
	}
--]]
s2c.ABANDON_PEAK_REPONSE = 0x7102

--[[
	[1] = {--GetMinResponse
		[1] = 'int32':state	[是否领取成功 0:失败/1:成功]
	}
--]]
s2c.GET_MIN_RESPONSE = 0x3309

--[[
	[1] = {--SacrificeMergeAutoSuccessNotify
	}
--]]
s2c.SACRIFICE_MERGE_AUTO_SUCCESS_NOTIFY = 0x3e04

--[[
	[1] = {--DanFangDetials
		[1] = 'int32':playerId
		[2] = 'string':playerName
		[3] = 'int64':createTime
		[4] = 'int64':endTime
		[5] = 'int32':state	[是否领取 0未领取,1已领取]
		[6] = 'repeated int32':helper
		[7] = 'int32':id	[材料id]
	}
--]]
s2c.DAN_FANG_DETIALS = 0x5e05

--[[
	[1] = {--CrossChampionsInfos
		[1] = {--repeated CrossChampionsRankInfo
			[1] = 'int32':playerId
			[2] = 'string':name
			[3] = 'int32':score
			[4] = 'int32':atkWin
			[5] = 'int32':atkLost
			[6] = 'int32':defWin
			[7] = 'int32':defLost
			[8] = 'int32':atkWinStreak
			[9] = 'int32':defWinStreak
			[10] = 'string':serverName
		},
		[2] = 'int32':myRank
		[3] = 'int32':score
		[4] = 'int32':atkWin
		[5] = 'int32':atkLost
		[6] = 'int32':defWin
		[7] = 'int32':defLost
		[8] = 'int32':atkWinStreak
		[9] = 'int32':defWinStreak
		[10] = 'string':atkFormation
		[11] = 'string':defFromation
		[12] = {--repeated CrossChampionsReplayMsg
			[1] = 'string':atkName
			[2] = 'int32':atkRank
			[3] = 'string':defNam
			[4] = 'int32':defRank
			[5] = 'bool':atkWin
			[6] = 'int64':createTime
			[7] = 'int32':replayId
			[8] = 'int32':atkUseIcon
			[9] = 'int32':atkFrameId
			[10] = 'int32':defUseIcon
			[11] = 'int32':defFrameId
			[12] = 'int32':atkStarHeroRanking
			[13] = 'int32':defStarHeroRanking
		},
	}
--]]
s2c.CROSS_CHAMPIONS_INFOS = 0x4515

--[[
	[1] = {--GuildBossStatus
		[1] = 'int32':status
	}
--]]
s2c.GUILD_BOSS_STATUS = 0x4b10

--[[
	[1] = {--WorldBossBalanceNotify
		[1] = {--repeated WorldBossBalanceInfo
			[1] = 'int32':playerId	[玩家ID]
			[2] = 'int32':displayId	[显示的职业类型ID,可能为主角职业ID或者战力最高的职业ID]
			[3] = 'string':name	[昵称]
			[4] = 'int32':level	[等级]
			[5] = 'int32':vipLevel	[vip等级]
			[6] = 'int32':totalDamage	[总伤害]
		},
	}
--]]
s2c.WORLD_BOSS_BALANCE_NOTIFY = 0x1d0c

--[[
	[1] = {--ExpTransferResultMsg
		[1] = 'int64':targetRoleID	[被传承角色实例id]
		[2] = 'int32':targetRoleExp	[被传承角色经验]
		[3] = 'int32':targetRoleLev	[被传承角色等级]
		[4] = 'int64':transferRoleID	[传承角色实例id]
	}
--]]
s2c.EXP_TRANSFER_RESULT = 0x1503

--[[
	[1] = {--GagPlayerResult
	}
--]]
s2c.GAG_PLAYER_RESULT = 0x7f30

--[[
	[1] = {--EscortAgencyEnrollResponse
		[1] = {--CardInfo
			[1] = 'int32':guildId	[帮会id]
			[2] = 'string':bannerId	[帮会旗帜id]
			[3] = 'int32':serverId	[服务器id]
			[4] = 'string':serverName	[服务器名字]
			[5] = 'int32':score	[积分]
			[6] = 'int32':quality	[品质]
			[7] = {--repeated PartInfo
				[1] = 'int32':type	[1:护甲 2:镖旗3:轮子 4:车厢]
				[2] = 'int32':lastResTime	[最近一次复活时间]
				[3] = 'int32':status	[状态 0:完好 1:损毁]
				[4] = {--repeated PlayerData
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'int32':useCoin	[玩家头像]
					[4] = 'int32':frameId	[玩家头像框]
					[5] = 'string':guildName	[帮会名称]
					[6] = 'string':serverName	[服务器名称]
					[7] = 'int32':power	[战力]
					[8] = 'int32':dieTime	[最近一次死亡时间]
					[9] = 'string':formationBlood	[侠客id_当前血量_最大血量;侠客id_当前血量_最大血量]
					[10] = 'int32':type	[类型 0:防守方 1:攻击方]
				},
				[5] = {--repeated DiePlayer
					[1] = 'int32':playerId	[玩家id]
					[2] = 'string':playerName	[玩家名称]
					[3] = 'string':guildName	[帮会名称]
					[4] = 'string':serverName	[服务器名称]
					[5] = 'int32':power	[战力]
					[6] = 'int32':dieTime	[死亡时间]
				},
			},
		},
	}
--]]
s2c.ESCORT_AGENCY_ENROLL_RESPONSE = 0x5f02

--[[
	[1] = {--UpdateGuildBannerIdResult
		[1] = 'string':bannerId
	}
--]]
s2c.UPDATE_GUILD_BANNER_ID_RESULT = 0x4429

--[[
	[1] = {--PlayerInfo
		[1] = 'int32':playerId	[玩家id]
		[2] = 'int32':profession	[职业]
		[3] = {--Sex(enum)
			'v4':Sex
		},
		[4] = 'string':name	[昵称]
		[5] = 'int32':level	[等级]
		[6] = 'int64':coin	[游戏币]
		[7] = 'int32':exp	[当前经验]
		[8] = 'int32':inspiration	[真气(悟性点)    //真气(悟性点)]
		[9] = 'int32':sycee	[元宝]
		[10] = 'int32':vipLevel	[VIP等级]
		[11] = 'int32':errantry	[侠义值]
		[12] = 'int32':beginnersGuide	[新手引导步骤,注册后为0.]
		[13] = 'int32':totalRecharge	[总充值金额]
		[14] = 'int64':serverTime	[服务器时间戳]
		[15] = 'string':openlist	[玩法开放列表]
		[16] = 'int64':registTime	[注册时间]
		[17] = 'int32':properties	[玩家属性字段,位运算进行判定:1.指导员;2.GM]
		[18] = 'int32':integral	[招募积分]
		[19] = 'int32':eggScore	[蛋花]
		[20] = 'int32':jingLu	[精露]
		[21] = 'int32':climbStar	[无量山星]
		[22] = 'int32':useIcon	[正在使用的头像]
		[23] = 'int32':headPicFrame	[正在使用的头像框]
		[24] = 'int32':experience	[阅历]
		[25] = 'int32':lowHonor	[低级荣誉令牌]
		[26] = 'int32':seniorHonor	[高级荣誉令牌]
		[27] = 'int32':serdangTianXiangCoin	[天相币]
		[28] = 'int32':serdangTianJiCoin	[天极币]
		[29] = 'int32':starHeroRanking	[名人堂排名]
		[30] = 'int32':ladderGrade	[天梯赛段位]
		[31] = 'int32':wisdom	[慧心币]
		[32] = 'int32':tenchu	[诛心币]
		[33] = 'int32':prestige	[威望]
		[34] = 'int32':jingPo	[精魄]
		[35] = 'int32':windCloudCoin	[风云令]
	}
--]]
s2c.PLAYER_INFO = 0x0e41

--[[
	[1] = {--GangCreateResult
		[1] = 'bool':isSuccess	[true or false]
	}
--]]
s2c.GANG_CREATE_RESULT = 0x180c

--[[
	[1] = {--LangBlesseSelectResponse
		[2] = {--repeated LangBlessedSeleteds
			[1] = 'int32':id
			[2] = 'int32':index
			[3] = 'int32':kind	[选项类型 1精品 2珍品]
		},
	}
--]]
s2c.LANG_BLESSE_SELECT_RESPONSE = 0x4d02

--[[
	[1] = {--UpdateDailyMissionProgress
		[1] = 'int32':progress
		[2] = 'repeated int32':drawAwards	[领取过的奖励]
	}
--]]
s2c.UPDATE_DAILY_MISSION_PROGRESS = 0x2076

--[[
	[1] = {--RandomStoreBuySuccessNotify
		[1] = 'int32':type	[随机商店类型]
		[2] = 'int32':commodityId	[商品id]
		[3] = 'int32':num	[商品个数]
	}
--]]
s2c.RANDOM_STORE_BUY_SUCCESS_NOTIFY = 0x1905

--[[
	[1] = {--GangBuffInfo
		[1] = 'string':buffStr	[ "1_125|2_125"]
		[2] = 'int64':cdLeaveTime	[cd刷新剩余时间]
		[3] = 'int32':buildLevel	[建筑等级]
		[4] = 'int32':status	[领取状态  0:今日已领取  1:正常]
	}
--]]
s2c.GANG_BUFF_INFO = 0x1815

--[[
	[1] = {--FightBeginMsg
		[1] = 'int32':fighttype
		[2] = 'int32':angerSelf
		[3] = 'int32':angerEnemy
		[4] = {--repeated FightRole
			[1] = 'int32':typeid	[角色类型:1.玩家拥有角色;2.NPC]
			[2] = 'int32':roleId	[卡牌角色id,npc为t_s_npc_instance表格配置的ID,其他为t_s_role表格id]
			[3] = 'int32':maxhp	[最大满血量]
			[4] = 'int32':posindex	[位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35    //位置索引 己方:0-8   敌方:9-17   己方第二阵容:18-26  敌方第二阵容:27-35]
			[5] = 'int32':level	[等级]
			[6] = 'repeated int32':attr	[属性]
			[7] = {--SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[8] = {--repeated SkillInfo
				[1] = 'int32':skillId	[技能的id]
				[2] = 'int32':level	[技能的等级]
			},
			[9] = 'string':name	[角色名称,只有主角才发送]
			[10] = 'string':immune	[免疫属性]
			[11] = 'string':effectActive	[效果影响主动]
			[12] = 'string':effectPassive	[效果影响被动]
			[13] = 'int32':anger	[角色怒气]
		},
		[5] = 'int32':index	[战斗场次]
		[6] = 'int32':myBattlearrayId	[ 我的阵法模板ID]
		[7] = 'int32':enemyBattlearrayId	[ 对方的阵法模板ID]
		[8] = 'string':suppress	[战力压制比(左方_右方)    //战力压制比(左方_右方)]
	}
--]]
s2c.FIGHT_BEGIN = 0x0f00

--[[
	[1] = {--MultipleUpdate
		[1] = {--repeated ChangedStruct
			[1] = {--ChangedType(enum)
				'v4':ChangedType
			},
			[2] = {--EquipmentInfo
				[1] = 'int64':userid	[userid  唯一id]
				[2] = 'int32':id	[id]
				[3] = 'int32':level	[level]
				[4] = 'int32':quality	[品质]
				[5] = 'string':base_attr	[基本属性]
				[6] = 'string':extra_attr	[附加属性]
				[7] = 'int32':grow	[成长值]
				[8] = 'int32':holeNum	[宝石孔数]
				[9] = {--repeated GemPos
					[1] = 'int32':pos	[ pos]
					[2] = 'int32':id	[ id]
				},
				[10] = 'int32':star	[星级]
				[11] = 'int32':starFailFix	[升星失败率修正值]
				[12] = 'int32':refineLevel	[精炼等级]
				[13] = {--repeated Recast
					[1] = 'int32':quality
					[2] = 'int32':ratio
					[3] = 'int32':index
				},
				[14] = 'int32':stepExp
				[15] = 'int32':stepLevel
				[16] = 'int32':throughLevel
			},
			[3] = {--ItemInfo
				[1] = 'int64':id	[ id]
				[2] = 'int32':num	[ num]
			},
		},
	}
--]]
s2c.MULTIPLE_UPDATE = 0x1040

--[[
	[1] = {--EmployRoleOperationResult
		[1] = {--EmployRoleInfo
			[1] = 'int64':roleId	[角色实例id]
			[2] = 'int64':startTime	[开始时间]
			[3] = 'int32':coin	[累计获得金钱]
			[4] = 'int32':indexId	[位置id]
			[5] = 'int32':count	[被雇佣次数]
		},
		[2] = 'int32':operation	[操作符,1表示增加,2表示移除,3表示领取]
		[3] = 'repeated int32':coin	[获得铜币]
	}
--]]
s2c.EMPLOY_ROLE_OPERATION_RESULT = 0x5101

--[[
	[1] = {--EmployTeamList
		[1] = {--repeated EmployTeamDetails
			[1] = 'int32':fromId	[雇佣自哪个玩家,玩家ID]
			[2] = 'int32':useType	[使用类型,哪里使用,可以根据战斗类型进行定义或者阵形.系统类型进行定义]
			[3] = {--repeated EmployRoleDetails
				[1] = 'int64':instanceId	[角色实例ID]
				[2] = 'int32':position	[上阵位置]
				[3] = 'int32':roleId	[ 卡牌的id]
				[4] = 'int32':level	[ 等级]
				[5] = 'int32':martialLevel	[ 武学等级]
				[6] = 'int32':starlevel	[ 星级]
				[7] = 'int32':power	[ 战力]
				[8] = 'int32':hp	[ 剩余HP]
				[9] = 'string':spell	[ 技能表达式:id_level|--]
				[10] = 'string':attributes	[ 属性字符串]
				[11] = 'string':immune	[ 免疫概率]
				[12] = 'string':effectActive	[ 效果影响主动]
				[13] = 'string':effectPassive	[ 效果影响被动]
				[14] = 'int32':quality	[品质,角色可以升品了]
			},
			[4] = {--repeated AssistantDetails
				[1] = 'int32':position	[位置]
				[2] = 'int32':roleId	[卡牌类型,职业,如:段誉.乔峰]
				[3] = 'int64':instanceId	[实例ID]
				[4] = 'int32':quality	[品质,角色可以升品了]
			},
		},
	}
--]]
s2c.EMPLOY_TEAM_LIST = 0x5163

--[[
	[1] = {--BibleAddResult
		[1] = 'int32':result	[是否成功]
		[2] = 'int64':instanceId	[唯一id]
		[3] = 'int32':id	[模板id]
	}
--]]
s2c.BIBLE_ADD_RESULT = 0x6009

--[[
	[1] = {--ReponseWinCount
		[1] = 'int32':winCount
		[2] = 'int32':winStreak
		[3] = 'repeated int32':boxes	[当前领取的宝箱]
	}
--]]
s2c.REPONSE_WIN_COUNT = 0x6e19

--[[
	[1] = {--DigTreasure
		[1] = 'int32':hasTreasures	[矩形范围内还有没有宝物:0是没有,1是有]
		[2] = 'int32':remainingTimes	[玩家剩余挖宝次数]
		[3] = 'int32':buriedTreasures	[所有玩家埋宝数]
		[4] = 'int32':hasGotTreasures	[玩家是否获得了宝物 0是没有,1是有]
		[5] = 'int32':goodsId	[玩家获得的物品ID]
		[6] = {--repeated BuriedTreasuresInfo
			[1] = 'string':playerName	[埋宝箱的玩家名称]
			[2] = 'int32':treasureId	[ 埋藏的宝物ID]
			[3] = 'int32':leftTimes	[ 该宝箱剩余可挖次数]
			[4] = 'int64':buriedTime	[埋宝箱时间]
			[5] = 'int32':rowId	[宝箱所在排数]
			[6] = 'int32':colId	[宝箱所在列数]
			[7] = 'int32':specialBox	[是否是无量宝箱]
		},
		[7] = 'int32':number	[玩家获得的物品的数量]
	}
--]]
s2c.DIG_TREASURE = 0x5931

--[[
	[1] = {--GetFirstRechargeSuccess
	}
--]]
s2c.GET_FIRST_RECHARGE_SUCCESS = 0x1a10

--[[
	[1] = {--ArenaRewardCompelete
		[1] = 'bool':success	[是否领取成功]
	}
--]]
s2c.ARENA_REWARD_COMPELETE = 0x1303

return s2c