-- client side WuLinEnemyManager.lua
--[[
 * @Description: 武林公敌
 ]]
-- script writer chikui
-- creation time 2016-12-20


local WuLinEnemyManager = class("WuLinEnemyManager")


WuLinEnemyManager.RECEIVE_MAIN_INFO          = "WuLinEnemyManager.RECEIVE_MAIN_INFO"

WuLinEnemyManager.RECEIVE_ACTIVITY_STATE     = "WuLinEnemyManager.RECEIVE_ACTIVITY_STATE"
WuLinEnemyManager.RECEIVE_CHALLENGE_INFO     = "WuLinEnemyManager.RECEIVE_CHALLENGE_INFO"
WuLinEnemyManager.RECEIVE_CLEAR_COLD_TIME    = "WuLinEnemyManager.RECEIVE_CLEAR_COLD_TIME"
WuLinEnemyManager.RECEIVE_REWARD_BOCX        = "WuLinEnemyManager.RECEIVE_REWARD_BOCX"


WuLinEnemyManager.ActivityState_0           = 0     --未开启
WuLinEnemyManager.ActivityState_1           = 1     --已开始
WuLinEnemyManager.ActivityState_2           = 2     --已结束
function WuLinEnemyManager:ctor()

    TFDirector:addProto(s2c.WULIN_ENEMIES_INFO, self, self.onReceiveMainInfo)

    TFDirector:addProto(s2c.WULIN_ENEMIES_STATE, self, self.onReceiveActivityState)

    TFDirector:addProto(s2c.WULIN_ENEMIES_CHALLENGE_INFO, self, self.onReceiveChallengeInfo)

    TFDirector:addProto(s2c.CLEAR_CHALLENGE_CDSUCESS, self, self.onReceiveClearColdTime)
    --宝箱
    TFDirector:addProto(s2c.WULIN_REWARD_BOCX, self, self.onReceiveRewardBox)

    ErrorCodeManager:addProtocolListener(c2s.CHALLENGE_WULIN_ENEMIES,  function(target,event)
        if MissionManager:isInTrustOnekey() then
            MissionManager:stopTrustOnekey()
        end
    end)

    self:restart()
end


function WuLinEnemyManager:restart()
    self.myRank             = {}
    self.rankList           = {}
    self.activityState      = 0
    self.activityBoxState   = -1     --宝箱奖励
    self.lastChallengeTime  = 0
end

function WuLinEnemyManager:requestPlayVideo(replayId)
    showLoading()
    local msg = {
        replayId
    }
    TFDirector:send(c2s.VIEW_WULIN_ENEMIES_REPLAY, msg)
end

function WuLinEnemyManager:requestBattleStart()
    showLoading()
    TFDirector:send(c2s.CHALLENGE_WULIN_ENEMIES, {})
end

--
function WuLinEnemyManager:requestRewardBox(getType)
    showLoading()
    getType = getType or 0
    local msg = {
        getType
    }
    TFDirector:send(c2s.REWARD_BOX_WULIN, msg)
end

function WuLinEnemyManager:requestClearCD()
    showLoading()
    TFDirector:send(c2s.CLEAR_CHALLENGE_CD, {})
end

function WuLinEnemyManager:requestBossInfo(isShow)
    showLoading()
    self.isShow = isShow
    TFDirector:send(c2s.GAIN_WULIN_ENEMIES_INFO,{})
end

--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--
function WuLinEnemyManager:onReceiveMainInfo( event )
    hideLoading()
    print('onReceiveMainInfo = ',event.data)
    local data = event.data or {}
    self.bossLevel = data.level
    self.bossHp = data.hp
    self.myRank = {}
    self.myRank = data.myRankInfo or {}
    self.myRank.rank = data.myRank
    self.rankList = {}
    self.lastChallengeTime = data.lastChallengeTime or 0
    self.lastChallengeTime = self.lastChallengeTime / 1000
    data.ranks = data.ranks or {}
    for i,v in ipairs( data.ranks ) do
        self.rankList[i] = v
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_MAIN_INFO, {})
    if self.isShow == true then
        self.isShow = nil
        local layer = AlertManager:addLayerByFile('lua.logic.wulinenemy.WuLinEnemyMainLayer',AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
        AlertManager:show()
    end
end

function WuLinEnemyManager:onReceiveChallengeInfo( event )
    hideLoading()
    local challengeInfo = event.data or {}
    self.bossHp = self:getBossHp()
    self.bossHp = self.bossHp - challengeInfo.hurt
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_CHALLENGE_INFO, {challengeInfo})
end

function WuLinEnemyManager:onReceiveActivityState( event )
    hideLoading()
    self.activityState      = event.data.state
    
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_ACTIVITY_STATE, {})
end

function WuLinEnemyManager:onReceiveClearColdTime( event )
    hideLoading()
    self.lastChallengeTime = 0
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_CLEAR_COLD_TIME, {})
end

function WuLinEnemyManager:onReceiveRewardBox( event )
    hideLoading()
    self.activityBoxState   = event.data.status
    TFDirector:dispatchGlobalEventWith(WuLinEnemyManager.RECEIVE_REWARD_BOCX, {})
end
--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function WuLinEnemyManager:getRankInfo()
    return self.rankList
end

function WuLinEnemyManager:getRankSize()
    if self.rankList == nil then
        return 0
    end
    return #(self.rankList)
end

function WuLinEnemyManager:getRankInfoByIndex(rank)
    if self.rankList == nil then
        return {}
    end
    return self.rankList[rank] or {}
end

function WuLinEnemyManager:getMyRankInfo()
    return self.myRank or {}
end

function WuLinEnemyManager:getBossLevel()
    return self.bossLevel or 0
end

function WuLinEnemyManager:getBossHp()
    if self.bossHp == nil or self.bossHp <= 0 then
        return 0
    end
    return self.bossHp or 0
end

function WuLinEnemyManager:getActivityState()
    return self.activityState
end

function WuLinEnemyManager:IsActivityBoxState()
    if (self:getActivityState() == WuLinEnemyManager.ActivityState_2) then
        return false
    end
    return (self.activityBoxState == 0)
end

function WuLinEnemyManager:getColdTime()
    if self.lastChallengeTime <= 0 or self:getActivityState() ~= 1 or self:getBossHp() <= 0 then
        return 0
    end

    local vipLevel = MainPlayer:getVipLevel()
    local vipInfo = VipData:getVipItemByTypeAndVip(8417,vipLevel)
    if vipInfo == nil or vipInfo.benefit_value == 0 then
        return 0
    end
    local coldTime = self.lastChallengeTime + vipInfo.benefit_value - MainPlayer:getNowtime()
    print("coldTimecoldTimecoldTime = ",coldTime)
    if coldTime <= 0 then coldTime = 0 end
    return coldTime
end

function WuLinEnemyManager:checkRedPoint()

    return false
end

function WuLinEnemyManager:getBossFormation()
    self.BossData = {}
    local bossLevel = self:getBossLevel()
    local bossInfo = WuLinEnemyData:getObjectByLevel(bossLevel)
    self.BossData.bossLevel   = bossLevel
    self.BossData.bossName  = bossInfo.name --"走火入魔的鸠摩智"
    self.BossData.posInfo   = bossInfo.formation
    self.BossData.icon      = 1
    return self.BossData
end

function WuLinEnemyManager:getFightRound()
    self.BossData = {}
    local bossLevel = self:getBossLevel()
    local bossInfo = WuLinEnemyData:getObjectByLevel(bossLevel)
    return bossInfo.round
end

--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--
function WuLinEnemyManager:openMainLayer()
    self:requestBossInfo(true)
end

function WuLinEnemyManager:openRewardLayer()
    local layer = AlertManager:addLayerByFile('lua.logic.wulinenemy.WuLinEnemyRewardLayer',AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
    
end

function WuLinEnemyManager:openVSLayer()
    local layer = AlertManager:addLayerByFile("lua.logic.wulinenemy.WuLinEnemyVSLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    local bossData = self:getBossFormation()
    layer:setBossData(bossData)
    AlertManager:show()
    MissionManager:checkTrustOnekeyLayer(layer,true)
end

return WuLinEnemyManager:new();