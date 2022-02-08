--[[
******争霸赛管理类*******

	-- 2015/11/16
]]


local ZhengbaManager = class("ZhengbaManager")


local OpenTime = "10:00:00"
local OpenDate = "6"


ZhengbaManager.UPADTECHAMPIONSSTATUS			= "ZhengbaManager.upadteChampionsStatus" --
ZhengbaManager.GAINCHAMPIONSINFO				= "ZhengbaManager.gainChampionsInfo" --
ZhengbaManager.CHAMPIONSRANK					= "ZhengbaManager.championsRank" --
ZhengbaManager.UPDATEFORMATIONSUCESS			= "ZhengbaManager.updateFormationSucess" --
ZhengbaManager.GETGRAND							= "ZhengbaManager.getGrand" --
ZhengbaManager.ENCOURAGINGSUCESS				= "ZhengbaManager.encouragingSucess" --
ZhengbaManager.OPENBOXSUCESS					= "ZhengbaManager.openBoxSucess" --
ZhengbaManager.BETRATE							= "ZhengbaManager.betrate" --
ZhengbaManager.OPENBOXKUAFUSUCESS				= "ZhengbaManager.openBoxKuaFuSucess" --
ZhengbaManager.OPENBOXKINGSUCESS				= "ZhengbaManager.OPENBOXKINGSUCESS"

ZhengbaManager.sortByQuality = 1
ZhengbaManager.sortByPower = 2

function ZhengbaManager:ctor()
	self.activityStatus = 1
	self.isJoin = false
	self:registerEvents()
	self.tempBoxIndex = 0
	self.personGrandList = TFArray:new()
	self.publicGrandList = TFArray:new()
	self.boxes = {}
	self.inspireNum = 0
	self.matchTime = 0
	self.matchCount = 0
	self.hosting = false

	self.StrategyMulitData = {}
end

function ZhengbaManager:restart()
	self.activityStatus = 1
	self.isJoin = false
	self.matchCount = 0
	self:registerEvents()
	self.tempBoxIndex = 0
	self.personGrandList:clear()
	self.publicGrandList:clear()
	self.tempFormations = nil
	self.inspireNum = 0
	self.championsInfo = nil
	self.championsRankInfo = nil
	self.matchTime = 0
	self.score_add = 0
	self.boxes = {}
	self.StrategyMulitData = {}
end
function ZhengbaManager:stateRestart()
	self.activityStatus = 1
	self.isJoin = false
	self.matchCount = 0
	self:registerEvents()
	self.tempBoxIndex = 0
	self.personGrandList:clear()
	self.publicGrandList:clear()
	self.tempFormations = nil
	self.inspireNum = 0
	self.championsInfo = nil
	self.championsRankInfo = nil
	self.matchTime = 0
	self.score_add = 0
	self.boxes = {}
end

function ZhengbaManager:registerEvents()
	TFDirector:addProto(s2c.UPDATE_FORMATION_SUCESS , self, self.updateFormationSucess)
	TFDirector:addProto(s2c.GAIN_CHAMPIONS_INFO, self, self.gainChampionsInfo)
	TFDirector:addProto(s2c.ENCOURAGING_SUCESS, self, self.encouragingSucess)
	TFDirector:addProto(s2c.GRAND, self, self.grand)
	TFDirector:addProto(s2c.UPADTE_CHAMPIONS_STATUS, self, self.upadteChampionsStatus)
	TFDirector:addProto(s2c.OPEN_BOX_SUCESS, self, self.openBoxSucess)
	TFDirector:addProto(s2c.CHAMPIONS_RANK, self, self.championsRank)
	TFDirector:addProto(s2c.NOT_JOIN, self, self.notJoin)
	TFDirector:addProto(s2c.UPDATE_HOSTING_SUCESS, self, self.updateHostingSucess)
	TFDirector:addProto(s2c.FORMATION_RESPONSE, self, self.updateFormationSucess)
	TFDirector:addProto(s2c.ALL_FORMATION_DATA, self, self.InitFormationInfo)
	TFDirector:addProto(s2c.REPONSE_BET_RADIO_INFO, self, self.updataBetRate)
end

function ZhengbaManager:updateFormationSucess(event)
	hideLoading()
	if self.tempFormations then
		-- if self.tempFormations[1] == EnumFightStrategyType.StrategyType_CHAMPIONS_ATK then
		-- 	self.championsInfo.atkFormation = self.tempFormations[2]
		-- elseif self.tempFormations[1] == EnumFightStrategyType.StrategyType_CHAMPIONS_DEF then
		-- 	self.championsInfo.defFormation = self.tempFormations[2]

		-- elseif self.tempFormations[1] == EnumFightStrategyType.StrategyType_AREAN then
		-- 	--quanhuan 添加群豪谱防守
		-- 	self.championsInfo.qunHaoDefFormation = self.tempFormations[2]

		-- elseif self.tempFormations[1] == EnumFightStrategyType.StrategyType_MINE1_DEF then
		-- 	self.championsInfo.MineDefFormation1 = self.tempFormations[2]
		-- elseif self.tempFormations[1] == EnumFightStrategyType.StrategyType_MINE2_DEF then
		-- 	self.championsInfo.MineDefFormation2 = self.tempFormations[2]
		-- end

		local StrategyType = self.tempFormations[1]
		if StrategyType == EnumFightStrategyType.StrategyType_PVE then
			StrategyManager:updateFormation(self.tempFormations[2])
		else
			self:receiveUpdateFormation(self.tempFormations[2],StrategyType)
		end
		TFDirector:dispatchGlobalEventWith(ZhengbaManager.UPDATEFORMATIONSUCESS)
	end
	self.tempFormations = nil
end

function ZhengbaManager:receiveUpdateFormation(formation,fight_type)
	self.StrategyMulitData[fight_type] = self.StrategyMulitData[fight_type] or {}
	for k,gmId1 in pairs(self.StrategyMulitData[fight_type]) do
		if gmId1 ~= 0 then
			local isRoleExist = false
			for kk,gmId2 in pairs(formation) do
				if gmId1 == gmId2 then
					isRoleExist = true
					break;
				end
			end
			if isRoleExist == false then
				local role = CardRoleManager:getRoleByGmid(gmId1)
				if role then
					role:updateFateByIdListForShow({},fight_type)
					role:setPosByFightType(fight_type,0)
				end
			end
		end
	end

	self.StrategyMulitData[fight_type] = formation or {}
	local assistList = AssistFightManager:getAssistRoleList(fight_type) or {}
	local roleIdList = FateManager:LinkStrategyAndAssit(formation, assistList,fight_type)
	for i=1,9 do
		local role_id = 0
		role_id = formation[i] or 0
		local role = CardRoleManager:getRoleByGmid(role_id)
		if role then
			role:updateFateByIdListForShow(roleIdList,fight_type,true)
			role:setPosByFightType(fight_type,i)
		end
	end
end

function ZhengbaManager:updataBetRate(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.BETRATE,event.data)
end
function ZhengbaManager:InitFormationInfo(event)
	local formationList = event.data.data or {}
	-- print("ZhengbaManager:InitFormationInfo ,",formationList)
	for k,v in pairs(formationList) do
		local StrategyType = self:getStrategyTypeByIndex(v.type)
		if StrategyType == EnumFightStrategyType.StrategyType_PVE then
			StrategyManager:updateFormation(v.formation)
		else
			self.StrategyMulitData[StrategyType] = v.formation
		end
	end
end

function ZhengbaManager:setTotalPower( power )
	self.totalPower = power
end

function ZhengbaManager:powerChangeInfo(event)
	local newPower = event.data.power
	if self.totalPower ~= nil and self.totalPower ~= newPower then
		local offset = self.totalPower - newPower
		offset = math.abs(offset)
		if offset > 5 then
			toastPowerChange(self.totalPower,newPower)
		end
	end 
	self:setTotalPower(newPower)
end

function ZhengbaManager:getStrategyTypeByIndex(index)
	local strategyType = EnumFightStrategyType.StrategyType_PVE
	if index == EnumFightStrategyIndexType.StrategyType_Attack then
		strategyType = EnumFightStrategyType.StrategyType_PVE

	elseif index == EnumFightStrategyIndexType.StrategyType_Defence then
		strategyType = EnumFightStrategyType.StrategyType_AREAN

	elseif index == EnumFightStrategyIndexType.StrategyIndexType_DOUBLE_ATK_1 then
		strategyType = EnumFightStrategyType.StrategyType_DOUBLE_1

	elseif index == EnumFightStrategyIndexType.StrategyIndexType_DOUBLE_ATK_2 then
		strategyType = EnumFightStrategyType.StrategyType_DOUBLE_2
	elseif index == EnumFightStrategyIndexType.StrategyIndexType_CHUANGZHEN then
		strategyType = EnumFightStrategyType.StrategyType_CHUANGZHEN
	elseif index == EnumFightStrategyIndexType.StrategyIndexType_CROSSZHENGBA then
		strategyType = EnumFightStrategyType.StrategyType_CROSSZHENGBA
	end
	return strategyType
end

function ZhengbaManager:gainChampionsInfo(event)
	hideLoading()
	local data = event.data
	print("gainChampionsInfo = ",data)
	self.isJoin = true
	self.championsInfo = data.info
	self.matchCount = data.matchCount
	self.boxes = data.boxes or {0,0,0,0}
	self.hosting = data.hosting
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.GAINCHAMPIONSINFO)
	self:gainRankInfo()

	self:qunHaoDefFormationSet(EnumFightStrategyType.StrategyType_CHAMPIONS_ATK, self.championsInfo.atkFormation)
	self:qunHaoDefFormationSet(EnumFightStrategyType.StrategyType_CHAMPIONS_DEF, self.championsInfo.defFormation)
end
function ZhengbaManager:updateChampionsInfo(info)
	self.score_add = self.championsInfo.score - info.score
	self.championsInfo = info
	self.matchCount = self.matchCount + 1
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.GAINCHAMPIONSINFO)
	self:gainRankInfo()
end

function ZhengbaManager:encouragingSucess(event)
	hideLoading()
	-- toastMessage("鼓舞成功")
	toastMessage(localizable.bloodBattleMainLayer_up_success)
	self.inspireNum = 1
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.ENCOURAGINGSUCESS)
end

--[[
enum GrandType{
	YOU_BEAT =1;//你击败了谁 玩家名,连胜,积分
	CHALLENGE_FAILURE=2;//挑战失败 玩家名
	BEAT_YOU = 3;//击败了你 name
	CHALLENGE_YOUR_FAILURE = 4;//挑战你失败  name,积分
	ATT_WIN_STREAK = 5;//进攻连胜 名称,连胜数
	DEF_WIN_STREAK = 6;//防守连胜 名称,连胜数
}
]]
function ZhengbaManager:grand(event)
	local data = event.data
	print("grand data , ==",data)
	local message = {}
	if data.type == 1 then
		message = self:getYouBeatGrand( data.msg )
		self.personGrandList:pushBack(message)
	elseif data.type == 2 then
		message = self:getYouFailGrand( data.msg )
		self.personGrandList:pushBack(message)
	elseif data.type == 3 then
		message = self:getBeatYouGrand( data.msg )
		self.personGrandList:pushBack(message)
	elseif data.type == 4 then
		message = self:getFailYouGrand( data.msg )
		self.personGrandList:pushBack(message)
	elseif data.type == 5 then
		local strState = localizable.NotifyManager_wulin_broadcast_state
		local strEnd = strState[5]
		local strFormat = localizable.NotifyManager_wulin_broadcast_attack
		local msg = data.msg or data.message
		local msgTab = string.split(msg, ',')
		local name = msgTab[1] or ""
		local count = msgTab[2] or 5
		count = tonumber(count)
		if count > 9 then
			strEnd = strState[9]
		elseif count >= 5 then
			strEnd = strState[count]
		end
		local str = stringUtils.format( strFormat, msgTab[1], msgTab[2], strEnd)
		NotifyManager:addMessage(str, 1, 2)

		message = self:getAttWinStreakGrand( data.msg )
		self.publicGrandList:pushBack(message)

	elseif data.type == 6 then
		local strFormat = localizable.NotifyManager_wulin_broadcast_defend
		local msg = data.msg or data.message
		local msgTab = string.split(msg, ',')
		local name = msgTab[1] or ""
		local count = msgTab[2] or 5
		count = tonumber(count)
		local str = stringUtils.format( strFormat, msgTab[1], msgTab[2])
		NotifyManager:addMessage(str, 1, 2)

		message = self:getDefWinStreakGrand( data.msg )
		self.publicGrandList:pushBack(message)
	end
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.GETGRAND,{message})
end

function ZhengbaManager:upadteChampionsStatus(event)
	hideLoading()
	local data = event.data
	self.activityStatus = data.status
	if self.activityStatus == 1 then
		self:stateRestart()
	elseif self.activityStatus == 5 then
		WeekRaceManager:startPlayNotice()
	end
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.UPADTECHAMPIONSSTATUS)
end

function ZhengbaManager:openBoxSucess(event)
	hideLoading()

	-- 跨服武林
	if self.tempBoxIndex == 4 then 
		MultiServerFightManager.betWinCount = MultiServerFightManager.betWinCount + 1
		TFDirector:dispatchGlobalEventWith(ZhengbaManager.OPENBOXKUAFUSUCESS)
		return
	end
	-- 跨服武林
	if self.tempBoxIndex == 5 or self.tempBoxIndex == 6 then 
		TFDirector:dispatchGlobalEventWith(ZhengbaManager.OPENBOXKINGSUCESS)
		return
	end

	if self.tempBoxIndex ~= 0 then
		self.boxes[self.tempBoxIndex] = self.boxes[self.tempBoxIndex] + 1
		self.tempBoxIndex = 0
		TFDirector:dispatchGlobalEventWith(ZhengbaManager.OPENBOXSUCESS)
	end
end

function ZhengbaManager:championsRank(event)
	hideLoading()
	local data = event.data
	print("championsRank = ",data)
	self.championsRankInfo = data.infos
	self.myRank = data.myRank
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.CHAMPIONSRANK)
end
function ZhengbaManager:notJoin(event)
	hideLoading()
	self.isJoin = false
	self:gainRankInfo()
end

function ZhengbaManager:openZhengbaMainLayer()

	if self.activityStatus == 5 then
		WeekRaceManager:requestRaceInfo(true)
		return
	end

	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.zhengba.ZhengbaLayer",AlertManager.BLOCK_AND_GRAY)
	AlertManager:show();
	self:checkJoin()
	-- if self.activityStatus == 3 or self.activityStatus == 4 then
	-- 	self:gainRankInfo()
	-- end
end

function ZhengbaManager:getActivityStatus()
	print("self.activityStatus =",self.activityStatus)
	return self.activityStatus
end
function ZhengbaManager:isJoinActivity()
	return self.isJoin
end


function ZhengbaManager:match()
	print("ZhengbaManager:Match")
	self.matchTime = self.matchTime or 0
	local nowTime = MainPlayer:getNowtime()
	local tempTime = 45 - (nowTime - self.matchTime)
	if  tempTime > 0 then
		-- toastMessage("对战冷却时间剩余："..tempTime .."秒")
		toastMessage(stringUtils.format(localizable.ZhengbaManager_cd_time, tempTime))
		return
	end
	
	OtherPlayerManager:ZhengbaMatch()
	self.inspireNum = 0
	-- showLoading()
	-- TFDirector:send(c2s.MATCH, {})
end

function ZhengbaManager:checkJoin()
	print("ZhengbaManager:checkJoin")
	showLoading()
	TFDirector:send(c2s.CHECK_JOIN, {})
end

function ZhengbaManager:gainRankInfo()
	showLoading()
	TFDirector:send(c2s.GAIN_RANK_INFO, {})
end
function ZhengbaManager:Encouraging()
	if self.inspireNum > 0 then
		-- toastMessage("你已经鼓舞了")
		toastMessage(localizable.ZhengbaManager_insprie_time)
		return
	end
	showLoading()
	TFDirector:send(c2s.ENCOURAGING, {})
end
function ZhengbaManager:BetRateInfo(roundId,index,betPlayerId)
	showLoading()
	local betMsg = {
		roundId,
		index,
		betPlayerId
	}
	TFDirector:send(c2s.REQUEST_BET_RADIO_INFO, betMsg)
end

function ZhengbaManager:joinChampions()
	showLoading()
	TFDirector:send(c2s.GAIN_CHAMPIONS, {})
end
function ZhengbaManager:beginFight()
	self.matchTime = self.matchTime or 0
	local nowTime = MainPlayer:getNowtime()
	local tempTime = 45 - (nowTime - self.matchTime)
	if  tempTime > 0 then
		-- toastMessage("对战冷却时间剩余："..tempTime .."秒")
		toastMessage(stringUtils.format(localizable.ZhengbaManager_cd_time, tempTime))
		return
	end

	self.matchTime = nowTime
	showLoading()
	TFDirector:send(c2s.CHALLENGE_CHAMPIONS, {})
	-- self.matchTime = 0
end
function ZhengbaManager:updateFormation(fight_type ,formations, index_type)
	showLoading()
	for i=1,9 do
		formations[i] = formations[i] or 0
	end
	local msg =  {
		-- fight_type - 1,
		fight_type,
		formations
	}
	self.tempFormations = clone(msg)
	-- TFDirector:send(c2s.UPDATE_FORMATION, msg)
	-- do return end
	if index_type == nil then
		TFDirector:send(c2s.UPDATE_FORMATION, msg)
	else
		msg[1] = index_type
		TFDirector:send(c2s.FORMATION_REQUEST, msg)
	end
end
function ZhengbaManager:openBox(index)
	local box_id = self.boxes[index] or 0
	local boxInfo = ChampionsBoxData:objectByID(index*1000 + box_id)
	if boxInfo == nil then
		-- toastMessage("你已领取所有宝箱")
		toastMessage(localizable.ZhengbaManager_get_all_box)
		return
	end
	if index == 1 then
		if self.championsInfo == nil or self.championsInfo.atkMaxWinStreak < boxInfo.value then
			-- toastMessage("对不起，您还没有取得"..boxInfo.value.."连胜")
			-- self:openBoxInfo( boxInfo ,"取得进攻"..boxInfo.value.."连胜可领取")
			self:openBoxInfo(boxInfo, stringUtils.format(localizable.ZhengbaManager_liansheng_ing, boxInfo.value))
			return
		end
	elseif index == 2 then
		if self.matchCount < boxInfo.value then
			-- toastMessage("对不起，您还没有取得"..boxInfo.value.."连胜")
			-- self:openBoxInfo( boxInfo ,"进行"..boxInfo.value.."次对战可领取")
			self:openBoxInfo(boxInfo, stringUtils.format(localizable.ZhengbaManager_liansheng_ed, boxInfo.value))
			return
		end
	elseif index == 3 then
		--本服武林大会押注
		if self.championsInfo == nil or self.championsInfo.betWinCount < boxInfo.value then
			self:openBoxInfo(boxInfo, stringUtils.format(localizable.ZhengbaManager_Yazhu, boxInfo.value))
			return
		end
	end

	showLoading()
	self.tempBoxIndex = index
	TFDirector:send(c2s.OPEN_BOX, {index})
end

function ZhengbaManager:openBoxInfo( boxInfo ,message)
	local calculateRewardList = self:calculateReward(boxInfo.drop_id)
	if calculateRewardList == nil then
		return
	end
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.zhengba.ZhengbasaiBox",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(calculateRewardList, message);
    AlertManager:show();
end

function ZhengbaManager:calculateReward(rewardid)

    local calculateRewardList = TFArray:new();
    local rewardConfigure = RewardConfigureData:objectByID(rewardid)
    if rewardConfigure == nil then
		print("找不到奖励配置 id == ",rewardid)
		return nil
    end
    local rewardItems = rewardConfigure:getReward()


    for k,v in pairs(rewardItems.m_list) do
        local rewardInfo = {}
        rewardInfo.type = v.type
        rewardInfo.itemId = v.itemid
        rewardInfo.number = v.number
        local _rewardInfo = BaseDataManager:getReward(rewardInfo)
        calculateRewardList:push(_rewardInfo);
    end

    return calculateRewardList
end

function ZhengbaManager:getYouBeatGrand( _message )
	local info = stringToTable(_message,",")
	local message = {}
	message.message = stringUtils.format(localizable.ZhengbaManager_jibai_xxx, info[1]) --"你击败了"..info[1].."，"
	message.score = stringUtils.format(localizable.ZhengbaManager_jifen_add, info[3]) --"积分+"..info[3]
	if self.championsInfo then
		self.championsInfo.atkWinStreak = tonumber(info[2])
		self.championsInfo.atkWinCount = self.championsInfo.atkWinCount + 1
	end
	-- if self.championsInfo.atkWinStreak > self.championsInfo.atkMaxWinStreak then
	-- 	self.championsInfo.atkMaxWinStreak = self.championsInfo.atkWinStreak
	-- end
	return message
end

function ZhengbaManager:getYouFailGrand( _message )
	local info = stringToTable(_message,",")
	local message = {}
	message.message = stringUtils.format(localizable.ZhengbaManager_tiaozhanshibai, info[1]) --"你挑战"..info[1].."失败"
	-- self.championsInfo.atkWinStreak = 0
	if self.championsInfo then
		self.championsInfo.atkWinStreak = 0
		self.championsInfo.atkLostCount = self.championsInfo.atkLostCount + 1
	end
	return message
end

function ZhengbaManager:getBeatYouGrand( _message )
	local info = stringToTable(_message,",")
	local message = {}
	message.message = stringUtils.format(localizable.ZhengbaManager_xxx_jibai, info[1])  --info[1].."击败了你"
	if self.championsInfo ~= nil then
		self.championsInfo.defWinStreak = 0
		self.championsInfo.defLostCount = self.championsInfo.defLostCount + 1
	end
	return message
end

function ZhengbaManager:getFailYouGrand( _message )
	local info = stringToTable(_message,",")
	local message = {}
	message.message =  stringUtils.format(localizable.ZhengbaManager_xxx_tiaozhan, info[1]) --info[1].."挑战你失败，"
	message.score = stringUtils.format(localizable.ZhengbaManager_jifen_add, info[2]) -- "积分+"..info[2]
	if self.championsInfo == nil then
		return message
	end
	self.championsInfo.defWinStreak = self.championsInfo.defWinStreak + 1
	if self.championsInfo.defWinStreak > self.championsInfo.defMaxWinSteak then
		self.championsInfo.defMaxWinSteak = self.championsInfo.defWinStreak
	end
	self.championsInfo.score = self.championsInfo.score + tonumber(info[2])
	self.championsInfo.defWinCount = self.championsInfo.defWinCount + 1
	return message
end

function ZhengbaManager:getAttWinStreakGrand( _message )
	local info = stringToTable(_message,",")
	local message = {}
	local times = tonumber(info[2])

	-- if times == 5 then
	-- 	message.message = info[1].."取得了进攻"..times.."连胜，正在暴走状态！"
	-- elseif times == 6 then
	-- 	message.message = info[1].."取得了进攻"..times.."连胜，已经技压群雄！"
	-- elseif times == 7 then
	-- 	message.message = info[1].."取得了进攻"..times.."连胜，已经无人能挡！"
	-- elseif times == 8 then
	-- 	message.message = info[1].."取得了进攻"..times.."连胜，已经主宰大会！"
	-- elseif times >= 9 then
	-- 	message.message = info[1].."取得了进攻"..times.."连胜，犹如天神下凡！"
	-- end

	local descIndex = times
	if times >= 9 then
		descIndex = 9
	end
	message.message = stringUtils.format(localizable.ZhengbaManager_fight_desc[descIndex], info[1], times)

	if times >= 10 then
		message.showEffect = true
	end
	return message
end

function ZhengbaManager:getDefWinStreakGrand( _message )
	local info = stringToTable(_message,",")
	local message = {}
	-- message.message = info[1].."取得了防守"..info[2].."连胜，已经无人能破！"
	message.message = stringUtils.format(localizable.ZhengbaManager_fight_desc2, info[1], info[2])
	if tonumber(info[2]) >= 10 then
		message.showEffect = true
	end
	return message
end



function ZhengbaManager:getReport( message_type )
	if message_type == 1 then
		return self.personGrandList
	else
		return self.publicGrandList
	end
end

function ZhengbaManager:getFightList( fight_type )
	-- if fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_ATK then
	-- 	return self.championsInfo.atkFormation

	-- elseif fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_DEF then
	-- 	return self.championsInfo.defFormation

	-- elseif fight_type == EnumFightStrategyType.StrategyType_AREAN then
	-- 	--quanhuan 添加群豪谱防守
	-- 	return self.championsInfo.qunHaoDefFormation

	-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	return self.championsInfo.MineDefFormation1
	-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE2_DEF then
	-- 	return self.championsInfo.MineDefFormation2

	-- else
	-- 	return self.championsInfo.defFormation
	-- end
	if fight_type == EnumFightStrategyType.StrategyType_PVE then
		return StrategyManager:getList()

	elseif fight_type == EnumFightStrategyType.StrategyType_BLOOY then
		return BloodFightManager:getList()
	end
	return self.StrategyMulitData[fight_type] or {}
end

function ZhengbaManager:getMaxNum(fight_type)
	if fight_type == EnumFightStrategyType.StrategyType_CHUANGZHEN then
		return 7
	end
	if fight_type == EnumFightStrategyType.StrategyType_CROSSZHENGBA then
		return CrossZhengBaManager:getMaxNum()
	end
	return StrategyManager:getMaxNum()
end

function ZhengbaManager:canAddFightRole(fight_type)
	local num = self:getFightRoleNum(fight_type);
	if self:getMaxNum(fight_type) > num then
		return true;
	else
		return false;
	end
end
function ZhengbaManager:getFightRoleNum( fight_type )
	local list = {}

	-- if fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_ATK  then
	-- 	list = self.championsInfo.atkFormation
	
	-- elseif fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_DEF then
	-- 	list = self.championsInfo.defFormation

	-- elseif fight_type == EnumFightStrategyType.StrategyType_AREAN  then
	-- 	--quanhuan 添加群豪谱防守
	-- 	list = self.championsInfo.qunHaoDefFormation
	
	-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	list = self.championsInfo.MineDefFormation1
	-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	list = self.championsInfo.MineDefFormation2
	-- else
	-- 	list = self.championsInfo.defFormation
	-- end

	list = self:getFightList(fight_type) or {}

	local num = 0;
	for i=1,10 do
		if list[i] and list[i] ~= 0 then
			local role = CardRoleManager:getRoleByGmid(list[i])
			if role then
				num = num + 1;
			else
				local mercenary = EmployManager:getMercenaryInAllEmployRole( list[i] )
				if mercenary then
					num = num + 1;
				else
					mercenary = EmployManager:getEmploySingleRoleByGmId( list[i] ,fight_type)
					if mercenary then
						num = num + 1;
					end
				end
			end
		end
	end
	return num;
end
function ZhengbaManager:getIndexByRole(fight_type,gmid )
	local list = self:getFightList(fight_type)
	for i=1,9 do
		if list[i] and list[i] == gmid then
			return i
		end
	end
	return 0
end
function ZhengbaManager:getPower(fight_type)

	if 1 then
		-- local figtType = LineUpType.LineUp_Attack

		-- if fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_DEF then
		-- 	figtType = LineUpType.LineUp_Defense

		-- elseif fight_type == EnumFightStrategyType.StrategyType_AREAN then
		-- 	figtType = LineUpType.LineUp_QunhaoDef
		
		-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
		-- 	figtType = LineUpType.LineUp_Mine1_Defense
		-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
		-- 	figtType = LineUpType.LineUp_Mine2_Defense

		-- end
		
		return AssistFightManager:getStrategyPower(fight_type)
	end

	local list = self:getFightList(fight_type)
	local allPower = 0;
	for i=1,10 do
		if list[i] and list[i] ~= 0 then
			local role = CardRoleManager:getRoleByGmid(list[i]);
			if role then
				allPower = allPower + role:getPowerByList(list,fight_type);
			else
				local mercenary = EmployManager:getMercenaryInAllEmployRole( list[i] )
				print("mercenary =",mercenary)
				if mercenary then
					allPower = allPower + mercenary.power
				else
					mercenary = EmployManager:getEmploySingleRoleByGmId( list[i] ,fight_type)
					if mercenary then
						allPower = allPower + mercenary.power
					end
				end
            end
		end
	end
	return allPower;
end
function ZhengbaManager:getRoleByIndex( fight_type,index )
	local role_id = 0

	-- if fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_ATK then
	-- 	role_id = self.championsInfo.atkFormation[index] or 0
		
	-- elseif fight_type == EnumFightStrategyType.StrategyType_CHAMPIONS_DEF then
	-- 	role_id = self.championsInfo.defFormation[index] or 0

	-- elseif fight_type == EnumFightStrategyType.StrategyType_AREAN then
	-- 	--quanhuan 添加群豪谱防守
	-- 	role_id = self.championsInfo.qunHaoDefFormation[index] or 0

	-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	role_id = self.championsInfo.MineDefFormation1[index] or 0
	-- elseif fight_type == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	role_id = self.championsInfo.MineDefFormation2[index] or 0

	-- else
	-- 	role_id = self.championsInfo.defFormation[index] or 0
	-- end

	local roleList = self:getFightList(fight_type) or {}
	role_id = roleList[index] or 0

	local role = CardRoleManager:getRoleByGmid(role_id)
	return role
end

function ZhengbaManager:getMercenaryByIndex( fight_type,index )
	local role_id = 0
	local roleList = self:getFightList(fight_type)
	if roleList == nil then
		return nil
	end
	role_id = roleList[index]
	if role_id == nil or role_id == 0 then
		return nil
	end

	role = EmployManager:getEmploySingleRoleByGmId( role_id,fight_type)
	return role
end
function ZhengbaManager:getMercenaryGmIdByIndex( fight_type,index )
	local role_id = 0
	local roleList = self:getFightList(fight_type)
	if roleList == nil then
		return 0
	end
	role_id = roleList[index]
	if role_id == nil or role_id == 0 then
		return 0
	end

	return role_id
end

function ZhengbaManager:getMercenaryIndexByGmId( fight_type,gmId )
	local role_id = 0
	local roleList = self:getFightList(fight_type)
	if roleList == nil then
		return 0
	end
	for i=1,9 do
		if roleList[i] and  roleList[i] == gmId then
			return i
		end
	end
	return 0
end

function ZhengbaManager:getMercenaryInArmy( fight_type )
	local roleList = self:getFightList(fight_type) or {}
	for i=1,9 do
		local role_id = roleList[i] or 0
		if role_id ~= 0 then
			local role = CardRoleManager:getRoleByGmid(role_id)
			if role == nil then
				local employInfo = EmployManager:getMercenaryInAllEmployRole( role_id )
				if employInfo == nil then
					roleList[i] = 0
				else
					return role_id , i
				end
			end
		end
	end
	return 0 ,0

end

function ZhengbaManager:getNowState()
	local date = GetCorrectDate("*t", MainPlayer:getNowtime())
	if self:isDateOpen(date) == false then
		return 1
	end
	local open_timeDate = self:getTime()
	date.hour = open_timeDate.hour
	date.min  = open_timeDate.min
	date.sec  = open_timeDate.sec

	local open_time	= os.time(date) - getTimeAreaDifSec()-- time correct
	if MainPlayer:getNowtime() < open_time then
		return 1
	end
	local waitTime = ConstantData:getValue( "Zhengba.Time.Wait" )
	local fightTime = ConstantData:getValue( "Zhengba.Time.Fight" )

	if MainPlayer:getNowtime() > open_time + waitTime + fightTime then
		return 1
	end
	if MainPlayer:getNowtime() > open_time and MainPlayer:getNowtime() < open_time + waitTime then
		return 2 , open_time + waitTime - MainPlayer:getNowtime()
	end
	if MainPlayer:getNowtime() > open_time + waitTime and MainPlayer:getNowtime() < open_time + waitTime + fightTime then
		return 3 , open_time + waitTime + fightTime - MainPlayer:getNowtime()
	end
	return 1
end

function ZhengbaManager:isOpen()
	local date = GetCorrectDate("*t", MainPlayer:getNowtime())
	if self:isDateOpen(date) == false then
		return false
	end
	local open_timeDate = self:getTime()
	date.hour = open_timeDate.hour
	date.min  = open_timeDate.min
	date.sec  = open_timeDate.sec

	local open_time	= os.time(open_timeDate) - getTimeAreaDifSec() -- time correct
	if MainPlayer:getNowtime() < open_time then
		return false
	end
	local waitTime = ConstantData:getValue( "Zhengba.Time.Wait" )
	local fightTime = ConstantData:getValue( "Zhengba.Time.Fight" )

	if MainPlayer:getNowtime() > open_time + waitTime + fightTime then
		return false
	end
	return true
end

function ZhengbaManager:getTime()
	if self.open_time ==nil then
		local tbl = split(OpenTime, ":")
		self.open_time = {hour=tbl[1], min=tbl[2], setbl=tbl[3]}
	end
	return self.open_time
end
function ZhengbaManager:getDate()
	if self.open_date ==nil then
		self.open_date , self.open_date_length = stringToNumberTable(OpenDate,',')
	end
	return self.open_date , self.open_date_length
end

function ZhengbaManager:isDateOpen(date)
	self:getDate()
	--没有设置开放时间，则每天都开放
	if not self.open_date_length or self.open_date_length < 1 then
		return true
	end

	local weekDay = date.wday - 1		--获得当前时间的table表存储格式

	if weekDay == 0 then
		weekDay = 7
	end

	for k,v in ipairs(self.open_date) do
		if weekDay == v then
			return true
		end
	end
	return false
end

function ZhengbaManager:openGuizheLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.zhengba.ZhenbashaiRuleLayer", AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
	AlertManager:show()
end
function ZhengbaManager:openZhangBaoLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.zhengba.ZhenbashaiBattlefieldLayer", AlertManager.BLOCK_AND_GRAY)
	AlertManager:show()
end
function ZhengbaManager:openArmyLayer(index, canOpenInfo)
	print("===  ZhengbaManager:openArmyLayer index = ", index)
	if index == EnumFightStrategyType.StrategyType_PVE then
		CardRoleManager:openRoleList()
		return
	end
    local layer = require("lua.logic.zhengba.ZhengbaArmyLayer"):new(index)
    AlertManager:addLayer(layer)
    layer:setOpenInfo(canOpenInfo)
    AlertManager:show()
end

function ZhengbaManager:delRoleByGmid( gmid )
	if self.championsInfo == nil then
		return
	end
	for i=1,9 do
		-- if self.championsInfo.atkFormation and self.championsInfo.atkFormation[i] == gmid then
		-- 	self.championsInfo.atkFormation[i] = 0
		-- end
		-- if self.championsInfo.defFormation and self.championsInfo.defFormation[i] == gmid then
		-- 	self.championsInfo.defFormation[i] = 0
		-- end
		-- --quanhuan 添加群豪谱防守
		-- if self.championsInfo.qunHaoDefFormation and self.championsInfo.qunHaoDefFormation[i] == gmid then
		-- 	self.championsInfo.qunHaoDefFormation[i] = 0
		-- end

		-- if self.championsInfo.MineDefFormation1 and self.championsInfo.MineDefFormation1[i] == gmid then
		-- 	self.championsInfo.MineDefFormation1[i] = 0
		-- end

		-- if self.championsInfo.MineDefFormation2 and self.championsInfo.MineDefFormation2[i] == gmid then
		-- 	self.championsInfo.MineDefFormation2[i] = 0
		-- end
		for j,v in pairs(self.StrategyMulitData) do
			if v and v[i] == gmid then
				v[i] = 0
			end
		end
	end
end

-- 上阵
function ZhengbaManager:OnBattle(fight_type,gmid, posIndex, index_type)
    local role = CardRoleManager:getRoleByGmid(gmid)
    if role == nil then
        -- toastMessage("没有该英雄")
	toastMessage(localizable.ZhengbaManager_no_this_hero)
        return
    end

    local list = clone(self:getFightList(fight_type))
    list[posIndex] = gmid
    self:updateFormation(fight_type ,list , index_type)
end

-- 下阵
function ZhengbaManager:OutBattle(fight_type,gmid,index_type)
    local list = clone(self:getFightList(fight_type))
    for i=1,10 do
        if list[i] and list[i] == gmid then
            list[i] = 0
        end
    end
    for i=1,10 do
		if list[i] and list[i] ~= 0 then
			self:updateFormation(fight_type ,list ,index_type)
			return
        end
    end
    -- toastMessage("必须有一人在阵上")
    toastMessage(localizable.BloodFightManager_zhishaoshangzhenyiren)
    
end

-- 换位置
function ZhengbaManager:ChangePos(fight_type,oldPos, newPos, index_type)
    local list = clone(self:getFightList(fight_type))
    local temp = list[oldPos]
    list[oldPos] = list[newPos]
    list[newPos] = temp
    self:updateFormation(fight_type ,list ,index_type)
end

function ZhengbaManager:getOnlyStrategyEquip( roleList,fight_type,currSortType )
	local strategyRoleList = TFArray:new()
	for roleId in roleList:iterator() do
		local cardRole = CardRoleManager:getRoleById(roleId)
		if cardRole and cardRole:getPosByFightType(fight_type) and cardRole:getPosByFightType(fight_type) > 0 then
			strategyRoleList:push(roleId)
		end
	end
	local equipList = TFArray:new()
	for roleId in strategyRoleList:iterator() do
		local cardRole = CardRoleManager:getRoleById(roleId)
		if cardRole then
			for v in cardRole:getEquipment():iterator() do
				equipList:push(v)
			end
		end
	end
	return equipList
end

function ZhengbaManager:getOnlySportStrategy( fight_type, currSortType )
	local strategyRoleList = TFArray:new()
	local fightgmList = self:getFightList(fight_type)
	for i=1,10 do
		local gmId = fightgmList[i] or 0
		if gmId ~= 0 then
			local role = CardRoleManager:getRoleByGmid(gmId)
			if role then
				strategyRoleList:push(role.id)
			end
		end
	end
	fightgmList = nil
	if fight_type == EnumFightStrategyType.StrategyType_DOUBLE_1 then
		fightgmList = self:getFightList(EnumFightStrategyType.StrategyType_DOUBLE_2)
	elseif fight_type == EnumFightStrategyType.StrategyType_DOUBLE_2 then
		fightgmList = self:getFightList(EnumFightStrategyType.StrategyType_DOUBLE_1)
	end
	if fightgmList then
		for i=1,10 do
			local gmId = fightgmList[i] or 0
			if gmId ~= 0 then
				local role = CardRoleManager:getRoleByGmid(gmId)
				if role and strategyRoleList:indexOf(role.id) == -1  then
					strategyRoleList:push(role.id)
				end
			end
		end
	end
	self:reSortStrategy(fight_type,strategyRoleList,currSortType)
	return strategyRoleList
end

function ZhengbaManager:getSortStrategyByFilter(fight_type, currSortType, front_list, filter_list)
	currSortType = currSortType or CardRoleManager.sort_type
	CardRoleManager:reSortStrategy(currSortType)
	fight_type = fight_type or EnumFightStrategyType.StrategyType_Max
	local cardRoleIdList = nil
	if nil == filter_list then
		filter_list = TFArray:new()
	end
	if front_list then
		self:reSortStrategy(fight_type, front_list, currSortType)
		cardRoleIdList = clone(front_list)
		filter_list:push(front_list)
	else
		cardRoleIdList = TFArray:new()
	end
	for roleId in CardRoleManager.cardRoleList:iterator() do
		if filter_list:indexOf(roleId) == -1 then
			cardRoleIdList:push(roleId)
		end
	end
	return cardRoleIdList
end

function ZhengbaManager:getSortStrategy(fight_type, currSortType, filter_list)
	local strategyRoleList = TFArray:new()
	local fightgmList = self:getFightList(fight_type)
	for i=1,10 do
		local gmId = fightgmList[i] or 0
		if gmId ~= 0 then
			local role = CardRoleManager:getRoleByGmid(gmId)
			if role then
				strategyRoleList:push(role.id)
			end
		end
	end
	fightgmList = nil
	if fight_type == EnumFightStrategyType.StrategyType_DOUBLE_1 then
		fightgmList = self:getFightList(EnumFightStrategyType.StrategyType_DOUBLE_2)
	elseif fight_type == EnumFightStrategyType.StrategyType_DOUBLE_2 then
		fightgmList = self:getFightList(EnumFightStrategyType.StrategyType_DOUBLE_1)
	end
	if fightgmList then
		for i=1,10 do
			local gmId = fightgmList[i] or 0
			if gmId ~= 0 then
				local role = CardRoleManager:getRoleByGmid(gmId)
				if role and strategyRoleList:indexOf(role.id) == -1  then
					strategyRoleList:push(role.id)
				end
			end
		end
	end
	return self:getSortStrategyByFilter(fight_type, currSortType, strategyRoleList, filter_list)
end

function ZhengbaManager:reSortStrategy(fight_type, cardlistDefault, currSortType)
	local cardList = CardRoleManager.cardRoleList
	if cardlistDefault ~= nil then
		cardList = cardlistDefault
	else
		CardRoleManager.sort_fight_type = fight_type
	end
	--EnumFightStrategyType.StrategyType_DOUBLE_1
	local function getRolePos(fight_type, gmId)
		local pos = self:getIndexByRole(fight_type,gmId)
		if pos == 0 then
			if fight_type == EnumFightStrategyType.StrategyType_DOUBLE_1 then
				pos = self:getIndexByRole(EnumFightStrategyType.StrategyType_DOUBLE_2,gmId)
			else
				pos = self:getIndexByRole(EnumFightStrategyType.StrategyType_DOUBLE_1,gmId)
			end
		end
		return pos		
	end

	local function cmpFunByPower(cardRoleId1, cardRoleId2)
        local cardRole1 = CardRoleManager:getRoleById(cardRoleId1)
        local cardRole2 = CardRoleManager:getRoleById(cardRoleId2)
		local pos_1 = cardRole1:getPosByFightType( fight_type )--getRolePos(fight_type,cardRole1.gmId);
		local pos_2 = cardRole2:getPosByFightType( fight_type )--getRolePos(fight_type,cardRole2.gmId);

		if fight_type == EnumFightStrategyType.StrategyType_BLOOY then
			if cardRole1.blood_curHp <= 0 and cardRole2.blood_curHp > 0 then
				return false
			elseif cardRole1.blood_curHp > 0 and cardRole2.blood_curHp <= 0 then
				return true
			end
		end
		-- if fight_type == EnumFightStrategyType.StrategyType_DOUBLE_1
		if pos_1 > pos_2  and pos_2  == 0  then
			return true;
		elseif  (pos_1 > 0 and  pos_2 > 0) or pos_1 == pos_2 then
			if cardRole1.power > cardRole2.power then
				return true;
			elseif cardRole1.power == cardRole2.power then
				if cardRole1.quality > cardRole2.quality then
						return true;
				elseif cardRole1.quality == cardRole2.quality then
					if cardRole1.starlevel > cardRole2.starlevel then
						return true;
					elseif cardRole1.starlevel == cardRole2.starlevel then
						if cardRole1.gmId > cardRole2.gmId then
							return true;
						end
					end
				end
			end
		end
		return false;
	end

	local function cmpFunByQuality(cardRoleId1, cardRoleId2)
        local cardRole1 = CardRoleManager:getRoleById(cardRoleId1)
        local cardRole2 = CardRoleManager:getRoleById(cardRoleId2)
		local pos_1 = cardRole1:getPosByFightType( fight_type )--getRolePos(fight_type,cardRole1.gmId);
		local pos_2 = cardRole2:getPosByFightType( fight_type )--getRolePos(fight_type,cardRole2.gmId);

		if fight_type == EnumFightStrategyType.StrategyType_BLOOY then
			if cardRole1.blood_curHp <= 0 and cardRole2.blood_curHp > 0 then
				return false
			elseif cardRole1.blood_curHp > 0 and cardRole2.blood_curHp <= 0 then
				return true
			end
		end
		-- if fight_type == EnumFightStrategyType.StrategyType_DOUBLE_1

		if pos_1 > pos_2  and pos_2  == 0  then
			return true;
		elseif  (pos_1 > 0 and  pos_2 > 0) or pos_1 == pos_2 then
			if cardRole1.quality > cardRole2.quality then
				return true;
			elseif cardRole1.quality == cardRole2.quality then
				if cardRole1.power > cardRole2.power then
						return true;
				elseif cardRole1.power == cardRole2.power then
					if cardRole1.starlevel > cardRole2.starlevel then
						return true;
					elseif cardRole1.starlevel == cardRole2.starlevel then
						if cardRole1.gmId > cardRole2.gmId then
							return true;
						end
					end
				end
			end
		end
		return false;
	end

	if currSortType == ZhengbaManager.sortByPower then
		cardList:sort(cmpFunByPower);
	else
		cardList:sort(cmpFunByQuality);
	end
end


function ZhengbaManager:qunHaoDefFormationSet(infoType, heroList )
	--quanhuan 2015/12/2
	-- if infoType == EnumFightStrategyType.StrategyType_CHAMPIONS_ATK then
	-- 	self.championsInfo = self.championsInfo or {}
	-- 	self.championsInfo.atkFormation = heroList

	-- elseif infoType == EnumFightStrategyType.StrategyType_AREAN then
	-- 	self.championsInfo = self.championsInfo or {}
	-- 	self.championsInfo.qunHaoDefFormation = heroList

	-- elseif infoType == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	self.championsInfo = self.championsInfo or {}
	-- 	self.championsInfo.MineDefFormation1 = heroList

	-- elseif infoType == EnumFightStrategyType.StrategyType_MINE1_DEF then
	-- 	self.championsInfo = self.championsInfo or {}
	-- 	self.championsInfo.MineDefFormation2 = heroList
	-- end
	for k,gmId1 in pairs(self.StrategyMulitData[infoType] or {}) do
		if gmId1 ~= 0 then
			local isRoleExist = false
			for kk,gmId2 in pairs(heroList) do
				if gmId1 == gmId2 then
					isRoleExist = true
					break;
				end
			end
			if isRoleExist == false then
				local role = CardRoleManager:getRoleByGmid(gmId1)
				if role then
					role:setPosByFightType(infoType,0)
				end
			end
		end
	end

	for i=1,9 do
		local role_id = 0
		role_id = heroList[i] or 0
		local role = CardRoleManager:getRoleByGmid(role_id)
		if role then
			role:setPosByFightType(infoType,i)
		end
	end
	self.StrategyMulitData[infoType] = heroList
end

function ZhengbaManager:getRoleList(infoType)
	if infoType == EnumFightStrategyType.StrategyType_MERCENARY_TEAM then
		return EmployManager:getTeamRoleList()
	end
	return CardRoleManager.cardRoleList
end


function ZhengbaManager:getRoleIndexByGmidAndFightType( gmId , fight_type )
	local list = AssistFightManager:getStrategyList( fight_type )
	for i=1,9 do
		if list[i] and list[i] ~= 0 and gmId == list[i] then
			return i
		end
	end
	return 0
end


function ZhengbaManager:updateHostingSucess( event)
	hideLoading()
	self.hosting = not self.hosting
	TFDirector:dispatchGlobalEventWith(ZhengbaManager.UPADTECHAMPIONSSTATUS)
end

function ZhengbaManager:updateHosting(value)
	if value == nil then
		value = not self.hosting
	end
	showLoading()
	TFDirector:send(c2s.UPDATE_HOSTING ,{value})
end

function ZhengbaManager:getGemMinLevel(gem)
	local lev = 0
	if (not gem) then
		return lev
	end
	local gemTab = {}
	local tab = self:getFightList(EnumFightStrategyType.StrategyType_PVE)
	for k, v in pairs(tab) do
		local role = CardRoleManager:getRoleByGmid(v)
		if role then
			for i = 1, 5 do
				local equip = role:getEquipmentByIndex(i)
				if equip and equip.maxGem then
					for j = 1, equip.maxGem do
						if equip:getGemPos(j) then
							local tempGem = ItemData:objectByID( equip:getGemPos(j) )
							if tempGem and tempGem.kind == gem.kind and gem.type == EnumGameItemType.Gem then
								table.insert(gemTab, tempGem.level)
							end
						end
					end
				end
			end
			local bible = role:getSkyBook()
			if bible and bible.maxGem then
				for j = 1, bible.maxGem do
					if j ~= 1 and bible:getGemPos(j) then
						local tempGem = ItemData:objectByID( bible:getGemPos(j) )
						if tempGem and tempGem.kind == gem.kind and gem.type == EnumGameItemType.Gem then
							table.insert(gemTab, tempGem.level)
						end
					end
				end
			end
		end
	end
	if #gemTab > 0 then
		table.sort(gemTab, function(gem1, gem2)
			return gem1 < gem2
		end)
		lev = gemTab[1]
	end 
	return lev
end
function ZhengbaManager:getStoneNeedNum(stone)
	local num = 0
	if (not stone) then
		return num
	end
	local stoneTab = {}
	local tab = self:getFightList(EnumFightStrategyType.StrategyType_PVE)
	for k, v in pairs(tab) do
		local role = CardRoleManager:getRoleByGmid(v)
		if role then
			local bible = role:getSkyBook()
			if bible and bible.maxStoneNum then
				local jingyaoIdList = bible:getJingyaoIdTable()
				for j = 1, bible.maxStoneNum do
					if jingyaoIdList ~= nil then
						local jingyaoId = jingyaoIdList[j]
        				local tmpStone = ItemData:objectByID(tonumber(jingyaoId)) 
        				if tmpStone and tmpStone.kind == stone.kind and stone.type == EnumGameItemType.SBStone and tmpStone.quality == stone.quality then
							num = num + 1
						end
					end
					if bible:getStonePos(j) then
						local tempStone = ItemData:objectByID(bible:getStonePos(j))
						if tempStone and tempStone.kind == stone.kind and stone.type == EnumGameItemType.SBStone and tempStone.quality == stone.quality then
							num = num - 1
						end
					end
				end
			end
		end
	end
	return num
end
--根据阵容获取精要
function ZhengbaManager:getStoneByType(type,role)
	local stonetab = TFArray:new()
	if (not type) or (not role) then
		return stonetab
	end
	if role then
		local bible = role:getSkyBook()
		if bible and bible.maxStoneNum then
			local jingyaoIdList = bible:getJingyaoIdTable()
			for j = 1, bible.maxStoneNum do
				if jingyaoIdList ~= nil then
					local jingyaoId = jingyaoIdList[j]
    				local tmpStone = ItemData:objectByID(tonumber(jingyaoId)) 
    				local tempStone = ItemData:objectByID(bible:getStonePos(j))
    				if tempStone == nil then      
						stonetab:push(tmpStone)
					end
				end
			end
		end
	end
	return stonetab
end
return ZhengbaManager:new();
