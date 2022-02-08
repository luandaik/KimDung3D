-- client side SevenDayRankManager.lua
--[[
 * @Description: HD开服大比拼
 ]]
-- script writer wuqi
-- creation time 2016-11-25

local SevenDayRankManager = class("SevenDayRankManager")

SevenDayRankManager.EnumOpenStatus = {
    OPEN = 1,
    DELAY = 2,
    CLOSE = 3,
}

SevenDayRankManager.RankListType = {
    LEVEL = 1,
    POWER = 2,
    RECHARGE = 3
}

SevenDayRankManager.TitleName = {
    [1] = localizable.SevenDayRankManager_txt_title1,
    [2] = localizable.SevenDayRankManager_txt_title2,
    [3] = localizable.SevenDayRankManager_txt_title3
}

SevenDayRankManager.rank_num_tab = { {1}, {2}, {3}, {4, 6}, {7, 10}, {11, 20}, {21, 30}, {31, 50} }

SevenDayRankManager.OpenDay = 7
SevenDayRankManager.DelayDay = 1

SevenDayRankManager.RANKING_LIST_LEVEL = "SevenDayRankManager.RANKING_LIST_LEVEL"
SevenDayRankManager.RANKING_LIST_E = "SevenDayRankManager.RANKING_LIST_E"
SevenDayRankManager.RANKING_LIST_RECHARGE = "SevenDayRankManager.RANKING_LIST_RECHARGE"
SevenDayRankManager.GET_MIN_RESPONSE = "SevenDayRankManager.GET_MIN_RESPONSE"
SevenDayRankManager.NOTIFY_SEVEN_RANK_TASK_STEP = "SevenDayRankManager.NOTIFY_SEVEN_RANK_TASK_STEP"
SevenDayRankManager.BIG_COMPET_AWARD_ALL = "SevenDayRankManager.BIG_COMPET_AWARD_ALL"

SevenDayRankManager.IS_TEST = false

function SevenDayRankManager:ctor()
    TFDirector:addProto(s2c.BIG_COMPET_AWARD_ALL, self, self.onReceiveAwardConfig)
    TFDirector:addProto(s2c.GET_MIN_RESPONSE, self, self.onReceiveGetAwardReponse)
    TFDirector:addProto(s2c.RANKING_LIST_LEVEL, self, self.onReceiveRankingListLevel)
    TFDirector:addProto(s2c.RANKING_LIST_E, self, self.onReceiveRankingListPower)
    TFDirector:addProto(s2c.RANKING_LIST_RECHARGE, self, self.onReceiveRankingListRecharge)
    TFDirector:addProto(s2c.NOTIFY_SEVEN_RANK_TASK_STEP, self, self.onReceiveSevenRankStepChange)
    
    self:initConfig()
end

function SevenDayRankManager:initConfig()
    self.rewardList = {}
    self.redPoint = false
    self.openStatus = self.EnumOpenStatus.CLOSE
    self.curStep = {0, 0, 0}
    self.rankDataMap = {}
end

function SevenDayRankManager:restart()
    self:initConfig()
    self:stopSevenDaysTimer()
end

function SevenDayRankManager:getOpenSatus()
    local RegisterTime = MainPlayer:ServerOpenTime()
    RegisterTime = self:filterOpenTime(RegisterTime)
    local nowTime      = MainPlayer:getNowtime()
    local secInOneDay  = 24 * 3600
    local curDay = 10
    local status = self.EnumOpenStatus.CLOSE
    local bStop = false

    if self.IS_TEST then
        -- print("RegisterTime==>> ", RegisterTime)
        -- print("nowTime==>> ", nowTime)
    end

    if not RegisterTime then
        return status, curDay
    end

    if ( nowTime > (RegisterTime + (self.OpenDay + self.DelayDay) * secInOneDay) ) or ( nowTime < RegisterTime ) then
        status = self.EnumOpenStatus.CLOSE
    elseif nowTime <= RegisterTime + self.OpenDay * secInOneDay then
        for i = 1, self.OpenDay do
            if ( not bStop ) and nowTime <= RegisterTime + i * secInOneDay then
                curDay = i
                bStop = true
            end
        end
        status = self.EnumOpenStatus.OPEN
    else
        curDay = self.OpenDay
        status = self.EnumOpenStatus.DELAY
    end

    return status, curDay
end

function SevenDayRankManager:openSevenDaysRankLayer()
	AlertManager:addLayerByFile("lua.logic.sevendays.SevenDaysRankLayer", AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_0);
    AlertManager:show();
end

-- 设置在线奖励回调
function SevenDayRankManager:addSevenDaysEvent(logic, id, callback)
    local status = self:getOpenSatus()
    -- 判断在线奖励是否过期
    if status == self.EnumOpenStatus.CLOSE then
        self:stopSevenDaysTimer()
        return
    end

    if self.SevenDaysTimerEvents == nil then
        self.SevenDaysTimerEvents = TFMapArray:new()
        self.SevenDaysTimerEvents:clear()
    end

    if self.SevenDaysTimer == nil then
        self.SevenDaysTimer = TFDirector:addTimer(1000, -1, nil, 
            function() 
                self:updateSevenDaysTimer()
            end)
    end

    local obj = self.SevenDaysTimerEvents:objectByID(id)
    
    if obj then
        obj.handler             = callback
        obj.logic               = logic
    else
        local timer = {}
        timer.id                = id
        timer.logic             = logic
        timer.handler           = callback
        self.SevenDaysTimerEvents:push(timer)
    end
end

-- 停止在线奖励定时器
function SevenDayRankManager:removeOnlineRewardTimer(id)
    if self.SevenDaysTimerEvents == nil then
        return
    end

    local obj = self.SevenDaysTimerEvents:objectByID(id)
    if obj then
        self.SevenDaysTimerEvents:removeInMapList(obj)
    end

    if self.SevenDaysTimerEvents:length() <= 0 and self.SevenDaysTimer then
        self:stopSevenDaysTimer()
    end
end

function SevenDayRankManager:stopSevenDaysTimer()
    if self.SevenDaysTimer then
        TFDirector:removeTimer(self.SevenDaysTimer)
        self.SevenDaysTimer = nil
    end

    -- 清空倒计时奖励
    if self.SevenDaysTimerEvents then
        self.SevenDaysTimerEvents:clear()
    end
end

function SevenDayRankManager:filterOpenTime(tTime)
    local secInOneDay  = 24 * 3600
    local date = GetCorrectDate("*t",tTime)
    --print("date = ",date)
    local secTotal = (date.hour*60 + date.min)*60 + date.sec 
    return tTime - secTotal
end

function SevenDayRankManager:updateSevenDaysTimer()
    local status = self:getOpenSatus()

    -- 判断在线奖励是否过期
    if status == self.EnumOpenStatus.ClOSE then
        self:stopSevenDaysTimer()
        return
    end
    local RegisterTime = MainPlayer:ServerOpenTime()

    RegisterTime = self:filterOpenTime(RegisterTime)
    local nowTime      = MainPlayer:getNowtime()

    if status == self.EnumOpenStatus.OPEN then
        RegisterTime = RegisterTime + 3600 * 24 * self.OpenDay
    else
        RegisterTime = RegisterTime + 3600 * 24 * (self.OpenDay + self.DelayDay)
    end

    local timeCount = RegisterTime - nowTime
    local secInOneDay  = 24 * 3600
    local day = math.floor(timeCount / secInOneDay)

    local sec   = math.max( timeCount - secInOneDay * day, 0 )
    local time1 = math.floor(sec/3600)
    local time2 = math.floor((sec-time1 * 3600)/60)
    local time3 = math.fmod(sec, 60)

    -- local timedesc1 = string.format("%02d天%02d小时%02d分%02d秒", day, time1, time2, time3)
    day = string.format("%02d", day)
    time1 = string.format("%02d", time1)
    time2 = string.format("%02d", time2)
    time3 = string.format("%02d", time3)
    local timedesc1 = stringUtils.format(localizable.common_time_5, day, time1, time2, time3)

    sec   = timeCount
    time1 = math.floor(sec/3600)
    time2 = math.floor((sec-time1 * 3600)/60)
    time3 = math.fmod(sec, 60)
    local timedesc2 = string.format("%02d:%02d:%02d", time1, time2, time3)

    for v in self.SevenDaysTimerEvents:iterator() do
        v.status    = status
        v.desc1     = timedesc1
        v.desc2     = timedesc2

        if v.handler then
            v.handler(v)
        end
    end
end

function SevenDayRankManager:checkRedPoint()
    local status, dayIdx = self:getOpenSatus()
    if dayIdx > self.OpenDay then
        return false
    end
    for k, v in ipairs(self.rewardList) do
        if v.state and v.state == 1 then
            return true
        end
    end
    return false
end

function SevenDayRankManager:checkRedByIndex(idx)
    local status, dayIdx = self:getOpenSatus()
    if dayIdx > self.OpenDay then
        return false
    end
    if self.rewardList[idx] and self.rewardList[idx].state and self.rewardList[idx].state == 1 then
        return true
    end
    return false
end

function SevenDayRankManager:requestRankList(id)
    if self.IS_TEST then
        print("SevenDayRankManager:requestRankList===>> ", id)
    end
    showLoading()
    TFDirector:send(c2s.SEND_RANK_REQUEST, {id})
end

function SevenDayRankManager:requestGetMinReward(tType)
    if self.IS_TEST then
        print("SevenDayRankManager:requestGetMinReward===>> ", tType)
    end
    showLoading()
    TFDirector:send(c2s.GET_MIN_REQUEST, {tType})
end

function SevenDayRankManager:requestGetConfig(isRequest)
    showLoading()
    self.isRequest = isRequest
    TFDirector:send(c2s.SEND_BIGCOMPET_REQUEST, {})
end

function SevenDayRankManager:onReceiveAwardConfig(event)
    if self.IS_TEST then
        print("SevenDayRankManager:onReceiveAwardConfig(event)===>>>> ", event.data)
    end
    hideLoading()
    local data = event.data or {}
    local award = data.award or {}

    if #award <= 0 then
        self.isRequest = false
        toastMessage(localizable.SevenDaysRankLayer_config_wrong)
        return
    end

    for k, v in ipairs(award) do
        local tType = v.type
        self.rewardList[tType] = {}
        local reward1 = v.reward_1
        local reward2 = v.reward_2
        local reward3 = v.reward_3
        local condition = v.condition

        if (not reward1) or (not reward2) or (not reward3) or (reward1 == "") or (reward2 == "") or (reward3 == "") then
            self.isRequest = false
            toastMessage(localizable.SevenDaysRankLayer_config_wrong)
            return
        end

        -- local temp2 = string.split( reward2, "&" )
        -- for i = 1, #t2 do
        --     local v1 = t2[i]
        --     temp2[i] = string.split( v1, "&" )  --分割排名
        -- end

        local tab = {}
        tab.reward1 = string.split(reward1, "|")
        tab.reward2 = string.split(reward2, "&")
        tab.reward3 = reward3
        tab.condition = condition or 0
        tab.condition = tonumber(tab.condition)
        self.curStep[tType] = v.step or 0
        tab.state = v.state or 0
        tab.state = tonumber(tab.state)

        self.rewardList[tType] = tab
    end
    if self.IS_TEST then
        print("onReceiveAwardConfig(event) after ===>>>> ", self.rewardList)
    end
    TFDirector:dispatchGlobalEventWith(SevenDayRankManager.BIG_COMPET_AWARD_ALL, {})

    if self.isRequest then
        self.isRequest = false
        self:openSevenDaysRankLayer()
    end
end

function SevenDayRankManager:changeAwardGetState( typeIdx, state )
    self.rewardList[typeIdx] = self.rewardList[typeIdx] or {}
    if self.rewardList[typeIdx].state then
        self.rewardList[typeIdx].state = 2
    end
end

function SevenDayRankManager:onReceiveGetAwardReponse(event)
    hideLoading()

    if self.IS_TEST then
        print("SevenDayRankManager:onReceiveGetAwardReponse ===>> ", event.data)
    end

    local data = event.data or {}
    local state = data.state or 0
    if state ~= 1 then
        toastMessage(localizable.SevenDayRankManager_get_reward_fail)
        return
    end
    TFDirector:dispatchGlobalEventWith(SevenDayRankManager.GET_MIN_RESPONSE, {})
end

function SevenDayRankManager:parseRankTab(data)
    local newData = {}
    newData.rankInfo = {}
    newData.myRanking = data.myRanking or 0
    newData.step = data.step or 0
    if not data.rankInfo then
        return newData
    end
    local dataCount = #data.rankInfo
    for i = 1, #self.rank_num_tab do
        if i <= 3 then
            if data.rankInfo[i] then
                newData.rankInfo[i] = data.rankInfo[i]
            end
        else
            local startIdx = self.rank_num_tab[i][1]
            local lastIdx = self.rank_num_tab[i][2]
            if lastIdx > dataCount then
                lastIdx = dataCount
            end
            if data.rankInfo[startIdx] then
                newData.rankInfo[i] = data.rankInfo[startIdx]
                newData.rankInfo[i].curStep = data.rankInfo[lastIdx].curStep
                -- for j = self.rank_num_tab[i][1], self.rank_num_tab[i][2] do
                --     if data.rankInfo[j] then
                --         newData.rankInfo[i] = data.rankInfo[j]
                --     end
                -- end
            end
        end
    end
    if self.IS_TEST then
        print("SevenDayRankManager:parseRankTab ===>> ", newData)
    end
    return newData
end

function SevenDayRankManager:onReceiveRankingListLevel(event)
    hideLoading()

    if self.IS_TEST then
        print("SevenDayRankManager:onReceiveRankingListLevel ===>> ", event.data)
    end

    local data = event.data or {}
    local newData = self:parseRankTab(data)
    local rank_type = self.RankListType.LEVEL

    local step = data.step
    if step then
        self.curStep[1] = step
        local status, dayIdx = self:getOpenSatus()
        if self.rewardList[1] and dayIdx <= self.OpenDay then
            local curState = self.rewardList[1].state
            local curGoal = self.rewardList[1].condition
            if curState == 0 and step >= curGoal then
                self.rewardList[1].state = 1
            end
        end
    end

    self.rankDataMap[rank_type] = nil
    self.rankDataMap[rank_type] = newData

    TFDirector:dispatchGlobalEventWith(SevenDayRankManager.RANKING_LIST_LEVEL, {})
end

function SevenDayRankManager:onReceiveRankingListPower(event)
    hideLoading()

    if self.IS_TEST then
        print("SevenDayRankManager:onReceiveRankingListPower ===>> ", event.data)
    end

    local data = event.data or {}
    local newData = self:parseRankTab(data)
    local rank_type = self.RankListType.POWER

    local step = data.step
    if step then
        self.curStep[2] = step
        local status, dayIdx = self:getOpenSatus()
        if self.rewardList[2] and dayIdx <= self.OpenDay then
            local curState = self.rewardList[2].state
            local curGoal = self.rewardList[2].condition
            if curState == 0 and step >= curGoal then
                self.rewardList[2].state = 1
            end
        end
    end

    self.rankDataMap[rank_type] = nil
    self.rankDataMap[rank_type] = newData

    TFDirector:dispatchGlobalEventWith(SevenDayRankManager.RANKING_LIST_E, {})
end

function SevenDayRankManager:onReceiveRankingListRecharge(event)
    hideLoading()

    if self.IS_TEST then
        print("SevenDayRankManager:onReceiveRankingListRecharge ===>> ", event.data)
    end

    local data = event.data or {}
    local newData = self:parseRankTab(data)
    local rank_type = self.RankListType.RECHARGE

    local step = data.step
    if step then
        self.curStep[3] = step
        local status, dayIdx = self:getOpenSatus()
        if self.rewardList[3] and dayIdx <= self.OpenDay then
            local curState = self.rewardList[3].state
            local curGoal = self.rewardList[3].condition
            if curState == 0 and step >= curGoal then
                self.rewardList[3].state = 1
            end
        end
    end

    self.rankDataMap[rank_type] = nil
    self.rankDataMap[rank_type] = newData

    TFDirector:dispatchGlobalEventWith(SevenDayRankManager.RANKING_LIST_RECHARGE, {})
end

function SevenDayRankManager:onReceiveSevenRankStepChange( event )
    local data = event.data or {}
    if self.IS_TEST then
        print("SevenDayRankManager:onReceiveSevenRankStepChange ==>> ", data)
    end
    local tType = data.type
    local currstep = data.currstep
    self.curStep[tType] = currstep

    local status, dayIdx = self:getOpenSatus()
    if self.rewardList[tType] and dayIdx <= self.OpenDay then
        local curState = self.rewardList[tType].state
        local curGoal = self.rewardList[tType].condition
        if curState == 0 and currstep >= curGoal then
            self.rewardList[tType].state = 1
        end
    end

    TFDirector:dispatchGlobalEventWith(self.NOTIFY_SEVEN_RANK_TASK_STEP, { tType = tType })
end

function SevenDayRankManager:parseRewardStr(str)
    if (not str) or (str == "") then
        return nil
    end
    if self.IS_TEST then
        print("SevenDayRankManager:parseRewardStr===>>> ", str)
    end
    local tab = stringToNumberTable(str, '_')
    local data = {}
    data.type   = tab[1]
    data.itemId = tab[2]
    data.number = tab[3]
    return BaseDataManager:getReward(data)
end

-- function SevenDayRankManager:parseRewardStr(str, bOne)
--     if (not str) or (str == "") then
--         return nil
--     end
--     if self.IS_TEST then
--         print("SevenDayRankManager:parseRewardStr===>>> ", str)
--     end
--     if string.find(str, ',') then
--         local temp = string.split(str, ',')
--         local arr = TFArray:new()
--         for i = 1, #temp do
--             local tt = tonumber(temp[i])
--             local list = RewardConfigureData:GetRewardItemListById(tt)
--             for v in list:iterator() do
--                 arr:push(v)
--             end
--         end
--         return arr
--     end
--     local id = tonumber(str)
--     local list = RewardConfigureData:GetRewardItemListById(id)
--     if bOne then
--         return list:objectAt(1)
--     else
--         return list
--     end
-- end

return SevenDayRankManager:new()