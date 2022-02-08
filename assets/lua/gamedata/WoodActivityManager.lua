-- client side WoodActivityManager.lua
--[[
 * @Description: 木人桩活动
 ]]
-- script writer wuqi
-- creation time 2016-11-10

local WoodActivityManager = class("WoodActivityManager")

WoodActivityManager.WOOD_MAN_REWARD_CONFIG_RESULT = "WoodActivityManager.WOOD_MAN_REWARD_CONFIG_RESULT"
WoodActivityManager.WOOD_MAN_HISTORY_RESULT = "WoodActivityManager.WOOD_MAN_HISTORY_RESULT"
WoodActivityManager.WOOD_MAN_EXTRA_REWARD = "WoodActivityManager.WOOD_MAN_EXTRA_REWARD"
WoodActivityManager.FRESH_WOOD_MAN_RANK_RESULT = "WoodActivityManager.FRESH_WOOD_MAN_RANK_RESULT"
WoodActivityManager.WOOD_MAN_RESULT = "WoodActivityManager.WOOD_MAN_RESULT"
WoodActivityManager.WOOD_MAN_PROGRESS = "WoodActivityManager.WOOD_MAN_PROGRESS"
WoodActivityManager.WOOD_MAN_SPECIAL_REWARD_RESULT = "WoodActivityManager.WOOD_MAN_SPECIAL_REWARD_RESULT"

WoodActivityManager.HistoryType = 
{
    SELF = 1,
    OTHER = 2
}

WoodActivityManager.ResultType = 
{
    SUCCESS = 1,
    FAIL = 2
}

WoodActivityManager.IS_TEST_SELF = false

function WoodActivityManager:ctor()
    TFDirector:addProto(s2c.WOOD_MAN_REWARD_CONFIG_RESULT, self, self.onReceiveWoodActivityInfo)
    TFDirector:addProto(s2c.WOOD_MAN_OWN_PROGRESS_RESULT, self, self.onReceivePlayerProcess)
    TFDirector:addProto(s2c.WOOD_MAN_RESULT, self, self.onReceiveSelectWood)
    TFDirector:addProto(s2c.WOOD_MAN_HISTORY_RESULT, self, self.onReceiveWoodHistory)
    TFDirector:addProto(s2c.WOOD_MAN_EXTRA_REWARD, self, self.onReceiveWoodExtraReward)
    TFDirector:addProto(s2c.FRESH_WOOD_MAN_RANK_RESULT, self, self.onReceiveRefreshRank)
    TFDirector:addProto(s2c.WOOD_MAN_SPECIAL_REWARD_RESULT, self, self.onReceiveGetSpecial)

    self:restart() 
end

function WoodActivityManager:restart()
    --三档价格,get from server
    self.priceTab = {}
    self.consumeGoodsTab = {}
    --奖励配置列表
    self.configList = {}
    self.extraReward = {}

    --额外宝箱奖励配置
    self.boxRewardList = {}
    --总距离
    self.totalDis = 0
    self.isFirstFree = false
    --开启到哪个宝箱
    self.boxIndex = 0
    --当前宝箱轮次
    self.round = 1
    --活动剩余时间
    self.leftTime = 0
    self.bRed = true
    self.bFreeRed = true
    self.bTips = false
    self.bOpen = false
    self.bRedSpecial = false

    self.recordList ={}
    self.recordList[1] =  {}
    self.recordList[2] =  {}
    self.myRank = {}
    self.rankList = TFArray:new()
end

function WoodActivityManager:onReceiveWoodActivityInfo(event)
    hideLoading()
    local data = event.data or {}
    print("WoodActivityManager:onReceiveWoodActivityInfo === >> ", data)
    local consumeSycee = data.consumeSycee
    --价格列表
    local priceTab = {}
    if consumeSycee and consumeSycee ~= "" then
        local tbl = stringToTable(consumeSycee, '_')
        for k, v in ipairs(tbl) do
            priceTab[k] = v
        end    
    end
    self.priceTab = priceTab
    --替代元宝的消耗道具列表
    local consumeGoods = data.consumeGoods
    local consumeGoodsTab = {}
    if consumeGoods and consumeGoods ~= "" then
        local tbl = stringToTable(consumeGoods, '_')
        for k, v in ipairs(tbl) do
            consumeGoodsTab[k] = tonumber(v)
        end    
    end
    self.consumeGoodsTab = consumeGoodsTab

    ---------------------
    --距离可以循环领取的宝箱   5|20|50|100|200
    local boxCount = data.boxCount
    local boxCounts = string.split(boxCount, '_')
    for i = 1, #boxCounts do
        boxCounts[i] = tonumber(boxCounts[i])
    end
    self.boxCounts = boxCounts
    ---------------------

    --奖励配置列表
    local configList = data.configList
    local configListTab = {}
    if configList then
        for i = 1, #configList do
            local item = configList[i]
            local info = {}
            info.type = item.resType
            info.itemId = item.resId
            info.number = item.number
            configListTab[i] = BaseDataManager:getReward(info)
        end
    end
    self.configList = configListTab

    --额外宝箱奖励配置
    -- local boxRewardList = data.boxRewardList
    -- local boxRewardListTab = {}
    -- self.boxDisTab = {}
    -- if boxRewardList then
    --     for i = 1, #boxRewardList do
    --         local item = boxRewardList[i]
    --         --对应距离
    --         local dis = item.count or 1
    --         self.boxDisTab[i] = dis
    --         local boxReward = item.boxReward or {}
    --         local tempTab = {}
    --         for j = 1, #boxReward do
    --             local m_item = boxReward[j]
    --             local info = {}
    --             info.type = m_item.resType
    --             info.itemId = m_item.resId
    --             info.number = m_item.number
    --             tempTab[j] = BaseDataManager:getReward(info)
    --         end
    --         boxRewardListTab[i] = tempTab
    --     end
    -- end
    self.boxRewardList = data.boxRewardList or {}

    self.specialRewardList = data.specialRewardList or {}
    self.specialRewardMap = {}
    for _, v in pairs(self.specialRewardList) do
        self.specialRewardMap[v.length] = self.specialRewardMap[v.length] or {}
        table.insert( self.specialRewardMap[v.length], v )
    end

    print("eeeeeeeee ===>> ", self.specialRewardMap)
    -- if self.IS_TEST_SELF then
    --     self.specialRewardList = {
            
    --     }
    --     self.specialRewardMap = {
            
    --     }
    --     for i = 1, 600 do
    --         self.specialRewardList[i] = { length = 20 * i, specialReward = {resType = 1, resId = i, number = 1} }
    --     end
    --     for _, v in pairs(self.specialRewardList) do
    --         self.specialRewardMap[v.length] = v.specialReward
    --     end
    -- end

    self:requestPlayerProcess()
end

function WoodActivityManager:isNewBox(dis)
    return self.specialRewardMap[dis]
end

function WoodActivityManager:getNextNewDis()
    local canGetList = {}
    local otherList = {}
    --先判断是否有可领的未领
    for k, v in pairs(self.specialRewardMap) do
        if self.totalDis >= k and k > self.specialLength then
            table.insert( canGetList, v )
        else
            table.insert( otherList, v )
        end
    end
    print("self.totalDis ==>> ", self.totalDis)
    --获得预览奖励
    local function getNextItem()
        local nextList = {}
        for _, v in pairs(otherList) do
            if v[1].length > self.totalDis then
                table.insert(nextList, v)
            end
        end
        return nextList
    end

    if #canGetList == 0 then
        local newList = getNextItem()
        if #newList == 0 then
            return nil
        end
        table.sort( newList, function( a, b )
            return a[1].length < b[1].length
        end )
        return newList[1], 2
    else
        table.sort( canGetList, function( a, b )
            return a[1].length < b[1].length
        end )
        return canGetList[1], 1
    end

    return nil
end

function WoodActivityManager:onReceivePlayerProcess(event)
    hideLoading()
    local data = event.data or {}
    print("WoodActivityManager:onReceivePlayerProcess === >> ", data)

    self.totalDis = data.zongjuli or 0
    self.isFirstFree = data.isFirstFree or false
    self.boxIndex = data.boxIndex or 0
    self.round = data.round or 1
    self.leftTime = data.actTime or 0
    -- if self.historyBest and self.disOneTime and self.historyBest < self.disOneTime then
    --     self.historyBest = self.disOneTime
    -- else
    --     self.historyBest = data.historyBest or 0
    -- end
    self.historyBest = data.historyBest or 0

    self.specialLength = data.specialLength or 0

    self.bRed = true
    local nextBoxDis = self.boxCounts[self.boxIndex + 1] + self.round * self.boxCounts[5]
    if self.totalDis < nextBoxDis then
        self.bRed = false
    end
    if self.isFirstFree < 1 then
        self.bFreeRed = false
    end    
    if OperationActivitiesManager:ActivityTypeIsOpen(OperationActivitiesManager.Type_Xia_Ke_Xing) == false then
        toastMessage(localizable.WoodActivity_not_open)
        return
    end
    if self:getLayerOpen() then
        self:openMainLayer()
        self:setLayerOpen(false)
    end
    TFDirector:dispatchGlobalEventWith(self.WOOD_MAN_PROGRESS, {})
end


function WoodActivityManager:isRedPoint()
    if self.bRed or self.bFreeRed or self.bRedSpecial then
        return true
    else    
        return false
    end    
end 

function WoodActivityManager:openMainLayer()
    local layer  = require("lua.logic.woodActivity.WoodActivityLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function WoodActivityManager:openBoxDetailLayer(idx, count)
    local layer  = require("lua.logic.woodActivity.XiakexingBaoxiang"):new()
    layer:loadData(self.boxRewardList[idx], count)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function WoodActivityManager:getTotalDis()
    return self.totalDis or 0
end

function WoodActivityManager:getConfigList()
    return self.configList or {}
end

function WoodActivityManager:getBoxRewardList()
    return self.boxRewardList or {}
end

function WoodActivityManager:getFreeTimes()
    return self.isFirstFree or 0
end

function WoodActivityManager:getBoxIndex()
    return self.boxIndex or 1
end

function WoodActivityManager:getHistoryBest()
    return self.historyBest or 0
end

function WoodActivityManager:getRound()
    return self.round or 1
end

function WoodActivityManager:getBoxCounts()
    return self.boxCounts or {}
end

function WoodActivityManager:getBoxNum()
    return self.boxNum or 0
end

function WoodActivityManager:getRewardList()
    return self.rewardList or {}
end

function WoodActivityManager:getGoodsTab()
    return self.consumeGoodsTab or {}
end

function WoodActivityManager:getPriceTab()
    return self.priceTab or {}
end

function WoodActivityManager:getLayerOpen()
    return self.bLayerOpen
end

function WoodActivityManager:setLayerOpen(bOpen)
    self.bLayerOpen = bOpen
end


function WoodActivityManager:onReceiveSelectWood(event)
    --print("onReceiveSelectWood == >> ", event.data)
    hideLoading()
    local data = event.data or {}
    local dis = data.juli or 0
    local boxNum = data.boxNum or 0
    local rewardList = data.rewardList or {}
    self.boxNum = boxNum
    self.disOneTime = dis
    self.rewardList = rewardList
    TFDirector:dispatchGlobalEventWith(self.WOOD_MAN_RESULT, {})
    self:requestRefreshRank()
end

function WoodActivityManager:onReceiveWoodHistory(event)
    hideLoading()     
    local recordType = event.data.type
    if self.recordList[recordType] == nil then
        self.recordList[recordType] =  {}
    end
    if event.data.HistoryList == nil then
        TFDirector:dispatchGlobalEventWith(self.WOOD_MAN_HISTORY_RESULT, {recordType = event.data.type, newcount = 0})
        return
    end

    local count = 0 
    if recordType == 1 then
        for i,v in pairs(event.data.HistoryList) do
            table.insert(self.recordList[recordType] , v)
            count = count + 1
        end    
    elseif recordType == 2 then
        self.recordList[recordType] = {}
        self.recordList[recordType] = event.data.HistoryList
    end
    TFDirector:dispatchGlobalEventWith(self.WOOD_MAN_HISTORY_RESULT, {recordType = event.data.type, newcount = count})
end

function WoodActivityManager:onReceiveWoodExtraReward(event)
    hideLoading()
    local data = event.data or {}
    local success = data.success
    self.boxIndex = data.boxIndex
    self.round = data.round

    self.bRed = true
    local nextBoxDis = self.boxCounts[self.boxIndex + 1] + self.round * self.boxCounts[5]
    if self.totalDis < nextBoxDis then
        self.bRed = false
    end

    TFDirector:dispatchGlobalEventWith(self.WOOD_MAN_EXTRA_REWARD, {})
end

function WoodActivityManager:onReceiveRefreshRank(event)
    --hideLoading()
    local data = event.data or {}
    self.myRank = data.own
    if data.list then
        self.rankList = TFArray:new()
        for i = 1, #data.list do
            local score = data.list[i]
            self.rankList:push(score)
        end
    end
    TFDirector:dispatchGlobalEventWith(self.FRESH_WOOD_MAN_RANK_RESULT, {})
end

function WoodActivityManager:requestActivityInfo(bOpen)
    showLoading()
    self:setLayerOpen(bOpen or false)
    TFDirector:send(c2s.WOOD_MAN_REWARD_CONFIG, {})
    -- local layer  = require("lua.logic.woodActivity.WoodActivityLayer"):new()
    -- AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    -- AlertManager:show()
end

function WoodActivityManager:requestPlayerProcess()
    showLoading()
    TFDirector:send(c2s.WOOD_MAN_OWN_PROGRESS, {})
end

--请求选择木桩
function WoodActivityManager:requestSelectWood(count)
    showLoading()
    print("WoodActivityManager:requestSelectWood == >> ", count)
    TFDirector:send(c2s.WOOD_MAN_REQUEST, { count })
end

--请求木人桩历史信息
function WoodActivityManager:requestWoodHistory(curCount, count, nType)
    showLoading()
    TFDirector:send(c2s.WOOD_MAN_HISTORY_REQUEST, { curCount, count, nType })
end

--请求领取额外宝箱
function WoodActivityManager:requestGetExtraReward(id)
    showLoading()
    TFDirector:send(c2s.WOOD_MAN_EXTRA_REWARD, { id })
end

--请求刷新排行
function WoodActivityManager:requestRefreshRank()
    --showLoading()
    TFDirector:send(c2s.FRESH_WOOD_MAN_RANK, {})
end

function WoodActivityManager:openResultLayer(logic, func)
    local layer = require("lua.logic.woodActivity.XiakexingReward"):new()
    layer:loadData(self.rewardList, logic, func)
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
    AlertManager:show()
end

function WoodActivityManager:openChoiceLayer(data, status)
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.woodActivity.WoodChoiceLayer",AlertManager.BLOCK_AND_GRAY,tween);
    layer:setData(data, status)
    AlertManager:show();
end

--新增需求  领取特殊宝箱
function WoodActivityManager:requestGetSpecialReward(id, length)
    showLoading()
    local Msg = { id, length }
    TFDirector:send(c2s.WOOD_MAN_SPECIAL_REWARD, Msg)
end

--1yes 2no
function WoodActivityManager:onReceiveGetSpecial(event)
    hideLoading()
    local data = event.data or {}
    local success = data.success
   
    TFDirector:dispatchGlobalEventWith(self.WOOD_MAN_SPECIAL_REWARD_RESULT, {})
end

return WoodActivityManager:new();