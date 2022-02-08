-- client side WestClimbManager.lua
--[[
 * @Description: 西岭
 ]]
-- script writer wuqi
-- creation time 2016-06-27

local WestClimbManager = class("WestClimbManager")

WestClimbManager.LEVEL_NORTH = 20
WestClimbManager.REWARD_TYPE = 
{
    PASS_HISTORY = 1,
    PASS_SEASON = 2,
    PASS_AGAIN = 3
}

WestClimbManager.REWARD_LIST_TYPE = 9

WestClimbManager.SERDANG_SEASON_INFO_REPONSE = "WestClimbManager.SERDANG_SEASON_INFO_REPONSE"
WestClimbManager.SERDANG_INFO_REPONSE   = "WestClimbManager.SERDANG_INFO_REPONSE"
WestClimbManager.SERDANG_CHALLENGE_REPONSE   = "WestClimbManager.SERDANG_CHALLENGE_REPONSE"
WestClimbManager.SERDANG_SWEEP_REPONSE   = "WestClimbManager.SERDANG_SWEEP_REPONSE"
WestClimbManager.SERDANG_RANK_REPONSE = "WestClimbManager.SERDANG_RANK_REPONSE"
WestClimbManager.SERDANG_BOX_REPONSE = "WestClimbManager.SERDANG_BOX_REPONSE"

function WestClimbManager:ctor()
    TFDirector:addProto(s2c.SERDANG_INFO_REPONSE, self, self.onReceiveSerdangInfo)
    TFDirector:addProto(s2c.SERDANG_CHALLENGE_REPONSE, self, self.onReceiveSerdangChallenge)
    TFDirector:addProto(s2c.SERDANG_SWEEP_REPONSE, self, self.onReceiveSerdangSweep)    
    TFDirector:addProto(s2c.SERDANG_SEASON_INFO_REPONSE, self, self.onReceiveSerdangSeasonInfo)
    TFDirector:addProto(s2c.SERDANG_RANK_REPONSE, self, self.onReceiveRankInfo)
    TFDirector:addProto(s2c.SERDANG_BOX_REPONSE, self, self.onReceiveBoxInfo)
    self:restart()
end

function WestClimbManager:restart()
    self.rankInfo = {}
    self.playerName = nil
    self.serverName = nil
    self.floorInfo = {}
    self.serdangInfo = {}
    self.climbInfo = {}
end

--西岭关卡信息
function WestClimbManager:onReceiveSerdangInfo(event)
    hideLoading();

    self.climbInfo = event.data

    print("WestClimbManager:onReceiveSerdangInfo : ", event.data)

    if self.climbInfo then
        self.playerName = self.climbInfo.playerName
        self.serverName = self.climbInfo.serverName
        self.floorInfo = self.climbInfo.floorInfo
        self.serdangInfo = self.climbInfo.serdangInfo
        self.preFloorId = self.climbInfo.floorId
    end
    table.sort(self.floorInfo, function(a, b)
        return a.floorId < b.floorId
    end)
    local leftTime = self:getCutDownTime()
    if leftTime and leftTime > 0 then
        AlertManager:addLayerByFile("lua.logic.westClimb.XilingListLayer")
        AlertManager:show()
    else
        --toastMessage(localizable.Xiling_txt_season1)
    end
end

function WestClimbManager:getPreSeasonFloorId()
    return self.preFloorId
end

function WestClimbManager:getCurFloorId()
    local maxNum = XilingData:length()
    if self.serdangInfo then
        return math.min(self.serdangInfo.floorId + 1, maxNum)
    end
    return 1
end

function WestClimbManager:getNextFloorId()
    local maxNum = XilingData:length()
    if self.serdangInfo then
        return self.serdangInfo.floorId + 1
    end
    return 1
end

function WestClimbManager:getPassedFloorId()
    if self.serdangInfo then
        return self.serdangInfo.floorId
    end
end

--西岭关卡挑战结果
function WestClimbManager:onReceiveSerdangChallenge(event)
    hideLoading();
    local data = event.data
    local oldId = self:getCurFloorId()
    local boxFloor = self:getBoxFloor()
    local floorInfo = self:getFloorInfo()
    print(" >> ", data.curId, oldId, boxFloor)
    if data.curId + 1 > oldId and boxFloor == oldId then
        floorInfo[oldId].isOpenBox = true
    end
    print("WestClimbManager:onReceiveSerdangChallenge(event) == > " , data)

    local maxNum = XilingData:length()
    if data.curId > self.serdangInfo.floorId then
        --self:changeRewardToHistory(self.serdangInfo.floorId)

        if floorInfo[floorId] then
            floorInfo[floorId].isHistoryReward = true
            floorInfo[floorId].isSeasonReward = true
        end

        self.serdangInfo.floorId = math.min(data.curId, maxNum)
    end
    TFDirector:dispatchGlobalEventWith(WestClimbManager.SERDANG_CHALLENGE_REPONSE, event.data);
end

function WestClimbManager:changeRewardToHistory(floorId)
    local floorInfo = self:getFloorInfo() or {}
    if floorInfo[floorId] then
        floorInfo[floorId].isHistoryReward = true
        floorInfo[floorId].isSeasonReward = true
    end
end

--西岭关卡扫荡结果
function WestClimbManager:onReceiveSerdangSweep(event)
    hideLoading()
    local data = event.data
    print("WestClimbManager:onReceiveSerdangSweep == > ", data)
    self:showSweepResultLayer(data)
    TFDirector:dispatchGlobalEventWith(WestClimbManager.SERDANG_SWEEP_REPONSE, event.data)
end

--西岭赛季信息s2c
function WestClimbManager:onReceiveSerdangSeasonInfo(event)
    hideLoading()
    local data = event.data
    self.seasonInfo = data or {} 
    
    TFDirector:dispatchGlobalEventWith(WestClimbManager.SERDANG_SEASON_INFO_REPONSE, data)
end

--奖励排名
function WestClimbManager:onReceiveRankInfo(event)
    hideLoading()
    local data = event.data
    self.rankInfo = data.rankInfo or {}
    self.minValue = data.minValue or 0
    self.myRanking = data.myRanking or 0

    table.sort(self.rankInfo, function(a, b)
        return a.rank < b.rank
    end)

    TFDirector:dispatchGlobalEventWith(WestClimbManager.SERDANG_RANK_REPONSE, event.data)   
end

function WestClimbManager:getRankInfo()
    return self.rankInfo
end

--西岭赛季信息c2s
function WestClimbManager:requestSeasonInfo()
    showLoading()
    TFDirector:send(c2s.SERDANG_SEASON_INFO_REQUEST, {})
    --[[
    local nowTime = MainPlayer:getNowtime()
    local event = {}
    event.data = {
        startTime = nowTime - 60 * 60 * 24,
        endTime = nowTime + 60 * 60 * 24,
        champions = true,
        isPassCave = true
    }
    self:onReceiveSerdangSeasonInfo(event)
    ]]
end

--西岭奖励列表c2s
function WestClimbManager:requestJiangliRankInfo()
    showLoading()
    TFDirector:send(c2s.SERDANG_RANK_REQUEST, {})
    --[[
    local event = {}
    event.data = {
        rankInfo = {},
        minValue = 200,
        myRanking = 1
    }

    for i = 1, 10 do
        local tab = {playerName = "wukkey" .. i, rank = i, serverName = "server" .. i, floorId = 20 - i}
        table.insert(event.data.rankInfo, tab)
    end

    self:onReceiveRankInfo(event)
    ]]
end


--请求西岭关卡信息
function WestClimbManager:requestSerdangInfo()
    showLoading()
    TFDirector:send(c2s.SERDANG_INFO_REQUEST, {} )

    --测试代码   begin--->>>>>
    --[[
    local event = {}
    event.data = {        
        serdangInfo = {playerId = 11, floorId = 12, failId = 11, },
        floorInfo = {
            {floorId = 1, isHistoryReward = false, isSeasonReward = false, npc = { npc = {npcId = 1, roleId = {1, 2, 3, 4, 5} }, isBoss = false, playerName = "sss1", serverName = "vvv1", icon = 2, headPicFrame = 2 }, 
                isBox = false, isOpenBox = false, boxPlayerName = "wukkey1", boxServerName = "server1", },
            {floorId = 2, isHistoryReward = false, isSeasonReward = false, npc = { npc = {npcId = 1, roleId = {1, 2, 3, 4, 5} }, isBoss = false, playerName = "sss1", serverName = "vvv1", icon = 2, headPicFrame = 2 }, 
                isBox = true, isOpenBox = true, boxPlayerName = "wukkey1", boxServerName = "server1", },
        },
        playerName = "wukkey_playerName1",
        serverName = "wukkey_serverName1",
    }
    
    for i = 1, 78 do
        local tab = {floorId = i + 2, isHistoryReward = false, isSeasonReward = false, npc = { npc = {npcId = 1, roleId = {1, 2, 3, 4, 5} }, isBoss = false, playerName = "sss1", serverName = "vvv1", icon = 2, headPicFrame = 2 }, 
                isBox = false, isOpenBox = true, boxPlayerName = "wukkey1", boxServerName = "server1", }
        table.insert(event.data.floorInfo, tab)
    end

    self:onReceiveSerdangInfo(event)
    ]]
    --测试代码   end--->>>>>
end

--请求挑战关卡
--fightType:佣兵阵形类型，如果不是使用佣兵为0
function WestClimbManager:requestSerdangChallenge(mountainId, fightType)
    local mountainItem = XilingData:objectByID(mountainId)
    --[[
    if mountainItem.min_level > MainPlayer:getLevel() then
        -- toastMessage("团队等级"..mountainItem.min_level.."级时开放！")
        toastMessage(stringUtils.format(localizable.common_function_openlevel, mountainItem.min_level))
        return
    end
    self.mountainPower = {mountainItemId = mountainId ,power = MainPlayer:getPower() /mountainItem.power}
    ]]
    showLoading();
    if fightType == nil then
        fightType = 0
    end
    TFDirector:send(c2s.SERDANG_CHALLENGE_REQUEST, {mountainId, fightType})
end

--请求关卡扫荡
function WestClimbManager:requestSerdangSweep(floorId, times)
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.XILING)
    local maxTimes = 0
    if challengeInfo then
        maxTimes = tonumber(challengeInfo:getLeftChallengeTimes())
    end
    local sweepTime = 0
    if not times then
        sweepTime = maxTimes
    elseif times <=0 then
       sweepTime = maxTimes
    else
        if times > maxTimes then
            sweepTime = maxTimes
        else
            sweepTime = times
        end
    end

    if sweepTime < 1 then
        toastMessage(localizable.common_no_tiaozhancishu)
        return
    end
    
    local message = 
    {
        floorId,
        sweepTime
    }
    showLoading()
    TFDirector:send(c2s.SERDANG_SWEEP_REQUEST, message)
end

function WestClimbManager:showSweepResultLayer(data)
    local layer = AlertManager:addLayerByFile("lua.logic.climb.ClimbSweepLayer", AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:loadData(data)
    AlertManager:show()
end

function WestClimbManager:getCutDownTime()
    local desTime = nil  
    self.seasonInfo = self.seasonInfo or {}  
    --赛季结束时间
    local startTime = self.seasonInfo.startTime
    local endTime = self.seasonInfo.endTime
    if (not startTime) or (not endTime) or (startTime == 0) or (endTime == 0) then
        toastMessage(localizable.Xiling_txt_enough2)
        return
    end

    local delta = endTime - startTime
    if delta < 0 then
        return
    end

    if MainPlayer:getNowtime() < startTime or MainPlayer:getNowtime() >= endTime then
        --toastMessage(localizable.Xiling_txt_season1)
        local interval = 60 * 24 * 60 * ConstantData:objectByID("Serdang.Open.Cycle").value
        local nextOpenTime = startTime + interval
        local str = FactionFightManager:getTimeString( nextOpenTime - MainPlayer:getNowtime() )
        toastMessage(stringUtils.format( localizable.Xiling_txt_season1, str ) )
        return
    end

    local deltaTime = endTime - MainPlayer:getNowtime()
    if deltaTime < 0 then
        deltaTime = 0
    end
    return deltaTime
end

function WestClimbManager:getClimbFloorNum()
    if self.climbInfo and self.climbInfo.curId then
        return (self.climbInfo.curId - 1)
    end
    return 1
end

function WestClimbManager:showMountainLayer()
    
end

function WestClimbManager:getBoxFloor()
    local floorInfo = self:getFloorInfo()
    for i = 1, #floorInfo do
        if floorInfo[i].isBox then
            return floorInfo[i].floorId
        end
    end
    return nil
end

function WestClimbManager:getFormation(index)
    local floorInfo = self:getFloorInfo()
    if floorInfo and floorInfo[index] then
        local temp = floorInfo[index].npc
        if temp and temp.npc and temp.npc.roleId then
            return temp.npc.roleId
        end
    end
    return {}
end

function WestClimbManager:getFormationIndex(index)
    local floorInfo = self:getFloorInfo()
    if floorInfo and floorInfo[index] then
        local temp = floorInfo[index].npc
        if temp and temp.npc and temp.npc.index then
            return temp.npc.index
        end
    end
    return {}
end

function WestClimbManager:getClimbInfo()
    return self.climbInfo
end

function WestClimbManager:getSerdangInfo()
    return self.serdangInfo
end

function WestClimbManager:getFloorInfo()
    return self.floorInfo
end

function WestClimbManager:getRankInfo()
    return self.rankInfo
end

function WestClimbManager:getServerName()
    return self.serverName
end

function WestClimbManager:getPlayerName()
    return self.playerName
end

function WestClimbManager:getSeasonInfo()
    return self.seasonInfo or {}
end

function WestClimbManager:getCurReward()
    if not self.myRanking then
        return nil
    end
    local rankReward = self:getRankReward(self.myRanking)
    if rankReward then
        return rankReward
    end
    return nil
end

function WestClimbManager:getRankReward(curRank)
    local rewardList = ChampionsAwardData:getAllRewardDataByType(self.REWARD_LIST_TYPE)
    for i = 1, #rewardList do
        local minRank = rewardList[i].min_rank
        local maxRank = rewardList[i].max_rank
        if curRank >= minRank and curRank <= maxRank then
            return rewardList[i]:getReward()
        end
    end
    return nil
end

--奖励排行中显示名字的最大名次
function WestClimbManager:getJiangliShowIndex()
    local rewardList = ChampionsAwardData:getAllRewardDataByType(self.REWARD_LIST_TYPE)
    table.sort(rewardList, function(a, b)
        return a.min_rank < b.min_rank
    end)
    local num = 1
    for i = 1, #rewardList do
        if rewardList[i].min_rank == rewardList[i].max_rank then
            num = rewardList[i].min_rank
        else
            return num 
        end
    end
    return num
end

function WestClimbManager:getMapId()
    local info = XilingData:objectByID(self:getCurFloorId())
    if info then
        return info.scene_id
    end
    return 22
end

function WestClimbManager:getFloorRewardType(floorId)
    local floorInfo = self:getFloorInfo()

    if floorInfo and floorInfo[floorId] then
        local info = floorInfo[floorId]
        if floorId < self:getCurFloorId() then
            return self.REWARD_TYPE.PASS_AGAIN
        end        
        if not info.isHistoryReward then
            return self.REWARD_TYPE.PASS_HISTORY
        elseif not info.isSeasonReward then
            return self.REWARD_TYPE.PASS_SEASON
        end
    end
    return self.REWARD_TYPE.PASS_AGAIN
end

function WestClimbManager:getHistoryRewardItemList(floorId)
    local mountainItem = XilingData:objectByID(floorId) 
    local historyReward = RewardConfigureData:GetRewardItemListById(mountainItem.history_drop)
    for v in historyReward:iterator() do
        v.newType = self.REWARD_TYPE.PASS_HISTORY
    end
    
    local seasonReward = self:getSeasonRewardItemList(floorId)

    for v in seasonReward:iterator() do
        historyReward:push(v)
    end
    
    return historyReward
end

function WestClimbManager:getSeasonRewardItemList(floorId)
    local mountainItem = XilingData:objectByID(floorId) 
    local list = RewardConfigureData:GetRewardItemListById(mountainItem.season_first_drop)
    for v in list:iterator() do
        v.newType = self.REWARD_TYPE.PASS_SEASON
    end
    return list
end

function WestClimbManager:getAgainRewardItemList(floorId)
    local mountainItem = XilingData:objectByID(floorId) 
    local list = RewardConfigureData:GetRewardItemListById(mountainItem.season_after_drop)
    for v in list:iterator() do
        v.newType = self.REWARD_TYPE.PASS_AGAIN
    end
    return list
end

function WestClimbManager:getRewardList(floorId)
    local rewardType = self:getFloorRewardType(floorId)
    print("rewardType == > ", rewardType)
    if rewardType == self.REWARD_TYPE.PASS_HISTORY then
        return self:getHistoryRewardItemList(floorId)
    elseif rewardType == self.REWARD_TYPE.PASS_SEASON then
        return self:getSeasonRewardItemList(floorId)
    elseif rewardType == self.REWARD_TYPE.PASS_AGAIN then
        return self:getAgainRewardItemList(floorId)
    end
    return self:getAgainRewardItemList(floorId)
end

function WestClimbManager:getIsOpen()
    local data = self:getSeasonInfo()
    if data.champions and data.isPassCave then
        return true
    end
    return false
end

function WestClimbManager:requestBox()
    showLoading()
    TFDirector:send(c2s.SERDANG_BOX_REQUEST, {})
end

function WestClimbManager:onReceiveBoxInfo(event)
    hideLoading()
    local data = event.data
    print("WestClimbManager:onReceiveBoxInfo == > ", data)
    TFDirector:dispatchGlobalEventWith(WestClimbManager.SERDANG_BOX_REPONSE, event.data)
end

function WestClimbManager:getActivityStatus()
    if MainPlayer:getServerSwitchStatue(ServerSwitchType.XiLing) == true then
        return 0
    end
    return 1
end

return WestClimbManager:new()