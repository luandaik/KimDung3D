-- client side StarHeroManager.lua
--[[
 * @Description: 名人堂管理类
 ]]
-- script writer chikui
-- creation time 2016-10-20

local StarHeroManager = class("StarHeroManager")

local StarHeroRewardData = require('lua.table.t_s_star_hero_reward')

StarHeroManager.RECEIVE_GET_REWARD              = "StarHeroManager.RECEIVE_GET_REWARD"

StarHeroManager.RECEIVE_RANKING_INFO            = "StarHeroManager.RECEIVE_RANKING_INFO"
function StarHeroManager:ctor(data)
    TFDirector:addProto(s2c.STAR_HERO_RANKING_REPONSE, self, self.onReceiveRankingInfo)
    TFDirector:addProto(s2c.STAR_HERO_REWARD_REPONSE, self, self.onReceiveGetReward)
    self.constTime = ConstantData:objectByID("StarHeroMinutes").value
    self:restart()
end

function StarHeroManager:restart()
    self.isReward   = false
    self.isOpenMainLayer = false
    self.rankInfo   = {}
    self.myRank     = 0
end

-- 请求点赞
function StarHeroManager:requestThumb( rank , playerId )
    showLoading()
    self.currThumbRank = rank
    local msg = {
        rank,
        playerId
    }
    TFDirector:send(c2s.STAR_HERO_PRAISE_REQUEST,msg)
end

-- 请求集赞奖励
function StarHeroManager:requestGetReward( )
    showLoading()
    self.currThumbRank = nil
    local msg = {
    }
    TFDirector:send(c2s.STAR_HERO_PRAISE_REWARD_REQUEST,msg)
end

-- 请求排行榜信息
function StarHeroManager:requestRankingInfo( rankNum )
    showLoading()
    local msg = {
        rankNum
    }
    TFDirector:send(c2s.STAR_HERO_RANKING_REQUEST,msg)
end

-->>>>>>>-------------------------------------------->>>>>>>>--

function StarHeroManager:onReceiveGetReward(event)
    hideLoading()
    local data = event.data
    local rewardId = event.data.id
    local rewardInfo = StarHeroRewardData:objectByID(rewardId)
    local rewardTbl = stringToTable(rewardInfo.reward,'|')
    local rewardList = {}
    for k,v in pairs(rewardTbl) do
        local tbl = stringToNumberTable(v,'_')
        local type = tbl[1]
        local itemId = tbl[2]
        local number = tbl[3]
        local rewardItem = {type = type, number = number, itemId = itemId}
        table.insert(rewardList,rewardItem)
    end
    if self.currThumbRank ~= nil and self.currThumbRank > 0 then
        local info = self.rankInfo[self.currThumbRank]
        if info then
            info.praise = info.praise + 1
            table.insert(self.praisePlayerId,info.playerId)
        end
    end

    RewardManager:setReward(rewardList)
    TFDirector:dispatchGlobalEventWith(StarHeroManager.RECEIVE_GET_REWARD, {rank = self.currThumbRank})
end

function StarHeroManager:onReceiveRankingInfo(event)
    hideLoading()
    self.rankInfo = self.rankInfo or {}
    local data = event.data.data or {}
    if event.data.myRank and event.data.myRank ~= -1 then
        self.myRank = event.data.myRank
        self.praisePlayerId = event.data.praisePlayerId or {}
    end
    if event.data.isReward == 1 then
        self.isReward = true
    else
        self.isReward = false
    end
    print('self.isReward = ',self.isReward)
    if data and #data > 0 then
        for k,v in pairs(data) do
            self.rankInfo[v.ranking] = v
        end
    end

    TFDirector:dispatchGlobalEventWith(StarHeroManager.RECEIVE_RANKING_INFO, {})
    if self.isOpenMainLayer == true then
        if self:getRankSize() <= 0 then
            toastMessage(localizable.commom_no_open2)
        else
            local layer = AlertManager:addLayerByFile("lua.logic.starhero.StarHeroLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
            AlertManager:show()
        end
    end
    self.isOpenMainLayer = false
end


-->>>>>>>-------------------------------------------->>>>>>>>--
function StarHeroManager:getRankInfo(rank)
    if self.rankInfo then
        return self.rankInfo[rank]
    end
    return nil
end

function StarHeroManager:getRankSize()
    if self.rankInfo then
        return #self.rankInfo
    end
    return 0
end

function StarHeroManager:getMyRank()
    return self.myRank or 0
end

function StarHeroManager:IsCanGetReward()
    return self.isReward or false
end

function StarHeroManager:openMainLayer()
    self.isOpenMainLayer = true
    self.rankInfo = {}
    self:requestRankingInfo(10)
end

function StarHeroManager:isCanThumb( playerId )
    local times = 0
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.STAR_HERO_THUMB)
    if challengeInfo then
        times = challengeInfo:getLeftChallengeTimes()
    end
    if times <= 0 then
        return false
    end
    self.praisePlayerId = self.praisePlayerId or {}
    for k,v in pairs(self.praisePlayerId) do
        if v == playerId then
            return false
        end
    end
    return true
end

function StarHeroManager:checkRedPoint()
    if self:isOnValidTime() == false then
        return false
    end
    return self:IsCanGetReward()
end

function StarHeroManager:IsOpen()
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2220)
    if teamLev < openLev then
        return false
    end
    return self:getServerSwitchStatue()
end

function StarHeroManager:getServerSwitchStatue()
    if MainPlayer:getServerSwitchStatue(ServerSwitchType.StarHero) ~= true then
        return false
    end
    return true
end

function StarHeroManager:reset_24()
    local layer = AlertManager:getLayerByName("lua.logic.starhero.StarHeroLayer");
    if layer then
        AlertManager:closeLayer(layer);
        toastMessage(localizable.star_hero_invalid_time_tip)
    end
end

function StarHeroManager:isOnValidTime()
    local time = MainPlayer:getNowtime()
    local tTime = GetCorrectDate("*t",time)
    if tTime.hour >= 1 and tTime.hour ~= 24 then
        return true
    end
    local totalSec = tTime.min * 60 + tTime.sec
    if totalSec > 60 * self.constTime then
        return true
    end
    return false
end

return StarHeroManager:new()