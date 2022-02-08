-- client side BiaoCheManager.lua
--[[
 * @Description: 镖行天下管理类
 ]]
-- script writer chikui
-- creation time 2017-01-10

-- ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
-- ！！！！！！！！！！！！！！！！！！       note       ！！！！！！！！！！！！！！！！！
-- ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
-- ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
-- note   坏车进场处理！！！！！
-- ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
local BiaoCheManager = class("BiaoCheManager")

BiaoCheManager.RECEIVE_MAIN_INFO                    = "BiaoCheManager.RECEIVE_MAIN_INFO"
BiaoCheManager.RECEIVE_SIGN_UP_INFO                 = "BiaoCheManager.RECEIVE_SIGN_UP_INFO"
BiaoCheManager.RECEIVE_CHANGE_SIGN_UP_INFO          = "BiaoCheManager.RECEIVE_CHANGE_SIGN_UP_INFO"
BiaoCheManager.RECEIVE_ACTIVITY_STATE               = "BiaoCheManager.RECEIVE_ACTIVITY_STATE"
BiaoCheManager.RECEIVE_CONVERGE_INFO                = "BiaoCheManager.RECEIVE_CONVERGE_INFO"
BiaoCheManager.RECEIVE_REST_SUCCESS                 = "BiaoCheManager.RECEIVE_REST_SUCCESS"
BiaoCheManager.RECEIVE_ATTACK_INFO                  = "BiaoCheManager.RECEIVE_ATTACK_INFO"
BiaoCheManager.RECEIVE_UPDATE_QUALITY_INFO          = "BiaoCheManager.RECEIVE_UPDATE_QUALITY_INFO"
BiaoCheManager.RECEIVE_HISTORY_RANK_INFO            = "BiaoCheManager.RECEIVE_HISTORY_RANK_INFO"
BiaoCheManager.RECEIVE_MY_ATTACK_STATE              = "BiaoCheManager.RECEIVE_MY_ATTACK_STATE"


BiaoCheManager.ActivityState_0 = 0 --未开启
BiaoCheManager.ActivityState_1 = 1 --报名
BiaoCheManager.ActivityState_2 = 2 --战斗
BiaoCheManager.ActivityState_3 = 0 --展示

BiaoCheManager.RankType_1 = 1 --镖车排行
BiaoCheManager.RankType_2 = 2 --击杀排行
BiaoCheManager.RankType_3 = 3 --仇敌排行

BiaoCheManager.RequestCar_1 = 1 --入口请求当前报名信息
BiaoCheManager.RequestCar_2 = 2 --点开报名界面
BiaoCheManager.RequestCar_3 = 3 --查看目标详情
BiaoCheManager.RequestCar_4 = 4 --查看当前进攻目标详情
BiaoCheManager.RequestCar_5 = 5 --查看当前进攻状态

BiaoCheManager.CarPart_1 = 1     -- 1:护甲
BiaoCheManager.CarPart_2 = 2     -- 2:镖旗
BiaoCheManager.CarPart_3 = 3     -- 3:轮子
BiaoCheManager.CarPart_4 = 4     -- 4:车厢
BiaoCheManager.layerBuffer = {
    "lua.logic.biaoche.BiaoCheSignUpLayer",
    "lua.logic.biaoche.BiaoCheMainLayer",
    "lua.logic.biaoche.BiaoCheHistoryLayer"
}
local CarNodePosData = require('lua.table.t_s_biaoche_pos')
function BiaoCheManager:ctor(data)
    TFDirector:addProto(s2c.ESCORT_AGENCY_RESPONSE, self, self.onReceiveMainInfo)
    TFDirector:addProto(s2c.ESCORT_AGENCY_ENROLL_RESPONSE, self, self.onReceiveSignUpInfo)
    TFDirector:addProto(s2c.ESCORT_AGENCY_DEPLOY_RESPONSE, self, self.onReceiveChangeSignUpInfo)
    TFDirector:addProto(s2c.ESCORT_AGENCY_TARGET_RESPONSE, self, self.onReceiveConvergeInfo)
    TFDirector:addProto(s2c.ESCORT_AGENCY_STATUS_RESPONSE, self, self.onReceiveActivityState)
    TFDirector:addProto(s2c.ESCORT_AGENCY_REST_RESPONSE, self, self.onReceiveRestSuccess)
    TFDirector:addProto(s2c.ESCORT_AGENCY_ATTACK_RESPONSE, self, self.onReceiveAttackInfo)
    TFDirector:addProto(s2c.ESCORT_AGENCY_UPDATE_QUALITY_RESPONSE, self, self.onReceiveUpdateQuality)
    TFDirector:addProto(s2c.ESCORT_AGENCY_ONE_INFO_RESPONSE, self, self.onReceiveOneCarInfo)
    TFDirector:addProto(s2c.ESCORT_AGENCY_RANK_HISTORY_RESPONSE, self, self.onReceiveHistoryRankInfo)

    self.mapInfoHelper = require("lua.logic.biaoche.MapInfoHelper"):new()
    self:restart()
end

function BiaoCheManager:restart()

    self.rankInfo   = {}
    self.myRankInfo = {}
    self.signUpInfo = {}
    self.historyRank = {}
    self.serverBest = {}
    self.myHistoryRankInfo = {}
    self.activityState = 0
    self.convergeGuildId = 0
    self.currAttGuildId = 0
    self.isEscort = 0
    self.carQuality = 1
    self.myPlayerData = nil
	if self.mapInfoHelper then
		self.mapInfoHelper:restart()
	end
end

-- 请求镖车信息
function BiaoCheManager:requestMainInfo()
    showLoading()
    TFDirector:send(c2s.ESCORT_AGENCY_REQUEST,{})
end

function BiaoCheManager:requestReadyInfo()
    showLoading()
    self.oneCarRequestType = self.RequestCar_1
    local myGuildId = FactionManager:getPersonalInfo().guildId
    local msg = {
        myGuildId,
        self.oneCarRequestType
    }
    TFDirector:send(c2s.ESCORT_AGENCY_ONE_INFO_REQUEST,msg)
end

function BiaoCheManager:requestSignUpInfo()
    showLoading()
    self.oneCarRequestType = self.RequestCar_2
    local myGuildId = FactionManager:getPersonalInfo().guildId
    local msg = {
        myGuildId,
        self.oneCarRequestType
    }
    TFDirector:send(c2s.ESCORT_AGENCY_ONE_INFO_REQUEST,msg)
end

function BiaoCheManager:requestCarDetailInfo(guildId,isMyAttack)
    showLoading()
    if isMyAttack == true then
        self.oneCarRequestType = self.RequestCar_4
    else
        self.oneCarRequestType = self.RequestCar_3
    end
    local msg = {
        guildId,
        self.oneCarRequestType
    }
    TFDirector:send(c2s.ESCORT_AGENCY_ONE_INFO_REQUEST,msg)
end

function BiaoCheManager:requestSignUp(type)
    showLoading()
    local msg = {
        type
    }
    TFDirector:send(c2s.ESCORT_AGENCY_ENROLL_REQUEST,msg)
end

function BiaoCheManager:requestChangeSignUp(playerId,type,index)
    showLoading()
    local msg = {
        playerId,
        type,
        index
    }
    print("BiaoCheManager:requestChangeSignUp ---",msg)
    TFDirector:send(c2s.ESCORT_AGENCY_DEPLOY_REQUEST,msg)
end

function BiaoCheManager:requestConverge(targetId,type)
    showLoading()
    local msg = {
        type,
        targetId
    }
    TFDirector:send(c2s.ESCORT_AGENCY_TARGET_REQUEST,msg)
end

function BiaoCheManager:requestRest(updateFormation)
    showLoading()
    local msg = {
        updateFormation
    }
    TFDirector:send(c2s.ESCORT_AGENCY_REST_REQUEST,msg)
end

function BiaoCheManager:requestHistoryRank()
    showLoading()
    local msg = {
    }
    TFDirector:send(c2s.ESCORT_AGENCY_RANK_HISTORY_REQUEST,msg)
end

function BiaoCheManager:requestShengji(quality)
    showLoading()
    local msg = {
        quality
    }
    TFDirector:send(c2s.ESCORT_AGENCY_UPDATE_QUALITY_REQUEST, msg)
end

function BiaoCheManager:requestAttack(guildId,type)
    showLoading()
    local msg = {
        guildId,
        type
    }
    TFDirector:send(c2s.ESCORT_AGENCY_ATTACK_REQUEST, msg)
end

function BiaoCheManager:requestMyAttackDetail()
    local guildId = self:getAttackGuildId()
    if guildId == nil or guildId == 0 then
        return
    end
    --showLoading()
    self.oneCarRequestType = self.RequestCar_5
    local msg = {
        guildId,
        self.oneCarRequestType
    }
    TFDirector:send(c2s.ESCORT_AGENCY_ONE_INFO_REQUEST,msg)
end

-->>>>>>>-------------------------------------------->>>>>>>>--

function BiaoCheManager:onReceiveMainInfo(event)
    hideLoading()

    local activityState = self:getActivityState()
    -- print("BiaoCheManager:onReceiveMainInfo data =",event.data)
    if activityState == 2 then
        self.convergeGuildId = event.data.targetId
        self.currAttGuildId = event.data.attGuildId
        self.isEscort = event.data.isEscort
        self.restTime = event.data.resetTime
        self:parseCarInfoList(event.data.cardInfo)
        self.mapInfoHelper:setUpdateTime(event.data.updateTime)
        if event.data.cardRankInfo and event.data.cardRankInfo[1] then
            local carRankData = event.data.cardRankInfo[1]
            self:parseCarRank(carRankData)
        end

        if event.data.killRankInfo and event.data.killRankInfo[1] then
            local killRankData = event.data.killRankInfo[1]
            self:parseKillRank(killRankData)
        end

        if event.data.targetRankInfo and event.data.targetRankInfo[1] then
            local enemyRankData = event.data.targetRankInfo[1]
            self:parseEnemyRank(enemyRankData)
        end

        local battleState = event.data.attBattleResult
        if battleState == 1 then
            toastMessage(localizable.BiaoCheBaoAttackDefeated_txt)
        elseif battleState == 2 then
            toastMessage(localizable.BiaoCheBaoAttackSuccess_txt)
        end
        
    else
        if self.isOpenMainLayer == true then
            self:clossAllLayer()
            self:openMainLayer()
        end
        return
    end

    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_MAIN_INFO, {})
    if self.isOpenMainLayer == true then
        self.isOpenMainLayer = false
        self:clossAllLayer()
        self:openCurLayer()
    end
end

function BiaoCheManager:onReceiveSignUpInfo(event)
    hideLoading()
    local mysignUpData = event.data.cardInfo
    if mysignUpData and mysignUpData.partInfo then
        for k,v in pairs(mysignUpData.partInfo) do
            v.defensePlayer = {}
            v.attackPlayer = {}
            if v.player and v.player[1] then
                for j,u in ipairs(v.player) do
                    if u.type == 0 then
                        table.insert(v.defensePlayer,u)
                    else
                        table.insert(v.attackPlayer,u)
                    end
                end
            end
            v.player = nil
        end
    end
    self:parseMySignUpInfo(mysignUpData)
    self.isEscort = 1
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_SIGN_UP_INFO, {})
end

function BiaoCheManager:onReceiveChangeSignUpInfo(event)
    hideLoading()
    local mysignUpData = event.data.cardInfo
    if mysignUpData and mysignUpData.partInfo then
        for k,v in pairs(mysignUpData.partInfo) do
            v.defensePlayer = {}
            v.attackPlayer = {}
            if v.player and v.player[1] then
                for j,u in ipairs(v.player) do
                    if u.type == 0 then
                        table.insert(v.defensePlayer,u)
                    else
                        table.insert(v.attackPlayer,u)
                    end
                end
            end
            v.player = nil
        end
    end
    self:parseMySignUpInfo(mysignUpData)
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_CHANGE_SIGN_UP_INFO, {})
end

function BiaoCheManager:onReceiveConvergeInfo(event)
    hideLoading()
    self.convergeGuildId = event.data.targetId
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_CONVERGE_INFO, {})
end

function BiaoCheManager:onReceiveActivityState(event)
    local lastActivityState = self.activityState
    self.activityState = event.data.status
    -- print("lastActivityState = ",lastActivityState)
    -- print("self.activityState = ",self.activityState)
    if lastActivityState ~= self.activityState then
        local bResult = false
        for k,v in pairs(self.layerBuffer) do
            layerExsit = AlertManager:getLayerByName(v)
            if layerExsit then
                bResult = true
                break
            end
        end
        if bResult == true then
            self:openMainLayer()
        end
    end
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_ACTIVITY_STATE, {})
end

function BiaoCheManager:onReceiveRestSuccess(event)
    hideLoading()
    self.restTime = event.data.restTime
    toastMessage(localizable.Biaochemainlayer_reset_success)
    self:setMyPlayerData(nil)
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_REST_SUCCESS, {})
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_MY_ATTACK_STATE, {})
end

function BiaoCheManager:onReceiveAttackInfo(event)
    hideLoading()
    local carInfo = event.data.cardInfo
    if carInfo and carInfo.partInfo then
        for k,v in pairs(carInfo.partInfo) do
            v.defensePlayer = {}
            v.attackPlayer = {}
            if v.player and v.player[1] then
                for j,u in ipairs(v.player) do
                    if u.type == 0 then
                        table.insert(v.defensePlayer,u)
                    else
                        table.insert(v.attackPlayer,u)
                    end
                end
            end
            v.player = nil
        end
    end
    self.currAttGuildId = carInfo.guildId
    self:requestMyAttackDetail()
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_ATTACK_INFO, {carInfo})
end

function BiaoCheManager:onReceiveUpdateQuality(event)
    hideLoading()
    local quality = event.data.quality
    self.carQuality = quality
    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_UPDATE_QUALITY_INFO, {quality})
end

function BiaoCheManager:onReceiveOneCarInfo(event)
    hideLoading()
    local carInfo = event.data.cardInfo
    self.oneCarRequestType = event.data.type
    -- print("event.data = ",event.data)
    local activityState = self:getActivityState()
    if carInfo and carInfo.partInfo then
        for k,v in pairs(carInfo.partInfo) do
            v.defensePlayer = {}
            v.attackPlayer = {}
            if v.player and v.player[1] then
                for j,u in ipairs(v.player) do
                    if u.type == 0 then
                        table.insert(v.defensePlayer,u)
                    else
                        table.insert(v.attackPlayer,u)
                    end
                end
            end
            v.player = nil
        end
    end
    print("self.oneCarRequestType = ",self.oneCarRequestType)
    if self.oneCarRequestType == BiaoCheManager.RequestCar_1 then
        self:parseRequestCar_1(carInfo)
    elseif self.oneCarRequestType == BiaoCheManager.RequestCar_2 then
        self:parseRequestCar_2(carInfo)
    elseif self.oneCarRequestType == BiaoCheManager.RequestCar_3 then
        self:parseRequestCar_3(carInfo)
    elseif self.oneCarRequestType == BiaoCheManager.RequestCar_4 then
        self:parseRequestCar_4(carInfo)
    elseif self.oneCarRequestType == BiaoCheManager.RequestCar_5 then
        self:parseRequestCar_5(carInfo)
    end
end

function BiaoCheManager:onReceiveHistoryRankInfo(event)
    hideLoading()
    self.myHistoryRankInfo[self.RankType_1] = nil
    self.serverBest[self.RankType_1] = nil
    self.historyRank[self.RankType_1] = nil
    if event.data.cardRankInfo then
        self.historyRank[self.RankType_1] = event.data.cardRankInfo.cardRank or {}
        local myGuildId = FactionManager:getPersonalInfo().guildId
        for k,v in pairs(self.historyRank[self.RankType_1]) do
            if v.cardInfo.guildId == myGuildId then
                self.myHistoryRankInfo[self.RankType_1] = v
                break
            end
        end
        self.serverBest[self.RankType_1] = {}
        self.serverBest[self.RankType_1].rank       = event.data.cardRankInfo.myRanking
        self.serverBest[self.RankType_1].lastScore  = event.data.cardRankInfo.lastScore
        self.serverBest[self.RankType_1].guildId    = event.data.cardRankInfo.myGuildId
        self.serverBest[self.RankType_1].guildName  = event.data.cardRankInfo.myGuildName
        self.serverBest[self.RankType_1].bannerId   = event.data.cardRankInfo.bannerId
    end

--------------------------------------->>>>>>>>>>>>>>>>
    self.serverBest[self.RankType_2] = nil
    self.historyRank[self.RankType_2] = nil
    if event.data.killRankInfo then
        self.historyRank[self.RankType_2] = event.data.killRankInfo.killRank or {}
        self.myHistoryRankInfo[self.RankType_2] = nil
        local playerId = MainPlayer:getPlayerId()
        for k,v in pairs(self.historyRank[self.RankType_2]) do
            if v.playerId == playerId then
                self.myHistoryRankInfo[self.RankType_2] = v
                break
            end
        end
        self.serverBest[self.RankType_2] = {}
        self.serverBest[self.RankType_2].rank           = event.data.killRankInfo.myRanking
        self.serverBest[self.RankType_2].lastScore      = event.data.killRankInfo.lastScore
        self.serverBest[self.RankType_2].playerId       = event.data.killRankInfo.myPlayerId
        self.serverBest[self.RankType_2].playerName     = event.data.killRankInfo.myPlayerName
        self.serverBest[self.RankType_2].useCoin        = event.data.killRankInfo.useCoin
        self.serverBest[self.RankType_2].frameId        = event.data.killRankInfo.frameId
        self.serverBest[self.RankType_2].guildName      = event.data.killRankInfo.guildName
    end

    local activityState = self:getActivityState()
    if activityState ~= self.ActivityState_3 then
        if self.isOpenMainLayer == true then
            self:clossAllLayer()
            self:openMainLayer()
            return
        end
    end

    TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_HISTORY_RANK_INFO, {})

    if self.isOpenMainLayer == true then
        self.isOpenMainLayer = false
        self:clossAllLayer()
        self:openCurLayer()
    end
end
-->>>>>>>-------------------------------------------->>>>>>>>--

function BiaoCheManager:parseCarInfoList( data )
    if data == nil then
        return
    end
    for k,v in pairs(data) do
        self.mapInfoHelper:pushInfoNodeByData(v)
    end
end

function BiaoCheManager:parseMySignUpInfo( mysignUpData )
    self.signUpInfo = {}
    if mysignUpData == nil then
        self.carQuality = 1
    else
        self.carQuality = mysignUpData.quality
    end
    if mysignUpData and mysignUpData.partInfo then
        for i = 1, 4 do
            if mysignUpData.partInfo[i] then
                local type = mysignUpData.partInfo[i].type
                self.signUpInfo[type] = mysignUpData.partInfo[i].defensePlayer or {}
            end
        end
    end
    -- print("self.signUpInfo = ",self.signUpInfo)
end

function BiaoCheManager:parseCarRank( carRankData )
    self.myRankInfo[self.RankType_1] = {}
    self.myRankInfo[self.RankType_1].rank = carRankData.myRanking
    self.myRankInfo[self.RankType_1].lastScore = carRankData.lastScore
    self.rankInfo[self.RankType_1] = carRankData.cardRank or {}
end

function BiaoCheManager:parseKillRank( killRankData )
    self.myRankInfo[self.RankType_2] = {}
    self.myRankInfo[self.RankType_2].rank = killRankData.myRanking
    self.myRankInfo[self.RankType_2].lastScore = killRankData.lastScore
    self.rankInfo[self.RankType_2] = killRankData.killRank
end

function BiaoCheManager:parseEnemyRank( enemyRankData )
    self.rankInfo[self.RankType_3] = enemyRankData.targetRank
end

function BiaoCheManager:parseRequestCar_1( carInfo )
    local activityState = self:getActivityState()
    if activityState == self.ActivityState_1 then
        self:parseMySignUpInfo(carInfo)
        if self.isOpenMainLayer == true then
            self.isOpenMainLayer = false
            self:clossAllLayer()
            self:openCurLayer()
            return
        end
    else
        if self.isOpenMainLayer == true then
            self:clossAllLayer()
            self:openMainLayer()
        end
    end
end

function BiaoCheManager:parseRequestCar_2( carInfo )
    
    self:parseMySignUpInfo(carInfo)
        -- open sign up layer
    self:openSignUpLayer()
end

function BiaoCheManager:parseRequestCar_3( carInfo )
    local activityState = self:getActivityState()
    if activityState == self.ActivityState_2 then
        -- show car detail layer
        if carInfo == nil then
            return
        end
        local layerName = "lua.logic.biaoche.BiaoCheInfoLayer"
        local layer = AlertManager:getLayerByName(layerName)
        if layer then
            layer:setInfo(carInfo)
        else
            layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
            layer:setInfo(carInfo)
            AlertManager:show()
        end
        layerName = "lua.logic.biaoche.BiaoChePartInfoLayer"
        layer = AlertManager:getLayerByName(layerName)
        if layer then
            layer:setInfo(carInfo,layer.partType)
        end
    else
        return
    end
end

function BiaoCheManager:parseRequestCar_4( carInfo )
    local activityState = self:getActivityState()
    if activityState == self.ActivityState_2 then
        -- show car detail layer
        if carInfo == nil then
            return
        end
        local layerName = "lua.logic.biaoche.BiaoCheInfoLayer"
        local layer = AlertManager:getLayerByName(layerName)
        if layer then
            layer:setInfo(carInfo)
        else
            layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
            layer:setInfo(carInfo)
            AlertManager:show()
        end
        local partType = 0
        local myPlayerId = MainPlayer:getPlayerId()
        if carInfo and carInfo.partInfo then
            for k,v in pairs(carInfo.partInfo) do
                if v.attackPlayer and v.attackPlayer[1] then
                    for j,u in ipairs(v.attackPlayer) do
                        if u.playerId == myPlayerId then
                            partType = v.type
                            break
                        end
                    end
                end
            end
        end

        layerName = "lua.logic.biaoche.BiaoChePartInfoLayer"
        layer = AlertManager:getLayerByName(layerName)
        if layer then
            if partType == 0 then
                partType = layer.partType
            end
            layer:setInfo(carInfo,partType)
        else
            if partType == 0 then
                return
            end
            layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
            layer:setInfo(carInfo,partType)
            AlertManager:show()
        end
    else
        return
    end
end

local function getHpPer( strData )
    if strData == "" then
        return 100
    end
    local tbl = stringToTable(strData,";")
    print("strData = ",strData)
    local maxHp = 0
    local curHp = 0
    for i,v in ipairs(tbl) do
        if v ~= "" then
            local tTemp = stringToNumberTable(v,"_")
            curHp = curHp + tTemp[2]
            maxHp = maxHp + tTemp[3]
        end
    end
    if maxHp == 0 then
        return 0
    end
    return math.ceil(curHp * 100 / maxHp)
end

function BiaoCheManager:parseRequestCar_5( carInfo )
    local activityState = self:getActivityState()
    if activityState == self.ActivityState_2 then
        -- show car detail layer
        if carInfo == nil then
            return
        end
        local myData = nil
        local myPlayerId = MainPlayer:getPlayerId()
        if carInfo and carInfo.partInfo then
            for k,v in pairs(carInfo.partInfo) do
                if v.attackPlayer and v.attackPlayer[1] then
                    for j,u in ipairs(v.attackPlayer) do
                        if u.playerId == myPlayerId then
                            u.isInBreak = v.status
                            u.hpPer = getHpPer(u.formationBlood)
                            myData = u
                            break
                        end
                    end
                end
            end
        end
        if myData == nil then
            print("myData = nil")
            self:setMyPlayerData(nil)
            return
        end
        self:setMyPlayerData(myData)
        print("myData = ",myData)
        TFDirector:dispatchGlobalEventWith(BiaoCheManager.RECEIVE_MY_ATTACK_STATE, {})
    else
        return
    end
end

-->>>>>>>-------------------------------------------->>>>>>>>--
function BiaoCheManager:test()
    self.mapInfoHelper:test()
    local currTime = MainPlayer:getNowtime()
    self.mapInfoHelper:setUpdateTime(currTime)

end

function BiaoCheManager:getMyCarQuality()
    return self.carQuality
end

function BiaoCheManager:getMyInfoNode()
    return self.mapInfoHelper:getMyInfoNode()
end

function BiaoCheManager:getInfoNodeList()
    return self.mapInfoHelper:getInfoNodeList()
end

function BiaoCheManager:getInfoNode(guildId)
    return self.mapInfoHelper:getInfoNode(guildId)
end

function BiaoCheManager:getActivityState()
    return self.activityState
end

function BiaoCheManager:getConvergeGuildId()
    return self.convergeGuildId
end

function BiaoCheManager:getTempTime()
    return self.mapInfoHelper:getTempTime()
end

function BiaoCheManager:updateTempTime()
    return self.mapInfoHelper:updateTempTime()
end

function BiaoCheManager:getServerBestRankInfo(type)
    return self.serverBest[type]
end

function BiaoCheManager:getHistoryRankInfo( type )
    return self.historyRank[type]
end

function BiaoCheManager:getMyHistoryRankInfo( type )
    return self.myHistoryRankInfo[type]
end

function BiaoCheManager:getAttackGuildId()
    return self.currAttGuildId
end

function BiaoCheManager:getMyPlayerData()
    return self.myPlayerData
end

function BiaoCheManager:setMyPlayerData(playerData)
    self.myPlayerData = playerData
end

function BiaoCheManager:getRestTime()
    return self.restTime
end

function BiaoCheManager:getRankList( type,index )
    if index == nil then
        return self.rankInfo[type] or {}
    else
        if self.rankInfo[type] == nil then
            return nil
        end
        return self.rankInfo[type][index]
    end
end

function BiaoCheManager:getRankListSize( type )
    if self.rankInfo[type] == nil then
        return 0
    end
    return #(self.rankInfo[type])
end

function BiaoCheManager:getMyRankInfo( type )
    return self.myRankInfo[type]
end

function BiaoCheManager:getCarNodePosData( index )
    return CarNodePosData:objectByID(index)
end

function BiaoCheManager:getCarNodePosDataSize()
    return CarNodePosData:length()
end

function BiaoCheManager:getIsSign()
    return (self.isEscort == 1)
end

function BiaoCheManager:clossAllLayer()
    for k,v in pairs(self.layerBuffer) do
        layerExsit = AlertManager:getLayerByName(v)
        if layerExsit then
            AlertManager:closeAllToLayer(layerExsit)
        end
    end
end

function BiaoCheManager:openMainLayer()
    self.isOpenMainLayer = true
    local activityState = self:getActivityState()
    if activityState == BiaoCheManager.ActivityState_0 then
        -- never opened
        self:requestHistoryRank()
    elseif activityState == BiaoCheManager.ActivityState_1 then
        -- show sign up layer
        self:requestReadyInfo()
    elseif activityState == BiaoCheManager.ActivityState_2 then
        -- show fight layer
        self:requestMainInfo()
    elseif activityState == BiaoCheManager.ActivityState_3 then
        -- show history layer
        self:requestHistoryRank()
    end
    
end

function BiaoCheManager:openCurLayer()
    local activityState = self:getActivityState()
    if activityState == BiaoCheManager.ActivityState_0 then
        -- never opened
        self:openHistoryLayer()
    elseif activityState == BiaoCheManager.ActivityState_1 then
        -- show sign up layer
        self:openReadyLayer()
    elseif activityState == BiaoCheManager.ActivityState_2 then
        self:openFightLayer()
    elseif activityState == BiaoCheManager.ActivityState_3 then
        -- show history layer
        self:openHistoryLayer()
    end
end

function BiaoCheManager:openReadyLayer()
    local layer  = AlertManager:addLayerByFile("lua.logic.biaoche.BiaoCheSignUpLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function BiaoCheManager:openFightLayer()
    local layer  = AlertManager:addLayerByFile("lua.logic.biaoche.BiaoCheMainLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function BiaoCheManager:openHistoryLayer()
    local layer  = AlertManager:addLayerByFile("lua.logic.biaoche.BiaoCheHistoryLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function BiaoCheManager:openPartInfoLayer(carInfo,partType)
    local layer  = AlertManager:addLayerByFile("lua.logic.biaoche.BiaoChePartInfoLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    layer:setInfo(carInfo,partType)
    AlertManager:show()
end

function BiaoCheManager:getSignUpInfo()
    return self.signUpInfo or {}
end

-- 报名界面
function BiaoCheManager:openSignUpLayer()
    local layerName = "lua.logic.biaoche.BiaocheBaoMingList"
    local layer = AlertManager:getLayerByName(layerName)
    if layer then
        layer:refreshUI()
    else
        layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
        AlertManager:show()
    end
end

-- 报名编辑界面
function BiaoCheManager:openEditChangeLayer()
    local layerName = "lua.logic.biaoche.BiaocheChangeList"
    local layer = AlertManager:getLayerByName(layerName)
    if layer then
        layer:refreshUI()
    else
        layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
        AlertManager:show()
    end
end

-- 奖励界面
function BiaoCheManager:openRewardLayer()
    local layerName = "lua.logic.biaoche.BiaocheReword"
    local layer = AlertManager:getLayerByName(layerName)
    if layer then
        layer:refreshUI()
    else
        layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
        AlertManager:show()
    end
end

-- 升级界面
function BiaoCheManager:openShengjiLayer()
    local layerName = "lua.logic.biaoche.BiaocheShengJi"
    local layer = AlertManager:getLayerByName(layerName)
    if layer then
        layer:refreshUI()
    else
        layer = AlertManager:addLayerByFile(layerName, AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
        AlertManager:show()
    end
end

function BiaoCheManager:testOpenSignUp()
    -- BiaoCheManager:requestSignUpInfo()
    ------------ test start >>>>---------------------
    local event = {}
    local data = {}
    data.cardInfo = 
    { 
        guildId = FactionManager:getPersonalInfo().guildId,  
        score = 999,
        quality = 5,
        partInfo = {}
    }  
    for i = 1, 4 do
        local playerTab = { useCoin = i, frameId = i, playerId = i, playerName = "wukkey" .. i, guildName = "guildName" .. i, serverName = "serverName" .. i, power = i * 10000, formationBlood = "" }
        local tab = { type = i, status = 0, defensePlayer = { playerTab }, attackPlayer = {}, diePlayer = {} }
        table.insert( data.cardInfo.partInfo, tab ) 
    end
    event.data = data

    self.oneCarRequestType = self.RequestCar_2
    self.activityState = self.ActivityState_1
    self:onReceiveOneCarInfo(event)
    ------------ test end <<<<---------------------
end

return BiaoCheManager:new()