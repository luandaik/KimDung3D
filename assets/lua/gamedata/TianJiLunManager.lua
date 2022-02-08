-- client side TianJiLunManager.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-07-25

local TianJiLunManager = class("TianJiLunManager")


TianJiLunManager.RECEIVE_TIAN_JI_LUN_INFO   = "TianJiLunManager.RECEIVE_TIAN_JI_LUN_INFO"
TianJiLunManager.RECEIVE_RANK_INFO          = "TianJiLunManager.RECEIVE_RANK_INFO"
TianJiLunManager.RECEIVE_TIAN_JI_LUN_RESULT = "TianJiLunManager.RECEIVE_TIAN_JI_LUN_RESULT"
TianJiLunManager.RECEIVE_BRUSH_JACK_POT     = "TianJiLunManager.RECEIVE_BRUSH_JACK_POT"
TianJiLunManager.RECEIVE_COIN_IN            = "TianJiLunManager.RECEIVE_COIN_IN"
TianJiLunManager.RECEIVE_24_BRUSH            = "TianJiLunManager.RECEIVE_24_BRUSH"
TianJiLunManager.RECEIVE_PUSH_MSG            = "TianJiLunManager.RECEIVE_PUSH_MSG"

TianJiLunManager.Reward_Type_n = 1 -- 常规奖
TianJiLunManager.Reward_Type_s = 2 -- 特殊奖
TianJiLunManager.Reward_Type_t = 3 -- 特奖
function TianJiLunManager:ctor()
    -- --配置信息
    TFDirector:addProto(s2c.TIAN_JI_LUN_INFO_RESPONSE, self, self.onReceiveTianJiLunInfo)
    --历史记录信息
    TFDirector:addProto(s2c.TIAN_JI_LUN_RANK, self, self.onReceiveRankInfo)
    --寻宝结果
    TFDirector:addProto(s2c.TIAN_JI_LUN_BONUS_POOL_RESPONSE, self, self.onReceiveBrushJackPot)
    --额外宝箱
    TFDirector:addProto(s2c.TIAN_JI_LUN_OPEN_RESPONSE, self, self.onReceiveTianJiLunResult)

    TFDirector:addProto(s2c.TIAN_JI_LUN_COIN_RESPONSE, self, self.onReceiveCoinIn)

    TFDirector:addProto(s2c.RESET_RESPONSE, self, self.onReceive24_brush)

    TFDirector:addProto(s2c.REWARD_PUSH_RESPONSE, self, self.onReceivePushMsg)


    self.myRank = {}
    self.rankList = TFArray:new()
    self:restart()
end


function TianJiLunManager:restart()
    self.break_start_cost_tip = false
    self.myRank = {}
    self.rankList:clear()
    self.coinInfo = {}
    self.itemList = {}
    self.extraRewardList = {}
    self.jackpot = 0
    self.coinInType = 0
    self.freeTimes = 0
    self.myMsgList = {}
    self.serverMsgList = {}
end

function TianJiLunManager:requestTianJiLunInfo(isShow)
    showLoading()
    TFDirector:send(c2s.TIAN_JI_LUN_INFO_REQUEST, {})
    self.isShow = isShow
end

function TianJiLunManager:requestTianJiLunStart()
    showLoading()
    TFDirector:send(c2s.TIAN_JI_LUN_OPEN_REQUEST, {})
end

function TianJiLunManager:requestRankList()
    TFDirector:send(c2s.TIAN_JI_LUN_RANK_REQUEST,{})
end

function TianJiLunManager:requestBrushJackPot()
    TFDirector:send(c2s.TIAN_JI_LUN_BONUS_POOL_REQUEST,{})
end

function TianJiLunManager:requestCoinIn(type)
    showLoading()
    local msg = {
        type
    }
    TFDirector:send(c2s.TIAN_JI_LUN_COIN_REQUEST, msg)
end

--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function TianJiLunManager:onReceiveTianJiLunInfo( event )
    hideLoading()
    local data = event.data
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    
    self.itemList = {}
    if data.itemList then
        for i,v in ipairs(data.itemList) do
            self.itemList[#self.itemList + 1] = BaseDataManager:getReward(v)
        end
    end
    
    self.extraRewardList = {}
    if data.extraList then
        for i,v in ipairs(data.extraList) do
            local extraReward = {}
            extraReward.result = {}
            for ii,vv in ipairs(v.condition) do
                extraReward.result[#extraReward.result + 1] = BaseDataManager:getReward(vv)
            end
            extraReward.reward = BaseDataManager:getReward(v.reward)
            self.extraRewardList[#self.extraRewardList + 1] = extraReward
            extraReward.type = v.rewardType
            extraReward.index = v.index
        end
        local sortFunc = function ( extraReward1, extraReward2)
            if extraReward1.type == extraReward2.type then
                return extraReward1.index < extraReward2.index
            else
                return extraReward1.type > extraReward2.type
            end
        end
        table.sort( self.extraRewardList, sortFunc )
    end
    self.jackpot = data.jackpot or 0
    self.coinInfo = {}
    if data.coinInfo and data.coinInfo ~= "" then
        local tbl = stringToTable(data.coinInfo,'|')
        for i,v in ipairs(tbl) do
            local tmptbl = stringToNumberTable(v,'_')
            local info = {}
            info.type = tonumber(tmptbl[1])
            info.multiple = tonumber(tmptbl[2])
            info.score = tonumber(tmptbl[3])
            self.coinInfo[info.type] = info
        end
    end

    self.myMsgList = data.myPush or {}
    self.serverMsgList = data.serverPush or {}
    if #self.serverMsgList > 1 then
        local msgSortFunc = function ( msg1,msg2 )
            if msg1.rewardType == msg2.rewardType then
                return msg1.rewardTime > msg2.rewardTime
            end
            return msg1.rewardType > msg2.rewardType
        end
        table.sort( self.serverMsgList, msgSortFunc )
    end
    self.coinInType = data.info.isCoin
    self.freeTimes = data.info.freeCount
    print('data.info = ',data.info)
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_TIAN_JI_LUN_INFO, {})
    if self.isShow == true then
        self:openMainLayer()
        self.isShow = false
    end
end

function TianJiLunManager:onReceiveTianJiLunResult( event )
    hideLoading()
    local data = event.data
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    self.rewardResult = data.reward or {}
    self.resultType = data.rewardType
    for i=1,#self.rewardResult do
        local type = self.coinInType or 0
        local multiple = 0
        if self.resultType ~= TianJiLunManager.Reward_Type_t then
            multiple = self.coinInfo[type].multiple
        end
        self.rewardResult[i].multiple = multiple
    end
    self.indexResult = data.index
    --self.coinInType = 0
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_TIAN_JI_LUN_RESULT, {})
end

function TianJiLunManager:onReceiveCoinIn( event )
    --hideLoading()
    self.coinInType = event.data.type
    self.freeTimes = event.data.freeCount
    if self.coinInType > 0 then
        local indexStr = {'TianJiLunBuleCoin','TianJiLunPurpleCoin'}
        local rewardItem = {}
        rewardItem.type = EnumDropType.COIN
        rewardItem.number = ConstantData:objectByID(indexStr[self.coinInType]).value
        rewardItem.itemId = 0
        local rewardInfo = BaseDataManager:getReward(rewardItem)
        RewardManager:toastRewardMessage(rewardInfo);
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_COIN_IN, {})
end

function TianJiLunManager:onReceive24_brush( event )
    self.freeTimes = event.data.freeCount
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_24_BRUSH, {})
end

function TianJiLunManager:onReceiveRankInfo( event )
    print('event.data = ',event.data)
    local data = event.data or {}
    self.myRank = {}
    self.myRank.rank = data.myRank or 0
    self.myRank.score = data.myScore or 0
    self.rankList:clear()
    data.infos = data.infos or {}
    for i,v in ipairs( data.infos ) do
        self.rankList:push(v)
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_RANK_INFO, {})
end

function TianJiLunManager:onReceiveBrushJackPot( event )
    local data = event.data
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    self.jackpot = data.jackpot or 0
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_BRUSH_JACK_POT, {})
end

function TianJiLunManager:onReceivePushMsg( event )
    local data = event.data
    local bIsMine = false
    local Max_Msg_Num = 25
    if data.serverPush ~= nil and data.serverPush.playerId == MainPlayer:getPlayerId() then
        bIsMine = true
        local list = {}
        list[1] = data.serverPush
        for i=1,(#self.myMsgList) do
            list[#list + 1] = self.myMsgList[i]
            if #list >= Max_Msg_Num then
                break
            end
        end
        self.myMsgList = list
    end
    local list0 = {}
    list0[1] = data.serverPush
    local index = 0
    if list0[1].rewardType == self.Reward_Type_t then
        index = 1
    end
    for i=1,(#self.serverMsgList) do
        if index < 5 or self.serverMsgList[i].rewardType ~= self.Reward_Type_t then
            if self.serverMsgList[i].rewardType == self.Reward_Type_t then 
                index = index + 1
            end
            list0[#list0 + 1] = self.serverMsgList[i]
            if #list0 >= Max_Msg_Num then
                break
            end
        end
    end
    self.serverMsgList = list0
    if #self.serverMsgList > 1 then
        local msgSortFunc = function ( msg1,msg2 )
            if msg1.rewardType == msg2.rewardType then
                return msg1.rewardTime > msg2.rewardTime
            end
            return msg1.rewardType > msg2.rewardType
        end
        table.sort( self.serverMsgList, msgSortFunc )
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_PUSH_MSG, {isMine = bIsMine})
end

--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function TianJiLunManager:getCoinInfoByType( type )
    if self.coinInfo and self.coinInfo[type] then
        return self.coinInfo[type]
    end
    return {}
end

function TianJiLunManager:getJackPot()
    return self.jackpot or 0
end

function TianJiLunManager:getExtraRewardSize()
    return #(self.extraRewardList)
end

function TianJiLunManager:getExtraRewardInfoByIdx(idx)
    return self.extraRewardList[idx]
end

function TianJiLunManager:getCoinInType()
    return self.coinInType
end

function TianJiLunManager:getFreeTimes()
    return self.freeTimes
end

function TianJiLunManager:getResultType()
    return self.resultType
end

function TianJiLunManager:getResultIndex()
    return self.indexResult
end

function TianJiLunManager:getReward()
    return self.rewardResult
end

function TianJiLunManager:getMsgByType(type)
    if type == 1 then
        return self.serverMsgList
    else
        return self.myMsgList
    end
end

function TianJiLunManager:getMsgSizeByType(type)
    if type == 1 then
        return #(self.serverMsgList)
    else
        return #(self.myMsgList)
    end
end

function TianJiLunManager:getMyRankInfo()
    return self.myRank or {}
end

function TianJiLunManager:getItemList()
    return self.itemList or {}
end

function TianJiLunManager:checkRedPoint()
    if self.freeTimes and self.freeTimes > 0 then
        return true
    end
    return false
end

--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function TianJiLunManager:openMainLayer()
    local layer  = require("lua.logic.tianjilun.TianJiLunLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

return TianJiLunManager:new();