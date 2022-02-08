-- client side CrossCrossZhengBaManager.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-02-28

-- Ladder_s2c.proto

local CrossZhengBaManager = class("CrossZhengBaManager")

CrossZhengBaManager.RECEIVE_MAIN_INFO                    = "CrossZhengBaManager.RECEIVE_MAIN_INFO"
CrossZhengBaManager.RECEIVE_RANK_INFO                    = "CrossZhengBaManager.RECEIVE_RANK_INFO"

local LadderData = require('lua.table.t_s_ladder_race')
local LadderMissionData = require('lua.table.t_s_ladder_mission')
CrossZhengBaManager.MissionState_0 = 0  -- 未完成
CrossZhengBaManager.MissionState_1 = 1  -- 已完成
CrossZhengBaManager.MissionState_2 = 2  -- 已领取

CrossZhengBaManager.HeroState_0 = 0 -- 正常
CrossZhengBaManager.HeroState_1 = 1 -- 胜利
CrossZhengBaManager.HeroState_2 = 2 -- 停战
function CrossZhengBaManager:ctor()
	self.missionDataList = {}
	for item in LadderMissionData:iterator() do
		if self.missionDataList[item.case] == nil then
			self.missionDataList[item.case] = {}
		end
		if self.missionDataList[item.case].missions == nil then
			self.missionDataList[item.case].missions = {}
		end
		local data = { id = item.id, currNum = 0, maxNum = item.num, state = CrossZhengBaManager.MissionState_0 }
		table.insert(self.missionDataList[item.case].missions,data)
		if self.missionDataList[item.case].currMission == nil then
			self.missionDataList[item.case].currMission = item.id
			self.missionDataList[item.case].currNum = 0
			self.missionDataList[item.case].maxNum = item.num
			self.missionDataList[item.case].state = CrossZhengBaManager.MissionState_0
		end
	end
	self:registerEvents()
	self:restart()
end

function CrossZhengBaManager:restart()
	self.activityStatus = 1
	self.challengeInfoList = {}
	self.myChallengeInfo = {}
	self.rankList = {}
	self.otherPlayerList = {}
	self.myRankInfo = nil
    self.stopIndex = -1
    self.break_start_cost_tip = false
    self.isSweepStatus = true -- 一键扫荡是否可用
end

function CrossZhengBaManager:reset_24()
	self.otherPlayerList = {}
    self.isSweepStatus = true
end

function CrossZhengBaManager:pushOtherPlayerData( userData )
	self.otherPlayerList[userData.playerId] = userData
end

function CrossZhengBaManager:getOtherPlayerData(playerId)
	return self.otherPlayerList[playerId]
end

function CrossZhengBaManager:registerEvents()
	TFDirector:addProto(s2c.PLAYER_LADDER_MESSAGE , self, self.onReceiveMainInfo)
    TFDirector:addProto(s2c.LADDER_RANK , self, self.onReceiveRankInfo)
    TFDirector:addProto(s2c.LADDER_FORMATION , self, self.onReceiveChallengerDetail)
	TFDirector:addProto(s2c.MY_LADDER_INFO , self, self.onReceiveMyLadderInfo)
    TFDirector:addProto(s2c.LADDER_SWEEP_REPONSE , self, self.onReceiveSweepInfo)
end
--=======================================================================================--
function CrossZhengBaManager:requestMainInfo(isOpen)
    if (not self:getServerSwitchStatue()) then
        toastMessage(localizable.CrossFightBattle_ShowTxt2)
        return
    end
    showLoading()
    self.isOpen = isOpen
    TFDirector:send(c2s.GAIN_PLAYER_LADDER_MESSAGE,{})
end

function CrossZhengBaManager:requestRankInfo(isOpen)
    showLoading()
    self.isOpen = isOpen
    TFDirector:send(c2s.GAIN_LADDER_RANK,{})
end

function CrossZhengBaManager:requestFight(index)
    showLoading()
    local msg = {
    	index
	}
    TFDirector:send(c2s.CHALLENGE_LADDER,msg)
end

function CrossZhengBaManager:requestStop(index)
    showLoading()
    local msg = {
    	index
	}

    self.stopIndex = index
    TFDirector:send(c2s.LADDER_STOP_BATTLE,msg)
end

function CrossZhengBaManager:requestGetMissionReward(id)
    showLoading()
    local msg = {
    	id
	}
    TFDirector:send(c2s.DROW_LADDER_MISSION,msg)
end

function CrossZhengBaManager:requestChallengerDetail(index)
    showLoading()
    local msg = {
        index
    }
    TFDirector:send(c2s.GAIN_LADDER_FORMATION,msg)
end

function CrossZhengBaManager:requestSweep(index)
    showLoading()
    local msg = {
        index
    }
    TFDirector:send(c2s.LADDER_SWEEP,msg)
end
--=======================================================================================--
function CrossZhengBaManager:onReceiveMainInfo(event)
    hideLoading()
    self.challengeInfoList = event.data.challengers or {}
    self.lastSeasonTime = event.data.lastSeasonTime / 1000
    self.lastSeasonGrade = event.data.lastSeasonGrade
    self.myChallengeInfo = {}
    self.myChallengeInfo.grade = event.data.grade
    self.myChallengeInfo.star = event.data.star
    self.myChallengeInfo.stopBattleCount = event.data.stopBattleCount
    print("event.data.missionTypes = ",event.data.missionTypes)
    print("event.data.drowMissions = ",event.data.drowMissions)
    local acheiveList = {}
    local acheiveTempList = {}
    local tbl = stringToTable(event.data.missionTypes,"|")
    for i,v in ipairs(tbl) do
    	local tempTbl = stringToNumberTable(v,"_")
    	acheiveTempList[tempTbl[1]] = tempTbl[2]
    end
    -- 判断是否可以用一键扫荡
    if (event.data.status == 0) then
        self.isSweepStatus = true
    else
        self.isSweepStatus = false
    end


    local getList = {}
    tbl = stringToNumberTable(event.data.drowMissions,",")
    for i,v in ipairs(tbl) do
    	getList[v] = 1
    end
    for item in LadderMissionData:iterator() do
        if item.type < 100 then
            for k,v in pairs(acheiveTempList) do
                if k < 100 and item.type <= k then
                    if acheiveList[item.type] == nil then
                        acheiveList[item.type] = 0
                    end
                    acheiveList[item.type] = acheiveList[item.type] + v
                end
            end
        else
            acheiveList[item.type] = acheiveTempList[item.type] or 0
        end
    end

    local function getCurrNum( id )
    	local itemData = self:getMissionData(id)
    	if itemData == nil then
    		return 0
    	end
    	if acheiveList[itemData.type] == nil then
			acheiveList[itemData.type] = 0
		end
    	return acheiveList[itemData.type]
    end
    for i,v in ipairs(self.missionDataList) do
    	for j,u in ipairs(v.missions) do
    		u.currNum = 0
    		u.state = CrossZhengBaManager.MissionState_0
    		local itemData = self:getMissionData(u.id)
    		if itemData then
    			u.currNum = getCurrNum(u.id)
    			if u.currNum >= u.maxNum then
    				u.state = CrossZhengBaManager.MissionState_1
    			end
    		end
    		if getList[u.id] == 1 then
    			u.state = CrossZhengBaManager.MissionState_2
    			u.currNum = u.maxNum
    		end
    		if ( v.currMission >= u.id or getList[v.currMission] == 1 ) then
    			v.currMission = u.id
    			v.currNum = u.currNum
    			v.maxNum = u.maxNum
    			v.state = u.state
    		end
    	end
    end
    local isStopSuccess = false
    if self.stopIndex and self.stopIndex ~= -1 then
        local challengeInfo = self.challengeInfoList[self.stopIndex + 1]
        if challengeInfo and challengeInfo.state == self.HeroState_2 then
            isStopSuccess = true
        end
        self.stopIndex = -1
    end

    TFDirector:dispatchGlobalEventWith(CrossZhengBaManager.RECEIVE_MAIN_INFO, {isStopSuccess})
    if self.isOpen == true then
    	self.isOpen = false
    	local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaMainLayer", AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
		AlertManager:show()
        if self.lastSeasonGrade then
            self:openDWLayer(self.lastSeasonGrade.grade,self.lastSeasonGrade.star)
        end
    end
end

function CrossZhengBaManager:onReceiveMyLadderInfo( event )
    if event.data.grade then
        if self.myChallengeInfo == nil then
            self.myChallengeInfo = {}
        end
        self.myChallengeInfo.grade = event.data.grade
    end
    if event.data.star then
        if self.myChallengeInfo == nil then
            self.myChallengeInfo = {}
        end
        self.myChallengeInfo.star = event.data.star
    end
end

function CrossZhengBaManager:onReceiveRankInfo(event)
    hideLoading()
    self.rankList = event.data.infos or {}
    local myPlayerId = MainPlayer:getPlayerId()
    self.myRankInfo = nil
    for i,v in ipairs(self.rankList) do
    	if v.playerId == myPlayerId then
    		self.myRankInfo = v
    		self.myRankInfo.rank = i
    	end
        if i <= 20 and v.grade == 21 then
            v.grade = 22
        end
    end
    if event.data.grade then
    	if self.myChallengeInfo == nil then
    		self.myChallengeInfo = {}
    	end
    	self.myChallengeInfo.grade = event.data.grade
    end
    if event.data.star then
    	if self.myChallengeInfo == nil then
    		self.myChallengeInfo = {}
    	end
    	self.myChallengeInfo.star = event.data.star
    end
    print("self.rankList = ",self.rankList)
    if self.isOutRank == true then
    	self.isOutRank = false
    	local dataMap = {}
    	dataMap.rankInfo = event.data.infos
    	dataMap.myRanking = 0
    	if self.myRankInfo then
    		dataMap.myRanking = self.myRankInfo.rank
    	end
    	dataMap.myGrade = 0
    	dataMap.myStar = 0
    	if self.myChallengeInfo then
    		dataMap.myGrade = self.myChallengeInfo.grade
    		dataMap.myStar = self.myChallengeInfo.star
    	end
    	TFDirector:dispatchGlobalEventWith(RankManager.GETRANKDATADONE, {dataMap})
    end
    TFDirector:dispatchGlobalEventWith(CrossZhengBaManager.RECEIVE_RANK_INFO, {})
    if self.isOpen == true then
    	self.isOpen = false
    	local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaRankLayer", AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
		AlertManager:show()
    end
end

function CrossZhengBaManager:onReceiveChallengerDetail( event )
    hideLoading()

    local challengeInfo,index = self:getChallengeInfoById(event.data.details.playerId)
    if challengeInfo then
        challengeInfo.grade = event.data.grade
        challengeInfo.power = event.data.details.power
    end
    local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaVSLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
    layer:loadData(event.data.details,event.data.grade)
    AlertManager:show()
end

function CrossZhengBaManager:onReceiveSweepInfo(event)
    hideLoading()
    self.sweepData = event.data.info
    local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaSweepResult",AlertManager.BLOCK_CLOSE,AlertManager.TWEEN_NONE);
    AlertManager:show()
end
--=======================================================================================--
function CrossZhengBaManager:getChallengeInfo( index )
	if index == nil then
		return self.challengeInfoList or {}
	end
	return self.challengeInfoList[index]
end

function CrossZhengBaManager:getChallengeInfoById( playerId )
	if playerId == nil then
		return nil,nil
	end
	for i,v in ipairs(self.challengeInfoList) do
		if v.playerId == playerId then
			return v,i
		end
	end
	return nil,nil
end

function CrossZhengBaManager:getMyChallengeInfo()
	return self.myChallengeInfo
end

function CrossZhengBaManager:getMyRankInfo()
	return self.myRankInfo
end

function CrossZhengBaManager:getRankInfo(index)
	return self.rankList[index]
end

function CrossZhengBaManager:getRankInfoSize()
	return #(self.rankList)
end

function CrossZhengBaManager:getGradeImg( grade )
	local itemData = self:getData(grade)
	if itemData == nil then
		return "ui_new/crosszhenba/img_dw1.png"
	end
	return "ui_new/crosszhenba/" .. itemData.icon .. ".png"
end

function CrossZhengBaManager:getSmallGradeImg( grade )
    local itemData = self:getData(grade)
    if itemData == nil then
        return "ui_new/crosszhenba/img_dws1.png"
    end
    return "ui_new/crosszhenba/" .. itemData.icon_s .. ".png"
end

function CrossZhengBaManager:getGradeName( grade )
	local itemData = self:getData(grade)
	if itemData == nil then
		return "ui_new/crosszhenba/img_dw1_1.png"
	end
	return "ui_new/crosszhenba/" .. itemData.pic .. ".png"
end

function CrossZhengBaManager:getGradeLevelTag( grade )
    local itemData = self:getData(grade)
    if itemData == nil then
        return nil
    end
    if itemData.level_icon == nil or itemData.level_icon == "" then
        return nil
    end
    return "ui_new/crosszhenba/" .. itemData.level_icon .. ".png"
end

function CrossZhengBaManager:getData( id )
	return LadderData:objectByID(id)
end

function CrossZhengBaManager:getMissionData( id )
	return LadderMissionData:objectByID(id)
end

function CrossZhengBaManager:getMissionByCase( case_id )
	return self.missionDataList[case_id]
end

function CrossZhengBaManager:getMissionSize()
	return #(self.missionDataList)
end

function CrossZhengBaManager:getMaxNum()
	local grade = 1
	if self.myChallengeInfo ~= nil and self.myChallengeInfo.grade ~= nil and self.myChallengeInfo.grade ~= 0 then
		grade = self.myChallengeInfo.grade
	end
	local itemData = self:getData(grade)
	return itemData.formation_count
end

function CrossZhengBaManager:getLastFinishTime()
    return self.lastSeasonTime or 0
end

function CrossZhengBaManager:IsCanFight()
    local timeNow = MainPlayer:getNowtime()
    local time = ConstantData:objectByID("Personal.Ladder.Battle.Cycle").value
    time = time * 24 * 3600
    local lastTime = self:getLastFinishTime()
    local totalSec = lastTime + time - timeNow
    if totalSec <= 3600 then
        return false
    end
    if totalSec >= time - 3600 then
        return false
    end
    return true
end

function CrossZhengBaManager:IsCanGetReward()
    for k,v in pairs(self.missionDataList) do
        if v.state == CrossZhengBaManager.MissionState_1 then
            return true
        end
    end
    return false
end

function CrossZhengBaManager:IsOpenActivity()
    if CommonManager:IsOpenServerGroup() == false then
        return false
    end
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2221)
    if teamLev < openLev then
        return false
    end
    return true
end

function CrossZhengBaManager:getServerSwitchStatue()
    return MainPlayer:getServerSwitchStatue( ServerSwitchType.CrossZhengBa )
end

function CrossZhengBaManager:getRankServerSwitchStatue()
    return MainPlayer:getServerSwitchStatue( ServerSwitchType.CrossZhengBaRank )
end
--=======================================================================================--

function CrossZhengBaManager:openMainLayer()
	self:requestMainInfo(true)
end

function CrossZhengBaManager:openTaskLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaMissionLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
	AlertManager:show()
end

function CrossZhengBaManager:openRankLayer()
	self:requestRankInfo(true)
end

function CrossZhengBaManager:requestOutRankInfo()
	self.isOutRank = true
	self:requestRankInfo(false)
end

function CrossZhengBaManager:openDWLayer(newGrade,newStar,oldGrade,oldStar)
	local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaDWLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:setGrade(newGrade,newStar,oldGrade,oldStar)
	AlertManager:show()
end

function CrossZhengBaManager:openRewardLayer()
    local layer = AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaRewardLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show()
end

function CrossZhengBaManager:createVSLayer()
	return AlertManager:addLayerByFile("lua.logic.crosszhengba.CrossZhengBaVSLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
end

--获取扫荡结果信息
function CrossZhengBaManager:getSweepData()
    return self.sweepData
end

return CrossZhengBaManager:new();
